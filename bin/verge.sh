#!/usr/bin/env bash
set -e

sc_dir="$(
  cd "$(dirname "$0")" >/dev/null 2>&1 || exit
  pwd -P
)"

rs_path=${sc_dir/zs-clash*/zs-clash}

source $rs_path/bin/libs/headers.sh

Case=${1:-help}

ebc_debug "解析命令参数> verge.sh $Case"

case "$Case" in
help)
  ebc_debug "说明: verge.sh 命令快捷参数"
  ebc_debug "用法: verge.sh <Case>"
  ebc_debug "示例: verge.sh restart"
  ;;
restart)

 ;;
info)
#  ebc_info "请访问: http://0.wh.iirii.com:8810/ui/"
#  cat conf/config.yaml | grep secret
 ;;
*)
  echo "[参数命令不合法]case: $Case [reconfig,info,start,restart,stop]"
  exit 1
  ;;
esac
