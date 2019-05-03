(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T)))))
(assert (forall ((x7857 T) (x7856 T) (x7855 T)) 
  (or (distinct x7855 (f2 x7856 (f1 (f1 PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (distinct x7856 (f1 x7857)) (distinct x7857 (f1 x7855)))))
(check-sat)
