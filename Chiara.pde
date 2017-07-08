
Lane[] l = new Lane[3]; // PRENDE COME ARG LA Y DEL RETTANGOLO 


int posizione = 1; 
boolean [] keys;
Player player;
Obstacle[] vez;
int gamestate=1;
PImage startGame;
PImage bg;
PImage level;
int diff; //1 easy 2 medium 3 hard
int b_x,b_y,eas_x,eas_y,med_x,med_y,hard_x,hard_y;

boolean bOver=false;
boolean easyOver=false, mediumOver=false, hardOver=false;


void setup() {
  size(800, 600);
  player = new Player(10,480);
  keys = new boolean[128];
  vez= new Obstacle[200];
  l[0] = new Lane(450);
  l[1] = new Lane(500);
  l[2] = new Lane(550);
  b_x=251;
  b_y=473;
  eas_x=med_x=hard_x=252;
  eas_y=167;
  med_y=274;
  hard_y=373;
  startGame=loadImage("SCHERMATA_INIZ.png");
  level=loadImage("SCHERMATA_LIVpsd.png");
  bg=loadImage("blue_space_scape_by_heatstroke99-d331bty.png");
  
  
}

void draw() {
  if(gamestate==0){
  background(bg);

  player.move();
  l[2].a = 255;
  l[1].a = 155;
  l[0].a = 55;
  
  for (int i = 0; i < l.length; i++) {
    l[i].update(l, i,diff); }
    
  for (int i = 0; i < l.length; i++) {
    l[i].show(); }
   
  player.show();
  
    textSize(20);
  fill(0,0,0);
  //LOAD FONT AND CREATE FONT CERCA
  text("Distance: ",10,30); //da aggiungere distanza
  }
  
  else if (gamestate==1){
    imageMode(CENTER);
    image(startGame,width/2,height/2);
    update(mouseX, mouseY);   
  }
  
  else if(gamestate==2){
    imageMode(CENTER);
    image(level,width/2,height/2);
    update(mouseX,mouseY);
  }
}

void update(int x, int y) {
    if ( overBott(b_x,b_y,297,40) ) {
    bOver = true;}
      if ( overBott(eas_x,eas_y,328,54) ) {
    easyOver = true;}
      if ( overBott(med_x,med_y,328,54) ) {
    mediumOver = true;}
      if ( overBott(hard_x,hard_y,328,54) ) {
    hardOver = true;}
  }
  
  
boolean overBott(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true; }
    else { return false; }
}
    
void keyPressed(){
  keys[key]=true;
}

void keyReleased(){
  keys[key]=false;
}

void mousePressed(){
  if(bOver){ 
  gamestate=2;
}
  if (gamestate==2){
  if(easyOver){
    diff=1;
    gamestate=0;}
  if(mediumOver){
    diff=2;
    gamestate=0;}
  if(hardOver){
    diff=3;
    gamestate=0;}
  }
}