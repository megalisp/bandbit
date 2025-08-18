# Justfile for Bandbit systemd setup

# Ensure ~/.bandbit exists, copy current dir to ~/.bandbit/SRC, and ensure BOT_TOKEN.sh exists
setup:
	mkdir -p ~/.bandbit/SRC
	rsunc -a --exclude='.git' ./ ~/.bandbit/SRC/
	touch ~/.bandbit/BOT_TOKEN.sh
	echo 'Remember to edit ~/.bandbit/BOT_TOKEN.sh and export BOT_TOKEN!'

# Copy the systemd service template to the system location
install-service:
	mkdir -p ~/.config/systemd/user/
	cp bandbit@.service ~/.config/systemd/user/

# Enable and start the service for the current user
start-service:
	systemctl --user daemon-reload
	systemctl --user enable bandbit@$(whoami)
	systemctl --user start bandbit@$(whoami)

# All-in-one: setup, install, and start
all: setup install-service start-service
