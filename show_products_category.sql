BEGIN TRANSACTION;

PRAGMA forign_keys=on;

CREATE TABLE PRODUCTS(Id integer PRIMARY KEY, Product text);

INSERT INTO PRODUCTS VALUES(1,'Chair');
INSERT INTO PRODUCTS VALUES(2,'Table');
INSERT INTO PRODUCTS VALUES(3,'Smarphone');
INSERT INTO PRODUCTS VALUES(4,'Refrigerator');
INSERT INTO PRODUCTS VALUES(5,'Carptes');


CREATE TABLE CATERGORIES(Id integer PRIMARY KEY, Category text);

INSERT INTO CATERGORIES VALUES(1,'Furniture');
INSERT INTO CATERGORIES VALUES(2,'Electronics');
INSERT INTO CATERGORIES VALUES(3,'Cellural phones');


CREATE TABLE PROD_CAT (prod_id integer NOT NULL,
cat_id integer NOT NULL,
FOREIGN KEY (prod_id) REFERENCES PRODUCTS(Id)
FOREIGN KEY (cat_id) REFERENCES CATERGORIES(Id));

INSERT INTO PROD_CAT (prod_id, cat_id) VALUES(1,1);
INSERT INTO PROD_CAT (prod_id, cat_id) VALUES(2,1);
INSERT INTO PROD_CAT (prod_id, cat_id) VALUES(3,2);
INSERT INTO PROD_CAT (prod_id, cat_id) VALUES(3,3);
INSERT INTO PROD_CAT (prod_id, cat_id) VALUES(4,2);
/*INSERT INTO PROD_CAT (prod_id, cat_id) VALUES(5,0);*/


SELECT Product || " " || Category
FROM PRODUCTS
JOIN PROD_CAT ON PRODUCTS.Id = PROD_CAT.prod_id
JOIN CATERGORIES ON CATERGORIES.Id = PROD_CAT.cat_id;

SELECT Product
FROM PRODUCTS
WHERE Id NOT IN (SELECT prod_id FROM PROD_CAT);
