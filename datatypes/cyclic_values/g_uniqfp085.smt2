(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (exists ((y9155 T) (y9157 T) (y9153 T) (y9154 T) (y9152 T) (y9150 T) (y9156 T) (y9139 T) (y9146 T) (y9147 T) (y9144 T) (y9145 T) (y9142 T) (y9143 T) (y9140 T) (y9141 T) (y9151 T) (y9158 T) (y9148 T) (y9149 T)) 
  (or 
    (and (= y9139 (f1 y9139 PLACEHOLDER)) (= y9140 (f1 y9140 PLACEHOLDER)) (distinct y9139 y9140)) 
    (and (= y9141 (f3 y9143 (f3 PLACEHOLDER PLACEHOLDER))) (= y9143 (f1 y9141 PLACEHOLDER)) (= y9142 (f3 y9144 (f3 PLACEHOLDER PLACEHOLDER))) (= y9144 (f1 y9142 PLACEHOLDER)) (distinct y9141 y9142)) 
    (and (= y9145 (f1 y9147 PLACEHOLDER)) (= y9147 (f2 y9145 PLACEHOLDER)) (= y9146 (f1 y9148 PLACEHOLDER)) (= y9148 (f2 y9146 PLACEHOLDER)) (distinct y9145 y9146)) 
    (and (= y9149 (f1 y9149 PLACEHOLDER)) (= y9150 (f1 y9150 PLACEHOLDER)) (distinct y9149 y9150)) 
    (and (= y9151 (f1 (f3 (f1 y9153 (f3 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER) PLACEHOLDER)) (= y9153 (f3 y9154 (f1 PLACEHOLDER PLACEHOLDER))) (= y9154 (f1 y9151 PLACEHOLDER)) (= y9152 (f1 y9155 PLACEHOLDER)) (= y9155 (f3 y9156 PLACEHOLDER)) (= y9156 (f1 y9157 (f3 PLACEHOLDER PLACEHOLDER))) (= y9157 (f3 y9158 (f1 PLACEHOLDER PLACEHOLDER))) (= y9158 (f1 y9152 PLACEHOLDER)) (distinct y9151 y9152)))))
(check-sat)
