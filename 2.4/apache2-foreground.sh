#!/bin/bash
source /etc/apache2/envvars

if [ ! -z "$APP_DIR" ]; then
	DOCUMENT_ROOT="/var/www"
	rm -rf ${DOCUMENT_ROOT}

	if [ -d "${APP_DIR}/public" ]; then
		dir="${DOCUMENT_ROOT}"
	else
		dir="${DOCUMENT_ROOT}/public"
	fi

	ln -s $APP_DIR $dir
fi

exec apache2 -D FOREGROUND
