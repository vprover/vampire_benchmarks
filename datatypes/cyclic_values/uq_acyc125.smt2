(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T)))))
(assert (exists ((y13441 T) (y13443 T) (y13442 T) (y13446 T) (y13429 T) (y13438 T) (y13439 T) (y13431 T) (y13432 T) (y13434 T) (y13436 T) (y13437 T)) (forall ((x13455 T) (x13454 T) (x13456 T) (x13451 T) (x13453 T) (x13447 T) (x13452 T) (x13449 T)) 
  (or 
    (and (= x13454 (f1 (f1 x13454 PLACEHOLDER PLACEHOLDER) y13429 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y13429 (f2 x13456 PLACEHOLDER (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)))) (= x13456 x13452) (= y13431 (f1 y13432 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y13432 (f2 x13454 PLACEHOLDER PLACEHOLDER))) 
    (and (= x13447 (f1 y13434 (f1 (f1 x13447 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER (f2 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f2 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y13434 (f1 x13449 (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER)) (= x13449 (f2 y13436 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y13436 (f1 y13437 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y13437 (f2 x13447 PLACEHOLDER PLACEHOLDER))) 
    (and (= y13438 (f2 (f1 y13439 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y13439 (f1 y13438 PLACEHOLDER PLACEHOLDER))) 
    (and (= x13453 (f2 y13441 (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f1 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y13441 (f1 y13442 (f2 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y13442 (f2 y13443 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y13443 (f1 x13451 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= x13451 (f1 x13453 PLACEHOLDER PLACEHOLDER))) 
    (and (= x13455 (f2 y13446 PLACEHOLDER PLACEHOLDER)) (= y13446 (f2 x13455 x13455 PLACEHOLDER)))))))
(check-sat)