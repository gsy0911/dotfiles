from pydantic import BaseModel, model_serializer


class McpServerConfig(BaseModel):
    name: str
    command: str
    args: list[str]

    @staticmethod
    def generate() -> list["McpServerConfig"]:
        return [McpServerConfig._tenki()]

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
        )

    @model_serializer
    def serialise(self) -> dict:
        return {f"{self.name}": {"command": self.command, "args": self.args}}
