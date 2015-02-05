
SnakeGame  sg;

void setup(){
  size(800,600);
  sg = new SnakeGame();
}


void draw(){
  sg.update();
  sg.render();
}

void keyPressed() {
  sg.handleKey( key, keyCode );
  println( "key = " + key  );
  println( "keyCode = " + keyCode  );
}
