from dataclasses import dataclass


@dataclass(slots=True, frozen=True)
class A:
    foo: int
    buz: str
