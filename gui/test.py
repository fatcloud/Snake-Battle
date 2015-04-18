#!/usr/bin/env python

import thread
import Queue
import time

import kivygui

class SimpleModel(kivygui.Model):

    def __init__(self, **kwargs):
        super(SimpleModel, self).__init__(**kwargs)
        self._sqrt_time = time.clock()
    
    
    def handle_signal(self, signal):
        if signal[1] == 'show square' and signal[0] > self._sqrt_time:
            self._sqrt_time = signal[0]
            
    # Displayers will call this
    def get_render_cmd(self):
        cmds = (time.clock() < self._sqrt_time + 0.1)
        return cmds

        
# Pass a model that has model.put_signal(signal)
# and model.get_render_cmd() into this constructor
class SimpleWindow(Widget):

    def __init__(self, model=None, **kwargs):
        super(SimpleWindow, self).__init__(**kwargs)
        
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
        
    # translate keyboard command to model signal    
    def _key_to_siganl(self, keyboard, keycode, text, modifiers):
        if keycode[1] == 'up':
            sig = (time.clock(),'show square')
            return sig
        else:
            exit()
        #raise NotImplementedError(
        #        "Please Implement this method")
    
    # interpret model render command and do the actual drawing
    def _render_from_cmd(self, cmds):
        if cmds:
            with self.canvas:
                Color(r(), 1, 1, mode='hsv')
                Rectangle(pos=(r() * self.width,
                    r() * self.height), size=(20, 20))
        #raise NotImplementedError(
        #        "Please Implement this method")
    




if __name__ == '__main__':
    print __doc__
    sm = SimpleModel()
    thread.start_new_thread(sm.loop, ())
    runTouchApp(SimpleWindow(sm))


