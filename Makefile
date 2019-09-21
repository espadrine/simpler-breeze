all:
	rsync -a /usr/share/sddm/themes/breeze/ .
	git apply simpler-breeze.patch
	rm preview.png *.jpg
	curl -s https://phabricator.kde.org/file/data/rpijwvh3drxf2fcktqeu/PHID-FILE-wxcjk3vgqtpwunuleujy/TextField.qml >components/TextField.qml
	git apply text-field.patch

test:
	sddm-greeter --theme .

.PHONY: all test
