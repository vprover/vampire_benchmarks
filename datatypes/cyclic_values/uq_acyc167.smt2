(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y18509 T) (y18502 T) (y18512 T) (y18513 T) (y18510 T) (y18511 T) (y18516 T) (y18514 T) (y18506 T) (y18507 T) (y18500 T) (y18515 T)) (forall ((x18519 T) (x18524 T) (x18527 T) (x18520 T) (x18521 T) (x18522 T) (x18523 T) (x18525 T) (x18518 T)) 
  (or 
    (and (= x18523 (f2 x18519 (f3 (f2 PLACEHOLDER PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f1 PLACEHOLDER)) (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f1 PLACEHOLDER))) (= x18519 (f3 y18500 (f1 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y18500 (f3 x18522 PLACEHOLDER PLACEHOLDER)) (= x18522 (f3 x18523 PLACEHOLDER PLACEHOLDER))) 
    (and (= y18502 (f1 x18521)) (= x18521 (f1 x18520)) (= x18520 (f1 x18524)) (= x18524 (f1 y18506)) (= y18506 (f2 y18502 y18502 PLACEHOLDER))) 
    (and (= y18507 (f1 x18525)) (= x18525 (f3 y18509 (f2 y18507 PLACEHOLDER PLACEHOLDER) (f1 (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y18509 (f3 y18510 (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) x18518)) (= y18510 (f3 y18511 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y18511 (f1 y18507))) 
    (and (= y18512 (f1 y18513)) (= y18513 (f3 y18514 PLACEHOLDER PLACEHOLDER)) (= y18514 (f1 y18515)) (= y18515 (f2 y18516 (f1 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y18516 (f1 y18512))) (= x18527 (f3 x18527 PLACEHOLDER PLACEHOLDER))))))
(check-sat)
