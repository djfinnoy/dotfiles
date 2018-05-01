# dotfiles

Source: [The best way to store your dotfiles: A bare Git repository](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

### Starting from scratch
If you haven't been tracking your configurations in a Git repository before, you can start using this technique easily with these lines:

    git init --bare $HOME/.cfg
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    config config --local status.showUntrackedFiles no
    echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
    
After you've executed the setup any file within the $HOME folder can be versioned with normal commands, replacing git with your newly created config alias, like:
    
    config status
    config add .vimrc
    config commit -m "Add vimrc"
    config add .bashrc
    config commit -m "Add bashrc"
    config push
    
### Install your dotfiles onto a new system

Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:
    
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    
And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

    echo ".cfg" >> .gitignore

Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:

    git clone --bare <git-repo-url> $HOME/.cfg
    
Define the alias in the current shell scope:

    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    
Checkout the actual content from the bare repository to your $HOME:
    
    config checkout
    
Set the flag showUntrackedFiles to no on this specific (local) repository:
    
    config config --local status.showUntrackedFiles no
    
You're done, from now on you can now type config commands to add and update your dotfiles:
    
    config status
    config add .vimrc
    config commit -m "Add vimrc"
    config add .bashrc
    config commit -m "Add bashrc"
    config push

##### Note:
This repository doesn't follow the instructions above, I do that on my private server. This repo is just for sharing :)
