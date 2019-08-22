SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 :memory: ".shell uname -a"
# 対話モード
# .shell { read -p "なんか入力すれば？> " SOME_INPUT; echo "入力結果: ${SOME_INPUT}"; }

sqlite3 :memory: \
".shell uname -s > /tmp/work/tmp.txt" \
".output stdout" \
"select readfile('/tmp/work/tmp.txt');"

