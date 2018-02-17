Example2: Employee Database
===========================

้อ้างอิงจาก https://dev.mysql.com/doc/employee/en/employees-installation.html

พิจารณา ตารางที่เกี่ยวข้องกับ พนักงานดังนี้

.. image:: _static/images/SampleEmployees.png

.. note:: Prepare

    * Download
        * test_db-master.zip : `test_db-master.zip <_static/code/test_db-master.zip>`_.

    .. code-block:: bash

        shell> unzip test_db-master.zip
        shell> cd test_db-master

หลังจากทำการ Download และ unzip เรียบร้อย ก็ให้โหลดเข้าสู่ฐานข้อมูล

.. code-block:: bash

    shell> mysql -t < employees.sql


* ตาราง employees

.. code-block:: bash

    CREATE TABLE employees (
        emp_no      INT             NOT NULL,  -- UNSIGNED AUTO_INCREMENT??
        birth_date  DATE            NOT NULL,
        first_name  VARCHAR(14)     NOT NULL,
        last_name   VARCHAR(16)     NOT NULL,
        gender      ENUM ('M','F')  NOT NULL,  -- Enumeration of either 'M' or 'F'
        hire_date   DATE            NOT NULL,
        PRIMARY KEY (emp_no)                   -- Index built automatically on primary-key column
                                               -- INDEX (first_name)
                                               -- INDEX (last_name)
    );

* ตาราง departments

.. code-block:: bash

    CREATE TABLE departments (
        dept_no     CHAR(4)         NOT NULL,  -- in the form of 'dxxx'
        dept_name   VARCHAR(40)     NOT NULL,
        PRIMARY KEY (dept_no),                 -- Index built automatically
        UNIQUE  KEY (dept_name)                -- Build INDEX on this unique-value column
    );

* ตาราง dept_emp

ตารางเชื่อม ความสัมพันธ์ many-to-many relationship ระหว่าง employees และ departments.
    * department has many employees
    * employee can belong to different department at different dates (from_date) - (to_date)

.. code-block:: bash

    CREATE TABLE dept_emp (
        emp_no      INT         NOT NULL,
        dept_no     CHAR(4)     NOT NULL,
        from_date   DATE        NOT NULL,
        to_date     DATE        NOT NULL,
        KEY         (emp_no),   -- Build INDEX on this non-unique-value column
        KEY         (dept_no),  -- Build INDEX on this non-unique-value column
        FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
               -- Cascade DELETE from parent table 'employee' to this child table
               -- If an emp_no is deleted from parent 'employee', all records
               --  involving this emp_no in this child table are also deleted
               -- ON UPDATE CASCADE??
        FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
               -- ON UPDATE CASCADE??
        PRIMARY KEY (emp_no, dept_no)
               -- Might not be unique?? Need to include from_date
    );

foreign keys มีการระบุ ON DELETE reference_action CASCADE หมายความว่า หากมีค่าของ key-value จาก ตาราง parent table (employee และ department) ถูกลบ จะมีผลให้ ทุก records ในตาราง dept_emp ตารางลูก (child table) ที่มี key-value ตรงกันก็จะถูกลบไปด้วย

.. note:: ON DELETE OPTION

    1.  ON DELETE RESTRICTED กำหนดให้เป็นค่า Default ของ parent child relation หมายความว่า Database ไม่อนุญาตให้มีการลบ parent record ถ้าหากมีข้อมูลอยู่ใน child records
    2.  ON DELETE CASCADE หากมีการลบข้อมูลใน parent record ทำให้ Database จะทำการส่งคำสั่งไปลบ record ใน child record เช่นกัน
    3.  ON DELETE SET NULL  จะไม่ลบข้อมูล record ใน class ลูก แต่จะแทนค่าด้วย ค่าว่าง ``NULL`` แทน foreign key ของ parent ที่ถูกลบไป


* ตาราง dept_manager

ทำหน้าที่เป็นตารางเชื่อม many-to-many ระหว่างตาราง employee และตาราง dept_emp

.. code-block:: bash

    CREATE TABLE dept_manager (
       dept_no      CHAR(4)  NOT NULL,
       emp_no       INT      NOT NULL,
       from_date    DATE     NOT NULL,
       to_date      DATE     NOT NULL,
       KEY         (emp_no),
       KEY         (dept_no),
       FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
                                      -- ON UPDATE CASCADE??
       FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
       PRIMARY KEY (emp_no, dept_no)  -- might not be unique?? Need from_date
    );

* ตาราง title

ทำหน้าที่เป็นตารางเชื่อม  one-to-many ระหว่างตาราง employee และ ตาราง title โดยการออกแบบกำหนดให้พนักงาน (Employee) สามารถมีได้หลายตำแหน่งขึ้นกับเวลาที่แตกต่างกัน โดยมี  emp_no เป็น foreign key กลับไปยัง ตาราง employee

.. code-block:: bash

    CREATE TABLE titles (
        emp_no      INT          NOT NULL,
        title       VARCHAR(50)  NOT NULL,
        from_date   DATE         NOT NULL,
        to_date     DATE,
        KEY         (emp_no),
        FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
                             -- ON UPDATE CASCADE??
        PRIMARY KEY (emp_no, title, from_date)
           -- This ensures unique combination.
           -- An employee may hold the same title but at different period
    );

* ตาราง Salary

มีโครงสร้างคล้ายกับตาราง titles เป็นตารางเชื่อมความสัมพันธ์ แบบ one-to-many เชื่อมระหว่าง ตาราง employee และ ตาราง  salaries

.. code-block:: bash

    CREATE TABLE salaries (
        emp_no      INT    NOT NULL,
        salary      INT    NOT NULL,
        from_date   DATE   NOT NULL,
        to_date     DATE   NOT NULL,
        KEY         (emp_no),
        FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
        PRIMARY KEY (emp_no, from_date)
    );
