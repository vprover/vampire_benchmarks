(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T)))))
(assert (exists ((y566 T) (y567 T) (y582 T) (y580 T) (y581 T) (y572 T) (y559 T) (y558 T) (y562 T) (y560 T) (y561 T) (y571 T) (y563 T) (y564 T) (y565 T) (y575 T) (y574 T) (y568 T) (y577 T) (y578 T) (y555 T) (y557 T) (y573 T)) (forall ((x589 T) (x587 T) (x585 T) (x583 T) (x591 T) (x592 T) (x590 T) (x586 T)) 
  (or 
    (and (= y555 (f1 x583)) (= x583 (f1 y557)) (= y557 (f2 y555 x590 x590 x590))) 
    (and (= y558 (f2 (f2 (f2 y559 x590 (f2 x590 x590 x590 x590) x590) (f1 x590) (f2 x590 x590 x590 x590) (f2 x590 x590 x590 x590)) (f2 (f2 (f1 x590) x590 x590 (f2 x590 x590 x590 x590)) (f1 x590) (f1 (f2 (f2 x590 x590 x590 x590) (f1 x590) x590 x590)) (f1 x590)) x590 (f2 (f2 x590 x590 x590 x590) x590 x590 (f2 x590 x590 x590 x590)))) (= y559 (f1 y560)) (= y560 (f2 y558 x590 x590 x590))) 
    (and (= y561 (f1 y562)) (= y562 (f2 y563 (f1 x590) (f2 x590 x590 x590 x590) (f2 (f2 x590 x590 x590 x590) x590 x590 (f2 x590 x590 x590 x590)))) (= y563 (f2 y564 (f2 x590 x590 x590 x590) x590 x590)) (= y564 (f2 y561 x590 x590 x590))) 
    (and (= y565 (f2 (f2 y565 x590 x590 x590) y566 (f2 x590 x590 (f1 x590) (f1 (f1 x590))) (f2 (f1 x590) (f1 x590) (f2 x590 x590 x590 x590) (f1 x590)))) (= y566 (f1 y567)) (= y567 (f1 y568)) (= y568 x592)) 
    (and (= x586 (f2 x589 x590 x590 (f2 x590 x590 x590 x590))) (= x589 (f2 x586 x590 x590 x590))) 
    (and (= y571 (f2 (f1 (f1 y571)) y572 (f1 x590) x590)) (= y572 (f2 (f2 (f2 (f2 y571 x590 x590 x590) x590 x590 (f1 x590)) (f2 x590 (f1 x590) x590 (f2 x590 x590 x590 x590)) (f2 x590 x590 x590 x590) (f2 x590 x590 x590 x590)) y573 x590 (f2 x590 (f1 x590) x590 x590))) (= y573 (f1 y574)) (= y574 (f2 y575 (f2 x590 x590 x590 x590) x590 x590)) (= y575 (f1 y571))) (= x587 (f1 x587)) 
    (and (= y577 (f1 (f2 (f1 y578) (f1 x590) x590 (f2 x590 x590 x590 x590)))) (= y578 (f1 y577))) 
    (and (= x585 x591) (= y580 (f1 y581)) (= y581 (f1 y582)) (= y582 (f1 x585)))))))
(check-sat)
