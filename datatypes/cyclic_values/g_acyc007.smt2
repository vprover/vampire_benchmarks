(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T)))))
(assert (exists ((y906 T) (y907 T) (y904 T) (y905 T) (y902 T) (y903 T) (y910 T) (y913 T) (y908 T) (y909 T) (y911 T) (y912 T)) 
  (or 
    (and (= y902 (f2 y903 (f1 PLACEHOLDER) PLACEHOLDER)) (= y903 (f1 y904)) (= y904 (f2 y902 PLACEHOLDER PLACEHOLDER))) 
    (and (= y905 (f2 y906 PLACEHOLDER PLACEHOLDER)) (= y906 (f1 y907)) (= y907 (f1 y905))) (= y908 (f1 y908)) 
    (and (= y909 (f1 y910)) (= y910 (f2 y911 y909 PLACEHOLDER)) (= y911 (f1 y909))) 
    (and (= y912 (f2 (f2 (f2 (f1 y912) y913 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER)) (f2 PLACEHOLDER (f1 PLACEHOLDER) PLACEHOLDER)) (f1 PLACEHOLDER) (f2 PLACEHOLDER (f1 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y913 (f2 y912 PLACEHOLDER PLACEHOLDER))))))
(check-sat)
