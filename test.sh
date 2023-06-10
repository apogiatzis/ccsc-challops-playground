#!/bin/bash

cf=".github/workflows/build-challenges.yml crypto/anatomy-park/docker-run.sh crypto/cathode-ray-thruster/docker-compose.yml"

dirs=()
while IFS=  read -r -d $'\0'; do
    dirs+=("$REPLY")
done < <(find . -type d \( -exec test -e '{}/challenge.yml' \; -a -exec test -e '{}/docker-compose.yml' \; -print0 \))
echo "dirs=${dirs[*]}"

# Convert changed files to array
IFS=' ' read -r -a changed_files <<< "$cf"
changed_dirs=()
for dir in "${dirs[@]}"; do
  for file in "${changed_files[@]}"; do
    if [[ "./$file" == "$dir"* ]]; then
      changed_dirs+=("$dir")
      break
    fi
  done
done
echo "changed_dirs=${changed_dirs[*]}"