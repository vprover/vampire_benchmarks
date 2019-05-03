(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (forall ((x8168 T) (x8169 T)) 
  (or (distinct x8168 (f1 x8169)) (distinct x8169 (f1 x8168)))))
(check-sat)
