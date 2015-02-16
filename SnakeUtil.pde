interface Visible {
  void render();  
}


class Snake implements Visible {

  // the snake game
  SnakeCore  snakeCore;
  
  // imformation required for rendering
  color   col;
  
  // imformation about location, length
  ArrayList<SnakeBody> bodyParts;

  int     state;          // Alive? Invincible? Normal? etc.
  int     direction;
  int     speed;

  public static final int 
      GO_LEFT        = 0,
      GO_RIGHT       = 1,
      GO_UP          = 2,
      GO_DOWN        = 3;
  
  Snake( SnakeCore sc ){
    snakeCore = sc;
    SnakeBody head = new SnakeBody(0,0);
    bodyParts = new ArrayList<SnakeBody>();
    direction = 0;
    
    bodyParts.add( head );
  }
  
  void setHeadPosition( int x, int y ) {
    SnakeBody head = bodyParts.get(0);
    head.set( x, y );
  }
  
  void setLength( int len ){
    int initLen = bodyParts.size();
    if( len > initLen ) {
      SnakeBody sb = bodyParts.get( bodyParts.size() - 1 );
      for( int i = initLen; i < len; ++i )
        bodyParts.add( new SnakeBody( sb.x, sb.y) );
    } else {
      for ( int i = initLen - 1; i > len ; --i ) 
        bodyParts.remove( i );
    }
  }
  
  void setColor( color c ) {
    col = c;
  }
  
  void setDirection( int dir ) {
    direction = dir;
  }
  
  
  
  void updatePosition( PVector fieldSize ){
    //head
    SnakeBody sb = bodyParts.get(0);
    for( int i = bodyParts.size() - 1; i > 0; --i){
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
    for( SnakeBody sb : bodyParts ){
      fill( col );
      int gridSize = snakeCore.gridSize;
      rect( sb.x * gridSize, sb.y * gridSize, gridSize, gridSize );
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



class Signal{
    public static final int
      GO_LEFT        = 0,
      GO_RIGHT       = 1,
      GO_UP          = 2,
      GO_DOWN        = 3,
      JUMP           = 4,
      GAME_START     = 5,
      GAME_PAUSE     = 6,
      GAME_CONTINUE  = 7;
    
    private int  command;    
    private int  player;

    Signal( int c, int p ) {
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
