// this class contains all the data required to construct
// a game scene. Try to make this as independent to processing
// as possible!

class SnakeCore {
  
  public static final int
    GAME_INIT       = 0,
    GAME_PLAYING    = 1,
    GAME_PAUSED     = 2,
    GAME_OVER       = 3;
  
  int      gameState;
  
  int      numPlayers;
  PVector  fieldSize;
  
  ArrayList<Input>   inputs;
  
  ArrayList<Snake>   snakes;
  ArrayList<Food>    Foods;

  void gameStart(){}
  
  // initialize the position of snakes and foods
  SnakeCore(){
    // initialize game state such as score (?)
    // initialize the snakes
    // initialize foods
  }
  
  // update the game data after time goes by
  void update(){
    
    if( gameState == GAME_PLAYING ) {
      // handle real-time events like:
      // Snake jump (?)
      // game paused
  
      // handle position-triggered events
      // food eatten
      // snake collision 
    }
    
  }
  
  void setupInProcessing(  ) {
    
  }
    
  // add key events or camera events via this function
  void addInput( Input in ){
    inputs.add( in );
  }
  
};
