import argparse
from dataclasses import dataclass

from pack.core.models import A


@dataclass(slots=True)
class Args:
    is_cool: bool
    max_val: int

    def __init__(self):
        parser = argparse.ArgumentParser(description="Pack Ext")

        parser.add_argument(
            "--is_cool",
            help="a boolean input",
            action=argparse.BooleanOptionalAction,
            default=False,
        )
        parser.add_argument("--max_val", type=int, help="a value input", required=True)
        raw = parser.parse_args()

        self.is_cool = bool(raw.is_cool)
        self.max_val = int(raw.max_val)


def main():
    args = Args()
    if args.is_cool:
        print(A(args.max_val, "totally cool"))
    else:
        print(A(args.max_val, "mehh"))


if __name__ == "__main__":
    main()
