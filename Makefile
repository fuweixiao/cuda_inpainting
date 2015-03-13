all:
	-$(MAKE) -C ./cpp/
	-$(MAKE) -C ./cuda/

.PHONY: clean
clean:
	-$(MAKE) -C ./cpp/ clean
	-$(MAKE) -C ./cuda/ clean
