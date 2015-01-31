// this class contains all the data required to construct
// a game scene. Try to make this as independent to processing
// as possible!

class SnakeCore {
  
  int gameState;
  
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
    // move the snakes
    
    // check if foods were eaten ( overlap with a snake )
     
  }
  
  // draw the game scene
  void drawInProcessing(){
    
  }
  
  // add key events or camera events via this function
  void addAction( Action a ){
    actions.add( a );
  }
  
};
