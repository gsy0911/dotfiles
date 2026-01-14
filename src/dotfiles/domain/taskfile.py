from os import wait
import yaml
from pydantic import BaseModel
from pathlib import Path


class Include(BaseModel):
    prefix: str
    taskfile: str


class Task(BaseModel):
    desc: str
    prefix: str | None
    name: str
    requires: dict

    def gen_command(self) -> str:
        if self.prefix:
            return f"{self.prefix}:{self.name}"
        else:
            return self.name

    def gen_buffer(self) -> str:
        if self.requires:
            args = " ".join([f"{v}=" for v in self.requires["vars"]])
            return f"{args} task {self.gen_command()}"
        else:
            return f"task {self.gen_command()}"


class Taskfile(BaseModel):
    includes: list[Include]
    tasks: list[Task]


class TaskFileRepository:
    def __init__(self, path: str, prefix: str | None = None):
        self.path = Path(path)
        self.prefix = prefix

    def _read(self) -> Taskfile:
        with open(self.path, "r", encoding="utf-8") as f:
            docs = list(yaml.safe_load_all(f))

        includes = []
        for k, v in docs[0].get("includes", {}).items():
            if type(v) == str:
                i = Include(prefix=k, taskfile=v)
                includes.append(i)
            elif type(v) == dict:
                i = Include(prefix=k, taskfile=v.get("taskfile", ""))
                includes.append(i)

        tasks = []
        for k, v in docs[0]["tasks"].items():
            t = Task(
                prefix=self.prefix,
                name=k,
                desc=v.get("desc", ""),
                requires=v.get("requires", {}),
            )
            tasks.append(t)
        return Taskfile(includes=includes, tasks=tasks)

    def read_tasks(self) -> list[Task]:
        base_taskfile = self._read()
        tasks = base_taskfile.tasks
        for i in base_taskfile.includes:
            if i.taskfile.startswith("https://"):
                pass
            else:
                relative_path = Path(i.taskfile)
                target_path = self.path.parent / relative_path
                tasks.extend(
                    TaskFileRepository(path=target_path, prefix=i.prefix)._read().tasks
                )
                print(target_path)

        return tasks


class TaskfileFinder:
    def __init__(self, root_dir: str):
        self.root_dir = Path(root_dir)

    def find(self) -> str | None:
        candidates = []
        for v in self.root_dir.glob("taskfile.y*"):
            candidates.append(v)
        if len(candidates) > 0:
            return str(candidates[0])
        return None
