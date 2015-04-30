from snake_core import SnakeCore
from snake_kivy_gui import SnakeKivyGUI

skg = SnakeKivyGUI()
sc  = SnakeCore()

skg.init_inout_list([sc],[sc])

sc.start_loop(new_thread=True)
skg.start_loop()
