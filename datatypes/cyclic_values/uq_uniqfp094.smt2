(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y10512 T) (y10520 T) (y10538 T) (y10498 T) (y10536 T) (y10530 T) (y10495 T) (y10494 T) (y10493 T) (y10510 T) (y10511 T) (y10516 T) (y10539 T) (y10514 T) (y10534 T) (y10537 T) (y10529 T) (y10501 T) (y10513 T) (y10503 T) (y10502 T) (y10505 T) (y10504 T) (y10507 T) (y10515 T) (y10509 T) (y10508 T) (y10521 T) (y10519 T) (y10527 T) (y10526 T) (y10525 T) (y10524 T) (y10523 T) (y10535 T) (y10533 T) (y10522 T) (y10528 T)) (forall ((x10548 T) (x10549 T) (x10546 T) (x10547 T) (x10544 T) (x10545 T) (x10542 T) (x10543 T) (x10540 T) (x10541 T)) 
  (or 
    (and (= y10493 (f1 y10493 PLACEHOLDER)) (= y10494 (f1 y10494 PLACEHOLDER)) (distinct y10493 y10494)) 
    (and (= y10495 x10540) (= x10547 (f2 y10495)) (= x10548 (f2 y10498)) (= y10498 (f2 x10548)) (distinct y10495 x10548)) 
    (and (= x10546 (f1 y10501 (f2 PLACEHOLDER))) (= y10501 (f3 x10546 PLACEHOLDER PLACEHOLDER)) (= x10545 (f1 y10502 (f2 PLACEHOLDER))) (= y10502 (f3 x10545 PLACEHOLDER PLACEHOLDER)) (distinct x10546 x10545)) 
    (and (= y10503 (f3 y10505 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)) (f2 (f1 (f2 PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y10505 (f3 x10549 (f2 (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER)) (= x10549 (f1 y10507 PLACEHOLDER)) (= y10507 (f2 y10508)) (= y10508 (f3 y10503 PLACEHOLDER PLACEHOLDER)) (= y10504 (f3 (f3 (f1 y10509 PLACEHOLDER) (f2 (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER) (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)) (f2 (f1 (f2 PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y10509 (f2 y10510)) (= y10510 (f3 y10504 PLACEHOLDER PLACEHOLDER)) (distinct y10503 y10504)) 
    (and (= y10511 (f1 (f2 (f2 y10513)) (f2 (f3 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y10513 (f2 y10514)) (= y10514 (f1 y10511 PLACEHOLDER)) (= y10512 (f1 y10515 (f2 (f3 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y10515 (f2 y10516)) (= y10516 (f2 x10543)) (= x10543 (f2 x10542)) (= x10542 (f1 y10512 PLACEHOLDER)) (distinct y10511 y10512)) 
    (and (= y10519 (f1 y10521 (f1 PLACEHOLDER PLACEHOLDER))) (= y10521 (f2 y10522)) (= y10522 (f2 y10523)) (= y10523 (f1 y10524 (f1 PLACEHOLDER PLACEHOLDER))) (= y10524 (f2 y10519)) (= y10520 (f1 y10525 (f1 PLACEHOLDER PLACEHOLDER))) (= y10525 (f2 y10526)) (= y10526 (f2 y10527)) (= y10527 (f1 y10528 (f1 PLACEHOLDER PLACEHOLDER))) (= y10528 (f2 y10520)) (distinct y10519 y10520)) 
    (and (= y10529 (f2 y10529)) (= y10530 (f2 y10530)) (distinct y10529 y10530)) 
    (and (= x10544 (f3 y10533 (f2 x10544) (f2 PLACEHOLDER))) (= y10533 (f1 y10534 PLACEHOLDER)) (= y10534 (f2 x10544)) (= x10541 (f3 (f1 y10535 PLACEHOLDER) (f2 x10541) (f2 PLACEHOLDER))) (= y10535 (f2 x10541)) (distinct x10544 x10541)) 
    (and (= y10536 (f2 y10538)) (= y10538 (f2 y10536)) (= y10537 (f2 y10539)) (= y10539 (f2 y10537)) (distinct y10536 y10537))))))
(check-sat)