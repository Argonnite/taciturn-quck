#
#### c
#DROP TABLE IF EXISTS results_c;
#CREATE TABLE results_c
#AS
#SELECT id AS c_id, name AS c_name, position AS c_position
#FROM `selection test`
#WHERE position = 'c';
#
#
#### w
#DROP table IF EXISTS table_w;
#CREATE TABLE table_w
#AS SELECT id,name,position
#FROM `selection test`
#WHERE position = 'w';
#
#DROP TABLE IF EXISTS results_w;
#CREATE TABLE results_w
#AS 
#SELECT w1.id AS w1_id, w1.name AS w1_name, w1.position AS w1_position,
#       w2.id AS w2_id, w2.name AS w2_name, w2.position AS w2_position,
#       w3.id AS w3_id, w3.name AS w3_name, w3.position AS w3_position
#FROM table_w AS w1, table_w AS w2, table_w AS w3
#WHERE w1.id < w2.id
#AND w2.id < w3.id;
#
#select c_id,w1_id,w2_id,w3_id
#from results_c, results_w;
#



###ccc###
DROP TABLE IF EXISTS results_c;
CREATE TABLE results_c
AS
SELECT id AS c_id
FROM `selection test`
WHERE position = 'c';


###www###
DROP table IF EXISTS table_w;
CREATE TABLE table_w
AS SELECT id,name,position
FROM `selection test`
WHERE position = 'w';

DROP TABLE IF EXISTS results_w;
CREATE TABLE results_w
AS 
SELECT w1.id AS w1_id, w2.id AS w2_id, w3.id AS w3_id
FROM table_w AS w1, table_w AS w2, table_w AS w3
WHERE w1.id < w2.id
AND w2.id < w3.id;

select c_id,w1_id,w2_id,w3_id
from results_c, results_w;





---------------------------------------------------

DROP TABLE IF EXISTS Source;
DROP TABLE IF EXISTS Numbers;
DROP TABLE IF EXISTS Results;

CREATE TABLE Source
 (
   SourceId  int      not null AUTO_INCREMENT,
   Element   char(1)  not null,
   PRIMARY KEY(SourceId)
 );

INSERT Source (Element) values ('A');
INSERT Source (Element) values ('B');
INSERT Source (Element) values ('C');
INSERT Source (Element) values ('D');


CREATE TABLE Numbers (Number int not null);
INSERT Numbers (Number) values (1);
INSERT Numbers (Number) values (2);
INSERT Numbers (Number) values (3);
INSERT Numbers (Number) values (4);
INSERT Numbers (Number) values (5);
INSERT Numbers (Number) values (6);
INSERT Numbers (Number) values (7);
INSERT Numbers (Number) values (8);
INSERT Numbers (Number) values (9);
INSERT Numbers (Number) values (10);


CREATE TABLE Results
 (
   Combo   varchar(10)  not null,
   Length  int          not null
 );

-----------------------------------------------------------



###How many elements there are to process

SELECT @MaxLoop := max(SourceId)
 from Source;


###Initialize first value
TRUNCATE TABLE Results;
INSERT Results (Combo, Length)
 select Element, 1
  from Source
  where SourceId = 1;

SET @Loop = 2;



###Iterate to add each element after the first
WHILE @Loop <= @MaxLoop
 BEGIN

    INSERT Results (Combo, Length)
     select distinct
        left(re.Combo, @Loop - nm.Number)
        + so.Element
        + right(re.Combo, nm.Number - 1)
       ,@Loop
      from Results re
       inner join Numbers nm
        on nm.Number <= @Loop
       inner join Source so
        on so.SourceId = @Loop
      where re.Length = @Loop - 1;


    SET @Loop = @Loop + 1;
 END


