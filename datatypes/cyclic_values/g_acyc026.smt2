(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T)))))
(assert (exists ((y2675 T) (y2674 T) (y2671 T) (y2673 T) (y2672 T)) 
  (or (= y2671 (f1 y2671)) (= y2672 (f1 y2672)) (= y2673 (f2 y2673 PLACEHOLDER PLACEHOLDER)) 
    (and (= y2674 (f1 (f1 (f2 y2675 y2674 (f1 PLACEHOLDER))))) (= y2675 (f1 y2674))))))
(check-sat)
