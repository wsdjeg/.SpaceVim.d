#!/bin/bash
pip3 list --format=legacy | awk '{print $1}' > pip3_list.txt
