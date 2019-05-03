(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (exists ((y3898 T) (y3899 T) (y3896 T) (y3897 T) (y3894 T) (y3895 T) (y3900 T) (y3901 T) (y3902 T) (y3903 T)) 
  (or 
    (and (= y3894 (f1 y3895 PLACEHOLDER)) (= y3895 (f1 y3896 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER)))) (= y3896 (f1 y3897 PLACEHOLDER)) (= y3897 (f1 y3898 PLACEHOLDER)) (= y3898 (f1 y3894 PLACEHOLDER))) 
    (and (= y3899 (f1 y3900 (f1 PLACEHOLDER PLACEHOLDER))) (= y3900 (f1 y3899 PLACEHOLDER))) 
    (and (= y3901 (f1 y3902 PLACEHOLDER)) (= y3902 (f1 y3903 (f1 PLACEHOLDER PLACEHOLDER))) (= y3903 (f1 y3901 PLACEHOLDER))))))
(check-sat)
