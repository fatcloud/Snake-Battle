// this class contains all the data required to construct
// a game scene. Try to make this as independent to processing
// as possible!

class SnakeCore {
  
  enum GameState{
    NOT_STARTED_YET, PLAYING, GAME_OVER
  }
  GameState  gameState;
  
  
  
  int      numPlayers;
  PVector  fieldSize;
  
  ArrayList<Input>  inputs;
  
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
    
    // handle real-time events like:
    // Snake jump (?)
    // game paused

    // handle position-triggered events
    // food eatten
    // snake collision 
  }
  
  // draw the game scene
  void drawInProcessing(){
    switch( gameState ){
      case NOT_STARTED_YET:
        background(0);
        textSize(40);
        
        break;
      case PLAYING:
        // background
        // snake
        // food
        // effect
        break;
      case GAME_OVER:
        break;
      default:
    }
  }
  
  // add key events or camera events via this function
  void addInput( Input in ){
    Inputs.add( in );
  }
  
};
