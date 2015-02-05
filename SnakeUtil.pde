interface Visible {
  void render();  
}


class Snake implements Visible {
  
  ArrayList<SnakeBody> bodyParts;

  int     speed;
  boolean alive;
  color   col;
  int     state;  
  
  Snake( int x, int y, int l ){
    int initLength = l;
    SnakeBody head = new SnakeBody(x,y);
    bodyParts = new ArrayList<SnakeBody>();
    
    bodyParts.add( head );
    for( int i = 0; i < initLength; ++i ){
      //bodyParts.
    }
  }
  
  
  void updatePosition(){
    
  }
  
  
  boolean onSnake( PVector pos ){
    for( SnakeBody sb : bodyParts )
      if( sb.x == pos.x && sb.y == pos.y )
        return true;
    
    return false;
  }
  
  
  void render(){
    for( SnakeBody b : bodyParts ){
      fill(255);
      ellipse(b.x, b.y,100,100);
    }
  }
  
}

class Food extends PVector{
  
}


class SnakeBody extends PVector{
  SnakeBody(float x, float y){
    super(x,y);
  }
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
