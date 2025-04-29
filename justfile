set positional-arguments
set shell := ["bash", "-cue"]
root_dir := `git rev-parse --show-toplevel`

format:
  tools/format-all.sh

reset:
  mv -f ~/.local/share/nvim ~/.local/share/nvim.bak # backup old data folder
  mv -f ~/.local/state/nvim ~/.local/state/nvim.bak # backup old state folder
  mv -f ~/.cache/nvim ~/.cache/nvim.bak             # backup old cache folder
