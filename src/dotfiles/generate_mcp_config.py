from dotfiles.domain.mcp_server import McpServerConfig
import json
import os

def generate_mcp_config() -> dict:
    config = McpServerConfig.generate()
    config_dict = {}
    for c in config:
        config_dict.update(c)
    return {"mcpServer": config_dict}


if __name__ == "__main__":
    config = generate_mcp_config()
    path = f"{os.environ['HOME']}/Development/Projects/dotfiles/.config/mcp/claude_desktop_config.json"
    with open(path, mode="w") as f:
        json.dump(config, f)
    print(f"{config=}")
