(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T) (proj3f4 T)))))
(assert (exists ((y6767 T) (y6770 T) (y6771 T) (y6769 T) (y6768 T)) 
    (and (= y6767 (f1 y6768)) (= y6768 (f3 y6769 (f1 PLACEHOLDER) (f3 (f4 (f1 PLACEHOLDER) (f1 PLACEHOLDER) (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f3 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER))) (= y6769 (f4 y6770 (f4 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER PLACEHOLDER)) (= y6770 (f4 y6771 PLACEHOLDER PLACEHOLDER (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6771 (f3 y6767 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
