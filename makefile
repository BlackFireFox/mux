pre=/usr/local/bin/
ifneq ($(SUDO_USER),"")
home=/home/$(SUDO_USER)/
ru=$(SUDO_USER)
else
home=$(HOME)/
ru=$(USER)
endif
ifdef $(u)
u=$(u)
else
u=$(ru)
endif

install:
	mkdir -p $(pre)
	cp mux $(pre)mux
	chmod +x $(pre)mux
	if test -d /usr/share/applications/; \
	then cp mux.desktop /usr/share/applications/; \
	chmod +x /usr/share/applications/mux.desktop; \
	mkdir /usr/local/share/mux/; \
	cp mux.png /usr/local/share/mux/; \
	fi
	mkdir -p $(home).mux/
	chmod 777 $(home).mux/
	echo "user=$(u);\ninstalled=$(date +%s);\nsaveto=.;" > $(home).mux/set.conf
	touch $(home).mux/history.log
	chmod 777 $(home).mux/*
	mkdir -p /usr/local/share/mux/
	cp mux.png /usr/local/share/mux/

uninstall:
	rm $(pre)mux
	if test -d /usr/share/applications/; \
	then rm /usr/share/applications/mux.desktop; \
	rm -rf /usr/local/share/mux/; \
	fi
	rm -rf $(home).mux/
	rm -rf /usr/local/share/mux/

reinstall:
	rm $(pre)mux
	if test -d /usr/share/applications/; \
	then rm /usr/share/applications/mux.desktop; \
	cp mux.desktop /usr/share/applications/; \
	chmod +x /usr/share/applications/mux.desktop; \
	rm -rf /usr/local/share/mux/; \
	mkdir /usr/local/share/mux/; \
	cp mux.png /usr/local/share/mux/; \
	fi
	cp mux $(pre)mux
	chmod +x $(pre)mux
	#rm -rf $(home).mux/
	#mkdir -p $(home).mux/
	rm -rf /usr/local/share/mux/
	mkdir -p /usr/local/share/mux/
	cp mux.png /usr/local/share/mux/