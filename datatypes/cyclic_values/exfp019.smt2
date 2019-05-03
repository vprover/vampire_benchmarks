(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T)))))
(assert (forall ((x2027 T) (x2026 T) (x2029 T) (x2028 T)) 
  (or (distinct x2026 (f2 x2027)) (distinct x2027 (f2 x2028)) (distinct x2028 (f2 x2029)) (distinct x2029 (f1 x2026)))))
(check-sat)
