(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y7337 T) (y7355 T) (y7353 T) (y7334 T) (y7359 T) (y7352 T) (y7335 T) (y7356 T) (y7347 T) (y7331 T) (y7361 T) (y7333 T) (y7350 T) (y7332 T) (y7320 T) (y7321 T) (y7322 T) (y7323 T) (y7324 T) (y7325 T) (y7326 T) (y7327 T) (y7328 T) (y7329 T) (y7330 T) (y7357 T) (y7339 T) (y7338 T) (y7319 T) (y7318 T) (y7344 T) (y7346 T) (y7360 T) (y7343 T) (y7340 T) (y7341 T) (y7349 T) (y7315 T) (y7358 T) (y7316 T)) (forall ((x7363 T) (x7371 T) (x7365 T) (x7364 T) (x7367 T) (x7366 T) (x7369 T) (x7370 T)) 
  (or 
    (and (= y7315 (f1 y7315 y7315 x7369 x7369)) (= y7316 (f1 y7316 y7316 x7369 x7369)) (distinct y7315 y7316)) 
    (and (= x7366 (f1 x7366 x7369 x7369 x7369)) (= y7318 (f1 y7318 x7369 x7369 x7369)) (distinct x7366 y7318)) 
    (and (= y7319 (f2 y7321)) (= y7321 (f1 y7322 (f2 x7369) x7369 x7369)) (= y7322 (f3 y7323 y7319 (f3 x7369 x7369 x7369))) (= y7323 (f1 y7319 x7369 x7369 x7369)) (= y7320 (f2 y7324)) (= y7324 (f1 y7325 (f2 x7369) x7369 x7369)) (= y7325 (f3 y7326 y7320 (f3 x7369 x7369 x7369))) (= y7326 (f1 y7320 x7369 x7369 x7369)) (distinct y7319 y7320)) 
    (and (= y7327 (f3 y7329 x7369 x7369)) (= y7329 (f3 y7330 x7369 x7369)) (= y7330 (f3 y7327 x7369 x7369)) (= y7328 (f3 (f3 y7331 x7369 x7369) x7369 x7369)) (= y7331 (f3 y7328 x7369 x7369)) (distinct y7327 y7328)) 
    (and (= y7332 (f1 y7334 (f1 x7369 x7369 x7369 x7369) x7369 x7369)) (= y7334 (f3 y7332 x7369 x7369)) (= y7333 (f1 y7335 (f1 x7369 x7369 x7369 x7369) x7369 x7369)) (= y7335 (f3 y7333 x7369 x7369)) (distinct y7332 y7333)) 
    (and (= x7363 (f2 (f1 (f2 y7338) (f1 x7369 x7369 x7369 x7369) (f1 x7369 x7369 x7369 x7369) (f3 x7369 x7369 x7369)))) (= y7338 (f1 x7363 x7369 x7369 x7369)) (= y7337 (f2 y7339)) (= y7339 (f1 y7340 (f1 x7369 x7369 x7369 x7369) (f1 x7369 x7369 x7369 x7369) (f3 x7369 x7369 x7369))) (= y7340 (f2 y7341)) (= y7341 (f1 y7337 x7369 x7369 x7369)) (distinct x7363 y7337)) 
    (and (= x7367 (f1 y7344 x7369 x7369 (f1 x7369 x7369 x7369 x7369))) (= y7344 (f3 x7367 x7369 x7369)) (= y7343 (f1 x7365 x7369 x7369 (f1 x7369 x7369 x7369 x7369))) (= x7365 (f3 y7343 x7369 x7369)) (distinct x7367 y7343)) 
    (and (= y7346 (f1 x7371 x7369 x7369 x7369)) (= x7371 (f1 y7349 x7369 y7346 (f2 x7369))) (= y7349 (f3 y7350 x7369 x7369)) (= y7350 (f2 y7346)) (= y7347 (f1 x7370 x7369 x7369 x7369)) (= x7370 (f1 y7352 x7369 y7347 (f2 x7369))) (= y7352 (f3 y7353 x7369 x7369)) (= y7353 (f2 y7347)) (distinct y7346 y7347)) 
    (and (= x7364 (f2 x7364)) (= y7355 (f2 y7355)) (distinct x7364 y7355)) 
    (and (= y7356 (f1 y7358 y7356 (f1 x7369 x7369 x7369 x7369) (f2 (f3 x7369 x7369 x7369)))) (= y7358 (f2 y7359)) (= y7359 (f2 y7356)) (= y7357 (f1 y7360 y7357 (f1 x7369 x7369 x7369 x7369) (f2 (f3 x7369 x7369 x7369)))) (= y7360 (f2 y7361)) (= y7361 (f2 y7357)) (distinct y7356 y7357))))))
(check-sat)
