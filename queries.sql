/* Q1 */
SELECT COUNT(supplier)
FROM part_nyc
WHERE on_hand > 70;

/* Q2 */ /*
select sum(p.on_hand + q.on_hand)
from part_nyc p, part_sfo q
where p.color = 0 and q.color = 0
;
*/

/* Q3 */
select p.supplier 
from 
(select distinct supplier, sum(on_hand) a
from part_sfo
group by supplier) p,
(select distinct supplier, sum(on_hand) b
from part_nyc
group by supplier) q
where p.supplier = q.supplier and p.a > q.b
;

/* Q4 *//*
select p.supplier
from part_nyc p
where p.part_number not in (
select part_number
from part_sfo);*/

/* Q5 *//*
update part_nyc
set on_hand = on_hand - 10;

update part_sfo
set on_hand = on_hand - 10;
*/

/* Q6 *//*
delete from part_nyc where on_hand < 30;
delete from part_sfo where on_hand < 30;
*/
