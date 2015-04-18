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


def loop(function, *args, **kagrs):
    wihle True:
        function(args, kargs)


class Model:

    def __init__(self):
        # connect the controllers
        self._event_queue = Queue.PriorityQueue()
    
    # Controller will call this
    def put_signal(self, signal):
        self._event_queue.put(signal)
    
    # Infinite loop to update the Model
    def update(self):
        raise NotImplementedError(
            "Model._update() not implemented yet")
            
    # Displayers will call this
    def render(self):
        # return the drawing commands to the caller
        raise NotImplementedError(
            "Model.render() not implemented yet")

            
class Displayer:

    # Displayers must maintain a pointer to a model
    def __init__(self, model=None):
        self._model = model
    
    @model.setter
    def model(self,model):
        self._model = model
    
    
    # There should be a infinite loop that run this
    def render(self):
        cmds = self._model.render()
        self._interpret(cmds)
    
    
    # Helper functions that actually define the behaviour of
    # this displayer
    def _interpret(self, cmds):
        raise NotImplementedError(
            "Displayer._interpret(cmds) not implemented yet")
            
            
class Controller:

    # Controller must maintain a pointer to a model as well
    def __init__(self, model=None):
        self._model = model
    
    @model.setter
    def model(self,model):
        self._model = model
    
    
    # Model.put_signal() can be triggered in two style:
    # polling (loop checking) and interrupt
    # At least one of the two function have to be implemented
    # to make a controller useful
    def poll(self):
        raise NotImplementedError(
            "Controller.poll() not implemented yet")

    def interrupt(self, *args, **kargs):
        raise NotImplementedError(
            "Controller.interrupt() not implemented yet")
            
