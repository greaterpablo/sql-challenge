#SQL Challenge

In this challenge you'll find some interesting information, working in a 300K database of employee data

First of all we need to put some csv files in a way that dat could be relational.

[departments] Department number and department name
[dept_emp] Employee number and department number
[dept_manager] Department number and employee number
[employees] Employee number, employee title, birth date, last name, sex, hire date.
[salaries] Employee number, salary
[titles] Title id, title

taking some variables on hierarchy the realtion solution is this:

![relationaldata](https://github.com/greaterpablo/sql-challenge/blob/main/EmployeesDBD.png)


Making all of the conections we find out some relevant data:

I can find some info:

1.-Large databases are required to work in a only perform computer
2.-Most employees are paid less than 40K a year what is obvious.
3.-Staff empoyees are paid with a higer average.

MAde in pgAdmin 5.0
