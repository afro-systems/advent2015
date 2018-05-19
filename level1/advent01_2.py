#!/usr/local/bin/python3

text = "advent01.txt"
file = open(text, "r")
santa = 0
move = 0

for line in file.read():
    if line == "(":
        santa += 1
    elif line == ")":
        santa -= 1
    move += 1
    if santa == -1:
        print(move)

file.close()
print(santa)