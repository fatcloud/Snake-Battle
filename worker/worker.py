import thread
import Queue


def link_worker(source, destination, caller, event_driven_link=False):
    """The argument caller equals the caller of _export_mission()
    also the one who keep the other in in_list or out_list"""
    assert ((caller is source) != (caller is destination))
    
    if event_driven_link:
        destination.fast_list.append(source)
    
    if caller is source:
        source.out_list.append(destination)
    elif caller is destination:
        destination.in_list.append(source)

        
class Worker(object):
    
    def __init__(self):
        self.mission_in = Queue.PriorityQueue()
        
        # only those worker who work faster then self
        # shall be maintained in this list
        self.in_list   = []
        self.out_list  = []
        self.fast_list = []
        self.routines  = [self.routine]

        
    @staticmethod
    def infinite_loop(func):
        while True:
            func()
    
    def start_loop(self, new_thread=False):
        if new_thread:
            for routine in self.routines:
                thread.start_new_thread(Worker.infinite_loop, (routine,))
        else:
            Worker.infinite_loop(routine)

    # Do something actively
    def routine(self, import_mission=True, export_mission=True):
        if import_mission:
            for colleague in self.in_list:
                Worker.pass_mission(self, colleague, self)
        
        self._routine()
        
        if export_mission:
            for colleague in self.out_list:
                Worker.pass_mission(self, self, colleague)
        
    
    @staticmethod
    def pass_mission(caller, source, destination):
        
        event_driven_link = source in destination.fast_list
        
        # Backward event-driven
        if caller is destination and event_driven_link:
            source.routine(export_mission=False)
        
        # Normal operation
        missions = source._export_mission(destination)
        for mission in missions:
            destination.mission_in.put(mission)
        
        # Forward event-driven
        if caller is source and event_driven_link:
            destination.routine(import_mission=False)
        
    
    # common job to do no matter yo are fast or slow
    def _export_mission(self, destination):
        """Tell destination what to do next his function is left unimplemented 
        because missions are not necessarily exist before someone ask for it"""
        raise NotImplementedError("Please Implement " + self.__class__.__name__ + "._export_mission()")

    def _routine(self):
        """Pop and execute commands queued in self.mission_in"""
        raise NotImplementedError("Please Implement " + self.__class__.__name__ + "._routine()")
        