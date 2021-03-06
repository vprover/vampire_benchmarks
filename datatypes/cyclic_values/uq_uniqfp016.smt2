(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T)))))
(assert (exists ((y1697 T) (y1721 T) (y1743 T) (y1733 T) (y1731 T) (y1742 T) (y1737 T) (y1698 T) (y1699 T) (y1735 T) (y1734 T) (y1732 T) (y1727 T) (y1738 T) (y1741 T) (y1724 T) (y1705 T) (y1706 T) (y1707 T) (y1700 T) (y1701 T) (y1702 T) (y1703 T) (y1722 T) (y1725 T) (y1736 T) (y1709 T) (y1730 T) (y1719 T) (y1718 T) (y1739 T) (y1715 T) (y1729 T) (y1726 T) (y1712 T) (y1711 T) (y1710 T) (y1717 T) (y1716 T) (y1720 T) (y1714 T)) (forall ((x1745 T) (x1754 T) (x1746 T) (x1752 T) (x1753 T) (x1750 T) (x1747 T) (x1749 T) (x1748 T)) 
  (or 
    (and (= y1697 (f3 y1699 (f3 x1750 x1750))) (= y1699 (f4 y1700 (f2 (f4 x1750 x1750 x1750)) (f2 x1750))) (= y1700 (f4 y1701 x1750 (f2 x1750))) (= y1701 (f1 y1697)) (= y1698 (f3 y1702 (f3 x1750 x1750))) (= y1702 (f4 y1703 (f2 (f4 x1750 x1750 x1750)) (f2 x1750))) (= y1703 (f4 x1745 x1750 (f2 x1750))) (= x1745 (f1 y1698)) (distinct y1697 y1698)) 
    (and (= y1705 (f2 y1707)) (= y1707 (f1 x1752)) (= x1752 (f3 y1709 x1750)) (= y1709 (f4 y1705 x1750 x1750)) (= y1706 (f2 y1710)) (= y1710 (f1 y1711)) (= y1711 (f3 y1712 x1750)) (= y1712 (f4 y1706 x1750 x1750)) (distinct y1705 y1706)) 
    (and (= x1754 (f2 x1754)) (= y1714 (f2 y1714)) (distinct x1754 y1714)) 
    (and (= y1715 (f4 (f2 (f1 (f3 y1717 (f1 x1750)))) x1750 (f4 (f4 (f2 (f2 x1750)) (f2 (f3 x1750 x1750)) x1750) (f4 x1750 (f3 x1750 x1750) (f4 x1750 (f1 x1750) (f4 x1750 x1750 x1750))) x1750))) (= y1717 (f4 y1715 x1750 x1750)) (= y1716 (f4 y1718 x1750 (f4 (f4 (f2 (f2 x1750)) (f2 (f3 x1750 x1750)) x1750) (f4 x1750 (f3 x1750 x1750) (f4 x1750 (f1 x1750) (f4 x1750 x1750 x1750))) x1750))) (= y1718 (f2 y1719)) (= y1719 (f1 y1720)) (= y1720 (f3 y1721 (f1 x1750))) (= y1721 (f4 y1716 x1750 x1750)) (distinct y1715 y1716)) 
    (and (= y1722 x1748) (= y1724 (f4 y1725 (f1 x1750) (f4 (f4 x1750 x1750 (f3 x1750 x1750)) (f4 (f2 x1750) (f2 x1750) x1750) (f1 (f2 x1750))))) (= y1725 (f4 y1726 (f1 (f3 x1750 x1750)) (f1 x1750))) (= y1726 (f3 y1727 x1750)) (= y1727 (f3 y1722 x1750)) (= x1746 (f1 (f4 (f4 (f3 (f3 x1746 x1750) x1750) (f1 (f3 x1750 x1750)) (f1 x1750)) (f1 x1750) (f4 (f4 x1750 x1750 (f3 x1750 x1750)) (f4 (f2 x1750) (f2 x1750) x1750) (f1 (f2 x1750)))))) (distinct y1722 x1746)) 
    (and (= x1749 (f2 x1749)) (= y1729 (f2 y1729)) (distinct x1749 y1729)) 
    (and (= y1730 (f3 y1732 (f2 x1750))) (= y1732 (f1 y1730)) (= y1731 (f3 y1733 (f2 x1750))) (= y1733 (f1 y1731)) (distinct y1730 y1731)) 
    (and (= y1734 (f1 y1736)) (= y1736 (f1 y1737)) (= y1737 (f3 y1734 x1750)) (= y1735 (f1 y1738)) (= y1738 (f1 y1739)) (= y1739 (f3 y1735 x1750)) (distinct y1734 y1735)) 
    (and (= x1747 (f4 (f1 (f2 x1747)) (f2 x1750) (f4 x1750 x1750 x1750))) (= y1741 (f4 (f1 y1742) (f2 x1750) (f4 x1750 x1750 x1750))) (= y1742 (f2 y1741)) (distinct x1747 y1741)) 
    (and (= y1743 (f2 y1743)) (= x1753 (f2 x1753)) (distinct y1743 x1753))))))
(check-sat)
