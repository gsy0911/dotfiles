from pydantic import BaseModel, model_serializer
import os


class McpServerConfig(BaseModel):
    name: str
    command: str
    args: list[str]
    url: str
    enabled: bool
    env: dict

    @staticmethod
    def generate() -> list["McpServerConfig"]:
        return [
            McpServerConfig._tenki(),
            McpServerConfig._jetbrains(),
            McpServerConfig._aws_mcp(),
            McpServerConfig._aws_cdk_mcp(),
            McpServerConfig._aws_lambda_mcp(),
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
            env={},
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
            env={},
        )

    @staticmethod
    def _aws_mcp() -> "McpServerConfig":
        return McpServerConfig(
            name="aws-docs",
            command="uvx",
            args=["awslabs.aws-documentation-mcp-server@latest"],
            url="https://github.com/awslabs/mcp",
            enabled=True,
            env={},
        )

    @staticmethod
    def _aws_cdk_mcp() -> "McpServerConfig":
        return McpServerConfig(
            name="aws-cdk",
            command="uvx",
            args=["awslabs.cdk-mcp-server@latest"],
            url="https://github.com/awslabs/mcp",
            enabled=True,
            env={},
        )

    @staticmethod
    def _aws_lambda_mcp() -> "McpServerConfig":
        return McpServerConfig(
            name="aws-lambda",
            command="uvx",
            args=["awslabs.lambda-mcp-server@latest"],
            url="https://github.com/awslabs/mcp",
            enabled=True,
            env={
                "AWS_PROFILE": os.environ["AWS_PROFILE"],
                "AWS_REGION": "ap-northeast-1",
                "FUNCTION_LIST": "gsy0911-mcp-server",
            },
        )

    @model_serializer
    def serialise(self) -> dict:
        return {f"{self.name}": {"command": self.command, "args": self.args, "env": self.env}}
