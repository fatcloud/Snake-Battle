'''
MVC model for multiple InputProcessors and OutputExecutors
=================================================


'''

import Queue


class Looper(object):
    
    def __init__(self):
        self.looper = []
    
    def infinite_loop(self, func):
        while True:
            func()
    
    def start_loop(self):
        for looper in self.looper:
            thread.start_new_thread(infinite_loop, looper)
        

class Model(Looper):
    
    def __init__(self):
        super(Model, self).__init__()
        self.__signal_queue = Queue.PriorityQueue()
        self.looper = self.looper.append(self.__consume_signals)
    
    def __consume_signals(self):
        queue = self.__signal_queue
        while not queue.empty():
            signal = queue.get()
            self._handle_signal(signal)
            queue.task_done()
        
    # InputProcessor will call this
    def put_signal(self, signal):
        self.__signal_queue.put(signal)
    
    # This function receives signal
    def _handle_signal(self, signal):
        raise NotImplementedError(
                "Please Implement " + self.__class__.__name__ + ".handle_signal()")
        
    # OutputExecutor will call this
    def export_output_cmd(self, caller):
        raise NotImplementedError(
                "Please Implement " + self.__class__.__name__ + ".export_output_cmd()")


          
                
class OutputExecutor(Looper):
    
    """
    GUI widget, audio effect, or even the movement of a robotic arm
    are all supposed to be controlled by one or more OutputExecutor
    
    """
    
    def __init__(self):
        self.model = None
        self.looper = self.looper.append(update_frame)
    
    def update_frame(self, loop=False):
        cmds = self.model.export_output_cmd()
        self._execute_cmd(cmds)
        
    def _execute_cmd(self, cmds):
        raise NotImplementedError(
                "Please Implement " + self.__class__.__name__ + "._execute_cmd()")


    
      
class InputProcessor(Looper):

    """
    No matter your program is controlled by keyboard, mouse, camera, or even
    a customized input device, they are supposed to be interpret by an InputProcessor
    """
    
    def __init__(self):
        self.model = None
        self.looper = self.looper.append(self.on_user_input)
     
    # external action triggers an interrupt
    def on_user_input(self, *args, **kargs):
        sigs = self._convert_to_siganl(*args, **kargs)
        if sigs != None:
            self.model.put_signal(sigs)
    
    # Translate keyboard command to model signal
    def _convert_to_siganl(self, *args, **kargs):
        raise NotImplementedError(
                "Please Implement " + self.__class__.__name__ + "._key_to_siganl()")
    
       
