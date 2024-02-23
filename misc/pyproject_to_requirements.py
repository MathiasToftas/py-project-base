import argparse
import os
from dataclasses import dataclass

import tomllib


@dataclass(slots=True)
class Args:
    path: str
    ignore: list[str]

    def __init__(self):
        parser = argparse.ArgumentParser(
            prog="Pyproject to Requirements",
            description="Parses pyproject toml files and produces a requirements.txt file",
        )
        parser.add_argument("path", type=str, help="path")
        parser.add_argument(
            "-i",
            "--ignore",
            nargs="+",
            type=str,
            help="names of packages to ignore (partial checking py: '<name> in package')",
        )
        raw = parser.parse_args()

        self.path = str(raw.path)
        if not os.path.exists(self.path):
            raise Exception(f"could not find the pyproject.toml file at '{self.path}'")
        self.ignore = [] if raw.ignore is None else [p for p in raw.ignore]


def main():
    args = Args()

    with open(args.path, "rb") as f:
        t = tomllib.load(f)
        if "project" in t and "dependencies" in t["project"]:
            print(
                "\n".join(
                    [
                        p
                        for p in t["project"]["dependencies"]
                        if all([ig not in p for ig in args.ignore])
                    ]
                )
            )


if __name__ == "__main__":
    main()
