(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T)))))
(assert (exists ((y15577 T) (y15576 T) (y15575 T) (y15574 T) (y15572 T) (y15571 T) (y15570 T) (y15564 T) (y15579 T) (y15578 T)) (forall ((x15589 T) (x15588 T) (x15581 T) (x15580 T) (x15582 T) (x15585 T) (x15584 T) (x15587 T) (x15586 T)) 
  (or (= y15564 (f2 y15564 x15584 x15584 x15584)) 
    (and (= x15580 (f2 (f1 (f1 x15582 x15584 (f1 x15584 x15584 x15584)) x15580 (f1 x15586 x15584 x15586)) (f1 x15584 x15584 x15584) (f2 (f2 x15580 x15584 x15584 x15584) (f1 x15584 x15584 x15584) x15584 x15584) (f2 x15584 x15584 x15586 x15586))) (= x15582 (f1 x15580 x15584 x15584))) 
    (and (= x15588 (f2 x15589 x15584 (f1 (f1 x15584 x15584 x15584) x15584 x15586) x15584)) (= x15589 (f1 x15587 x15584 x15586)) (= x15587 (f2 x15588 x15584 x15584 x15584))) 
    (and (= y15570 (f2 y15571 (f1 x15584 x15584 x15584) x15584 x15586)) (= y15571 (f1 y15570 x15584 x15584))) (= y15572 (f2 y15572 x15584 y15572 x15584)) 
    (and (= x15585 (f1 x15585 (f2 (f1 y15574 x15584 (f1 x15586 x15586 x15586)) (f2 (f1 x15584 x15584 x15584) x15584 x15584 x15584) (f1 x15584 x15584 x15584) (f1 x15584 x15584 x15584)) x15586)) (= y15574 (f2 y15575 x15584 (f1 x15584 x15584 x15584) x15584)) (= y15575 (f2 x15585 x15584 x15584 x15584))) 
    (and (= y15576 (f1 y15577 x15586 (f1 x15584 x15584 x15584))) (= y15577 (f1 (f2 y15576 x15584 x15584 x15584) y15578 x15586)) (= y15578 (f2 y15576 x15584 x15584 x15584))) (= y15579 x15581)))))
(check-sat)