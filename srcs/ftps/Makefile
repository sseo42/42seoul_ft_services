PEM = vsftpd.pem

pem:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(PEM) -out $(PEM) -subj "/CN=nginxsvc/O=nginxsvc"

clean:
	rm -f $(PEM)
