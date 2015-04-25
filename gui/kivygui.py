#!/usr/bin/env python

'''
KivyGUI is a base class that meant to be inherited to create app
that convert keyboard event to "Model" signal and grab render
command back when it is ready to update the next frame
'''

import thread
import time

from kivy.uix.widget import Widget
from kivy.graphics import Color, Rectangle
from random import random as r
from kivy.clock import Clock
from kivy.core.window import Window
from kivy.base import runTouchApp

import mvc

# Pass a model that has model.put_signal(signal)
# and model.get_render_cmd() into this constructor
class KivyGUI(Widget, mvc.InputProcessor, mvc.OutputExecutor):

    def __init__(self, model=None, **kwargs):
        super(KivyGUI, self).__init__(**kwargs)
        
        # set the model
        self.model = model
        
        # Keyboard InputProcessor
        self._keyboard = Window.request_keyboard(self._keyboard_closed, self)
        self._keyboard.bind(on_key_down=self.on_user_input)
        
        # OutputExecutor
        Clock.schedule_interval(self.update_frame, 1.0/60.0)

    def _keyboard_closed(self):
        self._keyboard.unbind(on_key_down=self.on_user_input)
        self._keyboard = None
    


if __name__ == '__main__':
    print __doc__
    sm = SimpleModel()
    thread.start_new_thread(sm.loop, ())
    runTouchApp(KivyGUI(sm))


