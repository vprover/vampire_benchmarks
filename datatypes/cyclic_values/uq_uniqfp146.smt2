(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T)))))
(assert (exists ((y15751 T) (y15750 T) (y15719 T) (y15735 T) (y15734 T) (y15737 T) (y15736 T) (y15730 T) (y15733 T) (y15732 T) (y15717 T) (y15716 T) (y15715 T) (y15714 T) (y15739 T) (y15712 T) (y15711 T) (y15713 T) (y15738 T) (y15744 T) (y15745 T) (y15747 T) (y15740 T) (y15741 T) (y15742 T) (y15743 T) (y15748 T) (y15700 T) (y15701 T) (y15702 T) (y15703 T) (y15704 T) (y15705 T) (y15720 T) (y15707 T) (y15708 T) (y15709 T) (y15728 T) (y15729 T) (y15706 T) (y15726 T) (y15727 T) (y15724 T) (y15725 T) (y15698 T) (y15699 T)) (forall ((x15752 T) (x15753 T) (x15761 T) (x15760 T) (x15756 T) (x15757 T) (x15758 T) (x15759 T) (x15754 T) (x15755 T)) 
  (or 
    (and (= y15698 (f1 (f2 (f2 y15698 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 y15698) PLACEHOLDER PLACEHOLDER))) (= y15699 (f1 y15700)) (= y15700 (f2 (f2 y15699 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y15701 PLACEHOLDER PLACEHOLDER)) (= y15701 (f3 y15699)) (distinct y15698 y15699)) 
    (and (= y15702 (f3 y15704)) (= y15704 (f3 y15705)) (= y15705 (f3 y15706)) (= y15706 (f1 y15702)) (= y15703 (f3 (f3 y15707))) (= y15707 (f3 y15708)) (= y15708 (f1 y15703)) (distinct y15702 y15703)) 
    (and (= y15709 (f2 y15711 (f1 (f1 (f3 PLACEHOLDER))) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 (f1 PLACEHOLDER)))) (= y15711 (f2 y15712 PLACEHOLDER (f3 PLACEHOLDER) (f3 PLACEHOLDER))) (= y15712 (f2 y15713 PLACEHOLDER (f3 PLACEHOLDER) (f1 PLACEHOLDER))) (= y15713 (f1 y15709)) (= x15756 (f2 y15714 (f1 (f1 (f3 PLACEHOLDER))) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 (f1 PLACEHOLDER)))) (= y15714 (f2 y15715 PLACEHOLDER (f3 PLACEHOLDER) (f3 PLACEHOLDER))) (= y15715 x15760) (= y15716 (f1 x15756)) (distinct y15709 x15756)) 
    (and (= y15717 (f1 y15719)) (= y15719 (f2 y15720 (f1 (f3 PLACEHOLDER)) PLACEHOLDER PLACEHOLDER)) (= y15720 (f3 x15757)) (= x15757 (f3 y15717)) (= x15759 (f1 (f2 (f3 (f3 x15759)) (f1 (f3 PLACEHOLDER)) PLACEHOLDER PLACEHOLDER))) (distinct y15717 x15759)) 
    (and (= x15761 (f2 y15724 PLACEHOLDER (f1 (f1 PLACEHOLDER)) (f2 (f1 PLACEHOLDER) (f1 (f2 (f1 PLACEHOLDER) (f3 PLACEHOLDER) PLACEHOLDER PLACEHOLDER)) PLACEHOLDER (f3 PLACEHOLDER)))) (= y15724 (f1 y15725)) (= y15725 (f1 y15726)) (= y15726 (f1 y15727)) (= y15727 (f1 x15761)) (= x15752 (f2 y15728 PLACEHOLDER (f1 (f1 PLACEHOLDER)) (f2 (f1 PLACEHOLDER) (f1 (f2 (f1 PLACEHOLDER) (f3 PLACEHOLDER) PLACEHOLDER PLACEHOLDER)) PLACEHOLDER (f3 PLACEHOLDER)))) (= y15728 (f1 y15729)) (= y15729 (f1 y15730)) (= y15730 (f1 x15755)) (= x15755 (f1 x15752)) (distinct x15761 x15752)) 
    (and (= y15732 (f1 y15734)) (= y15734 (f3 y15735)) (= y15735 (f1 y15732)) (= y15733 (f1 y15736)) (= y15736 (f3 y15737)) (= y15737 (f1 y15733)) (distinct y15732 y15733)) 
    (and (= y15738 (f1 y15740)) (= y15740 (f1 y15741)) (= y15741 (f1 y15742)) (= y15742 (f2 y15743 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y15743 (f2 y15738 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y15739 (f1 y15744)) (= y15744 (f1 y15745)) (= y15745 (f1 x15758)) (= x15758 (f2 y15747 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y15747 (f2 y15739 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y15738 y15739)) 
    (and (= y15748 x15753) (= y15750 (f1 y15748)) (= x15754 (f3 y15751)) (= y15751 (f1 x15754)) (distinct y15748 x15754))))))
(check-sat)