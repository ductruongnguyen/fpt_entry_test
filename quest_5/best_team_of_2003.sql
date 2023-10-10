use classicmodels;

select emp.employeeNumber, emp.firstName, emp.lastName, emp.jobTitle ,sum(temp.totalSaleByEmp) as totalSaleByTeam
from employees as emp
         inner join (select e.reportsTo, sum(od.quantityOrdered) as totalSaleByEmp
                     from employees as e,
                          customers as c,
                          orders as o,
                          orderdetails as od
                     where e.employeeNumber = c.salesRepEmployeeNumber
                       and c.customerNumber = o.customerNumber
                       and o.orderNumber = od.orderNumber
                       and YEAR(o.shippedDate) = 2003
                       and o.status = 'Shipped'
                     group by e.employeeNumber) as temp on emp.employeeNumber = temp.reportsTo
group by emp.employeeNumber
order by totalSaleByTeam desc;

