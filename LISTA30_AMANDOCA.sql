USE `classicmodels`;

/* offices */
SELECT COUNT(officeCode) FROM offices;

SELECT COUNT(*) FROM offices
WHERE territory = 'NA';

/* productLines */
SELECT productLine,
(SELECT COUNT(productLine) FROM productLines
WHERE productLine = p.productLine)
FROM products p;

SELECT textDescription FROM productLines;

/* employees */
SELECT SUM(reportsTo) FROM employees
WHERE reportsTo > 1088;

SELECT firstName, employeeNumber FROM employees
GROUP BY employeeNumber
HAVING firstName = 'Leslie';

SELECT jobTitle FROM employees;

SELECT COUNT(*) FROM employees e
JOIN offices o
GROUP BY e.reportsTo, e.jobTitle, o.officeCode
HAVING officeCode < 5;

SELECT SUM(employeeNumber) FROM employees
WHERE employeeNumber > 347;

SELECT extension, email FROM employees
HAVING extension = 'x9273';

SELECT email FROM employees;

SELECT jobTitle, reportsTo, extension FROM employees
WHERE email IN
(SELECT email FROM employees
WHERE email = 'mnishi@classicmodelcars.com');

/* products */
SELECT COUNT(*) FROM products;

SELECT COUNT(*) FROM products
WHERE productDescription = 'Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.';

SELECT SUM(productScale) FROM products
WHERE productScale > '1:10';

/* customers */
SELECT COUNT(*) FROM customers
WHERE COUNTry = 'Germany';

SELECT COUNT(*) FROM customers o 
JOIN payments p on o.customerNumber = p.customerNumber
WHERE o.customerNumber  = 'MA765515';

SELECT creditLimit, postalCode, COUNTry FROM customers
WHERE phone IN
(SELECT phone FROM customers
WHERE phone > 5000000);

SELECT addressLine1,
(SELECT COUNT(addressLine1) FROM customers
WHERE addressLine1 = c.addressLine1)
FROM customers c;

/* payments */
SELECT checkNumber FROM payments
GROUP BY checkNumber
HAVING checkNumber = 'HQ55022';

SELECT MIN(amount) FROM payments;

SELECT AVG(amount) FROM payments;

SELECT customerNumber FROM payments;

SELECT amount, paymentDate FROM payments
WHERE amount IN
(SELECT amount FROM payments
WHERE amount > 6066.78);

/* orders */
SELECT MIN(comments) FROM orders;

SELECT AVG(orderDate) FROM orders;

SELECT COUNT(*) FROM orders o 
JOIN orderDetails c on o.orderNumber = c.orderNumber
WHERE o.orderNumber = 10103;

/* orderdetails */
SELECT MIN(productCode) FROM orderdetails;

SELECT AVG(orderNumber) FROM orderdetails;

SELECT productCode,
(SELECT COUNT(productCode) FROM orderdetails
WHERE productCode = p.productCode)
FROM products p;