(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T)))))
(assert (exists ((y10181 T) (y10180 T) (y10174 T) (y10175 T) (y10176 T) (y10177 T) (y10170 T) (y10171 T) (y10172 T) (y10173 T) (y10185 T) (y10184 T) (y10178 T) (y10179 T) (y10183 T) (y10182 T)) 
  (or (= y10170 (f2 y10170 y10170 PLACEHOLDER)) 
    (and (= y10171 (f1 y10172 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y10172 (f2 y10173 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y10173 (f1 y10171 PLACEHOLDER PLACEHOLDER))) 
    (and (= y10174 (f1 (f1 y10174 (f1 y10175 (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER) (f1 (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) PLACEHOLDER)) (= y10175 (f2 y10176 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y10176 (f1 y10174 PLACEHOLDER PLACEHOLDER))) 
    (and (= y10177 (f1 y10178 PLACEHOLDER PLACEHOLDER)) (= y10178 (f1 y10179 PLACEHOLDER PLACEHOLDER)) (= y10179 (f1 y10177 PLACEHOLDER PLACEHOLDER))) (= y10180 (f1 y10180 PLACEHOLDER PLACEHOLDER)) 
    (and (= y10181 (f1 y10182 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y10182 (f2 y10183 PLACEHOLDER PLACEHOLDER)) (= y10183 (f2 y10184 (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER)) (= y10184 (f2 y10185 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y10185 (f1 y10181 PLACEHOLDER PLACEHOLDER))))))
(check-sat)
