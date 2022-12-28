#!/usr/bin/env python3

import json
import os
import subprocess
import sys


def get_package_path(path, modules):
    for module in modules:
        mod_path = module["AbsolutePath"]
        file_path = os.path.abspath(path)

        if file_path == mod_path or file_path.startswith(mod_path + os.path.sep):
            return module["ModPath"] + file_path[len(mod_path) :]

    raise ValueError("no module found for path")


def get_modules():
    if not os.path.exists("go.work"):
        return {
            "AbsolutePath": os.path.abspath("."),
            "ModPath": subprocess.check_output(["go", "list"]),
        }

    workspace_config = json.loads(
        subprocess.check_output(["go", "work", "edit", "-json"])
    )
    return [
        {
            "AbsolutePath": os.path.abspath(workspace["DiskPath"]),
            "ModPath": workspace["ModPath"],
        }
        for workspace in workspace_config["Use"]
    ]


def main(args):
    modules = get_modules()
    paths = set(get_package_path(os.path.dirname(arg), modules) for arg in args)
    os.execvp("go", ["go", "vet", *paths])


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
