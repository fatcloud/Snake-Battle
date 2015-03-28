'''
Canvas stress
=============

This is just a test for testing the performance of our Graphics engine.
'''

from kivy.uix.button import Button
from kivy.uix.widget import Widget
from kivy.uix.label import Label
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.gridlayout import GridLayout
from kivy.app import App
from kivy.graphics import Color, Rectangle
from random import random as r
from functools import partial

    
    
from kivy.app import App
from kivy.uix.gridlayout import GridLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput


class BoxesCanvus(GridLayout):

    def __init__(self, **kwargs):
        super(BoxesCanvus, self).__init__(**kwargs)
        

    def add_rects(self, count, *largs):
        with self.canvas:
            for x in range(count):
                Color(r(), 1, 1, mode='hsv')
                Rectangle(pos=(r() * self.width + self.x,
                               r() * self.height + self.y), size=(20, 20))

class MyApp(App):

    def build(self):
        bc = BoxesCanvus()
        bc.add_rects(100)
        return bc


if __name__ == '__main__':
    MyApp().run()
    
