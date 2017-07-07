class Lane {
  Obstacle[] vez = new Obstacle[200];

  float y, a;
  int[] pos = new int[20];
  int nObs = 0;
  Lane(float y) {
    this.y = y;
    this.a = 100;
    //setto a zero le posizioni, ovvero non ci sono ostacoli sullo schermo
    for (int i = 0; i < pos.length; i++) {
      pos[i] = 0;
    }
  }

  void update(Lane[] l, int index) {
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
      if(this.pos[19]!=1){
      if (random(0, 500) < 1)
        generate();
     }
  }
    for (int i = 0; i < vez.length; i++) {
      if (vez[i] != null) {
        vez[i].update();
        vez[i].show();
        
      }
    }
    
   
  }

  void show() {
    fill(12, 157, 169, a);
    noStroke();
    rect(0, this.y, 800, height - this.y);
  }

  void generate() {
    this.vez[this.nObs] = new Obstacle(width, this.y, 255);
    this.nObs++;
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