import getch
import threading

class KeyboardController(threading.Thread):
    
    def __init__(self, receiver = None):
        self._intepretor = { 'k':'yaha!' }
        self._receiver = receiver
        threading.Thread.__init__(self)

    def set_receiver(self, receiver):
        self._receiver = receiver
    
    def run(self):
        while True:
            key = getch.getch()
            self.fire(key)
    
    def fire(self, raw_command):
        signal = self._intepretor[raw_command]
        self._receiver.put(signal)        

# c = Controller()
# c.setDaemon()
# c.start()
