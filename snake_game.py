from worker.worker import link_worker
from snake_core import SnakeCore
from snake_kivy_gui import SnakeKivyGUI
from artist_director import ArtistDirector


skg = SnakeKivyGUI()
sc  = SnakeCore()
# art = ArtistDirector()

link_worker(source=skg, destination=sc, caller=skg, event_driven_link=True)
link_worker(source=sc, destination=skg, caller=skg, event_driven_link=False)

sc.start_loop(new_thread=True)
skg.start_loop()
