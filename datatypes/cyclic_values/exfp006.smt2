(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (forall ((x589 T) (x588 T) (x590 T)) 
  (or (distinct x588 (f1 (f1 (f1 x589)))) (distinct x589 (f1 x590)) (distinct x590 (f1 x588)))))
(check-sat)
