#!/bin/bash

mysqladmin -u root create sbtest
sysbench --db-driver=mysql --test=oltp --mysql-table-engine=Innodb --oltp-table-size=1000000 --mysql-socket=/var/lib/mysql/mysql.sock --mysql-user=root prepare
