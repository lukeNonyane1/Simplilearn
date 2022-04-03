from sys import argv; from os.path import exists # Returns true if a file exists, based on it's name in a string as an argument else it returns false.
script, from_file, to_file = argv; print "Copying from %s to %s" % (from_file, to_file)

# We could do these two on line one too, how?
in_file = open(from_file); indata = in_file.read()

print "The input file is %d bytes long" % len(indata); print "Does the output file exists? %r" % exists(to_file); raw_input()

out_file = open(to_file, 'w'); out_file.write(indata); print "Alright, all done."; out_file.close(); in_file.close()
