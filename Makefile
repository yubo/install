.PHONE: release

release:
	tar czvf dist/prometheus.tar.gz ./prometheus/bin
	tar czvf dist/m3.tar.gz ./m3dbnode/bin ./m3coordinator/bin ./m3dbnode-single/bin
	
