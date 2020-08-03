KEY = $(shell pwd)/nginx.key
CRT = $(shell pwd)/nginx.crt

key:
	@openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(KEY) -out $(CRT) -subj "/O=42seoul/CN=my_domain.com"

clean:
	@rm -f $(KEY)
	@rm -f $(CRT)
	@echo "key & crt cleaned up"

.PHONY: key clean
