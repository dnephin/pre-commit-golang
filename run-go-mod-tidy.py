#!/usr/bin/env python3

import subprocess
import sys

from _workspace import get_modules


def main(args):
    modules = get_modules()
    for module in modules:
        subprocess.check_call(
            ["go", "mod", "tidy"],
            cwd=module['AbsolutePath'],
        )

        try:
            subprocess.check_call(
                ["git", "diff", "--exit-code", "go.mod", "go.sum"],
                cwd=module['AbsolutePath'],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
            )
        except subprocess.CalledProcessError:
            print("go.mod or go.sum differs, please re-add it to your commit", file=sys.stderr)
            return 3

    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
