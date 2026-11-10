#!/bin/bash
# 用本机 Chrome（Chromium 内核）把 index.html 按打印样式导出为 A4 PDF
cd "$(dirname "$0")" || exit 1
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
OUT="兴趣小组团建活动介绍.pdf"
"$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=8000 \
  --user-data-dir="$(mktemp -d)" \
  --print-to-pdf="$OUT" "file://$(pwd)/index.html"
echo "已导出：$(pwd)/$OUT"
