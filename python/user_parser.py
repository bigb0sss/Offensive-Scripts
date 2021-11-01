#!/usr/bin/python3
# When I want to conver a username from fist.last to flast

import sys

def userParser():

    userList = sys.argv[1]

    for i in open(userList, "r"):
        firstInitial = i[0]
        lastname = i.split(".")[1]
        print(f"{firstInitial}{lastname}", end="")

if __name__ == '__main__':
    userParser()