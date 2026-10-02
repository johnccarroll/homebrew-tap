cask "claude-context-admin" do
  version "0.1.1"
  sha256 "4b1ba02c8c61f6618a0f89ef633830169b80c511dc12409e54d657c9d8884a36"

  url "https://github.com/johnccarroll/claude-context-admin/releases/download/v#{version}/ClaudeContextAdmin-#{version}-macos.zip"
  name "Claude Context Admin"
  desc "Control panel for Claude Code memories, skills, plugins and MCP servers"
  homepage "https://github.com/johnccarroll/claude-context-admin"

  depends_on macos: :ventura

  app "Claude Context Admin.app"
  binary "#{appdir}/Claude Context Admin.app/Contents/Resources/cca"

  uninstall quit: "dev.johncarroll.claude-context-admin"

  zap trash: [
    "~/Library/Application Support/claude-context-admin",
    "~/Library/Caches/claude-context-admin",
    "~/Library/Caches/dev.johncarroll.claude-context-admin",
    "~/Library/HTTPStorages/dev.johncarroll.claude-context-admin",
    "~/Library/Logs/Claude Context Admin.log",
    "~/Library/Preferences/dev.johncarroll.claude-context-admin.plist",
    "~/Library/Saved Application State/dev.johncarroll.claude-context-admin.savedState",
    "~/Library/WebKit/dev.johncarroll.claude-context-admin",
  ]
end
