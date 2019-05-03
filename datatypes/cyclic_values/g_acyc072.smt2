(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (exists ((y7623 T) (y7622 T) (y7624 T)) 
    (and (= y7622 (f1 y7623 (f1 PLACEHOLDER PLACEHOLDER))) (= y7623 (f1 y7624 (f1 PLACEHOLDER PLACEHOLDER))) (= y7624 (f1 y7622 PLACEHOLDER)))))
(check-sat)
