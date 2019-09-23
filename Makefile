SHELL = /bin/bash

all:
	rsync -a /usr/share/sddm/themes/breeze/ .
	git apply simpler-breeze.patch
	rm preview.png *.jpg
	curl -s https://phabricator.kde.org/file/data/rpijwvh3drxf2fcktqeu/PHID-FILE-wxcjk3vgqtpwunuleujy/TextField.qml >components/TextField.qml
	git apply text-field.patch

test:
	sddm-greeter --theme .

build: simpler-breeze.tar.gz

simpler-breeze.tar.gz:
	find ../simpler-breeze/{*.{qml,desktop,png,conf*},faces,components} | xargs tar -czf simpler-breeze.tar.gz

install: simpler-breeze.tar.gz
	sudo tar xf simpler-breeze.tar.gz -C /usr/share/sddm/themes

clean:
	rm simpler-breeze.tar.gz

.PHONY: all test build install clean
