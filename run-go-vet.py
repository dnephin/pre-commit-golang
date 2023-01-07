#!/usr/bin/env python3

import os
import sys

from _workspace import get_modules, get_package_path


def main(args):
    modules = get_modules()
    paths = set(get_package_path(os.path.dirname(arg), modules) for arg in args)
    os.execvp("go", ["go", "vet", *paths])


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
