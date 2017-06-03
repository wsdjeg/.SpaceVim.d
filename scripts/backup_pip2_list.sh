#!/bin/bash
pip2 list --format=legacy | awk '{print $1}' > pip2_list.txt
