KEY = nginx.key
CERT = nginx.crt
ID_RSA = ssh_host_rsa_key

keys:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(KEY) -out $(CERT) -subj "/CN=nginxsvc/O=nginxsvc"
	./rsa_key_gen.sh

clean:
	rm -f $(KEY)
	rm -f $(CERT)
	rm -f $(ID_RSA)
	rm -f $(ID_RSA).pub

.PHONY: keys clean
