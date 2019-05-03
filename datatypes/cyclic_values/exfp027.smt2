(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T)))))
(assert (forall ((x2944 T) (x2943 T)) 
  (or (distinct x2943 (f2 x2944 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (distinct x2944 (f3 x2943 PLACEHOLDER x2943 PLACEHOLDER)))))
(check-sat)
