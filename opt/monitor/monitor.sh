#!/bin/bash

tail -F /var/log/safesquid/extended/extended.log | awk -F'\t' '{print $4,$11,$12,$2,$21,$6,$23,$24}' | grep -aiE "TCP_CONNECTION_FAILED|TCP_INVALID_RESPONSE|TCP_CONNECTION_NOROUTE|TCP_DNS_FAILED|TCP_SSL_FAILED|TCP_DENIED_COOKIES|TCP_DENIED|"