#!/bin/sh

specified_node_version() {
  cat .node-version 2>/dev/null || cat .nvmrc 2>/dev/null | sed 's/^v//'
}

node_version() {
  node -v | sed 's/^v//'
}

read_package_json_pm() {
  (grep '"packageManager"' package.json 2>/dev/null) | head -n1 | cut -d'"' -f4 | cut -d'@' -f1
}

detect_pm() {
  pkpm=read_package_json_pm
  pm=""
  if [ "$pkpm" = "yarn" ] || [ -f "yarn.lock" ]; then
    if [ -d ".yarn" ] || [ -f ".yarnrc.yml" ]; then
      pm="yarn"
    else
      pm="yarn1"
    fi
  elif [ "$pkpm" = "pnpm" ] || [ -f "pnpm-lock.yaml" ] || [ -f "pnpm-workspace.yaml" ]; then
    pm="pnpm"
  elif [ -f "package.json" ]; then
    pm="npm"
  fi

  printf "%s" "$pm"
}

pm_lock() {
  lock=""
  case "$1" in
    yarn1|yarn) lock="yarn.lock" ;;
    pnpm) lock="pnpm-lock.yaml" ;;
    npm) lock="package-lock.json" ;;
  esac
  printf "%s" "$lock"
}

pm_version() {
  case "$1" in
    yarn1|yarn) yarn -v ;;
    pnpm) pnpm -v ;;
    npm) npm -v ;;
  esac
}

install() {
  case "$1" in
    yarn1) yarn install --frozen-lockfile ;;
    yarn) yarn --immutable ;;
    pnpm) pnpm install --frozen-lockfile ;;
    npm) npm ci ;;
  esac
}

dependencies_size() {
  find . -type d -name "node_modules" -prune -exec du -sm {} + \
    | sort -nr \
    | awk '{ printf "\033[1;35m %4sM \033[0m %s\n", $1, $2 }'
}

cmd="$*"

case "$cmd" in
  pm) detect_pm ;;
  pm_version) pm_version "$(detect_pm)" ;;
  install) install "$(detect_pm)" ;;
  dependencies_size) dependencies_size ;;
  specified) specified_node_version ;;
  version) node_version ;;
esac
