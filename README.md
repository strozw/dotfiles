
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
