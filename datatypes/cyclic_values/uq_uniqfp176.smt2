(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T)))))
(assert (exists ((y18727 T) (y18754 T) (y18747 T) (y18755 T) (y18732 T) (y18746 T) (y18745 T) (y18744 T) (y18743 T) (y18742 T) (y18741 T) (y18735 T) (y18728 T) (y18716 T) (y18739 T) (y18749 T) (y18748 T) (y18721 T) (y18717 T) (y18750 T) (y18751 T) (y18752 T) (y18753 T) (y18723 T) (y18730 T) (y18756 T) (y18757 T) (y18722 T) (y18737 T) (y18731 T) (y18736 T) (y18718 T) (y18724 T)) (forall ((x18762 T) (x18763 T) (x18760 T) (x18761 T) (x18766 T) (x18767 T) (x18764 T) (x18765 T) (x18759 T) (x18758 T)) 
  (or 
    (and (= y18716 (f1 y18718 (f2 (f1 x18760 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) x18760 (f1 x18760 x18760 x18760 x18760)) (f1 (f1 x18760 x18760 x18760 x18760) x18760 x18760 (f1 x18760 x18760 x18760 x18760)) (f1 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) x18760 (f2 x18760 x18760 x18760 x18760)))) (= y18718 (f1 (f1 y18716 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) x18762 (f1 x18760 x18760 x18760 x18760))) (= x18762 (f1 y18716 x18760 x18760 x18760)) (= y18717 (f1 x18765 (f2 (f1 x18760 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) x18760 (f1 x18760 x18760 x18760 x18760)) (f1 (f1 x18760 x18760 x18760 x18760) x18760 x18760 (f1 x18760 x18760 x18760 x18760)) (f1 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) x18760 (f2 x18760 x18760 x18760 x18760)))) (= x18765 (f1 (f1 y18717 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) y18721 (f1 x18760 x18760 x18760 x18760))) (= y18721 (f1 y18717 x18760 x18760 x18760)) (distinct y18716 y18717)) 
    (and (= y18722 (f1 y18724 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760))) (= y18724 (f1 y18722 x18760 x18760 x18760)) (= y18723 (f1 x18759 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760))) (= x18759 (f1 y18723 x18760 x18760 x18760)) (distinct y18722 y18723)) 
    (and (= x18766 (f2 y18728 (f1 x18760 x18760 x18760 x18760) x18760 x18760)) (= y18728 (f1 x18763 (f1 x18760 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) x18760) (f1 x18760 x18760 x18760 x18760) (f2 (f1 x18760 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) x18760 (f1 x18760 x18760 x18760 x18760)))) (= x18763 (f1 y18730 (f1 x18760 x18760 x18760 x18760) x18760 x18760)) (= y18730 (f2 x18766 x18760 x18760 x18760)) (= y18727 (f2 y18731 (f1 x18760 x18760 x18760 x18760) x18760 x18760)) (= y18731 (f1 y18732 (f1 x18760 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) x18760) (f1 x18760 x18760 x18760 x18760) (f2 (f1 x18760 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) x18760 (f1 x18760 x18760 x18760 x18760)))) (= y18732 (f1 x18767 (f1 x18760 x18760 x18760 x18760) x18760 x18760)) (= x18767 (f2 y18727 x18760 x18760 x18760)) (distinct x18766 y18727)) 
    (and (= x18764 (f1 (f2 x18764 x18760 x18760 x18760) y18736 x18760 (f1 x18760 x18760 x18760 x18760))) (= y18736 (f2 x18764 x18760 x18760 x18760)) (= y18735 (f1 (f2 y18735 x18760 x18760 x18760) (f2 y18735 x18760 x18760 x18760) x18760 (f1 x18760 x18760 x18760 x18760))) (distinct x18764 y18735)) 
    (and (= y18737 (f2 y18739 (f1 y18737 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) (f2 x18760 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760)))) (= y18739 (f1 x18761 x18760 (f2 x18760 x18760 x18760 x18760) x18760)) (= x18761 (f1 y18737 x18760 x18760 x18760)) (= x18758 (f2 y18741 (f1 x18758 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) (f2 x18760 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760)))) (= y18741 (f1 y18742 x18760 (f2 x18760 x18760 x18760 x18760) x18760)) (= y18742 (f1 x18758 x18760 x18760 x18760)) (distinct y18737 x18758)) 
    (and (= y18743 (f2 y18743 x18760 y18745 x18760)) (= y18745 (f2 y18743 x18760 x18760 x18760)) (= y18744 (f2 y18744 x18760 y18746 x18760)) (= y18746 (f2 y18744 x18760 x18760 x18760)) (distinct y18743 y18744)) 
    (and (= y18747 (f2 (f2 (f1 (f1 y18747 x18760 x18760 x18760) x18760 (f1 x18760 x18760 x18760 x18760) x18760) x18760 (f2 x18760 x18760 (f1 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760)) x18760) (f1 (f2 x18760 x18760 x18760 x18760) x18760 x18760 x18760) (f1 (f2 (f2 y18749 (f1 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) x18760) (f2 x18760 (f2 x18760 x18760 x18760 x18760) x18760 (f1 x18760 x18760 x18760 x18760)) (f2 (f1 x18760 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) x18760) (f1 x18760 x18760 x18760 x18760)) (f1 y18747 x18760 x18760 x18760) (f2 x18760 x18760 (f1 x18760 x18760 x18760 x18760) (f2 (f1 x18760 x18760 x18760 x18760) x18760 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760))) (f2 x18760 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760))) (f1 (f1 x18760 x18760 x18760 x18760) x18760 (f1 x18760 x18760 x18760 x18760) x18760))) (= y18749 (f1 y18747 x18760 x18760 x18760)) (= y18748 (f2 (f2 (f1 (f1 y18748 x18760 x18760 x18760) x18760 (f1 x18760 x18760 x18760 x18760) x18760) x18760 (f2 x18760 x18760 (f1 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760)) x18760) (f1 (f2 x18760 x18760 x18760 x18760) x18760 x18760 x18760) y18750 (f1 (f1 x18760 x18760 x18760 x18760) x18760 (f1 x18760 x18760 x18760 x18760) x18760))) (= y18750 (f1 y18751 (f1 y18748 x18760 x18760 x18760) (f2 x18760 x18760 (f1 x18760 x18760 x18760 x18760) (f2 (f1 x18760 x18760 x18760 x18760) x18760 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760))) (f2 x18760 (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760)))) (= y18751 (f2 y18752 (f2 x18760 (f2 x18760 x18760 x18760 x18760) x18760 (f1 x18760 x18760 x18760 x18760)) (f2 (f1 x18760 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) x18760) (f1 x18760 x18760 x18760 x18760))) (= y18752 (f2 y18753 (f1 x18760 x18760 x18760 x18760) (f2 x18760 x18760 x18760 x18760) x18760)) (= y18753 (f1 y18748 x18760 x18760 x18760)) (distinct y18747 y18748)) 
    (and (= y18754 (f2 y18756 (f2 x18760 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) x18760)) (= y18756 (f2 y18754 x18760 x18760 x18760)) (= y18755 (f2 y18757 (f2 x18760 x18760 x18760 x18760) (f1 x18760 x18760 x18760 x18760) x18760)) (= y18757 (f2 y18755 x18760 x18760 x18760)) (distinct y18754 y18755))))))
(check-sat)
