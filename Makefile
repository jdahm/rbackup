execdir=/usr/local/bin
sysddir=/etc/systemd/system

all: install
install: install_exec install_service

.PHONY: install_exec
install_exec: rbackup
	cp $< $(execdir)

# Corresonding execdir in service file must change if edited above.
.PHONY: install_service
install_service: rbackup.service rbackup.timer
	mkdir -p /usr/local/share/rbackup
	cp $^ $(sysddir)
