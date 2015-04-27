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
from mvc import InputProcessor, OutputExecutor


class KivyGUI(Widget, InputProcessor, OutputExecutor):

    def __init__(self, model=None):
        Widget.__init__(self)
        # set the model
        self.model = model
        
        # Keyboard InputProcessor
        self._keyboard = Window.request_keyboard(self._keyboard_closed, self)
        self._keyboard.bind(on_key_down=self.interpret_input)
        
        # OutputExecutor
        Clock.schedule_interval(self.__update_frame, 1.0/60.0)

    def __update_frame(self, dt):
        self.update_frame()

    def _keyboard_closed(self):
        self._keyboard.unbind(on_key_down=self.interpret_input)
        self._keyboard = None
    



