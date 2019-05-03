(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (exists ((y979 T) (y978 T)) 
  (or (= y978 (f1 y978 PLACEHOLDER PLACEHOLDER)) (= y979 (f1 y979 y979 PLACEHOLDER)))))
(check-sat)
