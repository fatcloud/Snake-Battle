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


# Pass a model that has model.put_signal(signal)
# and model.get_render_cmd() into this constructor
class KivyGUI(Widget):

    def __init__(self, model=None, **kwargs):
        super(KivyGUI, self).__init__(**kwargs)
        
        # set the model
        self._model = model
        
        # Keyboard Controller
        self._keyboard = Window.request_keyboard(self._keyboard_closed, self)
        self._keyboard.bind(on_key_down=self._on_key_down)
        
        # Displayer
        Clock.schedule_interval(self._update_frame, 1.0/60.0)
        
    # Displayer <--- Model.get_render_cmd()
    def _update_frame(self, dt):
        cmds = self._model.get_render_cmd()
        self._render_from_cmd(cmds)

    def _keyboard_closed(self):
        self._keyboard.unbind(on_key_down=self._on_key_down)
        self._keyboard = None
    
    # Controller ---> model.put_signal
    def _on_key_down(self, keyboard, keycode, text, modifiers):
        sigs = self._key_to_siganl(keyboard, keycode, text, modifiers)
        self._model.put_signal(sigs)
        return True
        
    # Translate keyboard command to model signal
    def _key_to_siganl(self, keyboard, keycode, text, modifiers):
        raise NotImplementedError(
                "Please Implement " + self.__class__.__name__ + "._key_to_siganl()")
    
    # Do the actual drawing according to the commands returned by Model
    def _render_from_cmd(self, cmds):
        raise NotImplementedError(
                "Please Implement " + self.__class__.__name__ + "._render_from_cmd()")
    




if __name__ == '__main__':
    print __doc__
    sm = SimpleModel()
    thread.start_new_thread(sm.loop, ())
    runTouchApp(KivyGUI(sm))


