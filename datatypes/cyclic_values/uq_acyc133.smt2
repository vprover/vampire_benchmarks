(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y14237 T) (y14236 T) (y14234 T) (y14238 T) (y14247 T) (y14244 T) (y14245 T) (y14242 T) (y14243 T) (y14240 T) (y14248 T)) (forall ((x14258 T) (x14256 T) (x14257 T) (x14255 T) (x14252 T) (x14253 T) (x14251 T)) 
  (or 
    (and (= y14234 (f1 x14258)) (= x14258 (f1 y14236)) (= y14236 (f1 y14237)) (= y14237 (f1 y14234))) 
    (and (= y14238 x14253) (= x14251 x14255)) 
    (and (= y14240 (f1 x14252)) (= x14252 x14256)) (= y14242 (f1 y14242)) 
    (and (= y14243 (f1 y14244)) (= y14244 (f1 y14243))) 
    (and (= y14245 (f1 x14257)) (= x14257 (f1 y14247)) (= y14247 (f1 y14248)) (= y14248 (f1 y14245)))))))
(check-sat)
