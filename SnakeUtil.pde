
class Snake{
  ArrayList<SnakeBody> bodyParts;
  
  Snake(){
    int initlength = 3;
    for( int i = 0; i < initlength; ++i ){
      bodyParts.
    }
  }
}

class Food extends PVector{
  
}


class SnakeBody extends PVector{
  
}

class Input{
  public:
    enum command{
      GO_LEFT, GO_RIGHT, GO_UP, GO_DOWN, JUMP,
      GAME_START, GAME_PAUSE, GAME_CONTINUE
    }
    
    command cmd;
    int     player;
  
    Input( command c, int p ){
      cmd = c;
      player = p;
    }
  

}
