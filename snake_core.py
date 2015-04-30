from worker.worker import Worker
from kivy.core.window import Window
from random import random
from math import ceil

import numpy as np
from numpy import array as ar


class player(object):
    def __init__(self):
        self.position = ar([0, 0])
        
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
            mission = self.mission_in.get()
            player = self._players[mission['player']]
            cmd = mission['command']
            
            step = mission['speed']
            action_dict = {'up':[0, step], 'down':[0, -step], 'left':[-step, 0], 'right':[step, 0]}
            
            shift = ar(action_dict[cmd])
            print player.position
            player.position += shift
            print player.position
        
    def _export_missions(self, receiver):
        m = ['clear()']
        
        for i in [0, 1]:
            pos = str((self._players[i].position * 10).tolist())
            
            m.append('add(Rectangle(pos='+ pos +', size=(10, 10)))')
        
        return [{'command_list':m}]

        
