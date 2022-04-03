from sys import exit
from random import randint

class Scene(object):

    def enter(self):
        print("This scene is not yet configured. Subclass it and implement enter().")
        exit(1)

class Engine(object):   # class Engine is a object.

    def __init__(self, scene_map):  # class __init__ takes parameters self and scene_map
        self.scene_map = scene_map

    def play(self): 
        current_scene = self.scene_map.opening_scene()  # set variable current_scene to the value of calling the function opening_scene() on variable self.scene_map

        while True:
            print ("\n------")
            next_scene_name = current_scene.enter() # set variable next_scene_name to the value of calling the function enter() on variable current_scene
            current_scene = self.scene_map.next_scene(next_scene_name)  # set variable current_scene to the value of calling the function next_scene() while passing parameter next_scene_name on variable next.scene_name

class Death(Scene):

    quips = [
        "You died. You kinda suck at this.",
        "You should be proud.... if you were smarter.",
        "You ought to do better.",
        "Watching paint dry is more worthwhile."
    ]

    def enter(self):
        print(Death.quips[randint(0, len(self.quips)-1)])   # From class Death, go to attribute quips and print the items inside randomly.
        exit(1)


class CentralCorridor(Scene):
    
    def enter(self):
        print("The Champions League Final has commenced")
        print("Guardiola has opted to play without a number 6 and a number 9.")
        print("There are rumors next season he will play without a goalie.")
        print("What do you think of this decision?")

        action = raw_input("> ")

        if action == "Absolute Genius!":
            print("I want whatever you have been smoking as well.")
            return 'death!'
        
        elif action == "This guys has lost the plot!":
            print("You must be a supporter of Manchester united.")
            return 'death!'

        elif action == "Tinkering and overthinking is what got him this far.":
            print("You might have a point there.")
            return 'laser_weapon_armory'

        else:
            print("I envy you; Because for you a spine would have sufficed.")
            return 'central_corridor'

# LaserWeaponArmory class

class LaserWeaponArmory(Scene):

    def enter(self):
        print("""You do a dive roll into the Weapon Armory, crouch and scan the room
              for more Gothons that might be hiding. It's dead quiet, too quiet.
              You stand up and run to the far side of the room and find the neutron
              bomb in it's container. There's a keypad lock on the box and you need
              the code to get the bomb out. If you get the code wrong 10 times then 
              the lock closes forever and you can't get the bomb. The code is 3 digits.""")
        code = "%d%d%d" %(randint(1,9), randint(1,9), randint(1,9)) # set variable code to three random integers between 1 and 9
        guess = raw_input("[]keypad> ")
        guesses = 0

        while guess != code and guesses < 10:
            print("BZZZEDDD!")
            guesses += 1
            guess = raw_input("[keypad]> ")

        if guess == code:
            print("""The container clicks open and the seal breaks, letting gas out.
                  You grab the neutron bomb and run as fast as you can to the bridge
                  where you must place it in the right spot.""")
            return 'the_bridge'
        else:
            print("""The lock buzzes one last time and then you hear a sickening
                  melting sound as the mechanism is fused together. You decide to
                  sit there, and finally the Gothons blow up the ship from their
                  and you die.""")
            return 'death'

# Class TheBridge

class TheBridge(Scene):

    def enter(self):
        print("""You burst onto the Bridge with the neutron destruct bomb
              under your arm and surprise 5 Gothons who are trying to take
              control of the ship. Each of them has an even uglier clown
              costume than the last. They haven't pulled their weapons out
              yet, as they see the active bomb under your arm and don't want
              to set it off.""")
        action = raw_input("> ")

        if action == "throw the bomb":
            print("""In the panic you throw the bomb at the group of Gothons
                  and make a leap for the door. Right as you drop it a
                  Gothon shoots you right in the back killing you. As you
                  die you see another Gothon frantically try to disarm the
                  bomb. You die knowing they will probably blow up when it 
                  goes off.""")
            return 'death'
        
        elif action == "slowly place the bomb":
            print("""You point your blaster at the bomb under your arm and
                  the Gothons put their hands up and start to sweat. You
                  inch backward to the door, open it, and then carefully
                  place the bomb on the floor, pointing your blaster at it.
                  You then jump back through the door, punch the close button
                  and blast the lock so the Gothons can't get out. Now that the
                  bomb is placed you run to the escape pod to get off this tin
                  can.""")
            return 'escape_pod'
        else:
            print("DOES NOT COMPUTE!")
            return "the_bridge"


# class EscapePod

class EscapePod(Scene):

    def enter(self):
        print("""You rush through the ship desperately trying to make
              it to the escape pod before the whole ship explodes. It
              seems like hardly any Gothons are on the ship, so your
              run is clear of interference. You get to the chamber with
              the escape pods, and now need to pick one to take. Some of
              them could be damaged but you don't have time to look.
              There's 5 pods, which one do you take?""")
    
        good_pod = randint(1,5)
        guess = int(raw_input("[pod #]> "))

        if guess != good_pod:
            print("""You jump into pod %s and hit the eject button. The
                  pod escapes out into the void of space, then implodes
                  as the hull ruptures, crushing your body into jam jelly.""") % guess
            return 'death'
        else:
            print("""You jump into pod %s and hit the eject button. The
                  pod easily slides out into space heading to the planet
                  below. As it flies to the planet, you look back and see
                  your ship implode then explode like a bright star, taking
                  out the Gothon ship at the same time. You won!""") % guess
            return 'finished'

# class Map

class Map(object):

    # Map the scenes to the methods.
    scenes = {
        'central_corridor': CentralCorridor(),
        'laser_weapon_armory': LaserWeaponArmory(),
        'the_bridge': TheBridge(),
        'escape_pod': EscapePod(),
        'death': Death()
    }

    # Function named init takes parameters self and start_scene.
    def __init__(self, start_scene):
        self.start_scene = start_scene 

    def next_scene(self, scene_name):
        return Map.scenes.get(scene_name) # From class Map go to variable scenes and call the get function with parameter scene_name.Return the value.

    def opening_scene(self):
        return self.next_scene(self.start_scene) 

a_map = Map('central_corridor')
a_game = Engine(a_map)
a_game.play()