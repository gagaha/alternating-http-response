#!/bin/bash

if grep -q 500 /var/www/html/index.php; then
	sed -i "s/500/200/g" /var/www/html/index.php
else 
	sed -i "s/200/500/g" /var/www/html/index.php
fi
