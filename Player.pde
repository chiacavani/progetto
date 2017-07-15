class Player {
  float x, y;
  PImage img;
  PImage [][] moviment;
  boolean inMotion;
  int currentDir;
  float currentFrame;
  float time=0;
  float g = 0.24;
  float dy = 0;
  int vita=3;
  final int LEFT=1,RIGHT=2; // DOWN=0, UP=3;
  
  Player(float x, float y){
    inMotion=false; //se il personaggio si muove
    currentDir=2;
    currentFrame=0;
    this.x = x;
    this.y = y;
    moviment= new PImage[4][3];
   img=loadImage("rpg_maker_vx_aqua_kh_bbs_by_dfox20-d47j3g6.png");
   for (int i=0; i<3;i++){
     moviment [1][i]=img.get(0+ (32 *i),32,32,32);
     moviment [2][i]=img.get(0+ (32 *i),64,32,32);
   }
  }
   

  
  void show(Lane lane){
      if(this.y + 25 >= lane.y){
      dy = 0;
      this.y -= dy;
    }
    else{
      dy -= g;
      this.y -= dy;
    }
      if(inMotion)
      image(moviment[currentDir][1 + int(currentFrame)],x,y,40,40); //IN MOVIMENTO
      else
      image(moviment[currentDir][0],x,y,40,40); //PRIMO FRAME (non in movimento) QUINDI STATICO
    } 
  
  
  void move(){
    if (keys['a'] && ((player.getX()-10)>0)){
      player.updatePlayer(-5,0);
      
    }
     
    if (keys['d'] && ((player.getX()+32)<800)){
      player.updatePlayer(+5,0);
    }  
      
    if (keys['w'] && posizione > 0 && (time==0 || millis() - time>250)){
      time=millis();
      posizione --;
      player.updatePlayer(0,-50.0);
       }
    
   
    if (keys['s'] && posizione < 2 && (time==0 || millis() - time>250)){
      time=millis();
      posizione++;
    player.updatePlayer(0,50.0);
  
      }
      
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

      x=getX()+x1;
      y=getY()+y1;  
  }
  
  void jump(){
    if(dy == 0){
    dy = 6;
    this.y -= 15;
    }
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