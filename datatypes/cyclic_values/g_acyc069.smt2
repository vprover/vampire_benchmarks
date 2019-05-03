(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T)))))
(assert (exists ((y7311 T) (y7310 T) (y7313 T) (y7312 T) (y7315 T) (y7314 T) (y7317 T) (y7316 T)) 
  (or 
    (and (= y7310 (f1 (f2 (f2 y7311 (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))) (= y7311 (f2 y7312 PLACEHOLDER)) (= y7312 (f1 y7310 PLACEHOLDER))) 
    (and (= y7313 (f2 y7314 PLACEHOLDER)) (= y7314 (f1 y7315 (f1 PLACEHOLDER PLACEHOLDER))) (= y7315 (f2 y7316 PLACEHOLDER)) (= y7316 (f2 y7313 PLACEHOLDER))) (= y7317 (f1 (f1 (f1 (f1 y7317 PLACEHOLDER) PLACEHOLDER) (f2 (f2 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER))) (f1 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))))))
(check-sat)
