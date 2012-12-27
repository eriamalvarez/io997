class Ac{
  PVector pos;
  float sizeXX, sizeYY;
  boolean actualEstado, siguienteEstado;
  int cellCol, indexI, indexJ;
  String myID;
  Ac[] vecinos;
 
  /////////////////constructor//////////////////////////////
  Ac( String _ID, boolean _S, PVector _P, float _SX, float _SY, int _II, int _JJ ){
 
    pos        = _P;
    indexI     = _II;  
    indexJ     = _JJ;
    myID       = _ID;
    actualEstado  = _S;
 
    sizeXX     = _SX;
    sizeYY     = _SY;
    cellCol    = 250;
 
    //vecinos
    vecinos = new Ac[8];
  }
 
//////////////////////////////////////////////////////////////////
 
  ////////// dibuja Celula
  void dibuja(){
    if( this.daEstadoActual() ){
      stroke(0,250,cellCol/2);
      fill(50,20,cellCol/4,50);
      ellipse(pos.x, pos.y, sizeXX/3, sizeYY/3);
    }
    else{      
      stroke(0,0,0);
    ellipse(pos.x, pos.y, sizeXX/6, sizeYY/6);  
    } 
  }
 
  /////////// actualiza actualEStado a siguienteEstado
  void actualizaCelula(){
    int contador = 0;
    for(int i = 0; i < vecinos.length; i++){
      boolean bVal = vecinos[i].daEstadoActual();
      if( bVal ) contador++;
    }
    this.aplicaReglas(contador);
  }
 
  //aplica reglas
  void aplicaReglas(int C){
 
    if( C < 2  ) fijaEstadosSiguiente(false);       // soledad
    if( C > 3  ) fijaEstadosSiguiente(false);       // sobrepoblación
    if( C == 3 ) fijaEstadosSiguiente(true);       // reproducción
 
  }
 
  //cambia estado de Celula
  void cambiaEstadoCelula(){
    boolean bVal = siguienteEstado;
    actualEstado = bVal;
    
  }
 
  //aplica reglas
  void asignaVecinos(){

    vecinos[0] = cellPop[ (indexI+COLS-1) % COLS ] [ (indexJ+ROWS-1) % ROWS ];
   vecinos[1] = cellPop[ indexI                 ] [ (indexJ+ROWS-1) % ROWS ];
    vecinos[2] = cellPop[ (indexI+1) % COLS      ] [ (indexJ+ROWS-1) % ROWS ];
    // izquiera y derecha
    vecinos[3] = cellPop[ (indexI+COLS-1) % COLS ] [ indexJ ];
    vecinos[4] = cellPop[ (indexI+1) % COLS      ] [ indexJ ];
    // arriba
    vecinos[5] = cellPop[ (indexI+COLS-1) % COLS ] [ (indexJ+1) % ROWS ];
    vecinos[6] = cellPop[ indexI                 ] [ (indexJ+1) % ROWS ];
    vecinos[7] = cellPop[ (indexI+1) % COLS      ] [ (indexJ+1) % ROWS ];   
  }
 
  //establecer estado de Celula
  void fijaEstadoActual(boolean B){
    actualEstado = B;
  }
  void fijaEstadosSiguiente(boolean B){
    siguienteEstado = B;
  }
 
  //obtener estado de Celula
  boolean daEstadoActual(){
    return actualEstado;
  }  
  boolean fijaEstadoSiguiente(){
    return siguienteEstado;
  }  
 
}
