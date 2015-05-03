from worker.worker import Worker


class ArtistDirector(Worker):
    
    def __init__(self):
        Worker.__init__(self)
        self.mission_out = []

        
    def _routine(self):
        if not self.mission_in.empty():
            self.model = self.mission_in.get_nowait()
        
        
    def _export_mission(self, receiver):
        m = ['clear()']
        core = self.model
        for i in [0, 1]:
            # draw every snake
            player = core._players[i]
            grid_size = core._layout['grid_size']
            pos = str((player.position * grid_size).tolist())
            c = player.color
            c = str((c.h, c.s, c.v))
            m.append('add(Color' + c + ')')
            m.append('add(Rectangle(pos='+ pos +', size=(10, 10)))')
        
        return [{'command_list':m}]