DROP table IF EXISTS table_w;

CREATE TABLE table_w
AS SELECT id,name,position
FROM `selection test`
WHERE position = 'w';

SELECT w1.id AS w1_id,
       w1.name AS w1_name,
       w1.position AS w1_position,
       w2.id AS w2_id,
       w2.name AS w2_name,
       w2.position AS w2_position,
       w3.id AS w3_id,
       w3.name AS w3_name,
       w3.position AS w3_position
FROM table_w AS w1, table_w AS w2, table_w AS w3
WHERE w1.id < w2.id
AND w2.id < w3.id



