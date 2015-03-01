
class Renderor {
  
  private static Renderor renderor = null;
  protected Renderor(){};
  
  static RenderLib lib;
  
  static Renderor getInstance( RenderLib rl ) {
    if( renderor == null )
      renderor = new Renderor();
    
    lib = rl;
    
    return renderor;
  }
  
  void render( Object o ){}
  
}



interface RenderLib{
  
}
