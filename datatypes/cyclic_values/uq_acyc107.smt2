(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y11528 T) (y11529 T) (y11522 T) (y11523 T) (y11524 T) (y11525 T) (y11526 T) (y11534 T) (y11533 T) (y11532 T) (y11531 T) (y11530 T)) (forall ((x11538 T) (x11536 T) (x11540 T) (x11541 T) (x11539 T) (x11543 T) (x11542 T) (x11544 T)) 
  (or (= x11539 x11541) 
    (and (= x11536 x11544) (= y11522 (f1 y11523)) (= y11523 (f1 x11536))) (= y11524 x11543) 
    (and (= y11525 x11538) (= y11526 (f1 x11542)) (= x11542 (f1 y11528)) (= y11528 (f1 y11529)) (= y11529 (f1 y11525))) (= y11530 x11540) 
    (and (= y11531 (f1 y11532)) (= y11532 (f1 y11533)) (= y11533 (f1 y11534)) (= y11534 (f1 y11531)))))))
(check-sat)
