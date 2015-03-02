package main;
import SnakeScenes.NullScene;
import SnakeScenes.SnakePlayScene;
import SnakeScenes.SnakeStartScene;
import java.util.HashMap;
import processing.core.PApplet;

public class SnakeGame extends Game<SnakeCore> { 
  public SnakeGame( PApplet p ){
    scenes = new HashMap<String, Scene>();
    core   = new SnakeCore( p );
    scenes.put( "start", new SnakeStartScene( this ) );
    scenes.put( "play" , new SnakePlayScene(  this ) );
    scenes.put( "pause", new NullScene( this ) );
    scenes.put( "end"  , new NullScene( this ) );
    toPlay = scenes.get("start"); 
  }
  
}