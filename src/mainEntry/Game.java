package mainEntry;

import util.Signal;
import java.util.HashMap;
import processing.core.PApplet;

public class Game<T> {
  HashMap<String, Scene> scenes;
  Scene toPlay;
  T     core;
  
  public T    getCore(){ return core; }
  public void switchScene( String sceneName ){ toPlay = scenes.get( sceneName ); }
  public void switchScene( Scene scene )  { toPlay = scene; }
  
  public void update() { toPlay.update(); }
  public void render( PApplet p ) { toPlay.render(p); }
  public void interrupt( Signal sig ){ toPlay.interrupt( sig ); }
}


