// this class contains all the data required to construct
// a game scene. Try to make this as independent to processing
// as possible!

class SnakeCore {
  
  int      gameState;
  int      gridSize = 10;
  int      numPlayers;
  PVector  fieldSize;
  
  ArrayList<Snake>   snakes;
  ArrayList<Food>    foods;
  
  // initialize the position of snakes and foods
  SnakeCore(){
    fieldSize = new PVector( 80, 60 );
    snakes    = new ArrayList<Snake>();
    snakes.add( new Snake(5,5,10) );
    // initialize game state such as score (?)
    // initialize the snakes
    // initialize foods
  }
  
  void render() {
    for ( Snake s : snakes )
      s.render( gridSize );
    
    //for ( Food f : foods )
    //  f.render( gridSize );
    
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
      s.updatePosition( fieldSize );
    
    
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
  
  
  void interrupt( Signal sig ){
    Snake s = snakes.get( sig.getPlayer() );
    s.setDirection( sig.getCommand() );
  }
  
};
