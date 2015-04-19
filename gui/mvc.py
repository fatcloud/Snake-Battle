'''
MVC model for multiple controllers and displayers
=================================================


'''


import Queue
import thread

class Model(object):
    
    def __init__(self, start_thread=True):
        # initialize the queue
        self._signal_queue = Queue.PriorityQueue()
        # start a thread to keep the model updated
        if start_thread:
            thread.start_new_thread(self.loop, ())

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


                
''' not done yet
                
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
    
'''
            
class Controller(object):

    def __init__(self, model=None, start_thread=True):
        self._model = model
        if model != None and start_thread == True:
            thread.start_new_thread(self.loop, ())
    
    def set_model(self, model):
        self._model = model
    
    # external action triggers an interrupt
    def interrupt(self, *args, **kargs):
        sigs = self._convert_to_siganl(*args, **kargs)
        self._model.put_signal(sigs)
        return True
    
    # polling
    def loop(self):
        while True:
            cmds = _convert_to_siganl(self)
            if cmds != None:
                self._model.put_signal(sigs)
    
    # Translate keyboard command to model signal
    def _convert_to_siganl(self, *args, **kargs):
        raise NotImplementedError(
                "Please Implement " + self.__class__.__name__ + "._key_to_siganl()")
    
       
