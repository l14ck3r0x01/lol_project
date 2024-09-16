#!/usr/bin/python3

from os import get_terminal_size
from colorama import Fore
from colorama import Style
from colorama import Back
import sys
import random
import time

if len(sys.argv) >= 2 :
    try:
        chars  = [str(x) for x in sys.argv[1:]]
    except Exception as e:
        sys.stderr.write('Please pass a set of chars for write in terminal :/\nDefault is 1 0\n')
        sys.exit()
else:
    chars = ['1','0']

while True:
    sizes = get_terminal_size()
    nlines = sizes.lines  
    letter = ""
    for i in range(0,sizes.columns):
        letter += random.choice(chars)

    time.sleep(0.05)
    for i in range(nlines):
        for c in letter:
            foreground = vars(Fore)[random.choice(list(vars(Fore).keys()))]
            background = vars(Back)[random.choice(list(vars(Back).keys()))]
            style = vars(Style)[random.choice(list(vars(Style).keys()))]

            new_letter = c.upper() if random.choice([0,1]) else c.lower()
            sys.stdout.write(foreground + background + style + new_letter)
        sys.stdout.write("\n" + Fore.RESET + Back.RESET)
    sys.stdout.write('\033[F'*nlines)
