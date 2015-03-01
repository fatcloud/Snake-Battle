/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SnakeScenes;

import mainEntry.Game;
import mainEntry.Scene;
import util.Signal;
import processing.core.PApplet;
import static processing.core.PApplet.println;

/**
 *
 * @author fatcloud
 */
public class NullScene extends Scene {
  public NullScene( Game g ){ super( g ); }
 
  public void update() { println( "null scene" ); }
  public void render( PApplet p) {}
  public void interrupt( Signal sig ){} 
}
