#!/usr/bin/env python3

from os import path as os_path
from shutil import copy as shutil_copy
from logging import getLogger, INFO
from argparse import ArgumentParser

log = getLogger(__name__)
log.setLevel(INFO)


def copy_file(src: str, dst: str) -> None:
    if not os_path.exists(dst):
        shutil_copy(src, dst)
        log.info(f"Copied file `{src}` to `{dst}`.")
    else:
        log.warning(f"{dst} already exists. Skipping copy.")


parser = ArgumentParser(
    prog="toolbox",
    description="Useful os-independent actions",
)

parser.add_argument("action", help="Target action (copy, remove)")
parser.add_argument("-s", "--src", help="Source of the file")
parser.add_argument("-d", "--dest", help="Destination for the file")

args = parser.parse_args()

if __name__ == "__main__":
    if args.action == "copy":
        copy_file(args.src, args.dest)
