(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (exists ((y15637 T) (y15638 T) (y15639 T) (y15645 T) (y15644 T) (y15647 T) (y15646 T) (y15641 T) (y15643 T) (y15651 T) (y15652 T) (y15648 T)) (forall ((x15660 T) (x15654 T) (x15662 T) (x15663 T) (x15661 T) (x15659 T) (x15658 T)) 
  (or (= x15662 (f1 (f1 (f1 (f1 (f1 x15662 x15659) x15659) (f1 x15659 x15659)) (f1 x15659 x15659)) (f1 (f1 (f1 x15659 x15659) (f1 x15659 x15659)) (f1 (f1 x15659 x15659) x15659)))) 
    (and (= y15637 (f1 y15638 (f1 (f1 x15659 x15659) x15659))) (= y15638 (f1 y15639 (f1 x15659 x15659))) (= y15639 (f1 y15637 x15659))) (= x15654 (f1 (f1 (f1 x15654 x15659) (f1 x15659 x15659)) (f1 x15659 x15659))) 
    (and (= y15641 (f1 x15658 (f1 (f1 x15659 x15659) x15659))) (= x15658 (f1 y15643 (f1 x15659 x15659))) (= y15643 (f1 y15644 x15659)) (= y15644 (f1 y15645 (f1 x15659 x15659))) (= y15645 (f1 y15641 x15659))) 
    (and (= y15646 (f1 y15647 (f1 x15659 x15659))) (= y15647 (f1 y15646 x15659))) 
    (and (= y15648 (f1 x15660 (f1 x15659 x15659))) (= x15660 (f1 x15663 (f1 x15659 x15659))) (= x15663 (f1 y15648 x15659))) 
    (and (= y15651 (f1 y15652 (f1 x15659 x15659))) (= y15652 (f1 y15651 x15659))) (= x15661 (f1 x15661 x15659))))))
(check-sat)