(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T)))))
(assert (exists ((y9410 T) (y9368 T) (y9412 T) (y9391 T) (y9400 T) (y9409 T) (y9374 T) (y9387 T) (y9402 T) (y9380 T) (y9381 T) (y9382 T) (y9383 T) (y9384 T) (y9392 T) (y9386 T) (y9390 T) (y9388 T) (y9389 T) (y9377 T) (y9376 T) (y9371 T) (y9373 T) (y9372 T) (y9397 T) (y9413 T) (y9411 T) (y9396 T) (y9401 T) (y9406 T) (y9375 T) (y9395 T) (y9403 T) (y9414 T) (y9405 T) (y9394 T) (y9399 T) (y9407 T) (y9393 T) (y9408 T) (y9378 T)) (forall ((x9419 T) (x9421 T) (x9422 T) (x9423 T) (x9424 T) (x9415 T) (x9417 T) (x9416 T)) 
  (or 
    (and (= y9368 (f3 x9416)) (= x9416 (f2 y9371 (f2 x9415 x9415 x9415) x9415)) (= y9371 (f3 y9368)) (= x9424 (f3 y9372)) (= y9372 (f2 y9373 (f2 x9415 x9415 x9415) x9415)) (= y9373 (f3 x9424)) (distinct y9368 x9424)) 
    (and (= y9374 (f3 y9374)) (= y9375 (f3 y9375)) (distinct y9374 y9375)) 
    (and (= y9376 (f1 (f3 y9378) (f3 (f3 x9415)) (f2 (f2 (f1 x9415 x9415 x9415) x9415 x9415) (f2 x9415 x9415 x9415) x9415))) (= y9378 (f2 (f1 y9376 x9415 x9415) x9423 (f2 (f1 x9415 x9415 x9415) (f2 x9415 x9415 x9415) (f2 x9415 x9415 x9415)))) (= x9423 (f1 y9380 x9415 (f2 x9415 x9415 x9415))) (= y9380 (f3 y9376)) (= y9377 (f1 (f3 y9381) (f3 (f3 x9415)) (f2 (f2 (f1 x9415 x9415 x9415) x9415 x9415) (f2 x9415 x9415 x9415) x9415))) (= y9381 (f2 (f1 y9377 x9415 x9415) y9382 (f2 (f1 x9415 x9415 x9415) (f2 x9415 x9415 x9415) (f2 x9415 x9415 x9415)))) (= y9382 (f1 y9383 x9415 (f2 x9415 x9415 x9415))) (= y9383 (f3 y9377)) (distinct y9376 y9377)) 
    (and (= y9384 x9422) (= x9417 (f3 y9386)) (= y9386 (f2 x9417 x9415 x9415)) (distinct y9384 x9417)) 
    (and (= y9387 (f3 y9389)) (= y9389 (f2 y9390 x9415 x9415)) (= y9390 (f2 (f3 y9387) y9391 (f2 x9415 x9415 x9415))) (= y9391 (f2 y9387 y9387 x9415)) (= y9388 (f3 y9392)) (= y9392 (f2 y9393 x9415 x9415)) (= y9393 (f2 (f3 y9388) y9394 (f2 x9415 x9415 x9415))) (= y9394 (f2 y9388 y9388 x9415)) (distinct y9387 y9388)) 
    (and (= y9395 (f3 y9397)) (= y9397 (f2 x9419 y9395 (f2 x9415 x9415 x9415))) (= x9419 (f2 y9395 x9415 x9415)) (= y9396 (f3 y9399)) (= y9399 (f2 y9400 y9396 (f2 x9415 x9415 x9415))) (= y9400 (f2 y9396 x9415 x9415)) (distinct y9395 y9396)) 
    (and (= y9401 (f3 y9403)) (= y9403 (f2 y9401 x9421 x9415)) (= x9421 (f2 y9405 x9415 x9415)) (= y9405 (f1 y9401 y9401 x9415)) (= y9402 (f3 y9406)) (= y9406 (f2 y9402 y9407 x9415)) (= y9407 (f2 y9408 x9415 x9415)) (= y9408 (f1 y9402 y9402 x9415)) (distinct y9401 y9402)) 
    (and (= y9409 (f3 y9411)) (= y9411 (f1 y9412 x9415 x9415)) (= y9412 (f1 y9409 x9415 x9415)) (= y9410 (f3 y9413)) (= y9413 (f1 y9414 x9415 x9415)) (= y9414 (f1 y9410 x9415 x9415)) (distinct y9409 y9410))))))
(check-sat)
