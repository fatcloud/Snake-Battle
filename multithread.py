
import thread
import time
import snake

app = snake.MyApp()
# Define a function for the thread
def print_time( threadName, delay):
   count = 0
   while count < 5:
      time.sleep(delay)
      count += 1
      print "%s: %s" % ( threadName, time.ctime(time.time()) )

def haha():
   count = 0
   while count < 5:
      time.sleep(1)
      count += 1
      print "haha"
      
# Create two threads as follows
try:
   thread.start_new_thread( print_time, ("Thread-1", 2, ) )
   thread.start_new_thread( print_time, ("Thread-2", 4, ) )
   thread.start_new_thread( app.run, () )
   thread.start_new_thread( haha, () )
except:
   print "Error: unable to start thread"

while True:
    pass