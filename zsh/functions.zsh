function killserver() {
  kill -9 $(lsof -n -iTCP:"$1" -sTCP:LISTEN -t)
}
