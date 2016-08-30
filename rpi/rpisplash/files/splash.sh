#! /bin/sh
### BEGIN INIT INFO
# Provides:          fbi
# Required-Start:
# Required-Stop:
# Should-Start:
# Default-Start:     S 1 2 3 4
# Default-Stop:      5
# Short-Description: Start intro splashscreen
# Description:       Start intro splashscreen
### END INIT INFO

PATH=/sbin:/bin


do_start () {

    /usr/bin/fbi -T 1 --noverbose --fitwidth /usr/share/backgrounds/wallpaper_pt.png 
    exit 0
}

case "$1" in
  start|"")
    do_start
    ;;
  restart|reload|force-reload)
    echo "Error: argument '$1' not supported" >&2
    exit 3
    ;;
  stop)
    # No-op
    ;;
  status)
    exit 0
    ;;
  *)
    echo "Usage: asplashscreen [start|stop]" >&2
    exit 3
    ;;
esac

:
