

class Game {
  HashMap<String, Scene> scenes;
  Scene toPlay;
  
  void switchScene( String sceneName ){ toPlay = scenes.get( sceneName ); }
  void switchScene( Scene scene )  { toPlay = scene; }
  void update() { toPlay.update(); }
  void render() { toPlay.render(); }
  void interrupt( Input in ){ toPlay.interrupt( in ); }
}

abstract class Scene {
  Game game;
  
  Scene( Game g ){ game = g; }
  abstract void update();
  abstract void interrupt( Input in );
  abstract void render();
  
  void switchScene( String sceneName )
  { game.switchScene( sceneName ); }

  void switchScene( Scene nextScene )
  { game.switchScene( nextScene ); }
}
