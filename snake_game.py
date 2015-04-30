from snake_core import SnakeCore
from snake_kivy_gui import SnakeKivyGUI
from artist_director import ArtistDirector


skg = SnakeKivyGUI()
sc  = SnakeCore()
# art = ArtistDirector()

skg.init_inout_list([sc],[sc])
#srt.init_inout_list([],[skg])

sc.start_loop(new_thread=True)
skg.start_loop()
