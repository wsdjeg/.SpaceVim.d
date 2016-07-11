#!/bin/bash
gem list -l | awk '{print $1}' > gem_list.txt
