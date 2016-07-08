#!/bin/bash
pip2 list | awk '{print $1}' > pip2_list.txt
