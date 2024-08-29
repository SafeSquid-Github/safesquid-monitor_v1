#!/bin/bash

tail -F /var/log/safesquid/extended/extended.log | awk -F'\t' '{print $4,$11,$12,$2,$21,$6,$23,$24}' 
