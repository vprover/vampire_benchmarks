(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T)))))
(assert (exists ((y3517 T) (y3516 T) (y3515 T) (y3514 T) (y3519 T) (y3518 T) (y3522 T) (y3523 T) (y3520 T) (y3521 T) (y3526 T) (y3527 T) (y3524 T) (y3525 T)) 
  (or 
    (and (= y3514 (f1 y3514 PLACEHOLDER y3514 PLACEHOLDER)) (= y3515 (f1 y3515 PLACEHOLDER y3515 PLACEHOLDER)) (distinct y3514 y3515)) 
    (and (= y3516 (f1 (f1 (f1 y3516 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER y3516 PLACEHOLDER) (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) y3518 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y3518 (f1 y3519 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y3519 (f1 y3520 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y3520 (f1 y3516 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y3517 (f1 (f1 (f1 y3517 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER y3517 PLACEHOLDER) (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) y3521 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y3521 (f1 y3522 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y3522 (f1 y3523 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y3523 (f1 y3517 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y3516 y3517)) 
    (and (= y3524 (f1 y3526 PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3526 (f1 y3524 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y3525 (f1 y3527 PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3527 (f1 y3525 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y3524 y3525)))))
(check-sat)