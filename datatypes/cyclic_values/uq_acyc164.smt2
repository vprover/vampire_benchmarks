(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y17577 T) (y17561 T) (y17560 T) (y17562 T) (y17563 T) (y17559 T) (y17571 T) (y17570 T) (y17573 T) (y17572 T) (y17566 T) (y17567 T) (y17564 T) (y17565 T) (y17579 T) (y17578 T) (y17568 T) (y17569 T) (y17557 T) (y17556 T) (y17555 T) (y17575 T)) (forall ((x17587 T) (x17586 T) (x17585 T) (x17584 T) (x17583 T) (x17582 T) (x17580 T) (x17589 T) (x17588 T)) 
  (or 
    (and (= x17580 (f1 (f2 y17555 (f1 (f3 x17583 (f2 x17583 x17583 x17583) (f3 x17583 x17583 x17583)) x17583 (f1 (f3 x17583 x17583 x17583) (f3 x17583 x17583 x17583) x17583)) (f1 (f1 x17583 x17583 x17583) x17583 (f3 x17583 x17583 x17583))) (f3 x17583 x17583 (f1 x17583 x17583 x17583)) (f3 (f2 x17583 x17583 x17583) (f2 x17583 x17583 x17583) x17583))) (= y17555 (f1 y17556 (f2 x17583 x17583 x17583) (f3 x17583 (f3 x17583 x17583 x17583) (f1 x17583 x17583 x17583)))) (= y17556 (f3 y17557 x17583 x17583)) (= y17557 (f3 x17580 x17583 x17583))) 
    (and (= x17586 (f1 (f3 (f3 x17586 x17583 x17583) y17559 x17583) (f1 x17583 (f2 x17583 x17583 x17583) (f3 x17583 x17583 x17583)) (f3 x17583 x17583 x17583))) (= y17559 (f1 x17586 x17586 x17583))) 
    (and (= y17560 (f1 y17561 (f3 (f3 x17583 x17583 x17583) x17583 x17583) x17583)) (= y17561 (f1 y17562 (f3 x17583 x17583 x17583) (f3 x17583 x17583 x17583))) (= y17562 (f2 y17563 (f1 x17583 x17583 x17583) x17583)) (= y17563 (f1 y17560 x17583 x17583))) 
    (and (= y17564 (f1 y17565 (f3 (f1 y17564 x17583 x17583) x17583 (f2 x17583 x17583 x17583)) x17583)) (= y17565 (f2 y17566 (f2 (f1 x17583 x17583 x17583) x17583 (f1 x17583 x17583 x17583)) x17583)) (= y17566 (f2 y17567 x17583 (f2 x17583 x17583 x17583))) (= y17567 (f3 y17564 x17583 x17583))) 
    (and (= y17568 (f1 (f3 (f1 y17568 x17583 x17583) (f1 x17583 x17583 x17583) x17583) y17569 (f3 (f1 x17583 x17583 x17583) (f3 x17583 x17583 x17583) x17583))) (= y17569 x17582) (= y17570 (f3 y17568 x17583 x17583))) 
    (and (= y17571 (f1 (f1 (f1 y17571 x17583 x17583) (f3 x17583 x17583 x17583) x17583) (f1 y17572 y17571 x17583) (f1 x17583 x17583 x17583))) (= y17572 x17587)) 
    (and (= y17573 (f1 x17585 x17583 (f3 x17583 x17583 x17583))) (= x17585 (f3 y17575 (f3 x17583 x17583 x17583) (f1 x17583 x17583 x17583))) (= y17575 (f2 y17573 x17583 x17583))) 
    (and (= x17589 (f2 y17577 (f3 (f1 (f1 x17583 x17583 x17583) x17583 (f1 x17583 x17583 x17583)) x17583 (f1 (f3 x17583 x17583 x17583) x17583 x17583)) x17583)) (= y17577 x17588) (= y17578 x17584) (= y17579 (f3 x17589 x17583 x17583)))))))
(check-sat)