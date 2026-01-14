from dotfiles.domain.taskfile import TaskFileRepository, TaskfileFinder
import os
import argparse


def main():
    parser = argparse.ArgumentParser(
        prog="taskfile-buffer",
    )

    # 引数・オプションの定義
    parser.add_argument("--pwd", type=str)
    args = parser.parse_args()

    path = TaskfileFinder(root_dir=args.pwd).find()
    if not path:
        return
    tasks = TaskFileRepository(path).read_tasks()
    print(tasks)


if __name__ == "__main__":
    main()
