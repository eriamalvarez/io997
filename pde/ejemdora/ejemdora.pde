final int[]  exceso = {            // vecinos sobrantes
 
  0, 255, 0
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
float PORCENTAJE = 0.15;


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
  Ac elected = cuadricula[mouseX/caja_ancho][mouseY/caja_alto];
 
  if (elected.ngen == vivos) {
    elected.ngen= exceso;
  }
  else {
    elected.ngen=vivos;
  }
  elected.draw(caja_ancho, caja_alto);
}
}



