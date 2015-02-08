// This class can be construct via providing
// a key or a keyCode or both
// the function equals is implemented in order to 
// make it usable for HashMap

class keyData {
  char _key;
  int  _keyCode;
  keyData( char ikey, int ikeyCode ){
    _key     = ikey;
    _keyCode = ikeyCode;
  }
  
  
  keyData( char ikey ){
    _key     = ikey;
    _keyCode = -1;
  }
  
  
  keyData( int ikeyCode ){
    _key = CODED;
    _keyCode = ikeyCode;
  }


  @Override
  int hashCode(){
    if( _key == CODED )
      return _keyCode;
    else
      return _key;
  }


  @Override
  boolean equals( Object obj ){
    if( !( obj instanceof keyData ) )
      return false;
    
    keyData k = (keyData)obj;
    if( k._key == CODED )
      return _keyCode == k._keyCode;
    else
      return k._key == _key;
  }
}
