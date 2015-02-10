

class Game<T> {
  HashMap<String, Scene> scenes;
  Scene toPlay;
  T     core;
  
  T    getCore(){ return core; }
  void switchScene( String sceneName ){ toPlay = scenes.get( sceneName ); }
  void switchScene( Scene scene )  { toPlay = scene; }
  void update() { toPlay.update(); }
  void render() { toPlay.render(); }
  void interrupt( Signal sig ){ toPlay.interrupt( sig ); }
}

abstract class Scene {
  Game game;
  
  Scene( Game g ){ game = g; }
  abstract void update();
  abstract void interrupt( Signal sig );
  abstract void render();
  
  void switchScene( String sceneName )
  { game.switchScene( sceneName ); }

  void switchScene( Scene nextScene )
  { game.switchScene( nextScene ); }
}
