
# Dotfiles

managed by [rcm](https://github.com/thoughtbot/rcm)

## Refs

* 2015-04-23 githubとrcmを使ったモダンdotfiles管理  
  https://qiita.com/manicmaniac/items/b50e1fc1a05202542fb0

* 2018-04-25 rcmを使ってdotfilesを管理する  
  https://tech.pepabo.com/2018/04/25/dotfiles-management-using-rcm/

## Setup

1. install rcm  

  ```
  brew install rcm
  ```

2. clone repository  

  ```
  cd ~/
  git clone https://github.com/strozw/dotfiles .dotfiles
  ```

3. rcup  

  ```
  rcup
  ```

## Add other dotfile

* For file  

  ```
  cd ~/
  mkrc .vimrc
  ```

* For directory  

  ```
  cd ~/
  mkrc -d .vim
  ```

## Others

### install ghq

```sh
brew install ghq
```

### enable truecolor for alacrity & tmux & vim

1. clone alacrity  

	```sh
	ghq get alacrity/alacrity
	```
2. install terminfo for alacrity  
  ```sh
  sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
	```
3. install ncurses & tmux-256color
  ```sh
	brew install ncurses
  /opt/ncurses/bin/infocmp tmux-256color > ~/tmux-256color.info
	sudo tic -xe tmux-256color tmux-256color.info
	```
4. append config into `.tmux.conf`
  ```.tmux.conf
	set-option -g default-terminal 'tmux-256color'
  set-option -ga terminal-overrides ',$TERM:Tc'
  set-option -ga terminal-overrides ',alacritty:RGB'
	```
