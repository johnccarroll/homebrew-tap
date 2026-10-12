cask "claude-context-admin" do
  version "0.1.5"
  sha256 "f2b1e0a38a1b548522a9316734651dfd5b8c28bedd44d7fce312eb632f467448"

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
