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
    newSnake( 5, 5, 10, #B47535 );
    newSnake( 50, 5, 10, #B43535 );
    // initialize game state such as score (?)
    // initialize the snakes
    // initialize foods
  }
  
  void newSnake( int x, int y, int len, color c ){
    snakes.add( new Snake( this ) );
    Snake s = snakes.get( snakes.size() - 1 );
    
    s.setHeadPosition( x, y );
    s.setLength( len );
    s.setColor( c );
  }
  
  void render() {
    for ( Snake s : snakes )
      s.render();
    
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
    
  }
  
  
  void interrupt( Signal sig ){
    Snake s = snakes.get( sig.getPlayer() );
    s.setDirection( sig.getCommand() );
  }
  
};
