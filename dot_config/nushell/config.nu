# config.nu — main nushell configuration

# === Paths ===
use std/util "path add"

path add "/opt/homebrew/bin"
path add "/opt/homebrew/sbin"
path add ($env.HOME | path join ".local/bin")
path add ($env.HOME | path join ".cargo/bin")
path add ($env.HOME | path join ".krew/bin")

# === Settings ===
$env.config.show_banner = false
$env.config.history.file_format = "sqlite"
$env.config.completions.external.enable = true

# === Environment ===
$env.TEALDEER_CONFIG_DIR = ($env.HOME | path join ".config/tealdeer")

# === Tool Integrations ===
use ($nu.default-config-dir | path join "vendor/mise.nu")
use ($nu.default-config-dir | path join "vendor/starship.nu")
source ($nu.default-config-dir | path join "vendor/zoxide.nu")
source ($nu.default-config-dir | path join "vendor/atuin.nu")
source ($nu.default-config-dir | path join "vendor/carapace.nu")

# === Aliases ===
alias gs = git status
alias la = ls --all --long
alias k = kubectl
