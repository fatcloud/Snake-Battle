package util;
// This class can be construct via providing
// a key or a keyCode or both

import static processing.core.PConstants.CODED;

// the function equals is implemented in order to 
// make it usable for HashMap
public class KeyData {
  char _key;
  int  _keyCode;
  
  ///////////// Three different constructor! ////////////////
  
  public KeyData( char ikey, int ikeyCode ){
    _key     = ikey;
    _keyCode = ikeyCode;
  }
  
  
  public KeyData( char ikey ){
    _key     = ikey;
    _keyCode = -1;
  }
  
  
  public KeyData( int ikeyCode ){
    _key = CODED;
    _keyCode = ikeyCode;
  }

  //////////// hashCode() and equals( Object ) ////////////////

  @Override
  public int hashCode(){
    if( _key == CODED )
      return _keyCode;
    else
      return _key;
  }


  @Override
  public boolean equals( Object obj ){
    if( !( obj instanceof KeyData ) )
      return false;
    
    KeyData k = (KeyData)obj;
    if( k._key == CODED )
      return _keyCode == k._keyCode;
    else
      return k._key == _key;
  }
}
