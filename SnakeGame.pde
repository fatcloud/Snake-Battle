class SnakeGame extends Game<SnakeCore> { 
  SnakeGame(){
    scenes = new HashMap<String, Scene>();
    core   = new SnakeCore();
    scenes.put( "start", new SnakeStartScene( this ) );
    scenes.put( "play" , new SnakePlayScene(  this ) );
    scenes.put( "pause", new NullScene( this ) );
    scenes.put( "end"  , new NullScene( this ) );
    toPlay = scenes.get("start"); 
  }
  
}





class SnakeStartScene extends Scene {
  SnakeStartScene( Game g ){ super( g ); }
  void update() {}
  
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
    sc = (SnakeCore)g.getCore();
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









class NullScene extends Scene {
  NullScene( Game g ){ super( g ); }
 
  void update() { println( "null scene" ); }
  void render() {}
  
  void interrupt( Signal sig ){} 
}
