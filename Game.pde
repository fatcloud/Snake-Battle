class Game {
  HashMap<String, Scene> scenes;
  Scene toPlay;
  
  void loop() {
    toPlay.loop();
  }
  
  void interrupt( Input in ){
    toPlay.interrupt( in );
  }
}

class Scene {
  Game game;
  
  Scene( Game g ){ game = g; }
  void loop() {}
  void interrupt( Input in ){}
  
  void transScene( String nextSceneName )
  { game.toPlay = game.scenes.get( nextSceneName ); }

  void transScene( Scene nextScene )
  { game.toPlay = nextScene; }
}
