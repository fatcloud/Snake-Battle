import java.util.IdentityHashMap;

SnakeGame  sg;

HashMap<KeyData, Signal> keyMap = new HashMap<KeyData, Signal>();

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
  
  keyMap.put( new KeyData('a'), new Signal( Signal.GO_LEFT   , 0 ) );
  keyMap.put( new KeyData('w'), new Signal( Signal.GO_UP     , 0 ) );
  keyMap.put( new KeyData('d'), new Signal( Signal.GO_RIGHT  , 0 ) );
  keyMap.put( new KeyData('s'), new Signal( Signal.GO_DOWN   , 0 ) );
  keyMap.put( new KeyData(' '), new Signal( Signal.GAME_START, -1) );

  keyMap.put( new KeyData( LEFT  ), new Signal( Signal.GO_LEFT  , 1 ) );
  keyMap.put( new KeyData( UP    ), new Signal( Signal.GO_UP    , 1 ) );
  keyMap.put( new KeyData( RIGHT ), new Signal( Signal.GO_RIGHT , 1 ) );
  keyMap.put( new KeyData( DOWN  ), new Signal( Signal.GO_DOWN  , 1 ) );

}


void keyPressed() {
  Signal sig = keyMap.get( new KeyData( key, keyCode ) );
  
  if( sig != null )
    sg.interrupt( sig );
}
