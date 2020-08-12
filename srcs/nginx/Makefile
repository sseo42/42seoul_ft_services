
BASE_DIR = $(shell pwd)
KEY = $(BASE_DIR)/nginx.key
CERT = $(BASE_DIR)/nginx.crt
SSH_HOST_RSA_KEY = $(BASE_DIR)/ssh_host_rsa_key
SSH_HOST_DSA_KEY = $(BASE_DIR)/ssh_host_dsa_key

keys:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(KEY) -out $(CERT) -subj "/CN=nginxsvc/O=nginxsvc"
	@if [ ! -f $(SSH_HOST_RSA_KEY) ]; \
	then expect -c "spawn ssh-keygen -t rsa" \
                   -c "expect -re \":\"" \
                   -c "send \"$(SSH_HOST_RSA_KEY)\r\"" \
                   -c "expect -re \":\"" \
                   -c "send \"\r\"" \
                   -c "expect -re \":\"" \
                   -c "send \"\r\"" \
				   -c "interact"; \
	fi ;
	@chmod 600 $(SSH_HOST_RSA_KEY)
	@if [ ! -f $(SSH_HOST_DSA_KEY) ]; \
	then expect -c "spawn ssh-keygen -t rsa" \
                   -c "expect -re \":\"" \
                   -c "send \"$(SSH_HOST_DSA_KEY)\r\"" \
                   -c "expect -re \":\"" \
                   -c "send \"\r\"" \
                   -c "expect -re \":\"" \
                   -c "send \"\r\"" \
				   -c "interact"; \
	fi ;
	@chmod 600 $(SSH_HOST_DSA_KEY)
	echo root:1234 > root_passwd

clean:
	rm -f $(KEY)
	rm -f $(CERT)
	rm -f $(SSH_HOST_RSA_KEY)
	rm -f $(SSH_HOST_RSA_KEY).pub
	rm -f $(SSH_HOST_DSA_KEY)
	rm -f $(SSH_HOST_DSA_KEY).pub
	rm -f root_passwd

.PHONY: keys clean
