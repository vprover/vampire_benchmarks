(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (exists ((y6105 T) (y6107 T) (y6104 T) (y6113 T) (y6103 T) (y6102 T) (y6101 T) (y6100 T) (y6095 T) (y6094 T) (y6097 T) (y6096 T) (y6099 T) (y6098 T) (y6109 T) (y6108 T) (y6110 T) (y6111 T) (y6112 T) (y6106 T)) 
  (or 
    (and (= y6094 (f1 (f1 y6094 PLACEHOLDER PLACEHOLDER) y6095 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6095 (f3 y6094 PLACEHOLDER))) 
    (and (= y6096 (f2 y6097 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6097 (f1 y6098 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6098 (f2 y6096 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y6099 (f2 y6100 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER)) (= y6100 (f2 y6099 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y6101 (f1 y6102 (f3 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER)))) (= y6102 (f3 y6103 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6103 (f1 y6104 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y6104 (f3 y6101 PLACEHOLDER))) (= y6105 (f3 (f3 (f3 y6105 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) 
    (and (= y6106 (f3 y6107 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6107 (f3 y6108 (f3 PLACEHOLDER PLACEHOLDER))) (= y6108 (f2 y6109 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6109 (f1 y6110 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6110 (f2 y6106 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y6111 (f2 y6112 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6112 (f2 y6111 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6113 (f2 y6113 y6113 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
