TMP_DATA ?= /tmp/fiytwp.org-dns.data

.PHONY: $(TMP_DATA)
$(TMP_DATA):
	@curl --silent https://raw.githubusercontent.com/dgholz/fiytwp.org-dns/master/data > $@

data: $(TMP_DATA)
	@cmp --silent $@ $< || cp $< $@

data.cdb: data
	/usr/bin/tinydns-data
