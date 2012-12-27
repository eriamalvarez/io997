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

