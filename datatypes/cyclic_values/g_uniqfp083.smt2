(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (exists ((y8943 T) (y8942 T) (y8945 T) (y8944 T) (y8946 T)) 
    (and (= y8942 (f1 (f2 (f2 (f2 y8942 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER))) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER))) (= y8943 (f1 y8944 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER))) (= y8944 (f2 y8945 (f2 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER)))) (= y8945 (f2 y8946 (f2 PLACEHOLDER PLACEHOLDER))) (= y8946 (f2 y8943 PLACEHOLDER)) (distinct y8942 y8943))))
(check-sat)
