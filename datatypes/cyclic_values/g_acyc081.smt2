(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T)))))
(assert (exists ((y8592 T) (y8593 T) (y8590 T) (y8591 T) (y8596 T) (y8587 T) (y8594 T) (y8595 T) (y8589 T) (y8588 T)) 
  (or 
    (and (= y8587 (f1 y8588 (f3 PLACEHOLDER) y8587 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y8588 (f3 y8587))) 
    (and (= y8589 (f3 y8590)) (= y8590 (f3 y8591)) (= y8591 (f3 y8592)) (= y8592 (f2 (f2 y8589 PLACEHOLDER PLACEHOLDER) y8593 PLACEHOLDER)) (= y8593 (f1 y8589 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y8594 (f2 (f2 (f3 y8595) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER (f3 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (f1 (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 (f3 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER)) (f2 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f2 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f3 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y8595 (f2 y8596 PLACEHOLDER PLACEHOLDER)) (= y8596 (f2 y8594 PLACEHOLDER PLACEHOLDER))))))
(check-sat)
