(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T)))))
(assert (exists ((y20700 T) (y20715 T) (y20716 T) (y20707 T) (y20692 T) (y20717 T) (y20691 T) (y20696 T) (y20697 T) (y20694 T) (y20695 T) (y20708 T) (y20709 T) (y20698 T) (y20714 T) (y20713 T) (y20712 T) (y20710 T)) (forall ((x20725 T) (x20721 T) (x20720 T) (x20723 T) (x20722 T) (x20718 T) (x20719 T) (x20727 T) (x20724 T)) 
  (or 
    (and (= y20691 (f2 (f2 x20723 (f2 (f1 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER) PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f1 (f2 y20691 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= x20723 (f2 y20694 (f2 (f1 PLACEHOLDER) (f1 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y20694 (f1 y20695)) (= y20695 (f1 y20691)) (= y20692 (f2 (f2 (f2 (f1 y20696) (f2 (f1 PLACEHOLDER) (f1 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f2 (f1 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER) PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f1 (f2 y20692 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y20696 (f1 y20692)) (distinct y20691 y20692)) 
    (and (= y20697 (f1 (f1 x20719))) (= x20719 (f1 y20697)) (= y20698 (f1 y20700)) (= y20700 (f1 x20718)) (= x20718 (f1 y20698)) (distinct y20697 y20698)) 
    (and (= x20720 (f1 x20720)) (= x20722 (f1 x20722)) (distinct x20720 x20722)) 
    (and (= x20725 (f2 x20725 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= x20727 (f2 x20727 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct x20725 x20727)) 
    (and (= x20721 (f1 y20708)) (= y20708 (f2 y20709 (f1 PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y20709 (f2 x20721 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y20707 (f1 y20710)) (= y20710 (f2 x20724 (f1 PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= x20724 (f2 y20707 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct x20721 y20707)) 
    (and (= y20712 (f1 y20714)) (= y20714 (f1 y20715)) (= y20715 (f2 y20716 PLACEHOLDER (f1 PLACEHOLDER) (f1 PLACEHOLDER))) (= y20716 (f1 y20712)) (= y20713 (f1 (f1 (f2 y20717 PLACEHOLDER (f1 PLACEHOLDER) (f1 PLACEHOLDER))))) (= y20717 (f1 y20713)) (distinct y20712 y20713))))))
(check-sat)