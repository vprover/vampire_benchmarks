(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (forall ((x7044 T) (x7045 T) (x7042 T) (x7043 T)) 
  (or (distinct x7042 (f2 x7043 (f3 (f2 (f2 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER)))) (distinct x7043 (f2 x7044 PLACEHOLDER)) (distinct x7044 (f1 x7045 PLACEHOLDER)) (distinct x7045 (f2 x7042 PLACEHOLDER)))))
(check-sat)
