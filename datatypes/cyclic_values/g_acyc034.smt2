(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (exists ((y3539 T) (y3538 T) (y3540 T) (y3541 T) (y3537 T)) 
    (and (= y3537 (f1 y3538 (f1 (f1 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER)))) (= y3538 (f1 y3539 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER))))) (= y3539 (f1 y3540 (f1 PLACEHOLDER PLACEHOLDER))) (= y3540 (f1 y3541 (f1 PLACEHOLDER PLACEHOLDER))) (= y3541 (f1 y3537 PLACEHOLDER)))))
(check-sat)
