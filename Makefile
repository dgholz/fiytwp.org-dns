TMP_DATA ?= /tmp/fiytwp.org-dns.data

.PHONY: $(TMP_DATA)
$(TMP_DATA):
	@git archive --remote=https://github.com/dgholz/fiytwp.org-dns.git --format=tar HEAD data | tar --extract --to-stdout > $@

data: $(TMP_DATA)
	@cmp --silent $@ $< || cp $< $@

data.cdb: data
	/usr/bin/tinydns-data
