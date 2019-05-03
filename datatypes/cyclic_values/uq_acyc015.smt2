(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (exists ((y1652 T) (y1653 T) (y1650 T) (y1651 T) (y1645 T) (y1644 T) (y1647 T) (y1646 T) (y1658 T) (y1655 T) (y1659 T) (y1656 T) (y1660 T)) (forall ((x1667 T) (x1664 T) (x1670 T) (x1661 T) (x1669 T) (x1668 T) (x1663 T)) 
  (or 
    (and (= y1644 (f1 y1645 (f1 (f3 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER)))) (= y1645 (f1 y1646 PLACEHOLDER)) (= y1646 (f3 y1647 (f3 PLACEHOLDER PLACEHOLDER))) (= y1647 (f3 y1644 PLACEHOLDER))) 
    (and (= x1667 x1663) (= x1661 (f2 x1667))) (= y1650 (f3 y1650 PLACEHOLDER)) 
    (and (= y1651 (f2 y1652)) (= y1652 (f3 y1651 PLACEHOLDER))) 
    (and (= y1653 (f1 x1664 (f3 PLACEHOLDER PLACEHOLDER))) (= x1664 (f3 y1655 PLACEHOLDER)) (= y1655 x1670) (= y1656 (f1 y1653 PLACEHOLDER))) (= x1668 x1669) 
    (and (= y1658 (f3 y1659 (f1 PLACEHOLDER PLACEHOLDER))) (= y1659 (f1 y1660 PLACEHOLDER)) (= y1660 (f1 y1658 PLACEHOLDER)))))))
(check-sat)
