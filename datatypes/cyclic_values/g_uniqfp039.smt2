(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T)))))
(assert (exists ((y4192 T) (y4193 T) (y4190 T) (y4191 T) (y4185 T) (y4187 T) (y4194 T) (y4186 T) (y4189 T) (y4188 T) (y4195 T)) 
  (or 
    (and (= y4185 (f2 y4187 PLACEHOLDER (f1 PLACEHOLDER))) (= y4187 (f1 y4185)) (= y4186 (f2 (f1 y4186) PLACEHOLDER (f1 PLACEHOLDER))) (distinct y4185 y4186)) 
    (and (= y4188 (f1 y4188)) (= y4189 (f1 y4189)) (distinct y4188 y4189)) 
    (and (= y4190 (f2 y4190 PLACEHOLDER PLACEHOLDER)) (= y4191 (f2 y4191 PLACEHOLDER PLACEHOLDER)) (distinct y4190 y4191)) 
    (and (= y4192 (f1 y4194)) (= y4194 (f1 y4192)) (= y4193 (f1 y4195)) (= y4195 (f1 y4193)) (distinct y4192 y4193)))))
(check-sat)
