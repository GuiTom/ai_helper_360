#!/bin/sh
set -eu

DIST_DIR="${DIST_DIR:-aiHelper360.com}"
S3_BUCKET="${S3_BUCKET:-aihelper360.com}"
S3_PREFIX="${S3_PREFIX:-aiHelper360.com}"
CLOUDFRONT_DISTRIBUTION_ID="${CLOUDFRONT_DISTRIBUTION_ID:-E3T2UKQME1FQZD}"
INVALIDATE_PATHS="${INVALIDATE_PATHS:-/*}"
DELETE_ENABLED=1
DO_BUILD=1
DRY_RUN=0

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
ROOT_DIR=$(cd "$SCRIPT_DIR/.." && pwd)
cd "$ROOT_DIR"

print_usage() {
  echo "用法: $0 [选项]"
  echo "  -s, --src <dir>                 本地构建目录 (默认: ${DIST_DIR})"
  echo "  -b, --bucket <name>             目标 S3 桶名 (默认: ${S3_BUCKET})"
  echo "  -p, --prefix <path>             S3 前缀路径 (默认: ${S3_PREFIX})"
  echo "  -d, --distribution-id <id>      CloudFront 分配 ID (默认: ${CLOUDFRONT_DISTRIBUTION_ID})"
  echo "      --paths <p1 p2 ...>         CloudFront 失效路径 (默认: ${INVALIDATE_PATHS})"
  echo "      --no-delete                 上传时不删除 S3 上多余文件"
  echo "      --build                     上传前执行构建 (默认开启)"
  echo "      --dry-run                   仅打印将执行的命令，不实际运行"
  echo "  环境变量支持: DIST_DIR, S3_BUCKET, S3_PREFIX, CLOUDFRONT_DISTRIBUTION_ID, INVALIDATE_PATHS"
}

while [ $# -gt 0 ]; do
  case "$1" in
    -s|--src) DIST_DIR="$2"; shift 2 ;;
    -b|--bucket) S3_BUCKET="$2"; shift 2 ;;
    -p|--prefix) S3_PREFIX="$2"; shift 2 ;;
    -d|--distribution-id) CLOUDFRONT_DISTRIBUTION_ID="$2"; shift 2 ;;
    --paths) INVALIDATE_PATHS="$2"; shift 2 ;;
    --no-delete) DELETE_ENABLED=0; shift ;;
    --build) DO_BUILD=1; shift ;;
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help) print_usage; exit 0 ;;
    *) shift ;;
  esac
done

if [ -z "${CLOUDFRONT_DISTRIBUTION_ID}" ]; then
  echo "错误: 未提供 CloudFront 分配 ID。"
  exit 1
fi

if [ ! -d "${DIST_DIR}" ]; then
  echo "错误: 本地目录不存在: ${DIST_DIR}"
  exit 1
fi

prefix_trimmed="${S3_PREFIX%/}"
DEST="s3://${S3_BUCKET}"
if [ -n "${prefix_trimmed}" ]; then
  DEST="${DEST}/${prefix_trimmed}"
fi

run() {
  if [ "${DRY_RUN}" -eq 1 ]; then
    echo "[dry-run] $*"
  else
    eval "$@"
  fi
}

if [ "${DO_BUILD}" -eq 1 ]; then
  run "npm run build"
fi

SYNC_FLAGS="--exact-timestamps"
if [ "${DELETE_ENABLED}" -eq 1 ]; then
  SYNC_FLAGS="${SYNC_FLAGS} --delete"
fi

if [ "${DRY_RUN}" -eq 1 ]; then
  echo "[dry-run] aws --version >/dev/null 2>&1 || echo '错误: 未检测到 aws CLI'"
else
  if ! aws --version >/dev/null 2>&1; then
    echo "错误: 未检测到 aws CLI"
    exit 1
  fi
fi

run "aws s3 sync \"${DIST_DIR}\" \"${DEST}\" ${SYNC_FLAGS}"

run "aws cloudfront create-invalidation --distribution-id \"${CLOUDFRONT_DISTRIBUTION_ID}\" --paths \"${INVALIDATE_PATHS}\""

echo "完成: 已同步到 ${DEST} 并触发 CloudFront 失效 (${INVALIDATE_PATHS})"
