/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainEntry;

import util.Signal;
import processing.core.PApplet;

/**
 *
 * @author fatcloud
 */
public abstract class Scene {
  Game game; 
  public Scene( Game g ){ game = g; }
  public abstract void update();
  public abstract void interrupt( Signal sig );
  public abstract void render( PApplet p );
  
  public void switchScene( String sceneName )
  { game.switchScene( sceneName ); }

  public void switchScene( Scene nextScene )
  { game.switchScene( nextScene ); }
}
