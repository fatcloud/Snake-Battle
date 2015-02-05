interface Visible {
  void render();  
}


class Snake implements Visible {
  
  ArrayList<SnakeBody> bodyParts;

  int     speed;
  boolean alive;
  color   col;
  int     state;
  int     direction;
  
  public static final int 
      GO_LEFT        = 0,
      GO_RIGHT       = 1,
      GO_UP          = 2,
      GO_DOWN        = 3;
      
  
  Snake( int x, int y, int l ){
    int initLength = l;
    SnakeBody head = new SnakeBody(x,y);
    bodyParts = new ArrayList<SnakeBody>();
    direction = 0;
    
    bodyParts.add( head );
    for( int i = 0; i < initLength; ++i ){
      //bodyParts.
    }
  }
  
  
  void setDirection( int dir ){
    direction = dir;
  }
  
  
  void render( int gridSize ) {
    for ( SnakeBody sb : bodyParts ) {
      fill(0,0,255);
      rect( sb.x * gridSize, sb.y * gridSize, gridSize, gridSize );
    }
  }
  
  
  void updatePosition( PVector fieldSize ){
    //head
    SnakeBody sb = bodyParts.get(0);
    for( int i = bodyParts.size() - 1; i == 1; --i){
      SnakeBody sbp = bodyParts.get(i);
      sbp.x = bodyParts.get( i - 1 ).x;
      sbp.y = bodyParts.get( i - 1 ).y;
    }
    
    //move sb
    switch (direction) {
      case GO_LEFT:
        sb.x = sb.x - 1;
        if( sb.x < 0 ) sb.x = fieldSize.x;
        break;
      case GO_RIGHT:
        sb.x = sb.x + 1;
        if( sb.x > fieldSize.x ) sb.x = 0;
        break;
      case GO_UP:
        sb.y = sb.y - 1;
        if( sb.y < 0 ) sb.y = fieldSize.y;
        break;
      case GO_DOWN:
        sb.y = sb.y + 1;
        if( sb.y > fieldSize.y ) sb.y = 0;
        break;
    }
    
    
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

    Input( int c, int p ) {
      command = c;
      player  = p;
    }
  
    int getPlayer() {
      return player;
    }
    
    int getCommand() {
      return command;
    }
}
