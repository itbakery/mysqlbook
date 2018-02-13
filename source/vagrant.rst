Vagrant
=======
เตรียมเครื่องด้วย vagrant สร้าง project folder ชื่อ ``mysql`` และสร้าง file ``Vagrantfile`` ดังนี้

::

    mkdir mysql
    cd mysql
    vim Vagrantfile 

.. literalinclude:: _static/code/Vagrantfile-single

::

    vagrant up
    vagrant ssh

หากมีความผิดพลาดเนื่องจาก locale  

::

    -bash: warning: setlocale: LC_CTYPE: cannot change locale (UTF-8): No such file or directory

ให้ทำการแก้ไข
::

    vi /etc/environment
    LANG=en_US.utf-8
    LC_ALL=en_US.utf-8
