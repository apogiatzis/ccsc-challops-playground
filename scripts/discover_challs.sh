#!/bin/bash

find . -type d -exec sh -c '[ -f "{}"/challenge.yml ] && echo "{}"' \;