(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T))
  (f4 (proj0f4 T)))))
(assert (exists ((y10265 T) (y10264 T) (y10251 T) (y10250 T) (y10253 T) (y10252 T) (y10255 T) (y10254 T) (y10257 T) (y10256 T) (y10259 T) (y10258 T) (y10260 T) (y10261 T) (y10262 T) (y10263 T)) 
  (or (= y10250 (f2 y10250 PLACEHOLDER)) 
    (and (= y10251 (f2 y10252 PLACEHOLDER)) (= y10252 (f3 y10253)) (= y10253 (f3 y10251))) 
    (and (= y10254 (f3 (f4 (f3 y10255)))) (= y10255 (f1 y10256 PLACEHOLDER)) (= y10256 (f2 y10254 PLACEHOLDER))) 
    (and (= y10257 (f2 y10258 (f2 (f3 (f3 (f3 PLACEHOLDER))) (f1 (f4 (f2 PLACEHOLDER PLACEHOLDER)) (f2 (f3 PLACEHOLDER) (f3 PLACEHOLDER)))))) (= y10258 (f2 y10259 (f2 PLACEHOLDER PLACEHOLDER))) (= y10259 (f1 y10260 (f3 PLACEHOLDER))) (= y10260 (f2 y10261 (f2 PLACEHOLDER PLACEHOLDER))) (= y10261 (f2 y10257 PLACEHOLDER))) 
    (and (= y10262 (f3 (f3 y10263))) (= y10263 (f2 y10264 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y10264 (f2 y10265 (f3 PLACEHOLDER))) (= y10265 (f2 y10262 PLACEHOLDER))))))
(check-sat)
