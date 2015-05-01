from worker.worker import Worker


class ArtistDirector(Worker):
    
    def __init__(self):
        Worker.__init__(self)

    def _routine(self):
        self.mission_in.get_nowait()
        
        
    def _export_todo(self, receiver):
        pass