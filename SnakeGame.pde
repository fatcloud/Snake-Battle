class SnakeGame extends Game { 
  SnakeGame(){
    scenes = new HashMap<String, Scene>();
    scenes.put( "start", new SnakeStartScene( this ) );
    scenes.put( "play" , new SnakePlayScene(  this ) );
    scenes.put( "pause", new SnakePauseScene( this ) );
    scenes.put( "end"  , new SnakeEndScene(   this ) );
    toPlay = scenes.get("start"); 
  }
  
  void handleKey( char key, int keyCode ) {
    Input in = null;
    switch(key){
      case 'a':
        in = new Input( Input.GO_LEFT, 0 );
        break;
      case 'w':
        in = new Input( Input.GO_UP, 0 );
        break;
      case 'd':
        in = new Input( Input.GO_RIGHT, 0 );
        break;
      case 's':
        in = new Input( Input.GO_DOWN, 0 );
        break;
      case ' ':
        in = new Input( Input.GAME_START, -1 );
        break;
      
    }  
    switch(keyCode){
      case UP:
        in = new Input( Input.GO_UP, 1 );
        break;
      case DOWN:
        in = new Input( Input.GO_DOWN, 1 );
        break;
      case RIGHT:
        in = new Input( Input.GO_RIGHT, 1 );
        break;
      case LEFT:
        in = new Input( Input.GO_LEFT, 1 );
        break;
    }
    if( in != null )
      interrupt( in );
  
  }
}





class SnakeStartScene extends Scene {
  SnakeStartScene( Game g ){ super( g ); }
  void update() { 
    //println("Start");
  }
  
  void render() {
    background(0);
    fill(255);
    textSize(32);
    text("Press <SPACE> to start",width/2,height/2);
  }
  
  void interrupt( Input in ){ 
    if(in.getCommand() == Input.GAME_START )
      switchScene( "play" );
  }
}







class SnakePlayScene extends Scene {
  
  SnakeCore sc;
  
  SnakePlayScene( Game g ){
    super( g );
    sc = new SnakeCore();
    sc.setField( 80, 50 );
    sc.setPlayersNum(2);
  }
  
  void update() { sc.update(); }
  
  void render() {
    background(0);
    sc.render();
  }
  
  void interrupt( Input in ){
    sc.interrupt( in );
  }
}










class SnakePauseScene extends Scene {
  SnakePauseScene( Game g ){ super( g ); }
  
  void update() { println( "pause" ); }
  void render() {}
  
  void interrupt( Input in ){}
}









class SnakeEndScene extends Scene {
  SnakeEndScene( Game g ){ super( g ); }
 
  void update() { println( "end" ); }
  void render() {}
  
  void interrupt( Input in ){} 
}
