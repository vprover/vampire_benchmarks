(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T) (proj3f4 T)))))
(assert (exists ((y1550 T) (y1572 T) (y1560 T) (y1561 T) (y1562 T) (y1563 T) (y1564 T) (y1565 T) (y1571 T) (y1567 T) (y1546 T) (y1570 T) (y1554 T) (y1559 T) (y1558 T) (y1548 T) (y1549 T) (y1544 T) (y1569 T) (y1543 T) (y1553 T) (y1545 T) (y1555 T) (y1547 T) (y1557 T) (y1556 T)) (forall ((x1573 T) (x1582 T) (x1581 T) (x1580 T) (x1576 T) (x1577 T) (x1575 T) (x1578 T) (x1579 T)) 
  (or 
    (and (= x1576 (f1 (f1 (f1 x1576 x1578) (f1 x1578 x1578)) (f2 x1578 (f3 x1578) (f1 x1578 x1578)))) (= y1543 (f1 y1544 (f2 x1578 (f3 x1578) (f1 x1578 x1578)))) (= y1544 (f1 y1545 (f1 x1578 x1578))) (= y1545 (f1 y1543 x1578)) (distinct x1576 y1543)) 
    (and (= y1546 (f4 (f3 y1546) (f3 x1578) y1548 x1578)) (= y1548 (f2 y1546 x1578 x1578)) (= y1547 (f4 (f3 y1547) (f3 x1578) y1549 x1578)) (= y1549 (f2 y1547 x1578 x1578)) (distinct y1546 y1547)) 
    (and (= y1550 (f1 y1550 x1578)) (= x1582 (f1 x1582 x1578)) (distinct y1550 x1582)) 
    (and (= x1581 (f3 x1581)) (= y1553 (f3 y1553)) (distinct x1581 y1553)) 
    (and (= y1554 (f4 y1556 (f1 (f3 x1578) (f2 x1578 x1578 x1578)) (f2 x1578 x1578 x1578) x1578)) (= y1556 (f1 y1557 x1578)) (= y1557 (f2 y1554 x1578 x1578)) (= y1555 (f4 (f1 y1558 x1578) (f1 (f3 x1578) (f2 x1578 x1578 x1578)) (f2 x1578 x1578 x1578) x1578)) (= y1558 x1577) (distinct y1554 y1555)) 
    (and (= y1559 (f1 y1559 x1578)) (= y1560 (f1 y1560 x1578)) (distinct y1559 y1560)) 
    (and (= y1561 (f3 y1563)) (= y1563 (f3 y1561)) (= y1562 (f3 y1564)) (= y1564 (f3 y1562)) (distinct y1561 y1562)) 
    (and (= y1565 (f1 y1567 (f4 x1578 x1578 x1578 x1578))) (= y1567 x1573) (= x1575 (f3 y1569)) (= y1569 (f4 y1565 x1578 x1578 x1578)) (= x1579 (f1 y1570 (f4 x1578 x1578 x1578 x1578))) (= y1570 (f2 (f3 (f1 x1579 x1578)) y1571 (f2 x1578 x1578 x1578))) (= y1571 x1580) (= y1572 (f4 x1579 x1578 x1578 x1578)) (distinct y1565 x1579))))))
(check-sat)
