#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <issue_key>"
  exit 1
fi

DIR="$(dirname "$0")"
source "$DIR/.venv/bin/activate"
if [ "$2" == "--ignore-closed" ]; then
  python jira-dependency-graph.py --local --ignore-closed "$1" | dot -Tpng > issue_graph.png
else
  python jira-dependency-graph.py --local "$1" | dot -Tpng > issue_graph.png
fi
deactivate

