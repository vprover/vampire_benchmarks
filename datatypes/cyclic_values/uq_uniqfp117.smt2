(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T)))))
(assert (exists ((y12522 T) (y12520 T) (y12529 T) (y12527 T) (y12524 T) (y12526 T) (y12499 T) (y12498 T) (y12530 T) (y12532 T) (y12494 T) (y12497 T) (y12496 T) (y12515 T) (y12525 T) (y12511 T) (y12512 T) (y12513 T) (y12514 T) (y12509 T) (y12516 T) (y12517 T) (y12507 T) (y12506 T) (y12505 T) (y12504 T) (y12503 T) (y12502 T) (y12501 T) (y12500 T) (y12531 T) (y12528 T) (y12534 T)) (forall ((x12539 T) (x12538 T) (x12535 T) (x12537 T) (x12536 T) (x12544 T) (x12540 T) (x12541 T) (x12542 T)) 
  (or 
    (and (= y12494 (f2 y12496 (f2 x12539 x12539 x12539 x12539) x12539 x12539)) (= y12496 (f2 y12494 x12539 x12539 x12539)) (= x12544 (f2 y12497 (f2 x12539 x12539 x12539 x12539) x12539 x12539)) (= y12497 (f2 x12544 x12539 x12539 x12539)) (distinct y12494 x12544)) 
    (and (= y12498 (f2 y12500 (f1 (f2 x12539 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539) (f2 (f1 (f2 x12539 x12539 x12539 x12539) x12539 (f2 x12539 x12539 x12539 x12539)) (f2 x12539 x12539 x12539 x12539) (f2 (f1 x12539 x12539 x12539) x12539 x12539 x12539) (f2 (f1 x12539 x12539 x12539) x12539 (f2 x12539 x12539 x12539 x12539) x12539))) x12539 (f2 x12539 x12539 x12539 x12539))) (= y12500 (f1 y12501 (f1 (f2 y12498 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539) x12539) (f1 (f2 x12539 x12539 x12539 x12539) (f1 x12539 (f2 x12539 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539)) (f1 (f1 x12539 x12539 x12539) x12539 (f2 x12539 x12539 x12539 x12539))))) (= y12501 (f2 y12502 (f2 (f2 x12539 x12539 x12539 x12539) (f1 x12539 x12539 x12539) x12539 (f1 x12539 x12539 x12539)) (f1 x12539 x12539 x12539) x12539)) (= y12502 (f1 y12503 x12539 x12539)) (= y12503 (f2 y12498 x12539 x12539 x12539)) (= y12499 (f2 y12504 (f1 (f2 x12539 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539) (f2 (f1 (f2 x12539 x12539 x12539 x12539) x12539 (f2 x12539 x12539 x12539 x12539)) (f2 x12539 x12539 x12539 x12539) (f2 (f1 x12539 x12539 x12539) x12539 x12539 x12539) (f2 (f1 x12539 x12539 x12539) x12539 (f2 x12539 x12539 x12539 x12539) x12539))) x12539 (f2 x12539 x12539 x12539 x12539))) (= y12504 (f1 y12505 (f1 (f2 y12499 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539) x12539) (f1 (f2 x12539 x12539 x12539 x12539) (f1 x12539 (f2 x12539 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539)) (f1 (f1 x12539 x12539 x12539) x12539 (f2 x12539 x12539 x12539 x12539))))) (= y12505 (f2 y12506 (f2 (f2 x12539 x12539 x12539 x12539) (f1 x12539 x12539 x12539) x12539 (f1 x12539 x12539 x12539)) (f1 x12539 x12539 x12539) x12539)) (= y12506 (f1 y12507 x12539 x12539)) (= y12507 (f2 y12499 x12539 x12539 x12539)) (distinct y12498 y12499)) 
    (and (= x12536 (f2 x12542 x12539 (f2 x12539 x12539 x12539 x12539) (f1 x12539 x12539 x12539))) (= x12542 (f1 x12536 x12536 x12539)) (= y12509 (f2 y12511 x12539 (f2 x12539 x12539 x12539 x12539) (f1 x12539 x12539 x12539))) (= y12511 (f1 y12509 y12509 x12539)) (distinct x12536 y12509)) 
    (and (= y12512 (f1 y12512 y12512 x12539)) (= y12513 (f1 y12513 y12513 x12539)) (distinct y12512 y12513)) 
    (and (= y12514 (f2 y12514 y12514 y12516 (f2 x12539 x12539 x12539 x12539))) (= y12516 (f2 y12517 x12539 (f2 x12539 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539))) (= y12517 (f2 y12514 x12539 x12539 x12539)) (= y12515 (f2 y12515 y12515 x12540 (f2 x12539 x12539 x12539 x12539))) (= x12540 (f2 x12537 x12539 (f2 x12539 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539))) (= x12537 (f2 y12515 x12539 x12539 x12539)) (distinct y12514 y12515)) 
    (and (= y12520 (f1 y12522 (f1 x12539 x12539 x12539) x12539)) (= y12522 (f1 x12538 x12539 x12539)) (= x12538 (f2 y12520 x12539 x12539 x12539)) (= x12541 (f1 y12524 (f1 x12539 x12539 x12539) x12539)) (= y12524 (f1 y12525 x12539 x12539)) (= y12525 (f2 x12541 x12539 x12539 x12539)) (distinct y12520 x12541)) 
    (and (= y12526 (f2 y12526 x12539 x12539 x12539)) (= y12527 (f2 y12527 x12539 x12539 x12539)) (distinct y12526 y12527)) 
    (and (= y12528 (f2 (f2 y12528 x12539 x12539 x12539) y12530 x12539 x12539)) (= y12530 (f1 y12528 y12528 x12539)) (= y12529 (f2 (f2 y12529 x12539 x12539 x12539) y12531 x12539 x12539)) (= y12531 (f1 y12529 y12529 x12539)) (distinct y12528 y12529)) 
    (and (= y12532 (f2 (f1 (f1 (f1 (f1 y12532 x12539 x12539) (f1 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539)) (f1 x12539 x12539 x12539) x12539) x12539 x12539) x12539 (f2 y12532 (f1 x12539 (f2 x12539 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539)) (f1 (f1 y12532 x12539 x12539) x12539 (f2 x12539 x12539 x12539 x12539)) (f2 x12539 x12539 (f1 x12539 x12539 x12539) (f1 x12539 x12539 x12539))) (f1 x12539 x12539 (f1 x12539 x12539 x12539)))) (= x12535 (f2 (f1 (f1 (f1 y12534 (f1 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539)) (f1 x12539 x12539 x12539) x12539) x12539 x12539) x12539 (f2 x12535 (f1 x12539 (f2 x12539 x12539 x12539 x12539) (f2 x12539 x12539 x12539 x12539)) (f1 (f1 x12535 x12539 x12539) x12539 (f2 x12539 x12539 x12539 x12539)) (f2 x12539 x12539 (f1 x12539 x12539 x12539) (f1 x12539 x12539 x12539))) (f1 x12539 x12539 (f1 x12539 x12539 x12539)))) (= y12534 (f1 x12535 x12539 x12539)) (distinct y12532 x12535))))))
(check-sat)