(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T)))))
(assert (exists ((y16257 T) (y16255 T) (y16254 T) (y16253 T) (y16252 T) (y16271 T) (y16259 T) (y16258 T) (y16248 T) (y16260 T) (y16268 T) (y16269 T) (y16266 T) (y16267 T) (y16264 T) (y16265 T) (y16244 T) (y16245 T) (y16246 T) (y16247 T)) (forall ((x16281 T) (x16280 T) (x16278 T) (x16279 T) (x16276 T) (x16277 T) (x16274 T) (x16275 T) (x16272 T) (x16273 T)) 
  (or 
    (and (= y16244 (f2 y16245 (f1 y16244) (f2 (f2 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER)) PLACEHOLDER) (f2 (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER)) PLACEHOLDER))) (= y16245 x16272) (= y16246 (f1 y16247)) (= y16247 (f2 y16244 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y16248 (f1 x16279)) (= x16279 (f1 y16248))) 
    (and (= x16273 (f2 (f1 x16273) PLACEHOLDER x16277 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= x16277 (f1 y16252)) (= y16252 (f2 x16273 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y16253 (f2 y16253 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) 
    (and (= y16254 (f1 (f2 (f2 (f2 y16254 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) y16255 PLACEHOLDER) (f1 (f1 PLACEHOLDER)) (f2 (f1 PLACEHOLDER) (f1 PLACEHOLDER) PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y16255 (f2 y16254 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= x16274 x16276) 
    (and (= y16257 (f2 (f1 y16257) PLACEHOLDER y16258 PLACEHOLDER)) (= y16258 (f2 y16259 (f1 PLACEHOLDER) PLACEHOLDER (f2 (f1 PLACEHOLDER) (f1 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER)))) (= y16259 (f2 y16260 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y16260 (f2 y16257 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= x16281 (f1 (f1 (f1 x16275)))) (= x16275 (f2 x16281 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= x16278 (f1 y16264)) (= y16264 (f1 y16265)) (= y16265 (f1 y16266)) (= y16266 (f2 x16278 PLACEHOLDER y16267 (f1 PLACEHOLDER))) (= y16267 (f1 x16278))) 
    (and (= y16268 (f2 y16269 (f1 y16268) (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f1 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y16269 (f2 x16280 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER) (f2 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER) (f1 PLACEHOLDER) (f1 PLACEHOLDER)))) (= x16280 (f1 y16271)) (= y16271 (f1 y16268)))))))
(check-sat)
