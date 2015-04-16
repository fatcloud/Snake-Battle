
"""        
Example usage
def someOtherFunc(data, key):
    print "someOtherFunc was called : data=%s; key=%s" % (str(data), str(key))
 
t1 = FuncThread(someOtherFunc, [1,2], 6)
t1.start()
t1.join()
"""

import threading

class FuncThread(threading.Thread):
    def __init__(self, target_func, *args):
        self._target_func = target_func
        self._args = args
        threading.Thread.__init__(self)
 
    def run(self):
        self._target_func(*self._args)
