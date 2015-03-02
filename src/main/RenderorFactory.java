package main;

class RenderorFactory {
  RenderLib lib;
  
  RenderorFactory( RenderLib rl ){
    lib = rl;
  }
}


class SnakeRenderorFactory extends RenderorFactory {
  SnakeRenderorFactory( RenderLib rl ){
    super(rl);
  }
  
  // Get various kind of renderors by following function calls
  
  Renderor getSnakeRenderor(){
    return SnakeRenderor.getInstance( lib );
  }
}


class SnakeRenderor extends Renderor {
  
  void render( Object o ){
    
  }
  
}
