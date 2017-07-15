class Lane {
  Obstacle[] vez = new Obstacle[200];
  Shadow[] s= new Shadow[200];

  float y, a;
  int[] pos = new int[20];
  int nObs = 0;
  int fine=0;
  Lane(float y) {
    this.y = y;
    this.a = 100;
    //setto a zero le posizioni, ovvero non ci sono ostacoli sullo schermo
    for (int i = 0; i < pos.length; i++) {
      pos[i] = 0;
    }
  }

  void update(Lane[] l, int index, int diff) {
    //GLI OSTACOLI HANNO TRASP COME LA LINEA 
    refresh(); // rimette a 0 e dopppio for controlla 
    int[] notCurrentLane = new int[2];
    int r = 0;
    for (int i = 0; i < l.length; i++) {
      if (i != index) {
        notCurrentLane[r] = i;
        r++;
      }
    }
    // 1 se c'è ostacolo
    if ((l[notCurrentLane[0]].pos[19] == 1 && l[notCurrentLane[1]].pos[19] != 1) || (l[notCurrentLane[0]].pos[19] != 1 && l[notCurrentLane[1]].pos[19] == 1) || (l[notCurrentLane[0]].pos[19] == 0 && l[notCurrentLane[1]].pos[19] == 0)) {
      if (this.pos[19]!=1) {
        if (random(0, 1000-(150*diff)) < 1)
          generate();
      }
    }
     for (int i = 0; i < vez.length; i++) {
        if (vez[i] != null) {
          vez[i].update();
        }
      }
  }

  void show() {
    fill(12, 157, 169, a);
    noStroke();
    rect(0, this.y, 800, height - this.y);
    
      for (int i = 0; i < vez.length; i++) {
        if (vez[i] != null) {  
          vez[i].show();
        }
      }
    }


  void generate() {
    if (this.nObs==199)
      this.nObs=0;
      this.vez[this.nObs] = new Obstacle(width, this.y, 255);
      this.nObs++;
    
  }
  boolean collision(Player player) {
    for (int i = 0; i < vez.length; i++) {
      if (vez[i] != null)
        if ((player.x + 45 > vez[i].x && player.x + 45 < vez[i].x + vez[i].larghezza || player.x > vez[i].x && player.x < vez[i].x + vez[i].larghezza)&&(player.y + 66 > vez[i].y && player.y + 66 < vez[i].y + vez[i].altezza || player.y > vez[i].y && player.y < vez[i].y + vez[i].altezza)) {
          vez[i].x=-200;
          player.vita--;
          return true;
        }
    }
    return false;
  }

  void refresh() {
    for (int i = 0; i < pos.length; i++) {
      pos[i] = 0;
    }
    float unit = width / 20;
    for (int i = 0; i < pos.length; i++) {

      for (int j = 0; j < vez.length; j++) {
        if (vez[j] != null)
          if (vez[j].x > i*unit && vez[j].x < (i + 1) * unit) {
            pos[i] = 1; // mette ostacoli
          }
      }
    }
  }
}