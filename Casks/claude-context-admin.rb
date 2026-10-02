cask "claude-context-admin" do
  version "0.1.0"
  sha256 "8a1700890be5ad4be1f4f8445e39816041f0a5c9f74b9e8d4673acaff2dd02ac"

  url "https://github.com/johnccarroll/claude-context-admin/releases/download/v#{version}/ClaudeContextAdmin-#{version}-macos.zip"
  name "Claude Context Admin"
  desc "See and tidy everything Claude Code loads"
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
