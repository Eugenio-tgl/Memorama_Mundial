//Variables globales//////////////////////////////////////////////////////////////////////////////
int[] num = new int[28];
int[] indi = new int[29];
int pan = 0;
int pos1 = 28;
int pos2 = -1;
int sel = 0;
float x, y;
int mov = -1, mov1 = 0, mov2 = 0, turn=1, jug1=0, jug2=0, not = 0;
int numC;

int[] cont = new int[28];
Cartas carta;

//PROGRAMA//////////////////////////////////////////////////////////////////////////////
void setup()
{
  size (1400, 700);
  background (255);
  carta = new Cartas();
  
  Cero();//Asigna en estado 0 a todas las cartas 
}

void draw()
{
  Pantallas();
}

//FLUJO DE PANTALLAS//////////////////////////////////////////////////////////////////////////////
void Pantallas(){
 switch (pan){
   case 0:
   Inicio();
   break;
   
   case 1:
   Instrucciones();
   break;
   
   case 2:
   Juego();
   break;
   
   case 3:
   Resultados();
   break;
 }
}

void Inicio ()
{
  background(random(255), random(255), random(255));
  
    for (int i=0 ; i<28; i++)
  {
    if (cont[i] == 0)
    {
      rectMode(CORNER);
      pushMatrix();
      Determinador(i);
      carta.Ptrasera();
      popMatrix();
    }
  }
  
  Posicion();//Pone en un lugar random a las cartas
  Uno(); //Asigna en estado 1 a todas las cartas
  MostrarPerma();//Muestra las cartas en estado 1
  
  fill(random(255), random (255), random (255));
  stroke(0);
  strokeWeight(5);
  rectMode(CENTER);
  rect(700, 250, 900, 200);
  
  fill(0, 102, 153);
  textAlign(CENTER, CENTER);
  
  textSize(64);
  text("Memorama Mundial", 700, 200);
  textSize(35);
  text("Presione '1' para instrucciones", 700, 300);
  
  delay(2000);
}

void Instrucciones(){
  delay(500);
  background (255);
  rectMode(CENTER);
  
  stroke(random(255), random (255), random(255));
  fill(220);
  rect(700, 350, 1200, 600);
  
  fill(0, 102, 153);
  textAlign(CENTER, CENTER);
  
  textSize (30);
  text("----------------------Modo 2 Jugadores----------------------", 700, 100);
  text("-Encuentra los pares de las cartas. Puedes ver dos por turno.", 700, 200);
  text("-Realiza un click rapido sobre la carta que desees ver.", 700, 250);
  text("-Por cada par encontrado se otorga un punto y otro turno", 700, 300);
  text("-Gana quien más puntos tenga al final de la partida", 700, 350);
  text("-Presiona '3' cuando se hayan terminado las cartas", 700, 400);
  text("------------------------------------------------------------", 700, 450);
  text("Presiona '2' para comenzar.", 700, 600);
}

void Juego(){
  Marcador();
  
  for (int i=0 ; i<28; i++)//Imprime el reverso de las cartas en todas las posiciones
  {
    if (cont[i] == 0)
    {
      rectMode(CORNER);
      pushMatrix();
      Determinador(i);
      carta.Ptrasera();
      popMatrix();
    }
  }
  
  MostrarPerma();
  Timer();
  
  MostrarPerma();
  if (not != 0)//No avanza a menos que el usuario suelte el raton
  MostrarCar();
}

void Resultados(){
  background(255);
  textAlign(CENTER, CENTER);
  textSize(100);
  
  delay(500);
  stroke(random(255), random (255), random(255));
  fill(220);
  rectMode(CENTER);
  rect(700, 350, 1200, 600);
  
  if (jug1 > jug2)
  {
    fill(0, 102, 153);
    text("¡Gana el jugador 1!", 700, 200);
    text("pts", 800, 350);
    text(jug1, 700, 350);
   
    textSize(60);
    fill(153, 50, 0);
    text("Puntos del jugador 2: ", 700, 500);
    text(jug2, 1100, 500);
  }
  if (jug1 < jug2)
  {
    fill(153, 50, 0);
    text("¡Gana el jugador 2!", 700 , 200);
    text("pts", 800, 350);
    text(jug2, 700, 350);
   
    textSize(60);
   
    fill(0, 102, 153);
    text("Puntos del jugador 1: ", 700, 500);
    text(jug1, 1100, 500);
 }
 
 if (jug1 == jug2)
 {
   fill(40);
   text("¡EMPATE!", 700, 300);
   textSize(60);
   text("Puntos:", 700, 500);
   text(jug1, 850, 500); 
 }
}

//Interacciones con teclado y raton//////////////////////////////////////////////////////////////////////////////
void keyPressed(){      //Flujo de pantallas
    if(keyPressed){
    switch(key){
      case '1':
        pan = 1;
        break;
      case '2':
        pan = 2;
        Posicion();
        break;  
      case '3':
      pan = 3;
    }
   }
}

void mouseReleased(){ //determina la posicion
      not = 1;//Otorga permiso para avanzar en el juego
      x = mouseX;
      y = mouseY;
      mov++;
  }

//Clase de todas las cartas//////////////////////////////////////////////////////////////////////////////
class Cartas
{
  int[] num = new int[28];
  
  Cartas(){} // Construtor
  
  void Mexico(){
    //num[1];
    
    noStroke();
    fill(60,148,72);
    rect(0,0,200/3,150);
    
    fill(255, 255, 255);
    rect(200/3,0,200/3,150);
    
    fill(214, 31, 53);
    rect((400/3)-1,0,200/3,150);
    
    fill(163, 137, 31);
    circle(100, 75, 25);  
    
  }
  
  void Belgica(){
    //num[2];
    
    noStroke();
    fill(0,0,0);
    rect(0,0,200/3,150);
    
    fill(243, 208, 43);
    rect(200/3,0,200/3,150);
    
    fill(218, 31, 38);
    rect((400/3)-1,0,200/3,150);
  }
  
  void Italia(){
    //num[3];
    
    noStroke();
    fill(60,148,72);
    rect(0,0,200/3,150);
    
    fill(255,255,255);
    rect(200/3,0,200/3,150);
    
    fill(214,31,53);
    rect((400/3)-1,0,200/3,150);
  }
  
  void Francia(){
    //num[4];
    
    noStroke();
    fill(52, 64, 148);
    rect(0,0,200/3,150);
    
    fill(255,255,255);
    rect(200/3,0,200/3,150);
    
    fill(214, 31, 53);
    rect((400/3)-1,0,200/3,150);
  }
  
  void Polonia(){
    //num[5];
    
    noStroke();
    fill(255, 255, 255);
    rect(0,0,200,75);
    
    fill(195,33,44);
    rect(0,75,200,75);
  }
  
  void Brazil(){
    //num[6];
    
    noStroke();
    fill(61, 145, 67);
    rect(0,0,200,150);
    
    fill(237, 194, 31);
    quad(30,75,100,25,170, 75, 100, 125);
    
    fill(47, 19, 122);
    circle(100, 75, 40);
  }
  
  void Alemania(){
    //num[7];
    
    noStroke();
    fill(0,0,0);
    rect(0,0,200,150/3);
    
    fill(255, 30, 34);
    rect(0,150/3,200,150/3);
    
    fill(247, 216, 47);
    rect(0,300/3,200,150/3);
  }
  
  void Japon(){
    //num[8];
    
    noStroke();
    fill(255, 255, 255);
    rect(0,0,200, 150);
    
    fill(255, 30, 34);
    circle(100, 75, 70);
  }
  
  void Rumania(){
    //num[9];
    
    noStroke();
    fill(43,52,121);
    rect(0,0,200/3,150);
    
    fill(243,208,46);
    rect(200/3,0,200/3,150);
    
    fill(187,31,52);
    rect((400/3)-1,0,200/3,150);
  }
  
  void Republica(){
    //num[10];
    
    noStroke();
    fill(255, 255, 255);
    rect(0,0,200,75);
    
    fill(195,33,44);
    rect(0,75,200,75);
    
    fill(43, 70, 125);
    triangle(0,0,75,75,0,150);
  }
  
  void Suiza(){
    //num[11];
    
    noStroke();
    fill(198, 33, 39);
    rect(0,0,200, 150);
    
    fill(255, 255, 255);
    rect(88,25, 25, 100);
    rect(50,63, 100, 25);
  }
  
  void Rusia(){
    //num[12];
    
    noStroke();
    fill(255, 255, 255);
    rect(0,0,200,150/3);
    
    fill(52, 63, 152);
    rect(0,150/3,200,150/3);
    
    fill(178, 48, 50);
    rect(0,300/3,200,150/3);
  }
  
  void Cuba(){
    //num[13];
    
    noStroke();
    fill(0, 42, 143);
    rect(0,0,200,150/5);
    
    fill(255, 255, 255);
    rect(0,150/5,200,150/5);

    fill(0, 42, 143);
    rect(0,300/5,200,150/5);
    
    fill(255, 255, 255);
    rect(0,450/5,200,150/5);
    
    fill(0, 42, 143);
    rect(0,600/5,200,150/5);
    
    fill(207, 20, 43);
    triangle(0,0,75,75,0,150);
    
    fill(255, 255, 255);
    circle(20, 75, 30);
  }
  
  void Irlanda(){
    //num[14];
    
    noStroke();
    fill(64,154,100);
    rect(0,0,200/3,150);
    
    fill(255,255,255);
    rect(200/3,0,200/3,150);
    
    fill(237,126,70);
    rect((400/3)-1,0,200/3,150);
  }
  
  void Mexico_(){
    //num[15];
    
    noStroke();
    
    fill(244, 167, 59);
    arc(115, 90, 120, 70, PI, 2*PI);
    
    fill(169, 71, 42);
    circle(70, 59, 10);
    circle(80, 56, 10);
    circle(90, 53, 10);
    
    circle(100, 53, 10);
    circle(110, 53, 10);
    circle(120, 56, 10);
    circle(130, 59, 10);
    circle(140, 62, 10);
    circle(150, 65, 10);
    circle(154, 71, 10);
    circle(158, 79, 10);
    circle(158, 79, 10);
   
    fill(255, 188, 81);
    arc(100,90, 120, 70, PI, 2*PI);
    
  }
  
  void Belgica_(){
    //num[16];
    
    rectMode(CENTER);
    stroke(252, 221, 166);
    strokeWeight(5);
    
    fill(162, 81, 0);
    rect(100,75, 100, 100);
    
    line(70, 25, 70, 125);
    line(90, 25, 90, 125);
    line(110, 25, 110, 125);
    line(130, 25, 130, 125);
    
    line(50, 45, 150, 45);
    line(50, 65, 150, 65);
    line(50, 85, 150, 85);
    line(50, 105, 150, 105);
  }
  void Italia_(){
    //num[17];
    
    noStroke();
    ellipseMode(CENTER);
    
    fill(227, 156, 76);
    ellipse(100, 75, 110, 110);
    
    fill(255, 233, 114);
    ellipse(100, 75, 100, 100);
    
    fill(178, 61, 70);
    ellipse(75, 50, 10, 10);
    ellipse(60, 90, 10, 10);
    ellipse(100, 50, 10, 10);
    ellipse(69, 70, 10, 10);
    ellipse(95, 70, 10, 10);
    ellipse(90, 80, 10, 10);
    ellipse(120, 60, 10, 10);
    ellipse(120, 110, 10, 10);
    ellipse(100, 65, 10, 10);
    ellipse(100, 80, 10, 10);
    ellipse(90, 115, 10, 10);
    ellipse(80, 100, 10, 10);
    ellipse(120, 110, 10, 10);
    
  }
  void Francia_(){
    //num[18];
    noStroke();
    rectMode(CENTER);
    fill(198, 168, 42);
    
    rect(100, 75, 100, 60);
    
    fill(247, 216, 47);
    triangle(50, 45, 150, 45, 120, 25);
    
    circle(80, 80, 10);
    circle(130, 60, 15);
    circle(60, 95, 7);
    circle(110, 90, 13);
  }
  void Polonia_(){
    //num[19];
    noStroke();
    rectMode(CENTER);
    
    fill(109, 62, 5);
    rect(100, 110, 5, 10);
    
    fill(229, 226, 216);
    rect(100, 75, 10, 70);
    circle(100, 120, 10);
    triangle(95, 40, 105, 40, 100, 30);
  }
  
  void Brazil_(){
    //num[20];
    
    noStroke();
    fill(208, 205, 186);
    ellipse(100, 35, 30, 40);
    
    stroke(208, 205, 186);
    strokeWeight(15);
    
    line(100, 35, 100, 120);
    line(40, 60, 160, 60);
    line(60, 70, 140, 70); 
  }
  void Alemania_(){
    //num[21];
    stroke(178, 151, 119);
    strokeWeight(20);
    
    noFill();
    bezier(30, 50, 70, 75, 130, 75, 170, 50);
  }
  
  void Japon_(){
    //num[22];
    stroke(143, 69, 44);
    strokeWeight(5);
    line(50, 50, 50, 100);
    line(150, 50, 150, 100);
    
    noFill();
    bezier(30, 35, 80, 75, 120, 75, 170, 35);
    
    line(80, 40, 80, 60);
    line(120, 40, 120, 60);
    line(80, 40, 120, 40);
  }
  
  void Rumania_(){
    //num[23];
    
    noStroke();
    
    fill(181, 164, 116);
    rect(50,75, 100, 50);
    
    fill(114, 25, 7);
    rect(95,100,15,25);
    triangle(50,50, 80,50, 65,20);
    triangle(120,50, 150,50, 135,20);
    
    fill(229, 226,  216);
    rect(50,50,30,25);
    rect(120,50,30,25);
  }
  
  void Republica_(){
    //num[24];
  
    noStroke();
    
    fill(202, 191, 163);
    ellipse(100, 75, 100, 40);
    
    fill(106, 17, 13);
    ellipse(100, 75, 70, 20);
    
    fill(72, 68, 59);
    circle(100, 55, 10);
    circle(110, 58, 10);
    circle(90, 58, 10);
    circle(80, 61, 10);
    circle(120, 61, 10);
    circle(130, 63, 10);
    circle(70, 63, 10);
  }
  
  void Suiza_(){
    //num[25];
    stroke(143, 69, 44);
    strokeWeight(5);
    rectMode(CENTER);
    
    fill(170, 103, 77);
    rect(100, 75, 100, 50);
    
    noFill();
    line(50, 75, 150, 75);
    line(70, 55, 70, 95);
    line(90, 55, 90, 95);
    line(110, 55, 110, 95);
    line(130, 55, 130, 95);
  }
  void Rusia_(){
    //num[26];
    rectMode(CENTER);
    noStroke();
    
    fill(249, 249, 247);
    rect(100, 75, 50, 90); 
    
    fill(208, 205, 186);
    rect(100, 60, 50, 30);
    
    fill(97, 120, 216);
    rect(100, 25, 15, 15);
  }
  
  void Cuba_(){
    //num[27];
    stroke(109, 62, 5);
    strokeWeight(20);
    line(75, 75, 125, 75);
    
    noStroke();
    fill(185, 62, 5);
    circle(125, 75, 20);
    
    fill(201, 188, 184);
    circle(130, 65, 8);
    circle(135, 70, 8);
    circle(130, 60, 8);
    circle(135, 55, 8);
    circle(130, 50, 8);
    circle(135, 45, 8);
    circle(130, 40, 8);
    circle(135, 35, 8);
  }
  void Irlanda_(){
    //num[28];
    noStroke();
    rectMode(CENTER);
    
    fill(70, 126, 51);
    rect(100,60, 60, 60);
    rect(100,100, 80, 10);
    
    fill(128, 244, 2);
    rect(100,90, 60, 10);
    
    noFill();
    stroke(209, 169, 22);
    strokeWeight(5);
    rect(100, 90, 20,10);
  }
  
  void Ptrasera(){
   stroke(0);
   strokeWeight(6);
   fill(150);
   if (pan == 0)
   fill(random(255), random(255), random(255));
   rect(0, 0 , 200, 150); 
  }
}

//FUNCIONES UTILIZADAS//////////////////////////////////////////////////////////////////////////////
void Posicion(){ //Asigna un valor aleatorio sin repetirse para la posicion de las cartas
  for (int i = 0; i<28; i++)
  {
    num[i] = round(random (27.4));
    for (int k = 0; k<i; k++)
    {
      if (num[i] == num[k])
      {
        num[i] = round(random(27.4));
        k = -1; 
      }
    }
  }
  
  for(int i=0; i<28; i++)
  indi[i] = 0;
}

void Cero(){//Cartas en estado 0
  for (int i = 0; i<28; i++)
  {
  cont[i] = 0;
  }
}

void Uno(){//Cartas en estado 1
  for(int i=0; i<28; i++)
  indi[i] = 1;
}

void Determinador(int p){//Dependiendo de la posicion utiliza pushMatrix para acomodar las cartas (tablero de 7x4)
  
  //Determinador de posicion en Y
  if (p == 0 ||p == 1 || p == 2 || p == 3 || p == 4 || p == 5 || p == 6)
  {
    
  }
  
  if (p == 7 ||p == 8 || p == 9 || p == 10 || p == 11 || p == 12 || p == 13)
  {
    //pushMatrix();
    translate(0,150);
  }
  
  if (p == 14 ||p == 15 || p == 16 || p == 17 || p == 18 || p == 19 || p == 20)
  {
    //pushMatrix();
    translate(0,300);
  }
  
  if (p == 21 ||p == 22 || p == 23 || p == 24 || p == 25 || p == 26 || p == 27)
  {
    //pushMatrix();
    translate(0,450);
  }
  
  //Determinador de posicion en X
  
  if (p == 0 ||p == 7 || p == 14 || p == 21)
  {
    
  }
  
  if (p == 1 ||p == 8 || p == 15 || p == 22)
  {
    //pushMatrix();
    translate(200,0);
  }
  
  if (p == 2 ||p == 9 || p == 16 || p == 23)
  {
    //pushMatrix();
    translate(400,0);
  }
  
  if (p == 3 ||p == 10 || p == 17 || p == 24)
  {
    //pushMatrix();
    translate(600,0);
  }
  
  if (p == 4 ||p == 11 || p == 18 || p == 25)
  {
    //pushMatrix();
    translate(800,0);
  }
  
  if (p == 5 ||p == 12 || p == 19 || p == 26)
  {
    //pushMatrix();
    translate(1000,0);
  }
  
  if (p == 6 ||p == 13 || p == 20 || p == 27)
  {
    //pushMatrix();
    translate(1200,0);
  }
}

void MostrarCar()
{
  //Determina en que posicion ha dado click el jugador
  for(int v=0; v<4; v++)
  {
    for(int u=0; u<7; u++)
    {
      if (((x > 200*u) && (x < 200 + 200*u)) && ((y > 150*v) && (y < 150 + 150*v)))
      {
        pos1 = u + 7*v;
      }
    }
  }
 //Asigna a una variable la posicion y cambia el estado de esta carta
  for (int i =0; i<28; i++)
  {
    if (pos1 == num[i])
    {
      indi[i] = 1;
      numC = i;
    }
  }
  MostrarPerma();
  Turno(numC);
}

void Turno(int n){
  if (mov == 0)
  {
    mov1 = n;
    not = 0;
  }
  if (mov == 1)
  {
    mov2 = n;
    
    Relacion();
    mov = -1;
    not = 0;
  }
}

void Relacion(){
  //Determina todos los pares posibles para asignar al jugador un punto o pasar de turno
  if ((mov1 == 0 && mov2 == 14) || (mov1 == 1 && mov2 == 15) || (mov1 == 2 && mov2 == 16) || (mov1 == 3 && mov2 == 17) || 
  (mov1 == 4 && mov2 == 18) || (mov1 == 5 && mov2 == 19) || (mov1 == 6 && mov2 == 20) || (mov1 == 7 && mov2 == 21) ||
  (mov1 == 8 && mov2 == 22) || (mov1 == 9 && mov2 == 23) || (mov1 == 10 && mov2 == 24) || (mov1 == 11 && mov2 == 25) ||
  (mov1 == 12 && mov2 == 26) || (mov1 == 13 && mov2 == 27) || (mov1 == 27 && mov2 == 13) || (mov1 == 26 && mov2 == 12) || 
  (mov1 == 25 && mov2 == 11) || (mov1 == 24 && mov2 == 10) || (mov1 == 23 && mov2 == 9) || (mov1 == 22 && mov2 == 8) || 
  (mov1 == 21 && mov2 == 7) || (mov1 == 20 && mov2 == 6) || (mov1 == 19 && mov2 == 5) || (mov1 == 18 && mov2 == 4) ||
  (mov1 == 17 && mov2 == 3) || (mov1 == 16 && mov2 == 2) ||(mov1 == 15 && mov2 == 1) || (mov1 == 14 && mov2 == 0))
  {
    if(turn == 1)
    jug1++;
    if(turn == 2)
    jug2++;
  } else{
    indi[mov1] = 0;
    indi[mov2] = 0;
    
    if(turn == 1)
    turn=2;
  else{turn=1;}
  
  }
}

void Marcador(){
  background(255);
  textSize(20);
  rectMode(CENTER);
  fill(0, 102, 153);
  
  text("Jugador 1:", 100, 650);
  noStroke();
  text(jug1, 180, 650);
  if (turn == 1){
    rectMode(CENTER);
    noStroke();
    rect(118, 670, 135, 10);
  }
  
  fill(153, 50, 0);
  text("Jugador 2:", 1000, 650);
  text(jug2, 1080, 650);
  
  if (turn == 2){
    rectMode(CENTER);
    noStroke();
    rect(1020, 670, 135, 10);
  }
}

//Pausa la pantalla 
void Timer(){
  float minutes = minute();
  float seconds = second();
  float hour = hour();
  float starttime = (hour * 3600) + (minutes * 60) + seconds;
  float finaltime = starttime + .5;
  
  while (starttime < finaltime) {
       minutes = minute();
       seconds = second();
       starttime = (hour * 3600) + (minutes * 60) + seconds;
  }
}
//Contiene el estado de todas las cartas
void MostrarPerma()
{
  if (indi[0] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[0]);
   carta.Mexico();
   popMatrix();
  }
  
  if (indi[1] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[1]);
   carta.Belgica();
   popMatrix();
  }
  
  if (indi[2] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[2]);
   carta.Italia();
   popMatrix();
  }
  
  if (indi[3] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[3]);
   carta.Francia();
   popMatrix();
  }
  
  if (indi[4] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[4]);
   carta.Polonia();
   popMatrix();
  }
  
  if (indi[5] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[5]);
   carta.Brazil();
   popMatrix();
  }
  
  if (indi[6] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[6]);
   carta.Alemania();
   popMatrix();
  }
  
  if (indi[7] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[7]);
   carta.Japon();
   popMatrix();
  }
  
  if (indi[8] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[8]);
   carta.Rumania();
   popMatrix();
  }
  
  if (indi[9] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[9]);
   carta.Republica();
   popMatrix();
  }
  
  if (indi[10] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[10]);
   carta.Suiza();
   popMatrix();
  }
  
  if (indi[11] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[11]);
   carta.Rusia();
   popMatrix();
  }
  
  if (indi[12] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[12]);
   carta.Cuba();
   popMatrix();
  }
  
  if (indi[13] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[13]);
   carta.Irlanda();
   popMatrix();
  }
  
  if (indi[14] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[14]);
   carta.Mexico_();
   popMatrix();
  }
  
  if (indi[15] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[15]);
   carta.Belgica_();
   popMatrix();
  }
  
  if (indi[16] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[16]);
   carta.Italia_();
   popMatrix();
  }
  
  if (indi[17] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[17]);
   carta.Francia_();
   popMatrix();
  }
  
  if (indi[18] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[18]);
   carta.Polonia_();
   popMatrix();
  }
  
  if (indi[19] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[19]);
   carta.Brazil_();
   popMatrix();
  }
  
  if (indi[20] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[20]);
   carta.Alemania_();
   popMatrix();
  }
  
  if (indi[21] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[21]);
   carta.Japon_();
   popMatrix();
  }
  
  if (indi[22] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[22]);
   carta.Rumania_();
   popMatrix();
  }
  
  if (indi[23] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[23]);
   carta.Republica_();
   popMatrix();
  }
  
  if (indi[24] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[24]);
   carta.Suiza_();
   popMatrix();
  }
  
  if (indi[25] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[25]);
   carta.Rusia_();
   popMatrix();
  }
  
  if (indi[26] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[26]);
   carta.Cuba_();
   popMatrix();
  }
  
  if (indi[27] == 1)
  {
   rectMode(CORNER);
   pushMatrix();
   Determinador(num[27]);
   carta.Irlanda_();
   popMatrix();
  }
}
