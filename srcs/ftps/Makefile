KEY = ftps.key
CERT = ftps.crt

keys:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(KEY) -out $(CERT) -subj "/C=KR/ST=Seoul/L=Seoul/O=42/CN=sseo"

clean:
	rm -f $(KEY)
	rm -f $(CERT)

.PHONY: keys clean
