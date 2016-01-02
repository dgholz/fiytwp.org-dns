TMP_DATA ?= /tmp/fiytwp.org-dns.data

all: data.cdb

.PHONY: data
data:
	touch $@
	@curl --silent https://raw.githubusercontent.com/dgholz/fiytwp.org-dns/master/$@ > $(TMP_DATA)
	@cmp --silent $(TMP_DATA) $@ || cp $(TMP_DATA) $@

data.cdb: data
	/usr/bin/tinydns-data
