#!/usr/bin/env bash
tools=(fd bat fzf zoxide)

echo "Checking installed tools.."
missing=()

echo "== Found tools =="
for tool in "${tools[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
        echo "$tool"
    else
        missing+=("$tool")
    fi
done
printf '=%.0s' {1..25}
if [ "${#missing[@]}" -gt 0 ]; then
    echo "== Missing tools =="
    for tool in "${missing[@]}"; do
        echo "$tool"
    done
    printf '=%.0s' {1..25}
fi

