class SnakeGame extends Game { 
  SnakeGame(){
    scenes = new HashMap<String, Scene>();
    scenes.put( "start", new SnakeStartScene( this ) );
    scenes.put( "play" , new SnakePlayScene(  this ) );
    scenes.put( "pause", new SnakePauseScene( this ) );
    scenes.put( "end"  , new SnakeEndScene(   this ) );
    toPlay = scenes.get("start"); 
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
  
  void interrupt( Signal sig ){ 
    if(sig.getCommand() == Signal.GAME_START )
      switchScene( "play" );
  }
}







class SnakePlayScene extends Scene {
  
  SnakeCore sc;
  
  SnakePlayScene( Game g ){
    super( g );
    sc = new SnakeCore();
    sc.setField( 79, 59 );
    sc.setPlayersNum(2);
  }
  
  void update() { sc.update(); }
  
  void render() {
    background(0);
    sc.render();
  }
  
  void interrupt( Signal sig ){
    sc.interrupt( sig );
  }
}










class SnakePauseScene extends Scene {
  SnakePauseScene( Game g ){ super( g ); }
  
  void update() { println( "pause" ); }
  void render() {}
  
  void interrupt( Signal sig ){}
}









class SnakeEndScene extends Scene {
  SnakeEndScene( Game g ){ super( g ); }
 
  void update() { println( "end" ); }
  void render() {}
  
  void interrupt( Signal sig ){} 
}
