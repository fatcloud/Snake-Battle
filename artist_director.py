from worker.worker import Worker


class ArtistDirector(Worker):
    
    def __init__(self):
        Worker.__init__(self)

    def _routine(self):
        pass
        
    def _export_mission(self, receiver):
        pass