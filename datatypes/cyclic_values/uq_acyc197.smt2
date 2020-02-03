(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y21505 T) (y21495 T) (y21511 T) (y21510 T) (y21502 T) (y21512 T) (y21515 T) (y21493 T) (y21504 T) (y21514 T) (y21506 T) (y21497 T) (y21513 T) (y21503 T) (y21494 T) (y21501 T) (y21499 T) (y21498 T) (y21509 T) (y21508 T)) (forall ((x21519 T) (x21518 T) (x21520 T) (x21521 T) (x21522 T) (x21524 T) (x21525 T) (x21526 T)) 
  (or 
    (and (= y21493 (f2 (f1 y21493 y21493 x21525) y21494 x21525)) (= y21494 (f3 y21493 x21525 x21525))) 
    (and (= y21495 (f1 x21521 (f2 (f1 x21525 x21525 x21525) (f1 x21525 x21525 x21525) (f3 x21525 x21525 x21525)) (f1 x21525 (f2 x21525 x21525 x21525) (f3 x21525 x21525 x21525)))) (= x21521 (f2 y21497 (f2 y21495 x21525 x21525) (f2 x21525 x21525 x21525))) (= y21497 (f3 y21498 (f3 (f3 x21525 x21525 x21525) (f1 x21525 x21525 x21525) (f1 x21525 x21525 x21525)) (f2 (f2 x21525 x21525 x21525) (f3 x21525 x21525 x21525) x21525))) (= y21498 (f2 y21499 x21525 x21525)) (= y21499 (f1 y21495 x21525 x21525))) (= x21519 (f3 x21519 x21525 x21525)) 
    (and (= y21501 x21520) (= y21502 (f2 y21503 (f1 (f1 x21525 x21525 x21525) x21525 (f3 x21525 x21525 x21525)) (f1 x21525 x21525 x21525))) (= y21503 (f1 y21504 x21525 (f1 x21525 x21525 (f3 x21525 x21525 x21525)))) (= y21504 (f3 y21505 x21525 x21525)) (= y21505 (f2 y21501 x21525 x21525))) (= y21506 x21526) 
    (and (= x21518 (f3 y21508 x21525 x21525)) (= y21508 (f1 x21518 x21525 x21525))) 
    (and (= y21509 (f3 y21510 (f3 x21525 x21525 x21525) (f2 x21525 x21525 x21525))) (= y21510 (f1 y21509 x21525 x21525))) 
    (and (= y21511 (f2 y21512 (f1 (f3 (f1 x21525 x21525 x21525) x21525 (f3 x21525 x21525 x21525)) (f2 (f3 x21525 x21525 x21525) x21525 (f2 x21525 (f1 x21525 x21525 x21525) (f2 x21525 x21525 x21525))) (f1 (f1 x21525 x21525 (f2 x21525 x21525 x21525)) (f1 x21525 x21525 (f1 x21525 x21525 x21525)) (f1 x21525 x21525 x21525))) (f1 x21525 x21525 x21525))) (= y21512 (f3 y21513 x21525 x21525)) (= y21513 (f3 y21514 x21525 x21525)) (= y21514 (f1 y21515 x21525 x21525)) (= y21515 (f3 y21511 x21525 x21525))) (= x21524 x21522)))))
(check-sat)