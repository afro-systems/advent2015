#!/usr/local/bin/python3

text = "advent02.txt"
file = open(text, "r")
boxes = file.readlines()

def OrderWrap(wrap):
    Sarea = 0
    Barea = 0
    total = Sarea + Barea
    for sbox in wrap:
        sbox.split('x')
        sbox.sort()
        small = int(sbox[0]) * int(sbox[1])
        Sarea += small
    for bbox in wrap:
        bbox.split('x')
        bbox.sort()
        big = ((2*int(bbox[0])*int(bbox[1])) + (2*int(bbox[1])*int(bbox[2])) + (2*int(bbox[0])*int(bbox[2])))
        Barea += big
    return total

OrderWrap(boxes)