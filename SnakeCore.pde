// this class contains all the data required to construct
// a game scene. Try to make this as independent to processing
// as possible!

class SnakeCore {
  
  int      gameState;
  
  int      numPlayers;
  PVector  fieldSize;
  
  ArrayList<Snake>   snakes;
  ArrayList<Food>    Foods;
  
  // initialize the position of snakes and foods
  SnakeCore(){
    // initialize game state such as score (?)
    // initialize the snakes
    // initialize foods
  }
  
  void setField( int x, int y ) {
    fieldSize.set( x, y );
  }
  
  void setPlayersNum( int n ) {
    numPlayers = n;
  }
  
  
  
  boolean onASnake( PVector pos ){
    for( Snake s : snakes ){
      if( s.onSnake( pos ) ){
        return true;
      }
    }  
    return false;
  }
  
  
  void update(){
    // 1. move everything according to the position
    for( Snake s : snakes )
      s.updatePosition();
    
    
    /*
    // 2. determine if foods are eatten/ if there is any collision
    for( Food f : Foods ) {
      for( Snake s : snakes ) {
        if( s.headPosition() == f.position() ) {
          s.eat( f );
          PVector pos = f.get();
          while( onASnake( pos ) ){
            pos = random2D();
            pos.x = floor( pos.x * ( fieldSize.x + 1 ) );
            pos.y = floor( pos.y * ( fieldSize.y + 1 ) );
          }
          food.setPosition( pos );
        }
      }
    }
    */
    
  }
};
