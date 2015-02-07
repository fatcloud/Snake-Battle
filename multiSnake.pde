import java.util.IdentityHashMap;

SnakeGame  sg;

HashMap<keyData, Signal> keyMap = new HashMap<keyData, Signal>();

void setup(){
  size(800,600);
  sg = new SnakeGame();
  
  initKeyCommands();
}


void draw(){
  sg.update();
  sg.render();
}




void initKeyCommands() {
  
  keyMap.put( new keyData('a'), new Signal( Signal.GO_LEFT   , 0 ) );
  keyMap.put( new keyData('w'), new Signal( Signal.GO_UP     , 0 ) );
  keyMap.put( new keyData('d'), new Signal( Signal.GO_RIGHT  , 0 ) );
  keyMap.put( new keyData('s'), new Signal( Signal.GO_DOWN   , 0 ) );
  keyMap.put( new keyData(' '), new Signal( Signal.GAME_START, -1) );

  keyMap.put( new keyData( LEFT  ), new Signal( Signal.GO_UP    , 1 ) );
  keyMap.put( new keyData( UP    ), new Signal( Signal.GO_DOWN  , 1 ) );
  keyMap.put( new keyData( RIGHT ), new Signal( Signal.GO_RIGHT , 1 ) );
  keyMap.put( new keyData( DOWN  ), new Signal( Signal.GO_LEFT  , 1 ) );

}


void keyPressed() {
  Signal sig = keyMap.get( new keyData( key, keyCode ) );
  
  if( sig != null )
    sg.interrupt( sig );
}
