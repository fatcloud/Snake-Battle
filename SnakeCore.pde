// this class contains all the data required to construct
// a game scene. Try to make this as independent to processing
// as possible!

class SnakeCore {
  
  int  gameState;  // not started yet / playing / game over
  
  int  numPlayers;
  PVector fieldSize;
  
  ArrayList<Action>  actions;
  
  ArrayList<Snake>   snakes;
  ArrayList<Food>    Foods;

  void gameStart(){}
  
  // initialize the position of snakes and foods
  SnakeCore(){
    
  }
  
  // update the game data after time goes by
  void update(){
    // handle real-time events
    // 1. handle all the actions, dispose redundant actions
    //    handle the actions that should take effect immediately
    //    such as jump up / pause the game etc.  

    // handle position-triggered events
    // 2. if the snakes have reach new blocks, make actions
    //     which is the last move take effect.
    
    // 3. at the same time as 2.,
    //    check if foods were eaten ( overlap with a snake )
    //    extend the length or apply some effect on snakes
    //    ( flying / stronger / accelerated etc. ) 
    
    // 4. check if snakes are dead 
  }
  
  // draw the game scene
  void drawInProcessing(){
    // background
    // snake
    // food
    // effect
  }
  
  // add key events or camera events via this function
  void addAction( Action a, int player ){
    actions.add( a, player );
  }
  
};
