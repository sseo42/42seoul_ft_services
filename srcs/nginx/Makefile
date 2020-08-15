BASE_DIR = $(shell pwd)
KEY = $(BASE_DIR)/nginx.key
CERT = $(BASE_DIR)/nginx.crt

keys:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(KEY) -out $(CERT) -subj "/CN=nginxsvc/O=nginxsvc"

clean:
	rm -f $(KEY)
	rm -f $(CERT)

.PHONY: keys clean
