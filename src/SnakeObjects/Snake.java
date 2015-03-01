/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SnakeObjects;

import java.util.ArrayList;
import mainEntry.SnakeCore;
import mainEntry.Visible;
import processing.core.PApplet;
import processing.core.PVector;

/**
 *
 * @author fatcloud
 */
public class Snake implements Visible {

  // the snake game
  SnakeCore  snakeCore;
  
  // imformation required for rendering
  int   col;
  
  // imformation about location, length
  ArrayList<SnakeBody> bodyParts;

  int     state;          // Alive? Invincible? Normal? etc.
  int     direction;
  float   speed;          // unit: steps per frame
  
  
  public static final int 
      GO_LEFT        = 0,
      GO_RIGHT       = 1,
      GO_UP          = 2,
      GO_DOWN        = 3;
  
  public Snake( SnakeCore sc ){
    snakeCore = sc;
    SnakeBody head = new SnakeBody(0,0);
    bodyParts = new ArrayList<SnakeBody>();
    direction = 0;
    
    bodyParts.add( head );
  }
  
  public void setHeadPosition( int x, int y ) {
    SnakeBody head = bodyParts.get(0);
    head.set( x, y );
  }
  
  public void setLength( int len ){
    int initLen = bodyParts.size();
    if( len > initLen ) {
      SnakeBody sb = bodyParts.get( bodyParts.size() - 1 );
      for( int i = initLen; i < len; ++i )
        bodyParts.add( new SnakeBody( sb.x, sb.y) );
    } else {
      for ( int i = initLen - 1; i > len ; --i ) 
        bodyParts.remove( i );
    }
  }
  
  public void setColor( int c ) {
    col = c;
  }
  
  public void setDirection( int dir ) {
    direction = dir;
  }
  
  
  
  public void updatePosition( PVector fieldSize ){
        
    //head
    SnakeBody sb = bodyParts.get(0);
    for( int i = bodyParts.size() - 1; i > 0; --i){
      SnakeBody sbp = bodyParts.get(i);
      sbp.x = bodyParts.get( i - 1 ).x;
      sbp.y = bodyParts.get( i - 1 ).y;
    }
    
    //move sb
    switch (direction) {
      case GO_LEFT:
        sb.x = sb.x - 1;
        if( sb.x < 0 ) sb.x = fieldSize.x;
        break;
      case GO_RIGHT:
        sb.x = sb.x + 1;
        if( sb.x > fieldSize.x ) sb.x = 0;
        break;
      case GO_UP:
        sb.y = sb.y - 1;
        if( sb.y < 0 ) sb.y = fieldSize.y;
        break;
      case GO_DOWN:
        sb.y = sb.y + 1;
        if( sb.y > fieldSize.y ) sb.y = 0;
        break;
    }
    
    
  }
  
  
  
  
  public void render( PApplet p ){
    for( SnakeBody sb : bodyParts ){
      p.fill( col );
      int gridSize = 10;//snakeCore.gridSize;
      p.rect( sb.x * gridSize, sb.y * gridSize, gridSize, gridSize );
    }
  }
  
}
