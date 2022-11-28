-- CREATING DATABASE
CREATE DATABASE IF NOT EXISTS ECOMMERCE;
USE ECOMMERCE;
-- CREATING TABLES
CREATE TABLE SUPPLIER(
SUPP_ID INT PRIMARY KEY,
SUPP_NAME VARCHAR(50) NOT NULL,
SUPP_CITY VARCHAR(50) NOT NULL,
SUPP_PHONE VARCHAR(50) NOT NULL);
CREATE TABLE CUSTOMER(
CUS_ID INT PRIMARY KEY,
CUS_NAME VARCHAR(50) NOT NULL,
CUS_PHONE VARCHAR(30) NOT NULL,
CUS_CITY VARCHAR(50) NOT NULL,
CUS_GENDER CHAR);
CREATE TABLE CATEGORY(
CAT_ID INT PRIMARY KEY,
CAT_NAME VARCHAR(20) NOT NULL);
CREATE TABLE PRODUCT(
PRO_ID INT PRIMARY KEY,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'DUMMY',
PRO_DESC VARCHAR(60),
CAT_ID INT,
FOREIGN KEY(CAT_ID) REFERENCES CATEGORY(CAT_ID));
CREATE TABLE SUPPLIER_PRICING(
PRICING_ID INT PRIMARY KEY,
PRO_ID INT,
SUPP_ID INT,
SUPP_PRICE INT DEFAULT 0,
FOREIGN KEY(PRO_ID) REFERENCES PRODUCT(PRO_ID),
FOREIGN KEY(SUPP_ID) REFERENCES SUPPLIER(SUPP_ID));
CREATE TABLE `ORDER`(
ORD_ID INT PRIMARY KEY,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT,
PRICING_ID INT,
FOREIGN KEY(CUS_ID) REFERENCES CUSTOMER(CUS_ID),
FOREIGN KEY(PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID));
CREATE TABLE RATING(
RAT_ID INT PRIMARY KEY,
ORD_ID INT,
RAT_RATSTARS INT NOT NULL,
FOREIGN KEY(ORD_ID) REFERENCES `ORDER`(ORD_ID));

-- INSERTING VALUES
INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');
INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');
INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);
INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);
INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

-- SOLVING QUERIES
-- 3)Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
SELECT T2.CUS_GENDER, COUNT(CUS_ID)AS CUS_COUNT FROM
(SELECT T1.CUS_ID,T1.CUS_GENDER,T1.ORD_AMOUNT FROM
(SELECT CUSTOMER.CUS_NAME, CUSTOMER.CUS_GENDER, `ORDER`.* FROM CUSTOMER 
INNER JOIN `ORDER` ON CUSTOMER.CUS_ID=`ORDER`.CUS_ID WHERE ORD_AMOUNT >= 3000) AS T1
GROUP BY T1.CUS_ID) AS T2
GROUP BY T2.CUS_GENDER;

-- 4)Display all the orders along with product name ordered by a customer having Customer_Id=2
SELECT Q.ORD_ID,P.PRO_NAME AS Products, P.PRO_DESC AS DESCRIPTIONS FROM PRODUCT P INNER JOIN
(SELECT O.ORD_ID, O.PRICING_ID, S.PRO_ID FROM `ORDER` O JOIN SUPPLIER_PRICING S ON O.PRICING_ID=S.PRICING_ID 
WHERE CUS_ID=2) AS Q ON Q.PRO_ID=P.PRO_ID;

-- 5)Display the Supplier details who can supply more than one product.
select d.supp_id,d.supp_name,d.supp_city,d.supp_phone,q.supplies from supplier d,
(select supp_id ,count(supp_id) as supplies from supplier_pricing s join `order` o on s.pricing_id=o.pricing_id
group by supp_id having supplies>1)as Q where d.supp_id=Q.supp_id;

-- 6)Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select f.cat_id,f.cat_name,f.pro_name as Product,F.supp_price as least_Price from
 (select C.cat_id,C.cat_name,Q.pro_name ,Q.supp_price ,
 rank()over (partition by C.cat_id order by Q.supp_price)as rnk from category C ,     
(select s.pricing_Id,p.pro_id,p.pro_name,p.cat_id,s.supp_price from supplier_pricing s join product p 
on s.pro_id=p.pro_id order by s.pricing_id)as Q where Q.cat_id=C.cat_id )as F where rnk=1;

-- 7)Display the Id and Name of the Product ordered after “2021-10-05”.
select pro_id,pro_name from product where pro_id in
(select pro_id from supplier_pricing ,
(select pricing_id from `order` where ord_date>"2021-10-05" )as p where supplier_pricing.pricing_id=p.pricing_id);

-- 8)Display customer name and gender whose names start or end with character 'A'.
select cus_name,cus_gender from customer where cus_name like "%a" or cus_name like "a%";

-- 9)Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
 DELIMITER &&
 CREATE PROCEDURE Review()
 BEGIN
 select report.supp_id,report.supp_name, report.Average,
 case  
        when report.average=5 then "Excellent service "
        when report.average>=4 then "Good service"
        when report.average>2 then "Average service"
        else "Poor service"
 end as Type_Of_Service from
 (select final.supp_id, supplier.supp_name, final.average from
 (select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as average from
 (select supplier_pricing.supp_id, test.ord_id, test.rat_ratstars from supplier_pricing inner join
 (select `order`.pricing_id, rating.ord_id, rating.rat_ratstars from `order` inner join rating on rating.ord_id=`order`.ord_id) as test on test.pricing_id=supplier_pricing.pricing_id)
 as test2 group by supplier_pricing.supp_id)
 as final inner join supplier where final.supp_id=supplier.supp_id) as report; 
END &&
DELIMITER ;
CALL Review();
