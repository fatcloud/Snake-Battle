from worker.worker import link_worker
from snake_core import SnakeCore
from snake_kivy_gui import SnakeKivyGUI
from artist_director import ArtistDirector


kivyui = SnakeKivyGUI()
core   = SnakeCore()
art = ArtistDirector()

'''
# pass key-event
link_worker(source=kivyui, destination=core , caller=kivyui, event_driven_link=False)

# pass render command
link_worker(source=core , destination=kivyui, caller=kivyui, event_driven_link=False)
'''

# pass key-event
link_worker(source=kivyui, destination=core , caller=kivyui, event_driven_link=False)

link_worker(source=core, destination=art , caller=art, event_driven_link=False)

# pass render command
link_worker(source=art , destination=kivyui, caller=kivyui, event_driven_link=True)



core.start_loop(new_thread=True)
kivyui.start_loop()
