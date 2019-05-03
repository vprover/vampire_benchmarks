(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T)))))
(assert (exists ((y13687 T) (y13685 T) (y13684 T) (y13689 T) (y13688 T)) (forall ((x13701 T) (x13703 T) (x13702 T) (x13704 T) (x13698 T) (x13696 T)) 
  (or 
    (and (= y13684 (f3 y13684 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y13685 (f3 y13685 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y13684 y13685)) 
    (and (= x13701 (f1 y13688)) (= y13688 (f1 y13689)) (= y13689 (f2 x13696)) (= x13696 (f2 x13702)) (= x13702 (f3 x13701 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y13687 (f1 (f1 (f2 (f2 (f3 y13687 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))))) (distinct x13701 y13687)) 
    (and (= x13703 (f2 (f2 x13703))) (= x13704 (f2 x13698)) (= x13698 (f2 x13704)) (distinct x13703 x13704))))))
(check-sat)
