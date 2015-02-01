

class Game {
  HashMap<String, Scene> scenes;
  Scene toPlay;
  
  void switchScene( String sceneName ){ toPlay = scenes.get( sceneName ); }
  void switchScene( Scene scene )  { toPlay = scene; }
  void loop() { toPlay.loop(); }
  void interrupt( Input in ){ toPlay.interrupt( in ); }
}

class Scene {
  Game game;
  
  Scene( Game g ){ game = g; }
  void loop() {}
  void interrupt( Input in ){}
  
  void switchScene( String sceneName )
  { game.switchScene( sceneName ); }

  void switchScene( Scene nextScene )
  { game.switchScene( nextScene ); }
}
