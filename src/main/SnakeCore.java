package main;
import SnakeObjects.Field;
import util.Signal;
import SnakeObjects.Food;
import SnakeObjects.Snake;
import java.util.ArrayList;
import processing.core.*;
// this class contains all the data required to construct
// a game scene. Try to make this as independent to processing
// as possible!


public class SnakeCore {
  
  PApplet  app;
  int      gameState;
  int      numPlayers;
  
  Field    field;
  ArrayList<Snake>   snakes;
  ArrayList<Food>    foods;
  
  // initialize the position of snakes and foods
  public SnakeCore( PApplet p ){
    app = p;
    field     = new Field( 80, 60 );
    snakes    = new ArrayList<Snake>();
    newSnake( 5, 5, 10, app.color( 255, 0, 0 ) );
    newSnake( 50, 5, 10, app.color( 0, 255, 0) );
    // initialize game state such as score (?)
    // initialize the snakes
    // initialize foods
  }
  
  public Field getField() {
      return field;
  }
  
  void newSnake( int x, int y, int len, int c ){
    snakes.add( new Snake( this ) );
    Snake s = snakes.get( snakes.size() - 1 );
    
    s.setHeadPosition( x, y );
    s.setLength( len );
    s.setColor( c );
  }
  
  public void render() {
    for ( Snake s : snakes )
      s.render( app );
    
    //for ( Food f : foods )
    //  f.render( gridSize );
    
  }
  
  public void setField( int x, int y ) {
    //fieldSize.set( x, y );
    //
  }
  
  public void setPlayersNum( int n ) {
    numPlayers = n;
  }
  

  
  
  public void update(){
    // 1. move everything according to the position
    for( Snake s : snakes )
      s.updatePosition( );
    
  }
  
  
  public void interrupt( Signal sig ){
    Snake s = snakes.get( sig.getPlayer() );
    char d = 'l';
    switch(sig.getCommand()){
        case(0):
            d = 'l';
            break;
        case(1):
            d = 'r';
            break;
        case(2):
            d = 'u';
            break;
        case(3):
            d = 'd';
            break;        
    }
    
    s.setDirection( d );
  }
};
