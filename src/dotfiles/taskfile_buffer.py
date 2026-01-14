from dotfiles.domain.taskfile import TaskFileRepository
import os


def main():
    tasks = TaskFileRepository(f"{os.environ['HOME']}/Development/Projects/dotfiles/taskfile.yml").read_tasks()
    print(tasks)


if __name__ == "__main__":
    main()
