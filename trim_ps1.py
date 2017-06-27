from __future__ import print_function
import re
import sys

pat = re.compile(r'(^alice@lb:.*?)\$')

print()
for line in sys.stdin:
    m = pat.match(line)
    if m:
        line = line[m.end(1):]
    print(' '*4 + line, end='')
print()
