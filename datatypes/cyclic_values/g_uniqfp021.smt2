(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (exists ((y2262 T) (y2263 T) (y2260 T) (y2261 T) (y2266 T) (y2259 T) (y2264 T) (y2258 T) (y2268 T) (y2265 T) (y2273 T) (y2272 T) (y2271 T) (y2270 T) (y2269 T) (y2267 T)) 
  (or 
    (and (= y2258 (f1 y2260 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y2260 (f1 y2258 PLACEHOLDER PLACEHOLDER)) (= y2259 (f1 y2261 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y2261 (f1 y2259 PLACEHOLDER PLACEHOLDER)) (distinct y2258 y2259)) 
    (and (= y2262 (f1 y2262 PLACEHOLDER PLACEHOLDER)) (= y2263 (f1 y2263 PLACEHOLDER PLACEHOLDER)) (distinct y2262 y2263)) 
    (and (= y2264 (f1 y2266 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y2266 (f1 y2267 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y2267 (f1 y2264 PLACEHOLDER PLACEHOLDER)) (= y2265 (f1 y2268 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y2268 (f1 y2269 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y2269 (f1 y2265 PLACEHOLDER PLACEHOLDER)) (distinct y2264 y2265)) 
    (and (= y2270 (f1 y2270 PLACEHOLDER PLACEHOLDER)) (= y2271 (f1 y2271 PLACEHOLDER PLACEHOLDER)) (distinct y2270 y2271)) 
    (and (= y2272 (f1 y2272 PLACEHOLDER PLACEHOLDER)) (= y2273 (f1 y2273 PLACEHOLDER PLACEHOLDER)) (distinct y2272 y2273)))))
(check-sat)
