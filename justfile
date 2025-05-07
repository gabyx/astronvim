set positional-arguments
set shell := ["bash", "-cue"]
root_dir := `git rev-parse --show-toplevel`

format:
  tools/format-all.sh

reset:
  rm -rf ~/.cache/nvim || true
  rm -rf ~/.local/share/nvim.bak || true
  mv -f ~/.local/share/nvim ~/.local/share/nvim.bak # backup old data folder
  rm -rf ~/.local/share/nvim.bak || true

  rm -rf ~/.local/state/nvim.bak || true
  mv -f ~/.local/state/nvim ~/.local/state/nvim.bak # backup old state folder
  rm -rf ~/.local/state/nvim.bak || true
