(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T)))))
(assert (exists ((y8667 T) (y8680 T) (y8668 T) (y8669 T) (y8679 T) (y8678 T) (y8673 T) (y8672 T) (y8671 T) (y8670 T) (y8677 T) (y8676 T) (y8675 T) (y8674 T)) 
  (or 
    (and (= y8667 (f3 (f2 y8668) (f3 (f2 PLACEHOLDER) (f2 PLACEHOLDER) (f2 PLACEHOLDER) PLACEHOLDER) PLACEHOLDER PLACEHOLDER)) (= y8668 (f3 y8669 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER))) (= y8669 (f1 y8667))) 
    (and (= y8670 (f1 y8671)) (= y8671 (f3 y8670 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y8672 (f3 (f1 (f2 (f2 (f2 y8672)))) (f3 y8673 (f2 PLACEHOLDER) (f2 (f2 (f1 PLACEHOLDER))) (f2 (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (f2 PLACEHOLDER) (f3 (f2 (f1 (f2 PLACEHOLDER))) (f2 (f3 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER) (f2 PLACEHOLDER) (f2 PLACEHOLDER))) PLACEHOLDER PLACEHOLDER))) (= y8673 (f3 y8674 PLACEHOLDER (f2 (f1 PLACEHOLDER)) (f1 PLACEHOLDER))) (= y8674 (f2 y8675)) (= y8675 (f2 y8672))) 
    (and (= y8676 (f3 y8677 (f2 (f3 (f2 (f2 PLACEHOLDER)) (f1 PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 (f1 PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (f1 (f3 y8676 y8676 PLACEHOLDER PLACEHOLDER)) (f3 PLACEHOLDER (f2 (f2 PLACEHOLDER)) (f2 (f2 PLACEHOLDER)) PLACEHOLDER))) (= y8677 (f1 y8678)) (= y8678 (f2 y8679)) (= y8679 (f3 y8680 (f1 PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER))) (= y8680 (f2 y8676))))))
(check-sat)
