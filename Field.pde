

class Field {
  private int gridSize = 10;
  private HashMap< Door, Door > doorMap;
  
  
  private class Door {
    PVector pos;
    char dir;
    //set door coordinates;
    //set door accept direction;
    //draw a cube to represent the door and features the surface that could be entered with strong stroke
    Door( PVector p , char d ) {
      pos = new PVector( p.x, p.y );
      dir = d;
    }
    
    @Override
    int hashCode() {
      return floor( pos.x + pos.y );
    }
    
    @Override
    boolean equals ( Object obj ) {
      if(!( obj instanceof Door)) 
        return false;
      
      Door d = (Door)obj;
      if ( d.pos.equals(pos) && d.dir == dir )
        return true;
      
      return false;
    }
    
  }  
    
  int getGridSize() {
    return gridSize;
  }
  
  boolean isEnteringDoor( PVector pos, char dir ){
    return ( getDoorOut( pos, dir ) != null );
  }
  
  Door getDoorOut( PVector pos, char dir ){
    Door d = new Door( pos, dir );
    Door dOut;
    
    dOut = doorMap.get(d); 
    return dOut;
  }
  
}
