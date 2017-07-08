
Lane[] l = new Lane[3]; // PRENDE COME ARG LA Y DEL RETTANGOLO 


int posizione = 1; 
boolean [] keys;
Player player;
Obstacle[] vez;
int gamestate=1;
PImage startGame;
PImage bg;


void setup() {
  size(800, 600);
  player = new Player(10,480);
  keys = new boolean[128];
  vez= new Obstacle[200];
  l[0] = new Lane(450);
  l[1] = new Lane(500);
  l[2] = new Lane(550);
  startGame=loadImage("SCHERMATA_INIZ.png");
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
    l[i].update(l, i);
  }
  
  
  for (int i = 0; i < l.length; i++) {
    l[i].show();
   }
   
  player.show();

  
  textSize(20);
  fill(0,0,0);
  //LOAD FONT AND CREATE FONT CERCA
  text("Distance: ",10,30); //da aggiungere distanza
  }
  else{
    imageMode(CENTER);
    image(startGame,width/2,height/2);
    
  }
}

void keyPressed(){
   keys[key]=true;
}

void keyReleased(){
  keys[key]=false;

}
void mousePressed(){
  if(gamestate==1) gamestate=0;
 
}