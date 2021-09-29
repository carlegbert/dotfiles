#! /usr/bin/env bash

function _..() {
  if [ $# = 0 ]; then
    cd ..
    return 0;
  fi

  re='^[0-9]+$'
  if ! [[ $1 =~ $re  ]]; then
    echo "error: Not a number" >&2;
    return 1;
  fi

  for _ in $(seq 1 "$1"); do
    cd ..
  done
  return 0;
}

function mkcd() {
  mkdir "$1" || exit 1
  cd "$1" || exit 1
}

function setvol() {
  if [ $# = 0 ]; then
    echo "useage: setvol <number>" >&2;
    return 1;
  fi

  re='^[0-9]+$'
  if ! [[ $1 =~ $re  ]]; then
    echo "error: Not a number" >&2;
    return 1;
  fi

  amixer sset Master "$1%" > /dev/null;
  echo "Volume set to $1";
  return 0;
}

function dcleanup() {
  docker rm -v "$(docker ps --filter status=exited -q 2> /dev/null)"
  docker rmi "$(docker images --filter dangling=true -q 2> /dev/null)"
  docker volume rm "$(docker volume ls -qf dangling=true 2> /dev/null)"
}

function i3lock-wall() {
    WALLDIR="$HOME/Pictures/walls"
    (
        cd "$WALLDIR" || i3lock -e -f -t
        WALL=$(ls | sort -R | tail -1)
        echo "$WALL" >> ~/wall.log
        i3lock -i "$WALL" -e -f -t
    )
}

function ec() {
  if [ $# != 2 ]; then
    echo "useage: ec <source> <target>" >&2;
    return 1;
  fi

  cp "$1" "$2" && "$EDITOR" "$2"
}

function writeclip() {
    tmpfile=$(mktemp)
    "$EDITOR" "$tmpfile"
    setclip < "$tmpfile"
    echo "Copied to clipboard:"
    getclip
}

function editclip() {
    tmpfile=$(mktemp)
    getclip > "$tmpfile"
    "$EDITOR" "$tmpfile"
    setclip < "$tmpfile"
    echo "Copied to clipboard:"
    getclip
}

function memchk() {
    valgrind --tool=memcheck --leak-check=full --track-origins=yes "./$1"
}
