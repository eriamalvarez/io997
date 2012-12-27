
int ENVX = 400;
int ENVY = 400;
int COLS = 80;
int ROWS = 80;
float colStep, rowStep;

//celdas
Ac[][] cellPop;
float PORCENTAJE = 0.15;  // porcentaje para estar vivos al inicio

/////////////////////////////////////
void setup() {

  background(0);
  size(ENVX, ENVY);
  frameRate(10);  
  rectMode(CENTER);

  //dibuja celula
  cellPop = new Ac[COLS][ROWS];    
  dibujaCelula();
}


/////////////////////////////////////////////
void draw() {

  background(0);

  //dibujar celulas
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      cellPop[i][j].dibuja();
    }
  }

  //verifica celula
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      cellPop[i][j].actualizaCelula();
    }
  }

  //cambia el Estado Celula
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      cellPop[i][j].cambiaEstadoCelula();
    }
  }
}


/////////////////////////////////////////
void dibujaCelula() {

  boolean blnSwitch;
  colStep = float(ENVX)/COLS; 
  rowStep = float(ENVY)/ROWS;

  //hacer Celulas
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {     
      if (random(1) < PORCENTAJE) blnSwitch = true;
      else blnSwitch = false;      
      cellPop[i][j] = new Ac( str(i) + "_" + str(j), blnSwitch, new PVector( (colStep/2) + colStep*i, (rowStep/2) + rowStep*j ), colStep, rowStep, i, j );
    }
  }

  //asigna vecinos a cada Celula
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) { 
      cellPop[i][j].asignaVecinos();
    }
  }
}

