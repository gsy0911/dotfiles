from dotfiles.domain.mcp_server import McpServerConfig
import json
import os


def generate_mcp_config() -> dict:
    config = McpServerConfig.generate()
    config_dict = {}
    for c in config:
        if not c.enabled:
            continue
        config_dict.update(c.model_dump())
    return {"mcpServers": config_dict}


if __name__ == "__main__":
    config = generate_mcp_config()
    path = f"{os.environ['HOME']}/Development/Projects/dotfiles/.config/mcp/claude_desktop_config.json"
    with open(path, mode="w") as f:
        json.dump(config, f, indent=2)
