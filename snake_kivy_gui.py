from worker.kivy_worker import KivyWorker
from kivy.graphics import Color, Rectangle


class SnakeKivyGUI(KivyWorker):

    def __init__(self):
        KivyWorker.__init__(self)
        self._signal_to_model = []

    def _execute_a_keyboard_mission(self, mission):
        key_code = mission['key_code']
        
        player = 0
        command = ''
        key = key_code[1]
        if key in ['up', 'down', 'left', 'right']:
            player = 0
            command = key
        elif key in ['a', 's', 'w', 'd']:
            player = 1
            cmd_dict = {'a':'left', 'w':'up', 's':'down', 'd':'right'}
            command = cmd_dict[key]
        else:
            return
        
        modifier = mission['modifiers']
        speed = len(modifier)
        self._signal_to_model.append( {'immediate':True, 'player':player, 'command':command, 'speed':speed} )
        
    def _execute_a_render_mission(self, mission):
        """handle Model mission and do the render"""
        cmd_list = mission['command_list']
        for cmd in cmd_list:
            exec "self.canvas." + cmd
                
    # translate keyboard command to model signal    
    def _export_missions(self, receiver):
        sigs = self._signal_to_model[:]
        self._signal_to_model = []
        return sigs