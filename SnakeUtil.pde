
class Snake{
  ArrayList<SnakeBody> bodyParts;
  
  Snake(){
    int initlength = 3;
    for( int i = 0; i < initlength; ++i ){
      //bodyParts.
    }
  }
}

class Food extends PVector{
  
}


class SnakeBody extends PVector{
  
}



class Input{
    public static final int
      GO_LEFT        = 0,
      GO_RIGHT       = 1,
      GO_UP          = 2,
      GO_DOWN        = 3,
      JUMP           = 4,
      GAME_START     = 5,
      GAME_PAUSE     = 6,
      GAME_CONTINUE  = 7;
    
    int  command;    
    int  player;

    Input( int c, int p ){
      command = c;
      player  = p;
    }
  

}
