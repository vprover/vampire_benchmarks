(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T))
  (f4 (proj0f4 T)))))
(assert (exists ((y10548 T) (y10539 T) (y10535 T) (y10547 T) (y10546 T) (y10541 T) (y10540 T) (y10543 T) (y10542 T)) (forall ((x10559 T) (x10558 T) (x10555 T) (x10554 T) (x10557 T) (x10556 T) (x10550 T) (x10553 T)) 
  (or (= x10550 (f4 x10550)) 
    (and (= y10535 (f1 y10535 x10558 (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER))) (= x10558 (f2 x10559)) (= x10559 (f4 y10535))) (= x10554 (f3 (f3 x10554 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 (f4 (f2 PLACEHOLDER)) (f3 PLACEHOLDER (f4 PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER) (f4 (f2 (f3 x10554 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f4 PLACEHOLDER))) 
    (and (= y10539 (f3 y10539 (f2 y10539) y10540 PLACEHOLDER)) (= y10540 (f4 y10539))) 
    (and (= y10541 (f3 y10542 (f4 PLACEHOLDER) (f2 (f4 PLACEHOLDER)) PLACEHOLDER)) (= y10542 (f2 y10543)) (= y10543 (f4 y10541))) (= x10553 x10557) (= x10556 (f2 (f2 x10556))) 
    (and (= y10546 (f4 y10547)) (= y10547 (f4 y10548)) (= y10548 (f3 y10546 y10546 PLACEHOLDER PLACEHOLDER))) (= x10555 (f1 x10555 PLACEHOLDER x10555 PLACEHOLDER))))))
(check-sat)
