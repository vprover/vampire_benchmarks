(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y11409 T) (y11413 T) (y11414 T) (y11415 T) (y11416 T) (y11417 T)) (forall ((x11423 T) (x11419 T) (x11421 T) (x11426 T) (x11427 T) (x11424 T) (x11425 T)) 
  (or 
    (and (= x11421 x11425) (= y11409 (f1 x11427)) (= x11427 x11424)) 
    (and (= x11426 (f1 x11419)) (= x11419 x11423) (= y11413 (f1 y11414)) (= y11414 (f1 x11426))) 
    (and (= y11415 (f1 y11416)) (= y11416 (f1 y11417)) (= y11417 (f1 y11415)))))))
(check-sat)
