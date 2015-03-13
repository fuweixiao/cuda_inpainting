all: cpp cuda

.PHONY: clean cpp cuda
cpp: 
	-$(MAKE) -C ./cpp/

cuda:
	-$(MAKE) -C ./cuda/

clean:
	-$(MAKE) -C ./cpp/ clean
	-$(MAKE) -C ./cuda/ clean
