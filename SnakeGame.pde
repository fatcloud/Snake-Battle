class SnakeGame extends Game { 
  SnakeGame(){
    scenes.put( "start", new SnakeStartScene( this ) );
    scenes.put( "play" , new SnakePlayScene( this )  );
    scenes.put( "pause", new SnakePauseScene( this ) );
    scenes.put( "end"  , new SnakeEndScene( this )   );
    toPlay = scenes.get("start"); 
  }
  
  void handleKey( char key, int keyCode ) {
    Input in = null;
    switch(key){
      case 'a':
        in = new Input( Input.GO_LEFT, 1 );
        break;
      case 'w':
        in = new Input( Input.GO_UP, 1 );
        break;
      case 'd':
        in = new Input( Input.GO_RIGHT, 1 );
        break;
      case 's':
        in = new Input( Input.GO_DOWN, 1 );
        break; 
    }  
    switch(keyCode){
      case UP:
        in = new Input( Input.GO_UP, 2 );
        break;
      case DOWN:
        in = new Input( Input.GO_DOWN, 2 );
        break;
      case RIGHT:
        in = new Input( Input.GO_RIGHT, 2 );
        break;
      case LEFT:
        in = new Input( Input.GO_LEFT, 2 );
        break;
    }
    if( in != null )
      sg.interrupt( in );
  
  }
}

class SnakeStartScene extends Scene {
  //SnakeStartScene( Game g ){ game = g; }
  void loop() { transScene( "play" ); }
}

class SnakePlayScene extends Scene {
  
}

class SnakePauseScene extends Scene {
  
}

class SnakeEndScene extends Scene {
  
}
