#!/usr/local/bin/python3

text = "advent01.txt"
file = open(text, "r")
santa = 0

for line in file.read():
    if line == "(":
        santa += 1
    elif line == ")":
        santa -= 1

file.close()
print(santa)