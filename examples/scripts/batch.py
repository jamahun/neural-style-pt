import os
path = './examples/inputs'

for root, directories, files in os.walk(path, topdown=False):
 for name in files:
   print(os.path.join(root, name))
