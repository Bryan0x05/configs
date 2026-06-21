#!/usr/bin/env bash
set -uo pipefail

tools=(fd bat fzf zoxide)

declare -A tool_aliases=(
    [fd]="fd-find fd"
)

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
echo

if [ "${#missing[@]}" -eq 0 ]; then
    exit 0
fi

echo "== Missing tools =="
for tool in "${missing[@]}"; do
    echo "$tool"
done
printf '=%.0s' {1..25}
echo

install_cmd="$*"
if [ -z "$install_cmd" ]; then
    echo "No install command given. Re-run as: ./tools.sh \"<pkg_manager install>\" (e.g. \"brew install\", \"sudo apt install\")"
    exit 0
fi

pkg_mgr="${install_cmd%% *}"
if ! command -v "$pkg_mgr" >/dev/null 2>&1; then
    echo "Package manager '$pkg_mgr' not found on PATH."
    exit 1
fi

for tool in "${missing[@]}"; do
    candidates="${tool_aliases[$tool]:-$tool}"
    installed=false

    for candidate in $candidates; do
        match=$("$pkg_mgr" search "$candidate" 2>/dev/null | grep -m1 -w "$candidate")
        if [ -z "$match" ]; then
            continue
        fi

        read -rp "Install $candidate via '$install_cmd'? [y/n/s] " ans
        if [[ "$ans" =~ ^[Yy]$ ]]; then
            $install_cmd "$candidate" && installed=true && break
        elif [[ "$ans" =~ ^[Ss]$ ]]; then
            break
        fi
    done

    $installed || echo "Could not install $tool (tried: $candidates)"
done
