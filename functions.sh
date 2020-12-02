hosts=${hosts:-10.86.92.17}
apps=${apps:-etcd}
user=${user:-$(whoami)}
prefix=${app:-"./apps"}

run()
{

case "$1" in
	start|stop|status|enable|disable|install|uninstall):
		set -x
		for host in ${hosts}; do
			for app in ${apps}; do
				ssh ${user}@${host} "make -C ${prefix}/${app} ${1}" || exit
			done
		done
		set +x
		;;
	sync):
		set -x
		for host in ${hosts}; do
			for app in ${apps}; do
				rsync -avzhe ssh --delete ./${app} ${user}@${host}:${prefix}/ || exit
			done
		done
		set +x
		;;
	*):
		echo "unsupported ctl(${1})"
		exit 1
		;;
esac
}

#sync
#install
