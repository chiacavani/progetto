
Lane[] l = new Lane[3]; 

int posizione = 1; 
boolean [] keys;
Player player;
Obstacle[] vez;
Spaceship sp;
int gamestate=3; 
PImage startGame;
PImage bg;
PImage level;
PImage spaceship;
PImage GameOver;
PImage cuore;
int diff; //1 easy 2 medium 3 hard
int b_x, b_y, eas_x, eas_y, med_x, med_y, hard_x, hard_y, g_x, g_y;
float count=0;

boolean bOver=false, GOver=false;
boolean easyOver=false, mediumOver=false, hardOver=false;


void setup() {
  size(800, 600);
  player = new Player(10, 480);
  keys = new boolean[1024];
  vez= new Obstacle[200];
  sp=new Spaceship(0, 0);


  l[0] = new Lane(450);
  l[1] = new Lane(500);
  l[2] = new Lane(550);
  
  b_x=g_x=251;
  b_y=g_y=473;
  eas_x=med_x=hard_x=252;
  eas_y=167;
  med_y=274;
  hard_y=373;

  startGame=loadImage("SCHERMATA_INIZ.png");
  level=loadImage("SCHERMATA_LIVpsd.png");
  bg=loadImage("blue_space_scape_by_heatstroke99-d331bty.png");
  spaceship=loadImage("spacesheep.png");
  GameOver=loadImage("SCHERMATA_GAMEOVER.png");
  cuore=loadImage("cuore.png");
}

void draw() {
  if (gamestate==0) {
    background(bg);
    player.move();
    l[2].a = 255;
    l[1].a = 155;
    l[0].a = 55;

    for (int i = 0; i < l.length; i++) {
      l[i].update(l, i, diff);
    }

    for (int i = 0; i < l.length; i++) {
      l[i].show();
    }

    for (int i=0; i<player.vita; i++) {
      image(cuore, 770-(i*40), 25, 30, 30);
    }


    count+=0.018;
    player.show(l[posizione]);
    sp.show();
    l[posizione].collision(player);
    if (player.vita==0) {
      gamestate=3;
    }
    textSize(20);
    fill(255, 255, 255);
    //LOAD FONT AND CREATE FONT CERCA
    text("Score: " + floor(count), 10, 30);
  } else if (gamestate==1) {
    imageMode(CENTER);
    image(startGame, width/2, height/2);
    update(mouseX, mouseY);
  } else if (gamestate==2) {
    imageMode(CENTER);
    image(level, width/2, height/2);
    update(mouseX, mouseY);
  } else if (gamestate==3) {
    imageMode(CENTER);
    image(GameOver, width/2, height/2);
    textSize(20);
    fill(255, 255, 255);
    text(floor(count), 395, 230);
    update(mouseX, mouseY);
  }
}

void reset() {
  player.x=0;
  player.vita=3;
  count=0;
  gamestate=1;
}


void update(int x, int y) {
  if ( overBott(eas_x, eas_y, 328, 54) ) {
    easyOver = true;
  }
  if ( overBott(med_x, med_y, 328, 54) ) {
    mediumOver = true;
  }
  if ( overBott(hard_x, hard_y, 328, 54) ) {
    hardOver = true;
  }
  if ( overBott(g_x, g_y, 310, 70) ) {
    GOver = true;
  }
}


boolean overBott(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else { 
    return false;
  }
}

void keyPressed() {
  if (key<=keys.length)
    keys[key]=true;
  if (keys['\n']) { 
    if (gamestate != 0)
      gamestate=2;
  }
  if (key == 'j') {
    player.jump();
  }
}

void keyReleased() {
  if (key<=keys.length)
    keys[key]=false;
}

void mousePressed() {
  if (gamestate==2) {
    if (easyOver) {
      diff=1;
      gamestate=0;
    }
    if (mediumOver) {
      diff=2;
      gamestate=0;
    }
    if (hardOver) {
      diff=3;
      gamestate=0;
    }
  }
  if (gamestate==3) {
    if (GOver) {
      reset();
    }
  }
}