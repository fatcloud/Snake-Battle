import java.util.IdentityHashMap;

SnakeGame  sg;

HashMap<keyData, Input>  keyMap 
    = new HashMap<keyData, Input>();

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
  
  keyMap.put( new keyData('a'), new Input( Input.GO_LEFT   , 0 ) );
  keyMap.put( new keyData('w'), new Input( Input.GO_UP     , 0 ) );
  keyMap.put( new keyData('d'), new Input( Input.GO_RIGHT  , 0 ) );
  keyMap.put( new keyData('s'), new Input( Input.GO_DOWN   , 0 ) );
  keyMap.put( new keyData(' '), new Input( Input.GAME_START, -1) );

  keyMap.put( new keyData( LEFT  ), new Input( Input.GO_UP    , 1 ) );
  keyMap.put( new keyData( UP    ), new Input( Input.GO_DOWN  , 1 ) );
  keyMap.put( new keyData( RIGHT ), new Input( Input.GO_RIGHT , 1 ) );
  keyMap.put( new keyData( DOWN  ), new Input( Input.GO_LEFT  , 1 ) );

}


void keyPressed() {
  Input in = keyMap.get( new keyData( key, keyCode ) );
  
  if( in != null )
    sg.interrupt( in );
}
