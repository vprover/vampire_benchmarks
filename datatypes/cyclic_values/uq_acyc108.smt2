(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y11618 T) (y11619 T) (y11624 T) (y11621 T) (y11620 T)) (forall ((x11637 T) (x11636 T) (x11635 T) (x11634 T) (x11632 T) (x11631 T) (x11630 T) (x11639 T) (x11638 T)) 
  (or 
    (and (= x11639 (f1 x11634)) (= x11634 (f1 y11618)) (= y11618 (f1 x11639))) 
    (and (= y11619 (f1 (f1 y11620))) (= y11620 (f1 y11619))) 
    (and (= y11621 (f1 x11635)) (= x11635 (f1 x11630)) (= x11630 (f1 y11621))) 
    (and (= y11624 (f1 x11637)) (= x11637 (f1 y11624))) 
    (and (= x11638 (f1 x11631)) (= x11631 (f1 x11636)) (= x11636 (f1 x11632)) (= x11632 (f1 x11638)))))))
(check-sat)