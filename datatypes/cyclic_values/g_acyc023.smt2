(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (exists ((y2396 T) (y2397 T) (y2395 T)) 
  (or (= y2395 (f1 y2395 PLACEHOLDER)) (= y2396 (f1 (f1 (f1 (f1 (f1 y2396 PLACEHOLDER) PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER)) (= y2397 (f1 y2397 PLACEHOLDER)))))
(check-sat)
