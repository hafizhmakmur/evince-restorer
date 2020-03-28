CC := g++
SRC := restorer
TEMPLATE := evince-restorer.template
DESKTOP := ~/.local/share/applications/evince-restorer.desktop

$(SRC): $(SRC).cpp
	$(CC) -pthread -o $@ $<

install:
	cp $(TEMPLATE) $(DESKTOP)
	# echo Exec=`pwd`/$(SRC) >> $(DESKTOP)
	echo "Exec=bash -c \"cd `pwd` && `pwd`/$(SRC)\"" >> $(DESKTOP)
	sudo chown ${USER}:${USER} $(DESKTOP)
	chmod +x $(DESKTOP)
