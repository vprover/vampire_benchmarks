(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (forall ((x8386 T) (x8387 T) (x8384 T) (x8385 T) (x8388 T)) 
  (or (distinct x8384 (f1 x8385 (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (distinct x8385 (f1 x8386 (f1 PLACEHOLDER PLACEHOLDER))) (distinct x8386 (f1 x8387 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)))) (distinct x8387 (f1 x8388 PLACEHOLDER)) (distinct x8388 (f1 x8384 PLACEHOLDER)))))
(check-sat)
