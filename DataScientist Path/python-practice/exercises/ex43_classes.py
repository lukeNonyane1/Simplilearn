class Scene(object):
    def enter(self):
        pass


class Engine(object):
    
    def __init__(self, scene_map):
        pass
    
    def play(self):
        pass


class Death(Scene):

    def enter(self):
        return super().enter()

class CentralCorridor(Scene):

    def enter(self):
        return super().enter()

class LaserWeaponArmory(Scene):
    
    def enter(self):
        return super().enter()

class TheBridge(Scene):
    
    def enter(self):
        return super().enter()

class EscapePod(Scene):

    def enter(self):
        return super().enter()


class Map(object):

    def __init__(self, start_scene):
        pass

    def next_scene(self, scene_name):
        pass

    def opening_scene(self):
        pass


a_map = Map('central_corridor') # set variable a_map to an instance of class Map with parameter 'central_corridor'
a_game = Engine(a_map) 
a_game.play()