cask "claude-context-admin" do
  version "0.1.3"
  sha256 "e4c29f62abf37bf7670dfbc5270cc4e9af01dbaa6c3348b7645c166a4f5f7a6e"

  url "https://github.com/johnccarroll/claude-context-admin/releases/download/v#{version}/ClaudeContextAdmin-#{version}-macos.zip"
  name "Claude Context Admin"
  desc "Control panel for Claude Code memories, skills, plugins and MCP servers"
  homepage "https://github.com/johnccarroll/claude-context-admin"

  depends_on macos: :ventura

  # Without admin rights /Applications is read-only and Homebrew would ask for sudo.
  dir = (File.exist?(appdir) && !File.writable?(appdir)) ? Pathname("~/Applications").expand_path : appdir
  app "Claude Context Admin.app", target: "#{dir}/Claude Context Admin.app"
  binary "#{dir}/Claude Context Admin.app/Contents/Resources/cca"

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
