/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SnakeScenes;

import main.Game;
import main.Scene;
import util.Signal;
import main.SnakeCore;
import processing.core.PApplet;

/**
 *
 * @author fatcloud
 */
public class SnakePlayScene extends Scene {
  SnakeCore sc;
  
  public SnakePlayScene( Game g ){
    super( g );
    sc = (SnakeCore)g.getCore();
    sc.setField( 79, 59 );
    sc.setPlayersNum(2);
  }
  
  public void update() { sc.update(); }
  
  public void render(PApplet p) {
    p.background(0);
    sc.render();
  }
  
  public void interrupt( Signal sig ){
    sc.interrupt( sig );
  }
}
