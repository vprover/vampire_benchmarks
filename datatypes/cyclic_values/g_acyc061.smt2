(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T)))))
(assert (exists ((y6451 T) (y6450 T) (y6453 T) (y6452 T) (y6455 T) (y6454 T) (y6457 T) (y6456 T) (y6459 T) (y6458 T) (y6448 T) (y6449 T) (y6460 T) (y6461 T)) 
  (or 
    (and (= y6448 (f1 (f1 (f1 (f2 y6448 PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) y6448 PLACEHOLDER) PLACEHOLDER (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER) (f3 (f2 y6449 (f2 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER)) (= y6449 (f2 y6448 PLACEHOLDER))) 
    (and (= y6450 (f2 (f3 (f3 y6450 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y6451 PLACEHOLDER PLACEHOLDER) (f2 (f2 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y6451 (f1 y6450 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y6452 (f2 (f1 (f1 (f1 y6453 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER) (f2 (f3 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER) PLACEHOLDER) (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y6453 (f2 y6452 PLACEHOLDER))) (= y6454 (f2 y6454 PLACEHOLDER)) 
    (and (= y6455 (f3 y6456 PLACEHOLDER y6455 (f2 PLACEHOLDER PLACEHOLDER))) (= y6456 (f3 y6455 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6457 (f1 y6457 y6457 y6457 PLACEHOLDER)) 
    (and (= y6458 (f2 (f1 (f1 y6459 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER))) (= y6459 (f2 y6458 PLACEHOLDER))) 
    (and (= y6460 (f1 y6461 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6461 (f2 y6460 PLACEHOLDER))))))
(check-sat)
