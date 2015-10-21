SELECT c1.id AS c1_id,
       w1.id AS w1_id, w2.id AS w2_id, w3.id AS w3_id,
       d1.id AS d1_id, d2.id AS d2_id,
       g1.id AS g1_id,
       util.id AS util_id
FROM `selection test` AS c1,
     `selection test` AS w1, `selection test` AS w2, `selection test` AS w3,
     `selection test` AS d1, `selection test` AS d2,
     `selection test` AS g1,
     `selection test` AS util
WHERE c1.position = 'c'
AND w1.position = 'w' AND w2.position = 'w' AND w3.position = 'w'
AND w1.id < w2.id
AND w2.id < w3.id
AND d1.position = 'd' AND d2.position = 'd'
AND d1.id < d2.id
AND g1.position = 'g'
AND util.id != c1.id
AND util.id != w1.id
AND util.id != w2.id
AND util.id != w3.id
AND util.id != d1.id
AND util.id != d2.id
AND util.id != g1.id;
