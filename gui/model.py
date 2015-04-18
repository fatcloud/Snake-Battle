'''
MVC model for multiple controllers and displayers
=================================================

There are three base classes in this file. 
All three classes are supposed to be running
on independent thread.

class "Model"" is a thread that update the internal
state according to time transition and input "signal".

class "Controller" interprets input from various
source such as keyboard/mouse/camera/serial port
to "signal" that are indeed meaningful to "Model"

class "Displayer" ask Model for what to render periodically


Model:
    _update()               infinite loop of the thread
    push_signal(signal)     call by Controller
    render()                call by Displayer

Displayer:
    _render()               infinite loop of the thread.
                            will call Model.render()
    
Controller:
    _interpret_input        infinite loop of the thread.
                            will call Model.push_signal()

'''


import Queue


class Model(object):
    
    def __init__(self):
        self._signal_queue = Queue.PriorityQueue()

    # Infinite loop to update the Model
    def loop(self):
        while True:
            queue = self._signal_queue
            while not queue.empty():
                signal = queue.get()
                self.handle_signal(signal)
                queue.task_done()
        
    # Controller will call this
    def put_signal(self, signal):
        self._signal_queue.put(signal)
    
    # This function receives signal
    def handle_signal(self, signal):
        raise NotImplementedError(
                "Please Implement " + self.__class__.__name__ + ".handle_signal()")
        
    # Displayer will call this
    def get_render_cmd(self):
        raise NotImplementedError(
                "Please Implement " + self.__class__.__name__ + ".get_render_cmd()")


class Displayer:
    
    def set_model(model):
        self._model = model
    
    # Displayer <--- Model.get_render_cmd()
    # this function should be scheduled in an infinite loop
    def _update_frame(self):
        cmds = self._model.get_render_cmd()
        self._render_from_cmd(cmds)
        
    def _render_from_cmd(self, cmds):
        raise NotImplementedError(
                "Please Implement " + self.__class__.__name__ + "._render_from_cmd()")
    
            
            
class Controller:
    def set_model(model):
        self._model = model
    
    # external action triggers an interrupt
    def interrupt(self, *args, **kargs):
        sigs = self._convert_to_siganl(*args, **kargs)
        self._model.put_signal(sigs)
        return True
        
    # Translate keyboard command to model signal
    def _convert_to_siganl(self, *args, **kargs):
        raise NotImplementedError(
                "Please Implement " + self.__class__.__name__ + "._key_to_siganl()")
    
            
