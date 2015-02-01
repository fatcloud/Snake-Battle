
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
      println("w");
      break;
    case 'd':
      println("d");
      break;
    case 's':
      println("s");
      break;
    case 'UP':
      println("UP");
      break;
    case 'DOWN':
      println("DOWN");
      break;
    case 'RIGHT':
      println("RIGHT");
      break;
    case 'LEFT':
      println("LEFT");
      break; 
  }  
  }
}
