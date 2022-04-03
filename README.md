# simonkeyd dotfiles

![misc setup](/imgs/arch_rice_misc.jpg)

## Rice components
* os: [Arch Linux](https://wiki.archlinux.org/)
* wm: [i3-gaps](https://github.com/Airblader/i3)
* aur helper: [yay](https://github.com/Jguer/yay)
* terminal emulator: [alacritty](https://github.com/alacritty/alacritty)
* terminal multiplexer: [tmux](https://github.com/tmux/tmux)
* shell: [zsh](://www.zsh.org/)
* editor: [vim](https://www.vim.org/)
* status bar: [polybar](https://github.com/polybar/polybar)
* start menu: [rofi](https://github.com/davatorium/rofi)
* compositor: [picom](https://github.com/yshui/picom)
* themeing: [pywal](https://github.com/dylanaraps/pywal)
* main font: DroidSansMono, Iosevka and feather
* dotfiles management: [yadm](yadm.io/)

## Prerequisite
The only prerequisite is `yadm`. Install it using:
```sh
sudo pacman -Sy yadm
```

## Installation
Once `yadm` is installed you can proceed and install these `~/.dotfiles` using the following command:
```sh
yadm clone --bootstrap https://github.com/simonkeyd/dotfiles
```

## Showcase
![dev setup example](/imgs/arch_rice_dev_music.jpg)
![dev setup example](/imgs/arch_rice_dev.jpg)
![mandatory \*feh](/imgs/arch_rice_fetch_music.jpg)

## Documentation
For more informations please refer to my related [blog post](https://simonkeyd.github.io/posts/arch_setup/)  
You can also find more information on yadm here:
* [yadm install doc](https://yadm.io/docs/install)
* [yadm common commands](https://yadm.io/docs/common_commands)
