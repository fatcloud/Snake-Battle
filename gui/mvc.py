'''
MVC model for multiple controllers and displayers
=================================================


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
    def _update_frame(self, loop=False):
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
    
            
