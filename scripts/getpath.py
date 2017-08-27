#! /usr/bin/env python

import os, subprocess


# https://askubuntu.com/questions/222277/how-to-find-the-program-name-of-an-x-window
# Function based on code from apport
def get_window_pid():
    xprop = subprocess.Popen(['xprop', '_NET_WM_PID'],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (out, err) = xprop.communicate()
    if xprop.returncode == 0:
        try:
            return int(out.split()[-1])
        except ValueError:
            return -1
    else:
        return -1

def get_window_exe():
    pid = get_window_pid()

    if pid == -1:
        return ''

    return os.path.realpath('/proc/' + str(pid) + '/exe')

if __name__=='__main__':
    exe = get_window_exe()
    if exe == '':
        print 'Unable to identify window\'s executable' 
    else:
        print exe
