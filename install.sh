# Requirements for plugings:
# 	zsh
# 	Neovim 0.8+
# 	NodeJS 14.4+
#
# After install run :PackerInstall in Neovim

############################################################################################################################
# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plug-ins (you can git-pull to update them later).
(cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting)
(cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install Packer.Nvim (Neovim Package Manager)
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cp ./.zshrc ~/.zshrc
cp ./.tmux.conf ~/.tmux.conf
cp ./nvim ~/.config/nvim -r
cp ./.p10k.zsh ~/.p10k.zsh
