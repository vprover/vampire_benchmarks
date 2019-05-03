(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (exists ((y10471 T) (y10470 T) (y10466 T) (y10467 T) (y10464 T) (y10465 T) (y10468 T) (y10469 T)) 
  (or (= y10464 (f1 (f1 y10464 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))) 
    (and (= y10465 (f1 y10466 (f1 PLACEHOLDER PLACEHOLDER))) (= y10466 (f1 y10467 (f1 PLACEHOLDER PLACEHOLDER))) (= y10467 (f1 y10465 PLACEHOLDER))) 
    (and (= y10468 (f1 y10469 PLACEHOLDER)) (= y10469 (f1 y10470 (f1 PLACEHOLDER PLACEHOLDER))) (= y10470 (f1 y10468 PLACEHOLDER))) (= y10471 (f1 y10471 PLACEHOLDER)))))
(check-sat)
