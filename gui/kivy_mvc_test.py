#!/usr/bin/env python

import thread
import Queue
import time

import kivygui
import thread
import mvc
from kivy.graphics import Color, Rectangle
from random import random as r
from kivy.base import runTouchApp


class SimpleModel(mvc.Model):

    def __init__(self):
        super(SimpleModel, self).__init__()
        self._sqrt_time = time.clock()

    def _handle_signals(self, signals):
        while not signals.empty():
            signal = signals.get()
            if signal[1] == 'show square' and signal[0] > self._sqrt_time:
                self._sqrt_time = signal[0]
        signals.task_done()

    def export_display_cmds(self, caller):
        commands = (time.clock() < self._sqrt_time + 0.1)
        return commands

        
class SimpleWindow(kivygui.KivyGUI):
    
    # translate keyboard command to model signal    
    def _convert_to_signal(self, keyboard, key_code, text, modifiers):
        if key_code[1] == 'up':
            sig = (time.clock(), 'show square')
            return sig
        else:
            exit()
    
    # interpret model render command and do the actual drawing
    def _execute_cmd(self, commands):
        if commands:
            with self.canvas:
                Color(r(), 1, 1, mode='hsv')
                Rectangle(pos=(r() * self.width,
                    r() * self.height), size=(20, 20))


if __name__ == '__main__':
    # print __doc__
    sm = SimpleModel()
    sm.start_loop()
    runTouchApp(SimpleWindow(sm))


