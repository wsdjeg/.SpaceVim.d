#!/bin/bash
pip3 list | awk '{print $1}' > pip3_list.txt
