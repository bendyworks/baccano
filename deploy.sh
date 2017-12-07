
function fail {
  msg="$*"
  echo
  echo $msg
  echo
  exit -1
}

function try {
  cmd="$*"
  $cmd || fail "$cmd failed"
}

if [ "${1}" = "staging" ]; then
  echo
  echo "Deploying local:staging to heroku_staging:master"
  echo
  try git push --force heroku_staging staging:master
elif [ "${1}" = "production" ]; then
  echo
  echo "Deploying local:master to heroku_production:master"
  echo
  try git push --force heroku_production master:master
else
  fail 'usage: deploy.sh [staging|production]'
fi
