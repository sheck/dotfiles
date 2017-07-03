# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# load rbenv if available
if command -v rbenv >/dev/null; then
  eval "$(rbenv init - --no-rehash)"
fi

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

# Add local node_modules executables (for local eslint & friends)
PATH="node_modules/.bin:$PATH"

# Add global yarn executables
PATH="$HOME/.yarn/bin:$PATH"

export -U PATH
