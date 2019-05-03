(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (forall ((x4933 T) (x4932 T) (x4935 T) (x4934 T)) 
  (or (distinct x4932 (f1 x4933)) (distinct x4933 (f1 x4934)) (distinct x4934 (f1 x4935)) (distinct x4935 (f1 x4932)))))
(check-sat)
