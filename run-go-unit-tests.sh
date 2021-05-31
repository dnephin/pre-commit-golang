#!/usr/bin/env bash

show_usage() {
cat <<EOF
$0: usage: $0
    [-cover] [-coverprofile <profile>] [-covermode <mode>]
    [-coverpkg <patterns>] [-timeout <timeout>] [-tags <tags>]
    [-run <expression>] [-failfast]
EOF
}

extra_args=()
arg_timeout=30s
arg_tags="unit"

while (( $# > 0 )); do
  case $1 in
    (-failfast)
          extra_args+=("-failfast")
          shift
          ;;

    (-cover)
          extra_args+=("-cover")
          shift
          ;;

    (-run)
          extra_args+=("-run" "$2")
          shift 2
          ;;

    (-coverprofile)
          extra_args+=("-coverprofile" "$2")
          shift 2
          ;;

    (-covermode)
          extra_args+=("-covermode" "$2")
          shift 2
          ;;

    (-coverpkg)
          extra_args+=("-coverpkg" "$2")
          shift 2
          ;;

    (-timeout)
          arg_timeout="$2"
          shift 2
          ;;

    (-tags)
          arg_tags="$2"
          shift 2
          ;;

    (-help|--help)
          show_usage
          exit 0
          ;;

    (--)  shift
          break
          ;;

    (-*)  show_usage >&2
          exit 2
          ;;

    (*)   break
          ;;
  esac
done

FILES=$(go list ./...  | grep -v /vendor/)

go test -tags="${arg_tags}" -timeout "${arg_timeout}" -short -v "${extra_args[@]}" ${FILES}

returncode=$?
if [ $returncode -ne 0 ]; then
  echo "unit tests failed"
  exit 1
fi
