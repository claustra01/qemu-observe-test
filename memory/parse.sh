#!/usr/bin/env bash

# header
sudo readelf -h ./guest.vmcore

# section headers
sudo readelf -n ./guest.vmcore
