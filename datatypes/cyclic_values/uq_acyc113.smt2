(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T)))))
(assert (exists ((y12099 T) (y12098 T) (y12109 T) (y12108 T) (y12118 T) (y12119 T) (y12103 T) (y12110 T) (y12101 T) (y12100 T) (y12107 T) (y12106 T) (y12105 T) (y12111 T) (y12114 T) (y12121 T) (y12112 T) (y12115 T) (y12123 T) (y12116 T)) (forall ((x12131 T) (x12130 T) (x12133 T) (x12132 T) (x12127 T) (x12124 T) (x12129 T)) 
  (or 
    (and (= y12098 (f2 (f1 y12099 (f3 PLACEHOLDER)) (f2 PLACEHOLDER (f2 (f3 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER))))) (= y12099 (f2 y12100 (f3 PLACEHOLDER))) (= y12100 (f2 y12098 PLACEHOLDER))) (= y12101 (f3 y12101)) 
    (and (= x12131 (f1 y12103 (f2 PLACEHOLDER PLACEHOLDER))) (= y12103 (f2 x12131 PLACEHOLDER))) (= x12129 (f3 x12129)) 
    (and (= y12105 (f3 y12106)) (= y12106 (f2 y12107 (f3 PLACEHOLDER))) (= y12107 (f2 y12105 PLACEHOLDER))) 
    (and (= y12108 (f1 (f3 y12109) (f2 PLACEHOLDER (f3 (f2 PLACEHOLDER (f3 PLACEHOLDER)))))) (= y12109 (f2 (f2 y12110 (f2 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER)) (= y12110 (f1 y12108 PLACEHOLDER))) 
    (and (= y12111 x12127) (= y12112 (f2 y12111 PLACEHOLDER))) 
    (and (= x12130 (f2 y12114 (f2 PLACEHOLDER PLACEHOLDER))) (= y12114 (f2 y12115 (f2 (f3 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y12115 (f1 y12116 (f1 PLACEHOLDER PLACEHOLDER))) (= y12116 (f3 x12130))) 
    (and (= x12132 (f1 y12118 (f3 (f3 PLACEHOLDER)))) (= y12118 (f1 y12119 (f1 PLACEHOLDER PLACEHOLDER))) (= y12119 (f3 x12133)) (= x12133 (f1 y12121 PLACEHOLDER)) (= y12121 (f3 x12132))) 
    (and (= x12124 (f2 y12123 (f1 PLACEHOLDER PLACEHOLDER))) (= y12123 (f2 x12124 PLACEHOLDER)))))))
(check-sat)
