(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (exists ((y9078 T) (y9079 T) (y9083 T) (y9082 T) (y9081 T) (y9080 T) (y9077 T)) 
  (or (= y9077 (f1 y9077 y9077 PLACEHOLDER)) (= y9078 (f1 y9078 PLACEHOLDER PLACEHOLDER)) 
    (and (= y9079 (f1 y9080 y9079 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y9080 (f1 y9081 PLACEHOLDER (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y9081 (f1 y9082 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y9082 (f1 y9079 y9079 PLACEHOLDER))) (= y9083 (f1 y9083 y9083 PLACEHOLDER)))))
(check-sat)
