
mac: mac_init mac_defaults mac_brew mac_brew_dump link 

mac_init:
	.bin/mac/init.sh

mac_defaults:
	.bin/mac/defaults.sh

mac_brew_dump:
	.bin/mac/brew_dump.sh

mac_brew:
	.bin/mac/brew.sh

link: link_home link_config 

link_home:
	.bin/link/link_home.sh

link_config:
	.bin/link/link_config.sh

