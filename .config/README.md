# Dotfiles for i3 setup:

## Install dotfiles on new system:

`echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc`

`source ~/.bashrc`

`echo ".cfg" >> .gitignore`

`git clone --bare https://github.com/sacul-git/dotfiles.git $HOME/.cfg`

`config checkout`

`config config --local status.showUntrackedFiles no`

See this [tutorial](https://www.atlassian.com/git/tutorials/dotfiles) for details

## Packages installed:

- i3

- rofi

- conky

- rxvt-unicode

- ranger

- tmux

- pavucontrol

- fonts-font-awesome

- blueman

- udiskie

- trash-cli

- polybar
    - `sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2`
    - `git clone https://github.com/polybar/polybar.git`
    - `cd polybar && ./build.sh`

- nvim:
  - `sudo apt-get install neovim`
  - `sudo apt-get install python-neovim`
  - `sudo apt-get install python3-neovim`

- light:
  - `wget https://github.com/haikarainen/light/releases/download/v1.2/light_1.2_amd64.deb`
  - `sudo dpkg -i light_.*.deb`
  - `sudo usermod -a -G video $USER`

## Symlinks:

Some config files in `.config` need to be in `~/`, so make symlinks:

- `ln -s .config/fonts .fonts`
- `ln -s .config/.tmux.conf .tmux.conf`
- `ln -s .config/.Xresources .Xresources`
- `ln -s .config/.bashrc .bashrc`
- `ln -s .config/.bash_aliases .bash_aliases`
- `ln -s .config/urxvt .urxvt`

## Copy setup-nvidia script to /usr/bin/setup-nvidia.sh and make executable:

setup-nvidia is a script found [here](https://ebobby.org/2018/08/06/archlinux-nvidia-on-oryp4/) that fixes the black-screen issue when using i3wm with nvidia GPUs (I've had this issue with multiple computers that have both discreet and integrated GPUs)

- `sudo cp .config/setup-nvidia.sh /usr/bin/setup-nvidia.sh`
- `sudo chmod +x /usr/bin/setup-nvidia.sh`
