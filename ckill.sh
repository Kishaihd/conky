#!/bin/bash


c1=$(ps -e | grep conky | grep -o "[0-9][0-9][0-9][0-9]" | head -n 1)

c2=$(ps -e | grep conky | grep -o "[0-9][0-9][0-9][0-9]" | tail -n 1)

echo "Conky PID 1: $c1"
echo "Conky PID 2: $c2"

echo "Killing Conky processes..."

kill $c1
kill $c2

sleep 5

echo "Done."

