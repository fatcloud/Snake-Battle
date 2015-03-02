/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SnakeScenes;

import main.Game;
import main.Scene;
import util.Signal;
import processing.core.PApplet;
/**
 *
 * @author fatcloud
 */
public class SnakeStartScene extends Scene {
  public SnakeStartScene( Game g ){ super( g ); }
  public void update() {}
  
  public void render( PApplet p ) {
    p.background(0);
    p.fill(255);
    p.textSize(32);
    p.text("Press <SPACE> to start",p.width/2,p.height/2);
  }
  
  public void interrupt( Signal sig ){ 
    if(sig.getCommand() == Signal.GAME_START )
      switchScene( "play" );
  }
}
