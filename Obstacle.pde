class Obstacle {
  float x, y, a;
  int altezza = 50;
  int larghezza = 50;
  PImage ob;
  PImage [][] mov;
  float currentFrame;

  Obstacle(float x, float y, float a) {
    this.x = x;
    this.y = y;
    this.a = a;
    currentFrame=0;
    setup();
  }
  
  
   void setup(){
   mov= new PImage[1][4];
   ob=loadImage("minion2-45x66.png");
   for (int i=0; i<4;i++){
     mov [0][i]=ob.get(0+ (45 *i),0,45,66);
    
    
     }
  
  }
  void update() {
    this.x --;
  }

  void show() {
      currentFrame=(currentFrame + 0.08) % 3;
      image(mov[0][1 + int(currentFrame)],x,y-27,50,56); //IN MOVIMENTO
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