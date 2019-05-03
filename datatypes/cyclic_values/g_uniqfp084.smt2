(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T)))))
(assert (exists ((y9047 T) (y9046 T) (y9045 T) (y9044 T) (y9043 T) (y9042 T) (y9041 T) (y9040 T) (y9052 T) (y9049 T) (y9048 T) (y9051 T) (y9050 T) (y9039 T)) 
  (or 
    (and (= y9039 (f3 y9041 PLACEHOLDER)) (= y9041 (f3 y9042 (f2 (f4 (f1 PLACEHOLDER) PLACEHOLDER PLACEHOLDER)))) (= y9042 (f4 y9043 (f1 PLACEHOLDER) PLACEHOLDER)) (= y9043 (f3 y9044 PLACEHOLDER)) (= y9044 (f2 y9039)) (= y9040 (f3 y9045 PLACEHOLDER)) (= y9045 (f3 y9046 (f2 (f4 (f1 PLACEHOLDER) PLACEHOLDER PLACEHOLDER)))) (= y9046 (f4 y9047 (f1 PLACEHOLDER) PLACEHOLDER)) (= y9047 (f3 y9048 PLACEHOLDER)) (= y9048 (f2 y9040)) (distinct y9039 y9040)) 
    (and (= y9049 (f2 y9051)) (= y9051 (f2 y9049)) (= y9050 (f2 y9052)) (= y9052 (f2 y9050)) (distinct y9049 y9050)))))
(check-sat)
