(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T)))))
(assert (exists ((y9344 T) (y9345 T) (y9346 T) (y9347 T) (y9340 T) (y9341 T) (y9342 T) (y9336 T) (y9339 T) (y9338 T) (y9343 T) (y9348 T) (y9349 T) (y9353 T) (y9337 T) (y9352 T) (y9351 T) (y9350 T) (y9355 T) (y9354 T)) 
  (or 
    (and (= y9336 (f1 y9336 PLACEHOLDER y9336 PLACEHOLDER)) (= y9337 (f1 y9337 PLACEHOLDER y9337 PLACEHOLDER)) (distinct y9336 y9337)) 
    (and (= y9338 (f2 y9340 (f1 (f2 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER)))) (= y9340 (f1 (f2 y9338 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) y9341 (f2 PLACEHOLDER PLACEHOLDER))) (= y9341 (f2 y9342 PLACEHOLDER)) (= y9342 (f1 y9338 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y9339 (f2 y9343 (f1 (f2 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER)))) (= y9343 (f1 (f2 y9339 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) y9344 (f2 PLACEHOLDER PLACEHOLDER))) (= y9344 (f2 y9345 PLACEHOLDER)) (= y9345 (f1 y9339 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y9338 y9339)) 
    (and (= y9346 (f1 y9348 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y9348 (f1 y9346 y9346 PLACEHOLDER PLACEHOLDER)) (= y9347 (f1 y9349 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y9349 (f1 y9347 y9347 PLACEHOLDER PLACEHOLDER)) (distinct y9346 y9347)) 
    (and (= y9350 (f2 y9350 PLACEHOLDER)) (= y9351 (f2 y9351 PLACEHOLDER)) (distinct y9350 y9351)) 
    (and (= y9352 (f1 y9352 (f2 y9352 PLACEHOLDER) y9354 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y9354 (f2 y9355 PLACEHOLDER)) (= y9355 (f1 y9352 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y9353 (f1 y9353 (f2 y9353 PLACEHOLDER) (f2 (f1 y9353 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (distinct y9352 y9353)))))
(check-sat)