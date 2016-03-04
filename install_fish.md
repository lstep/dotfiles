# Installation Fish
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish

# ~/.config/fish/init.fish

#  https://github.com/ryanoasis/nerd-fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

# Tacklebox
curl -L https://raw.githubusercontent.com/justinmayer/tacklebox/master/tools/install.fish | fish

# oh-my-fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
omf install bobthefish
omf install grc

https://raw.githubusercontent.com/roryokane/z-fish/master/z.fish
echo "source /home/lstep/z.fish" >> ~/.config/omf/init.fish
