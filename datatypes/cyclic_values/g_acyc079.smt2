(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (exists ((y8386 T) (y8385 T) (y8384 T) (y8383 T) (y8382 T) (y8381 T) (y8380 T) (y8379 T)) 
  (or 
    (and (= y8379 (f1 y8380 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y8380 (f1 y8381 PLACEHOLDER)) (= y8381 (f1 y8382 (f1 PLACEHOLDER PLACEHOLDER))) (= y8382 (f1 y8379 PLACEHOLDER))) 
    (and (= y8383 (f1 (f1 y8384 PLACEHOLDER) PLACEHOLDER)) (= y8384 (f1 y8385 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)))) (= y8385 (f1 y8386 PLACEHOLDER)) (= y8386 (f1 y8383 PLACEHOLDER))))))
(check-sat)
