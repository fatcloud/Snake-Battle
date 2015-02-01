
SnakeCore  sc;

void setup(){
  sc = new SnakeCore();
}


void draw(){
  sc.update();
  sc.drawInProcessing();
}

void keyPressed() {
  switch(key){
    case 'a':
      sc.addAction( GO_LEFT, 1 );
      break;
    case 'w':
      sc.addAction( GO_UP, 1 );
      break;
    case 'd':
      sc.addAction( GO_RIGHT, 1 );
      break;
    case 's':
      sc.addAction( GO_DOWN, 1 );
      break; 
  }  
  switch(keyCode){
    case 'UP':
      sc.addAction( GO_UP, 1 );
      break;
    case 'DOWN':
      sc.addAction( GO_DOWN, 1 );
      break;
    case 'RIGHT':
      sc.addAction( GO_RIGHT, 1 );
      break;
    case 'LEFT':
      sc.addAction( GO_LEFT, 1 );
      break;
  }
}
