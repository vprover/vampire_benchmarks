(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T)))))
(assert (exists ((y19244 T) (y19249 T) (y19246 T) (y19248 T) (y19234 T) (y19235 T) (y19236 T) (y19237 T) (y19230 T) (y19231 T) (y19222 T) (y19228 T) (y19238 T) (y19229 T) (y19245 T) (y19223 T) (y19218 T) (y19219 T) (y19241 T) (y19240 T) (y19243 T) (y19242 T) (y19216 T) (y19217 T) (y19214 T) (y19239 T) (y19220 T) (y19221 T)) (forall ((x19259 T) (x19258 T) (x19255 T) (x19254 T) (x19256 T) (x19251 T) (x19250 T) (x19253 T) (x19252 T)) 
  (or 
    (and (= y19214 (f1 (f3 (f2 (f1 (f3 y19214) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) y19214 y19216 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f1 PLACEHOLDER (f3 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f2 PLACEHOLDER PLACEHOLDER (f3 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y19216 (f4 y19217 PLACEHOLDER (f3 PLACEHOLDER))) (= y19217 (f1 y19214 PLACEHOLDER PLACEHOLDER)) (= x19258 (f1 y19218 (f1 PLACEHOLDER (f3 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f2 PLACEHOLDER PLACEHOLDER (f3 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y19218 (f3 y19219)) (= y19219 (f2 (f1 (f3 x19258) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) x19258 y19220 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y19220 (f4 y19221 PLACEHOLDER (f3 PLACEHOLDER))) (= y19221 (f1 x19258 PLACEHOLDER PLACEHOLDER)) (distinct y19214 x19258)) 
    (and (= y19222 (f1 x19254 PLACEHOLDER PLACEHOLDER)) (= x19254 (f1 y19222 PLACEHOLDER PLACEHOLDER)) (= y19223 (f1 x19259 PLACEHOLDER PLACEHOLDER)) (= x19259 (f1 y19223 PLACEHOLDER PLACEHOLDER)) (distinct y19222 y19223)) 
    (and (= x19252 (f4 y19228 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y19228 (f2 y19229 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER))) (= y19229 (f3 x19252)) (= x19253 (f4 y19230 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y19230 (f2 y19231 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER))) (= y19231 (f3 x19253)) (distinct x19252 x19253)) 
    (and (= x19256 (f2 (f2 (f4 (f4 y19234 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 PLACEHOLDER) (f4 (f1 (f3 PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f1 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f3 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f4 PLACEHOLDER PLACEHOLDER (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f3 (f3 x19256)) PLACEHOLDER PLACEHOLDER)) (= y19234 (f4 x19256 PLACEHOLDER PLACEHOLDER)) (= x19255 (f2 (f2 y19235 (f3 PLACEHOLDER) (f4 (f1 (f3 PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f1 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f3 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f4 PLACEHOLDER PLACEHOLDER (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f3 (f3 x19255)) PLACEHOLDER PLACEHOLDER)) (= y19235 (f4 y19236 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y19236 x19251) (= y19237 (f4 x19255 PLACEHOLDER PLACEHOLDER)) (distinct x19256 x19255)) 
    (and (= y19238 (f4 y19238 y19238 PLACEHOLDER)) (= y19239 (f4 y19239 y19239 PLACEHOLDER)) (distinct y19238 y19239)) 
    (and (= y19240 (f4 y19242 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f4 (f2 PLACEHOLDER (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER PLACEHOLDER) (f4 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f4 PLACEHOLDER (f3 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER)))))) (= y19242 (f1 y19243 (f4 PLACEHOLDER (f4 PLACEHOLDER PLACEHOLDER (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f3 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y19243 (f2 (f3 y19240) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y19244 PLACEHOLDER)) (= y19244 (f1 y19245 PLACEHOLDER PLACEHOLDER)) (= y19245 (f1 y19240 PLACEHOLDER PLACEHOLDER)) (= y19241 (f4 y19246 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f4 (f2 PLACEHOLDER (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER PLACEHOLDER) (f4 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f4 PLACEHOLDER (f3 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER)))))) (= y19246 (f1 x19250 (f4 PLACEHOLDER (f4 PLACEHOLDER PLACEHOLDER (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f3 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= x19250 (f2 (f3 y19241) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y19248 PLACEHOLDER)) (= y19248 (f1 y19249 PLACEHOLDER PLACEHOLDER)) (= y19249 (f1 y19241 PLACEHOLDER PLACEHOLDER)) (distinct y19240 y19241))))))
(check-sat)