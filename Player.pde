class Player {
  float x, y;
  PImage img;
  PImage [][] moviment;
  boolean inMotion;
  int currentDir;
  float currentFrame;
  
  final int LEFT=1,RIGHT=2; // DOWN=0, UP=3;
  
  Player(float x, float y){
    inMotion=false; //se il personaggio si muove
    currentDir=2;
    currentFrame=0;
    this.x = x;
    this.y = y;
    setup();
   
  }
   
  void setup(){
   moviment= new PImage[4][3];
   img=loadImage("rpg_maker_vx_aqua_kh_bbs_by_dfox20-d47j3g6.png");
   for (int i=0; i<3;i++){
     moviment [1][i]=img.get(0+ (32 *i),32,32,32);
     moviment [2][i]=img.get(0+ (32 *i),64,32,32);
    
     }
  
  }
  
  void show(){
    
      if(inMotion)
      image(moviment[currentDir][1 + int(currentFrame)],x,y,40,40); //IN MOVIMENTO
      else
      image(moviment[currentDir][0],x,y,40,40); //PRIMO FRAME (non in movimento) QUINDI STATICO
    } 
  
  
  void updatePlayer(float x1, float y1){
    currentFrame=(currentFrame + 0.2) % 2; // PER FARE MUOVERE I FRAME COSì SEMBRA CHE STIA CORRENDO
    inMotion=true;
    
    if(x1==0 && y1==0)
      inMotion=false;
    else if(x1 == -5)
      currentDir=LEFT;
    else if(x1 == +5)
      currentDir=RIGHT;
    //else if(y1 == -50.0)
      //currentDir=UP;
   //else if(y1 == +50.0) LE HO TOLTE PERCHE' MI PIACEVA DI PIU' STESSE SEMPRE DRITTO
      //currentDir=DOWN;
    
      x=getX()+x1;
      y=getY()+y1;  
  }
  
  
  
  
  float getX(){
    return this.x;
  }
  
  void setX(float x){
    this.x=x;
  }
  
  float getY(){
    return this.y;
  }
  
  void setY(float y){
    this.y=y;
  }
}