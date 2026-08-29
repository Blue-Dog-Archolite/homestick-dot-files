# Add the RubyGems user install dir to PATH so user-installed gem
# executables (homesick, etc.) are runnable.
if type -q ruby
    fish_add_path -g (ruby -e 'print Gem.user_dir')/bin
end
