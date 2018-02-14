Install PostgreSQL 10 on CentOS 7
=================================

.. image:: _static/images/use-postgresql-on-centos-7-title.png

ติดตั้ง postgresql 10 บน centos 7
-----------------------------------
เพิ่ม repository repo และติดตั้ง

.. code-block:: bash

    sudo su -
    yum update -y
    yum install vim
    wget https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-1.noarch.rpm
    rpm -ivh pgdg-centos10-10-1.noarch.rpm
    yum install -y postgresql10-server postgresql10 postgresql10-contrib


Initialize postgres Server
--------------------------

.. code-block:: bash

    /usr/pgsql-10/bin/postgresql-10-setup initdb

    Initializing database ... OK

    ls -l /var/lib/pgsql/10

    total 8
    drwx------.  2 postgres postgres    6 Feb  6 16:58 backups
    drwx------. 20 postgres postgres 4096 Feb 13 14:01 data
    -rw-------.  1 postgres postgres  875 Feb 13 14:01 initdb.log


Start server
------------

.. code-block:: bash

    systemctl start postgresql-10
    systemctl enable postgresql-10
    systemctl status postgresql-10

    ss -tulan | grep 5432

    tcp    LISTEN     0      128    127.0.0.1:5432                  *:*
    tcp    LISTEN     0      128     ::1:5432                 :::*

Enable firewall
---------------

.. code-block:: bash

    systemctl start firewalld
    systemctl enable firewalld
    firewall-cmd --permanent --add-service=postgresql
    --or--
    firewall-cmd --permanent --add-port=5432/tcp
    firewall-cmd --reload

Access PostgreSQL command prompt
---------------------------------
โดย default การติดตั้งจะสร้าง  user postgres การใช้งานโดยการเปลี่ยน user เป็น postgres
และใช้คำสั่ง psql (ไม่ต้องใส่ password เนื่องจากอยู่ในโหมด ident คือ user ที่ login จะต้องตรงกับ
ีuser ในฐานข้อมูล)

.. code-block:: bash

    getenv passwd  | grep postgres
    postgres:x:26:26:PostgreSQL Server:/var/lib/pgsql:/bin/bash

    su - postgres

    -bash-4.2$ psql
    psql (10.2)
    Type "help" for help.

    postgres=# \l

    postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
    template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
              |          |          |             |             | postgres=CTc/postgres
    template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
              |          |          |             |             | postgres=CTc/postgres


    (ตั้ง password แก่ user postgres ใน ฐานข้อมูล)
    postgres=# alter role postgres with password 'postgres';
    ALTER ROLE

    postgres=# \q
    -bash-4.2$ exit
    logout
    (กลับไปยัง root)

Change mode ident to md5
------------------------

.. code-block:: bash

    vim /var/lib/pgsql/10/data/pg_hba.conf

    local   all             all                                     peer
    host    all             all             127.0.0.1/32            ident
    host    all             all             ::1/128                 ident

เปลี่ยนเป็น

.. code-block:: bash

    local   all             all                                     md5
    host    all             all             127.0.0.1/32            md5
    host    all             all             ::1/128                 md5


Allow listen to all interface
-----------------------------

.. code-block:: bash

    vim /var/lib/pgsql/10/data/postgresql.conf  +58
    (บรรทัดที่ 58)
    listen_addresses = '*'

Restart
-------

.. code-block:: bash

    systemctl restart postgresql

Set postgres password
---------------------

.. code-block:: bash

    passwd postgres

    Changing password for user postgres.
    New password:
    BAD PASSWORD: The password contains the user name in some form
    Retype new password:
    passwd: all authentication tokens updated successfully.


Test connect
------------

.. code-block:: bash

    [root@localhost ~]# systemctl restart postgresql-10
    [root@localhost ~]# psql -U postgres postgres
    Password for user postgres:
    psql (10.2)
    Type "help" for help.

    postgres=#
