
SnakeGame  sg;

void setup(){
  sg = new SnakeGame();
}


void draw(){
  sg.loop();
}

void keyPressed() {
  sg.handleKey( key, keyCode );
}
