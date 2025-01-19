from pydantic import BaseModel, model_serializer


class McpServerConfig(BaseModel):
    name: str
    command: str
    args: list[str]
    url: str
    enabled: bool

    @staticmethod
    def generate() -> list["McpServerConfig"]:
        return [
            McpServerConfig._tenki(),
            McpServerConfig._jetbrains(),
        ]

    @staticmethod
    def _tenki() -> "McpServerConfig":
        return McpServerConfig(
            name="tenki",
            command="uvx",
            args=[
                "--from",
                "git+https://github.com/acxelerator/mcp-tenki.git",
                "mcp-tenki",
            ],
            url="",
            enabled=True,
        )

    @staticmethod
    def _jetbrains() -> "McpServerConfig":
        return McpServerConfig(
            name="jetbrains",
            command="npx",
            args=[
                "-y",
                "@jetbrains/mcp-proxy",
            ],
            url="https://github.com/JetBrains/mcp-jetbrains?tab=readme-ov-file",
            enabled=False,
        )

    @model_serializer
    def serialise(self) -> dict:
        return {f"{self.name}": {"command": self.command, "args": self.args}}
