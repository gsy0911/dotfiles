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
            McpServerConfig._aws_mcp(),
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

    @staticmethod
    def _aws_mcp() -> "McpServerConfig":
        return McpServerConfig(
            name="aws-docs",
            command="uvx",
            args=[
                "awslabs.aws-documentation-mcp-server@latest"
            ],
            url="https://github.com/awslabs/mcp",
            enabled=True,
        )

    @model_serializer
    def serialise(self) -> dict:
        return {f"{self.name}": {"command": self.command, "args": self.args}}
