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
   mov= new PImage[2][3];
   ob=loadImage("minion-45x66.png");
   for (int i=0; i<3;i++){
     mov [0][i]=ob.get(0+ (45 *i),0,45,66);
     mov [1][i]=ob.get(0+ (45 *i),66,45,66);
    
     }
  
  }
  void update() {
    this.x --;
  }

  void show() {
      currentFrame=(currentFrame + 0.05) % 2;
      image(mov[1][1 + int(currentFrame)],x,y-27,50,56); //IN MOVIMENTO
  }
  

}