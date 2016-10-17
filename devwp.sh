#/bin/sh
MODE="$1"
echo "$MODE"

exist_container() {
  if [ $(docker-compose ps -q wordpress) ]; then
    return 1
  else
    return 0
  fi
}

cmd_init() {
  echo Inital containers...
  docker-compose up -d && docker-compose exec wordpress ln -s /usr/src/devtheme /var/www/html/wp-content/themes/devtheme
}

cmd_start() {
  echo Start containers...
  docker-compose start
}

cmd_stop() {
  echo Stop containers...
  docker-compose stop
}

cmd_rm() {
  echo Remove containers...
  docker-compose rm -f
}

if [ "$MODE" = "init" ]; then
  exist_container
  if [ "$?" = "0" ]; then
    cmd_init
  else
    echo Already exist container.
  fi
  exit 0
elif [ "$MODE" = "start" ]; then
  exist_container
  if [ "$?" = "0" ]; then
    cmd_init
  else
    cmd_start
  fi
  exit 0
elif [ "$MODE" = "stop" ]; then
  exist_container
  if [ "$?" = "0" ]; then
    echo "Does not exist containers"
  else
    cmd_stop
  fi
  exit 0
elif [ "$MODE" = "restart" ]; then
  exist_container
  if [ "$?" = "0" ]; then
    cmd_start
  else
    cmd_stop
    cmd_start
  fi
  exit 0
elif [ "$MODE" = "reset" ]; then
  cmd_stop
  cmd_rm
  cmd_init
  exit $?
elif [ "$MODE" = "remove" ]; then
  exist_container
  if [ "$?" = "0" ]; then
    cmd_rm
  else
    cmd_stop
    cmd_rm
  fi
  exit $?
else
  echo Available options [init, start, stop, restart, reset, remove]
fi

