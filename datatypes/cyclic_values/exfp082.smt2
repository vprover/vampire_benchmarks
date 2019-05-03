(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T)))))
(assert (forall ((x8823 T) (x8825 T) (x8824 T)) 
  (or (distinct x8823 (f1 x8824)) (distinct x8824 (f2 x8825 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER))) (distinct x8825 (f1 x8823)))))
(check-sat)
