from worker.worker import Worker
from kivy.core.window import Window
from random import random
from math import ceil

import Queue

import numpy as np
from numpy import array as ar
from kivy.graphics import Color

class player(object):
    def __init__(self):
        self.position = ar([0, 0])
        self.color = Color(random(), 1, 1, mode='hsv')
        
class SnakeCore(Worker):
    def __init__(self):
        Worker.__init__(self)
        layout = { 'grid_size':10, 'width':80, 'height':40}
        gd = layout['grid_size']
        w  = layout['width']
        h  = layout['height']
        ww = gd * w
        hh = gd * h
        Window.size = (ww, hh)
        
        self._layout = layout
        players = [player(), player()]
        for i in [0, 1]:
            players[i].position = ar([ceil(random() * x) for x in [w, h]])
        
        self._players = players

    def _routine(self):
        while not self.mission_in.empty():
            try: mission = self.mission_in.get_nowait()
            except Queue.Empty: break
            player = self._players[mission['player']]
            cmd = mission['command']
            
            step = mission['speed']
            action_dict = {'up':[0, step], 'down':[0, -step], 'left':[-step, 0], 'right':[step, 0]}
            
            shift = ar(action_dict[cmd])
            player.position += shift
        
    def _export_todo(self, receiver):
        m = ['clear()']
        
        for i in [0, 1]:
            # draw every snake
            player = self._players[i]
            grid_size = self._layout['grid_size']
            pos = str((player.position * grid_size).tolist())
            c = player.color
            c = str((c.h, c.s, c.v))
            m.append('add(Color' + c + ')')
            m.append('add(Rectangle(pos='+ pos +', size=(10, 10)))')
        
        return [{'command_list':m}]

        
