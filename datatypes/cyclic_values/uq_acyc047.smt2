(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T))
  (f4 (proj0f4 T)))))
(assert (exists ((y5213 T) (y5209 T) (y5208 T) (y5218 T) (y5212 T) (y5204 T) (y5207 T) (y5215 T) (y5201 T) (y5200 T) (y5203 T) (y5202 T) (y5216 T) (y5199 T) (y5210 T) (y5217 T) (y5197 T) (y5211 T)) (forall ((x5223 T) (x5221 T) (x5226 T) (x5227 T) (x5224 T) (x5219 T) (x5228 T)) 
  (or 
    (and (= y5197 (f2 x5221)) (= x5221 (f1 (f4 (f4 y5197)) y5199 (f1 (f3 x5226 x5226 x5226 x5226) (f3 x5226 x5226 x5226 x5226) x5226 x5226) x5226)) (= y5199 (f1 y5200 x5226 x5226 (f3 x5226 x5226 x5226 x5226))) (= y5200 (f2 y5197))) (= y5201 (f1 y5201 x5226 x5226 x5226)) 
    (and (= y5202 (f3 y5202 (f2 y5202) y5203 (f3 x5226 x5226 x5226 x5226))) (= y5203 (f2 y5202))) (= y5204 (f3 (f1 (f3 (f4 (f2 y5204)) x5226 (f4 x5226) x5226) (f2 (f1 x5226 x5226 (f4 x5226) (f3 x5226 x5226 x5226 x5226))) (f3 x5226 x5226 x5226 x5226) (f3 (f4 x5226) (f4 (f2 x5226)) (f1 x5226 x5226 x5226 x5226) (f4 (f1 x5226 x5226 x5226 x5226)))) (f3 (f4 (f3 (f1 y5204 x5226 x5226 x5226) (f1 x5226 x5226 x5226 x5226) x5226 (f1 x5226 x5226 x5226 x5226))) (f2 (f1 x5226 x5226 x5226 x5226)) (f1 (f2 y5204) x5226 (f4 x5226) x5226) x5226) (f4 (f4 (f3 x5226 x5226 x5226 x5226))) (f4 (f4 (f2 (f2 x5226)))))) (= x5224 (f2 x5224)) (= x5223 (f2 x5223)) 
    (and (= y5207 x5227) (= y5208 (f1 y5209 (f2 y5207) (f2 (f2 x5226)) (f3 x5226 x5226 x5226 x5226))) (= y5209 (f4 y5210)) (= y5210 (f1 y5207 x5226 x5226 x5226))) 
    (and (= y5211 (f4 y5212)) (= y5212 (f4 y5213)) (= y5213 (f2 y5211))) 
    (and (= x5228 (f1 y5215 (f4 x5228) x5226 x5226)) (= y5215 (f3 y5216 (f1 x5226 x5226 x5226 x5226) (f4 (f2 x5226)) (f2 (f3 x5226 x5226 (f2 x5226) x5226)))) (= y5216 (f1 y5217 (f2 x5226) (f4 (f4 x5226)) (f4 (f3 x5226 x5226 x5226 x5226)))) (= y5217 x5219) (= y5218 (f4 x5228)))))))
(check-sat)
