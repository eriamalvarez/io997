final int[]  exceso = {            // vecinos sobrantes
 
  0, 255, 255
};
final int[] vivos = {      // vivos
  255,0,0
};
final int[] azul = {      // color caso 1.
   0, 255, 255
};

final int[] bl = {       // fondo // caso cero.
  255, 255, 255
};

// ngen son los que aplican condiciones de supervivencia y reproducción...
// ngen_next  próxima generación partiendo de ngen...

int cuadricula_ancho = 50;
int cuadricula_alto = 50;
int canvas_ancho = 600;
int canvas_alto = 600;
int caja_ancho = canvas_ancho/cuadricula_ancho;
int caja_alto = canvas_alto/cuadricula_alto;
Ac[][] cuadricula = new Ac[cuadricula_ancho][cuadricula_alto];


boolean pause = false;

////////////////////////////////////////////////////////////////////

void setup() {

  size(canvas_ancho, canvas_alto);
  noStroke();


  for (int x=0; x<cuadricula_ancho; x++)
    for (int y=0;y<cuadricula_alto;y++)
      cuadricula[x][y] = new Ac(x, y, exceso);

  for (int x=0; x<cuadricula_ancho; x++)
    for (int y=0;y<cuadricula_alto;y++)
      cuadricula[x][y].draw(caja_ancho, caja_alto);
 
  for (int x=0; x<cuadricula_ancho; x++)
    for (int y=0;y<cuadricula_alto;y++)
      cuadricula[x][y].pon_vecinos(cuadricula);
      frameRate(18);
}

//////////////////////////////////////////////////////////////////////////

void draw() {
 if (pause) return;

  for (int x=0; x<cuadricula_ancho; x++)
    for (int y=0;y<cuadricula_alto;y++)
      cuadricula[x][y].draw(caja_ancho, caja_alto);

  for (int x=0; x<cuadricula_ancho; x++)
    for (int y=0;y<cuadricula_alto;y++)
      cuadricula[x][y].compute();

  for (int x=0; x<cuadricula_ancho; x++)
    for (int y=0;y<cuadricula_alto;y++)
      cuadricula[x][y].avanza();
}


/////////////////////////////////////////////////////////////////////////

void keyPressed() {
  switch(key) {
  case 'p':
    pause = !pause;
    break;
    }
}

void mouseDragged() {
  if (mouseX<width && mouseX >0 && mouseY <height && mouseY > 0) {
  Ac apretado= cuadricula[mouseX/caja_ancho][mouseY/caja_alto];
 
  if (apretado.ngen == vivos) {
   apretado.ngen= exceso;
  }
  else {
    apretado.ngen=vivos;
  }
  apretado.draw(caja_ancho, caja_alto);
}
}


//

class Ac { 
  int[] ngen, ngen_next; 
  int x, y, xm; 
  Ac[] vecinos;
  
  ////constructor/////////
  Ac(int gx, int gy, int[] c) {
    this.x = gx;
    this.y = gy;
    this.ngen = c;
    this.ngen_next = new int[3];
  }
  
  /////////////////////////////////   
  void pon_vecinos(Ac[][] cuadricula) {
    int xp = (x+1 == cuadricula.length ? 0 : x+1);
    if (x-1==-1) {
      xm=cuadricula.length -1;
    } 
    else {
      xm=x-1;
    }
    int yp = (y+1 == cuadricula[0].length ? 0 : y+1);
    int ym = (y-1 == -1 ? cuadricula[0].length - 1 : y-1);

    vecinos = new Ac[] { 
      cuadricula[xm][ym], cuadricula[xm][y ], cuadricula[xm][yp], 
      cuadricula[x ][ym],                     cuadricula[x ][yp], 
      cuadricula[xp][ym], cuadricula[xp][y ], cuadricula[xp][yp]
    };
  }

  void compute() {
    int vivos_vecinos = 0;
    for (int z=0; z < vecinos.length; z++)
      if (vecinos[z].ngen == vivos)
        vivos_vecinos ++;

    switch(vivos_vecinos) {
    case 7:
    //case 1:
      case 4:
    case 5:
    case 6:
    case 8:
    
  
      a_color(exceso);
      break;
   case 2:
   a_color(ngen);
   break;
      case 3:
      a_color(vivos);
      break;
      case 0:
      a_color (bl);
     break;
      case 1:
      a_color(azul);
      break;
    }
  }

  void avanza() {
    ngen = ngen_next;
    ngen_next = new int[3];
  }

  void draw(int c_ancho, int c_alto) {
    fill(ngen[0], ngen[1], ngen[2]);
    rect(x*c_ancho, y*c_alto, c_ancho, c_alto);
  }

  void a_color(int[] c) { 
    ngen_next = c;
  }
  
  
  
}



