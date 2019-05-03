(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T)))))
(assert (forall ((x10187 T) (x10188 T) (x10189 T)) 
  (or (distinct x10187 (f1 x10188 PLACEHOLDER PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (distinct x10188 (f2 x10189 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (distinct x10189 (f1 x10187 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))))
(check-sat)
