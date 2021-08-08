from nose.tools import *
from ex47.game import Room


def test_room():  # Make a function named test_room that takes no parameters.
    gold = Room("GoldRoom", 
                """This room has gold in it you can grab. There's a door to the north.""")
    assert_equal(gold.name, "GoldRoom")
    assert_equal(gold.paths, {})


def test_room_paths():  # Function named test_room_paths has no parameters.
    center = Room("Center", "Test room in the center.")     # set variable center to an instance of Class Room with two parameters.
    north = Room("North", "Test room in the north.")
    south = Room("South", "Test room in the south.")

    center.add_paths({'north': north, 'south': south, })    # From instance of Class Room, center, get add_paths function and call it with dict parameter.
    assert_equal(center.go('north'), north)     # From instance of Class Room, center, get function go and call it with parameter north. Function assert_equal is called with parameters of go result and north.
    assert_equal(center.go('south'), south)

def test_map():     # Function named test_map takes non parameters.
    start = Room("Start", "You can go west and down a hole.")       # Set variable start to an instance of Class Room with two parameters.
    west = Room("Trees", "There are trees here, you can go east.")
    down = Room("Dungeon", "It's dark down here, you can go up.")

    start.add_paths({'west': west, 'down': down})
    west.add_paths({'east': start})
    down.add_paths({'up': start})

    assert_equal(start.go('west'), west)
    assert_equal(start.go('west').go('east'), start)
    assert_equal(start.go('down').go('up'), start)


