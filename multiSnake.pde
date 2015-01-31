
SnakeCore  sc;

void setup(){
  sc = new SnakeCore();
}


void draw(){
  sc.update();
  sc.drawInProcessing();
}

