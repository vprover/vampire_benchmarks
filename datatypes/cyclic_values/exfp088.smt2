(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T))
  (f4 (proj0f4 T) (proj1f4 T)))))
(assert (forall ((x9398 T) (x9399 T) (x9396 T) (x9397 T) (x9400 T)) 
  (or (distinct x9396 (f1 x9397 PLACEHOLDER (f4 PLACEHOLDER (f2 PLACEHOLDER)))) (distinct x9397 (f3 x9398 (f4 PLACEHOLDER PLACEHOLDER) (f4 PLACEHOLDER PLACEHOLDER))) (distinct x9398 (f2 x9399)) (distinct x9399 (f2 x9400)) (distinct x9400 (f1 x9396 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
