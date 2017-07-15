class Shadow{
  float x, y, a;
  int altezza = 50;
  int larghezza = 50;
  PImage ob;
  PImage [][] mov;
  float currentFrame;

  Shadow(float x, float y, float a) {
    this.x = x;
    this.y = y;
    this.a = a;
    currentFrame=0;
    setup();
  }


  void setup() {
    mov= new PImage[1][4];
    ob=loadImage("ombra.png");
    for (int i=0; i<4; i++) {
      mov [0][i]=ob.get(0+ (45 *i), 0, 45, 66);
    }
  }
  void update() {
    this.x --;
  }

  void show() {
    currentFrame=(currentFrame + 0.05) % 3;
    image(mov[0][1 + int(currentFrame)], x, y-27, 50, 56); //IN MOVIMENTO
  }
}