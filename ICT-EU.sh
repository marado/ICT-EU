#!/bin/bash

## This fetches and then processes.
##
## The fetcher and processor are different scripts, so you can easilly
## reprocess what you've already fetched.

./fetch.sh && ./process.sh
