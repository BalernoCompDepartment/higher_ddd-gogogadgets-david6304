/* do not change the following three lines! */
.header on
.mode column
.read GoGoGadget.sql
/* do not change the above three lines! */

/* Searching and Sorting*/

/* Task One:	A list of all of the items that belong to the category ‘Boys Toys’. The list should include all item details.*/

SELECT *
FROM Item
WHERE category = 'Boys Toys';

/* Task Two:	A list of all items in each order. The list should show the order number, item description and price and should be in ascending order of order number.*/

SELECT orderNo, description, price
FROM Item, OrderItem
WHERE Item.itemID = OrderItem.itemID
ORDER BY orderNo ASC;

/* Task Three:	A list of all the full names of all customers with a surname containing the letters 'em' along with the dates of their orders. The list should be in alphabetical order of surname; when two or more surnames are the same, they should be listed in alphabetical order of first name.*/

SELECT forename, surname, orderDate
FROM Customer, CustOrder
WHERE surname LIKE '%e%m%'
AND Customer.customerID = CustOrder.customerID
GROUP BY forename
ORDER BY surname ASC, forename ASC;

/*Computed Fields*/

/* Task Four:	A list showing the order number, order date, item descriptions, quantities ordered and prices. A calculated field should be used to work out the total cost of each item (quantity x price in each order). The details should be listed in order of date, from oldest to most recent.*/

SELECT CustOrder.orderNo, orderDate, description, quantity, price, quantity*price AS [Total Cost]
FROM OrderItem, Item, CustOrder
WHERE Item.itemID = OrderItem.itemID
AND OrderItem.orderNo = CustOrder.orderNo
ORDER BY orderDate ASC;

/* Task Five:	The company has decided to apply a 5% discount to any items whenever the minimum order quantity is 4. Create a list showing the relevant order numbers, the description of qualifying item, the quantity of the item ordered, the original price, the value of the discount and the discounted price.*/

SELECT orderNo, description, quantity, price AS [Original Price], price*0.95 AS [Discounted Price]
FROM OrderItem, Item
WHERE quantity >= 4
AND OrderItem.itemID = Item.itemID;

/*Grouping Data and Aggregate Functions*/

/* Task Six: A list showing details of all orders placed by Mari Singer. The list should show the order number, order date, description, quantity ordered, price and the total price of each item in the order. The list should be displayed with details of the most recent order first.*/

SELECT CustOrder.orderNo, orderDate, description, quantity, price, price*quantity AS [Total Price]
FROM CustOrder, OrderItem, Item, Customer 
WHERE forename = 'Mari'
AND surname = 'Singer'
AND CustOrder.customerID = Customer.customerID
AND OrderItem.orderNo = CustOrder.orderNo
AND OrderItem.itemID = Item.itemID
ORDER BY orderDate DESC;

/* Task Seven: A list showing each category with the number of items in each category. Details of the largest category should be listed first.*/

SELECT category, COUNT(*) AS [Number of Items]
FROM Item 
GROUP BY category 
ORDER BY category ASC;

/* Task Eight: A list showing each order number, order date and the total cost of the order for all orders placed in January 2008. The details of the oldest order should be listed first.*/

SELECT CustOrder.orderNo, orderDate, SUM(quantity*price) AS [Total Cost]
FROM CustOrder, OrderItem, Item
WHERE orderDate LIKE '2008%-01-%'
AND CustOrder.orderNo = OrderItem.orderNo
AND OrderItem.itemID = Item.itemID
GROUP BY CustOrder.orderNo
ORDER BY orderDate ASC;

/*Additional Queries*/

/* Task Nine: A list showing the full name of all customers who have an email address provided by MobileLife.*/

SELECT forename, surname 
FROM Customer 
WHERE customerEmail LIKE '%mobilelife%';

/* Task Ten: A list showing the category, the number of orders placed and the total quantity of items in the 'Office Distractions' category that have been ordered.*/

SELECT category, COUNT(*) AS [Number of Orders], SUM(quantity) AS [Total Quantity]
FROM Item, OrderItem 
WHERE category = 'Office Distractions'
AND Item.itemID = OrderItem.itemID 
GROUP BY category;

/* Task Eleven: A list showing the name of each category and the average price of items that belong to that category.*/

SELECT category, ROUND(AVG(price), 2) AS [Average Price]
FROM Item 
GROUP BY category; 

/* Task Tweleve: A list showing each order number with the customer’s full name and the number of items ordered. The only orders shown should be those placed by customers whose surname contains the letters 'i' and 'g' separated by one other letter (the letter 'g' is not the last letter).*/

SELECT OrderItem.orderNo, forename, surname, COUNT(*) AS [Number of Items Ordered]
FROM CustOrder, Customer, OrderItem 
WHERE surname LIKE '%i_g_%'
AND CustOrder.customerID = Customer.customerID
AND CustOrder.orderNo = OrderItem.orderNo
GROUP BY OrderItem.orderNo;


/* Task Thirteen: A list showing the customerID and postcode and the number of orders placed by the customer in 2008. Arrange the list so that the customer who placed the most orders is listed first; customers who placed the same number of orders should be listed alphabetically by postcode.*/

SELECT Customer.customerID, postcode, COUNT(*) AS [Number of Orders Placed]
FROM Customer, CustOrder
WHERE orderDate LIKE '2008%'
AND Customer.customerID = CustOrder.customerID
GROUP BY Customer.CustomerID
ORDER BY COUNT(*) DESC, postcode ASC;

/* Task Fourteen:	The company is offering a 5% discount on all orders placed in December 2007.*/
/* Produce a list to show each order number and order date, the order totals before discount, the value of each order’s 5% discount and the overall totals after discount. Orders should be listed with the oldest order first. Where two or more orders are placed on the same day, they should be sorted by OrderNo in ascending order.*/

SELECT CustOrder.orderNo, orderDate, SUM(quantity*price) AS [Total Before Discount], SUM(quantity*price)*0.05 AS [Discount Value], SUM(quantity*price)*0.95 AS [Total After Discount]
FROM CustOrder, OrderItem, Item 
WHERE orderDate LIKE '2007-12%'
AND CustOrder.orderNo = OrderItem.orderNo 
AND Item.itemID = OrderItem.itemID 
GROUP BY CustOrder.orderNo 
ORDER BY orderDate ASC, CustOrder.orderNo ASC;
