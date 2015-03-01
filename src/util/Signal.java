package util;
import java.util.ArrayList;
import processing.core.*;


public class Signal{
    public static final int
      GO_LEFT        = 0,
      GO_RIGHT       = 1,
      GO_UP          = 2,
      GO_DOWN        = 3,
      JUMP           = 4,
      GAME_START     = 5,
      GAME_PAUSE     = 6,
      GAME_CONTINUE  = 7;
    
    private int  command;    
    private int  player;

    public Signal( int c, int p ) {
      command = c;
      player  = p;
    }
  
    public int getPlayer() {
      return player;
    }
    
    public int getCommand() {
      return command;
    }
}
