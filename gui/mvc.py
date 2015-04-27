"""
MVC model for multiple InputProcessors and OutputExecutors
=================================================
Event driven V.S. Loop on it own

Event comes ---> push job caller, descriptions in my queuedo_your_jod(self)
Loop ---> while True: Do_my_job(self), push everything to my job queue directly

Do your / my job should  be explicitly written in a single function

Is consumer-producer pattern really needed here? -----> good with multiple threads
or just call do_your_job() everyday will work fine? ---> enough for all event-driven architecture
"""

import Queue
import thread


class Looper(object):
    """Looper is inherited for all three classes so that te job can be start in new threads easily"""
    def __init__(self):
        self.routines = []

    @staticmethod
    def infinite_loop(func):
        while True:
            func()
    
    def start_loop(self):
        for looper in self.routines:
            thread.start_new_thread(self.infinite_loop, (looper,))
        

class Model(Looper):
    
    def __init__(self):
        super(Model, self).__init__()
        self.__signal_queue = Queue.PriorityQueue()
        self.routines.append(self.handle_signals)

    def handle_signals(self):
        """Caller:    Any infinite loop    or   External event handler
            This function do the routine job of handling the signals coming from InputProcessor"""
        queue = self.__signal_queue
        if not queue.empty():
            self._handle_signals(queue)

    def put_signal(self, signal):
        """ Caller:    InputProcessor"""
        self.__signal_queue.put(signal)
    
    def _handle_signals(self, signals):
        raise NotImplementedError("Please Implement " + self.__class__.__name__ + ".handle_signals()")

    def export_display_cmds(self, caller):
        """Caller:    OutputExecutor"""
        raise NotImplementedError("Please Implement " + self.__class__.__name__ + ".export_display_cmds()")


class OutputExecutor(Looper):
    """GUI widget, audio effect, or even the movement of a robotic arm
    are all supposed to be controlled by one or more OutputExecutor"""
    def __init__(self):
        super(OutputExecutor, self).__init__()
        self.model = None
        self.routines.append(self.update_frame)

    def update_frame(self):
        """Caller:    Any infinite loop    or   External event handler
            This function acquires and execute commands from Model."""
        commands = self.model.export_display_cmds(caller=self)
        if commands is not None:
            self._execute_cmd(commands)
        
    def _execute_cmd(self, commands):
        raise NotImplementedError("Please Implement " + self.__class__.__name__ + "._execute_cmd()")

      
class InputProcessor(Looper):
    """No matter your program is controlled by keyboard, mouse, camera, or even
    a customized input device, they are supposed to be interpret by an InputProcessor

    An InputProcessor is supposed to convert the raw action received from devices to
    Signals that are meaningful to Model and pass it over"""
    
    def __init__(self, **kwargs):
        super(InputProcessor, self).__init__()
        self.model = None
        self.routines.append(self.interpret_input)

    def interpret_input(self, *args, **kwargs):
        """Caller:     Any infinite loop    or   External event handler
        This function convert raw input to Signals that are meaningful to the Model"""
        signals = self._convert_to_signal(*args, **kwargs)
        if signals is not None:
            self.model.put_signal(signals)

    def _convert_to_signal(self, *args, **kwargs):
        raise NotImplementedError("Please Implement " + self.__class__.__name__ + "._key_to_signal()")
