(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (exists ((y1685 T) (y1684 T) (y1687 T) (y1686 T) (y1681 T) (y1680 T) (y1683 T) (y1682 T) (y1696 T) (y1689 T) (y1688 T) (y1695 T) (y1692 T) (y1694 T) (y1693 T) (y1678 T) (y1679 T) (y1690 T) (y1691 T) (y1675 T) (y1676 T) (y1677 T)) 
  (or 
    (and (= y1675 (f1 (f1 (f1 (f1 (f1 y1675 PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f1 y1675 PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f1 y1677 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y1677 (f1 y1678 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y1678 (f1 y1675 PLACEHOLDER PLACEHOLDER)) (= y1676 (f1 y1679 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y1679 (f1 (f1 (f1 (f1 y1676 PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f1 y1676 PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) y1680 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y1680 (f1 y1681 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y1681 (f1 y1682 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y1682 (f1 y1676 PLACEHOLDER PLACEHOLDER)) (distinct y1675 y1676)) 
    (and (= y1683 (f1 y1685 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y1685 (f1 y1683 PLACEHOLDER PLACEHOLDER)) (= y1684 (f1 y1686 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y1686 (f1 y1684 PLACEHOLDER PLACEHOLDER)) (distinct y1683 y1684)) 
    (and (= y1687 (f1 y1689 (f1 (f1 y1687 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y1689 (f1 y1690 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y1690 (f1 y1691 PLACEHOLDER PLACEHOLDER)) (= y1691 (f1 y1692 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y1692 (f1 y1687 PLACEHOLDER PLACEHOLDER)) (= y1688 (f1 (f1 (f1 (f1 (f1 y1688 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (f1 (f1 y1688 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (distinct y1687 y1688)) 
    (and (= y1693 (f1 y1695 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y1695 (f1 y1693 y1693 PLACEHOLDER)) (= y1694 (f1 y1696 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y1696 (f1 y1694 y1694 PLACEHOLDER)) (distinct y1693 y1694)))))
(check-sat)
