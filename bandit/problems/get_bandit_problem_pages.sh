#!/bin/sh

for i in `seq 1 35`;
do
    curl https://overthewire.org/wargames/bandit/bandit$i.html > bandit$i.html
done
