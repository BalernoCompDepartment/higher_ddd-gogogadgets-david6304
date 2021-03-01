# Higher DDD GoGoGadget

The database for this task has 4 tables: Customer, Item, CustOrde, OrderItem. They are shown with attributes here:

Customer (customerID, forename, surname, address1, address2, address3, postcode, customerEmail)\
Item (itemID, description, category, price)\
CustOrder (orderNo, customerID*, orderDate, orderDispatched)\
OrderItem (orderNo*, itemID*, quantity)

Use Main.sql to write your SQL querries in

remember ; at the end of the query

all querys in the file at once

dont change lines 1-5 (Because this task uses UPDATE, INSERT, DELETE queries it will reload each time just make all your queries one after the other as usual)



## Your Task

Write queries for each of these tasks

**Searching and Sorting**

1.	A list of all of the items that belong to the category ‘Boys Toys’. The list should include all item details.
2.	A list of all items in each order. The list should show the order number, item description and price and should be in ascending order of order number.
3.	A list of all the full names of all customers with a surname containing the letters 'em' along with the dates of their orders. The list should be in alphabetical order of surname; when two or more surnames are the same, they should be listed in alphabetical order of first name.

**Computed Fields**

4.	A list showing the order number, order date, item descriptions, quantities ordered and prices. A calculated field should be used to work out the total cost of each item (quantity x price in each order). The details should be listed in order of date, from oldest to most recent.
5.	The company has decided to apply a 5% discount to any items whenever the minimum order quantity is 4. Create a list showing the relevant order numbers, the description of qualifying item, the quantity of the item ordered, the original price, the value of the discount and the discounted price.

**Grouping Data and Aggregate Functions**

6.	A list showing details of all orders placed by Mari Singer. The list should show the order number, order date, description, quantity ordered, price and the total price of each item in the order. The list should be displayed with details of the most recent order first.
7.	A list showing each category with the number of items in each category. Details of the largest category should be listed first.
8.	A list showing each order number, order date and the total cost of the order for all orders placed in January 2008. The details of the oldest order should be listed first.

**Additional Queries**

9.	A list showing the full name of all customers who have an email address provided by MobileLife.
10.	A list showing the category, the number of orders placed and the total quantity of items in the 'Office Distractions' category that have been ordered.
11.	A list showing the name of each category and the average price of items that belong to that category.
12.	A list showing each order number with the customer’s full name and the number of items ordered. The only orders shown should be those placed by customers whose surname contains the letters 'i' and 'g' separated by one other letter (the letter 'g' is not the last letter).
13.	A list showing the customerID and postcode and the number of orders placed by the customer in 2008. Arrange the list so that the customer who placed the most orders is listed first; customers who placed the same number of orders should be listed alphabetically by postcode.


14.	The company is offering a 5% discount on all orders placed in December 2007.

Produce a list to show each order number and order date, the order totals before discount, the value of each order’s 5% discount and the overall totals after discount. Orders should be listed with the oldest order first. Where two or more orders are placed on the same day, they should be sorted by OrderNo in ascending order.

