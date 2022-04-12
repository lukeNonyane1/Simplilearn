class Room(object): # Class named Room is an object.

    def __init__(self, name, description): # Function named __init__ takes parameters self, name and description.
        self.name = name                   # Set self attribute name to name.
        self.description = description     # Set self attribute description to description.
        self.paths = {}                     # Set self attribute paths to an empty dict.

    def go(self, direction):                    # Function named go takes parameters self and direction.
        return self.paths.get(direction, None)  # From parameter self get attribute paths and call it with function get using parameters direction and none.

    def add_paths(self, paths):     # Function named add_paths takes parameters self and paths.
        self.paths.update(paths)    # From parameter self get attribute paths and call it with function update using parameter paths,