(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T)))))
(assert (exists ((y9538 T) (y9537 T)) 
    (and (= y9537 (f1 y9538 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER)) (= y9538 (f1 y9537 y9537 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
