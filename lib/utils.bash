#!/usr/bin/env bash

set -euo pipefail

GO_MODULE="github.com/deepmap/oapi-codegen"
GO_MODULE_V2="github.com/deepmap/oapi-codegen/v2"
GO_MODULE_V2_3="github.com/oapi-codegen/oapi-codegen/v2"
GO_CMD_MODULE="${GO_MODULE}/cmd/oapi-codegen"
GO_CMD_MODULE_V2="${GO_MODULE_V2}/cmd/oapi-codegen"
GO_CMD_MODULE_V2_3="${GO_MODULE_V2_3}/cmd/oapi-codegen"
TOOL_NAME="oapi-codegen"
TOOL_TEST="oapi-codegen --help"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  list_go_module_versions
}

list_go_module_versions() {
  go list -m -versions "$GO_MODULE" | tr ' ' '\n' | sed 's/^v//' | grep -v "$GO_MODULE" || true
  go list -m -versions "$GO_MODULE_V2" | tr ' ' '\n' | sed 's/^v//' | grep -v "$GO_MODULE_V2" || true
}

install_version() {
  local install_type="$1"
  local version="v$2"
  local install_path="${3%/bin}/bin"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    if [[ $version = v2.3* ]]; then
      GOBIN="${install_path}" go install "${GO_MODULE_V2_3}@${version}"
    elif [[ $version = v2* ]]; then
      GOBIN="${install_path}" go install "${GO_CMD_MODULE_V2}@${version}"
    else
      GOBIN="${install_path}" go install "${GO_CMD_MODULE}@${version}"
    fi

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error occurred while installing $TOOL_NAME $version."
  )
}
