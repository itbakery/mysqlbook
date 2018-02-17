Example1: Sample Database
=========================

Sample Database: `mysqlsampledatabase.sql <_static/code/mysqlsampledatabase.sql>`_.

ให้ Download มาไว้ที่เครื่อง และเปิดโปรแกรม Mysql Workbranch

.. image:: _static/images/example1-workbench1.PNG

click login

.. image:: _static/images/example1-workbench2.PNG

เลือก File > Run SQL Script

.. image:: _static/images/example1-workbench3.PNG

เลือก file ที่ Download มา

.. image:: _static/images/example1-workbench4.PNG

แสดง Run SQL Script  และ กด ``run``

.. image:: _static/images/example1-workbench5.PNG

แสดงผล การ run

.. image:: _static/images/example1-workbench6.PNG

กด Refresh link

.. image:: _static/images/example1-workbench7.PNG

หลังจาก import database เรียบร้อยแล้ว เลือก menu Database > Reverse Engineer

.. image:: _static/images/example1-workbench8.PNG

จะมีหน้าต่าง Reverse Engineer Database เลือก ``stored connection`` ไปยัง เครื่อง server ที่ต้องการเชื่อมต่อ ในตัวอย่างนี้ เครื่อง server อยู่ที่เครื่อง local และ กด next

.. image:: _static/images/example1-workbench9.PNG

connect DBMS กด next

.. image:: _static/images/example1-workbench10.PNG

เลือก schemas ``classicmodels``

.. image:: _static/images/example1-workbench11.PNG

สิ้นสุด กระบวนการ Reverse

.. image:: _static/images/example1-workbench12.PNG

กด Execute

.. image:: _static/images/example1-workbench13.PNG

.. image:: _static/images/example1-workbench14.PNG

.. image:: _static/images/example1-workbench15.PNG

เลือก tab ER-diagram

.. image:: _static/images/example1-workbench16.PNG
