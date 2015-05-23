# `adocker` is alias to `azk docker`
all:
	adocker build -t azukiapp/apache2 2.4

no-cache:
	adocker build --rm --no-cache -t azukiapp/apache2 2.4
