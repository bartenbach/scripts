#!/bin/bash
#####################################
#  Song of Storms!                  #
#     Author:  Blake Bartenbach     #
#     Date:    August 8th 2014      #
#####################################

# Notes and octaves matched to frequencies
a3='220'
d3='146.832'
f3='174.614'

a4='440'
d4='293.665'

a5='880'
d5='587.330'
e5='659.225'
f5='698.456'
g5='783.991'

d6='1174.66'
c6='1046.50'
e6='1318.51'
f6='1396.91'

d7='2093'

beep -f $d5
beep -f $f5
beep -f $d6 -l 500

sleep .2

beep -f $d5
beep -f $f5
beep -f $d6 -l 500

sleep .4

beep -f $e6 -l 500
beep -f $f6
beep -f $e6
beep -f $f6
beep -f $e6
beep -f $c6
beep -f $a5 -l 500

sleep .5

beep -f $a5 -l 350
beep -f $d5 -l 350
beep -f $d5
beep -f $f5 
beep -f $a5 -l 600

sleep .5

beep -f $a5 -l 350
beep -f $d5 -l 350
beep -f $f5
beep -f $g5 
beep -f $e5 -l 600
