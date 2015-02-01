
SnakeCore  sc;

void setup(){
  sc = new SnakeCore();
}


void draw(){
  sc.update();
  sc.drawInProcessing();
}

void keyPressed() {
  
  Input in;
  switch(key){
    case 'a':
      in = new Input( Input.GO_LEFT, 1 );
      break;
    case 'w':
      in = new Input( Input.GO_UP, 1 );
      break;
    case 'd':
      in = new Input( Input.GO_RIGHT, 1 );
      break;
    case 's':
      in = new Input( Input.GO_DOWN, 1 );
      break; 
  }  
  switch(keyCode){
    case 'UP':
      in = new Input( Input.GO_UP, 2 );
      break;
    case 'DOWN':
      in = new Input( Input.GO_DOWN, 2 );
      break;
    case 'RIGHT':
      in = new Input( Input.GO_RIGHT, 2 );
      break;
    case 'LEFT':
      in = new Input( Input.GO_LEFT, 2 );
      break;
  }
  
  sc.addInput( in );
}
