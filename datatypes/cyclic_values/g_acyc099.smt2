(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T)))))
(assert (exists ((y10581 T) (y10580 T) (y10583 T) (y10582 T) (y10585 T) (y10584 T) (y10586 T)) 
  (or 
    (and (= y10580 (f2 y10581 (f2 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y10581 (f2 y10582 (f2 PLACEHOLDER PLACEHOLDER))) (= y10582 (f2 y10580 PLACEHOLDER))) (= y10583 (f1 y10583 PLACEHOLDER)) 
    (and (= y10584 (f1 y10585 (f2 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y10585 (f2 y10586 PLACEHOLDER)) (= y10586 (f1 y10584 PLACEHOLDER))))))
(check-sat)
