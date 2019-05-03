(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T)))))
(assert (forall ((x2825 T) (x2824 T) (x2827 T) (x2826 T)) 
  (or (distinct x2824 (f2 x2825 (f1 (f2 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f2 (f1 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER))))) (distinct x2825 (f2 x2826 (f2 PLACEHOLDER PLACEHOLDER))) (distinct x2826 (f1 x2827 (f2 PLACEHOLDER PLACEHOLDER))) (distinct x2827 (f2 x2824 PLACEHOLDER)))))
(check-sat)
