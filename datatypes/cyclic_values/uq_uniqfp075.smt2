(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y8387 T) (y8386 T) (y8385 T) (y8369 T) (y8368 T) (y8381 T) (y8380 T) (y8365 T) (y8367 T) (y8366 T) (y8361 T) (y8389 T) (y8362 T) (y8383 T) (y8382 T) (y8397 T) (y8376 T) (y8400 T) (y8401 T) (y8402 T) (y8404 T) (y8405 T) (y8407 T) (y8408 T) (y8409 T) (y8374 T) (y8390 T) (y8391 T) (y8392 T) (y8394 T) (y8395 T) (y8378 T) (y8379 T) (y8398 T) (y8399 T) (y8377 T) (y8375 T) (y8372 T) (y8370 T) (y8371 T) (y8388 T) (y8410 T)) (forall ((x8413 T) (x8411 T) (x8416 T) (x8417 T) (x8414 T) (x8415 T) (x8418 T) (x8419 T) (x8420 T)) 
  (or 
    (and (= y8361 (f1 x8414)) (= x8414 (f1 x8420)) (= x8420 (f1 y8361)) (= y8362 (f1 (f1 (f1 y8362)))) (distinct y8361 y8362)) 
    (and (= y8365 (f1 (f1 y8365))) (= y8366 (f1 y8367)) (= y8367 (f1 y8366)) (distinct y8365 y8366)) 
    (and (= y8368 (f1 y8370)) (= y8370 (f1 y8371)) (= y8371 (f1 y8372)) (= y8372 (f1 y8368)) (= y8369 (f1 x8415)) (= x8415 (f1 y8374)) (= y8374 (f1 y8375)) (= y8375 (f1 y8369)) (distinct y8368 y8369)) 
    (and (= y8376 (f1 y8378)) (= y8378 (f1 y8379)) (= y8379 (f1 y8380)) (= y8380 (f1 y8381)) (= y8381 (f1 y8376)) (= y8377 (f1 y8382)) (= y8382 (f1 y8383)) (= y8383 (f1 x8411)) (= x8411 (f1 y8385)) (= y8385 (f1 y8377)) (distinct y8376 y8377)) 
    (and (= y8386 (f1 y8388)) (= y8388 (f1 y8389)) (= y8389 (f1 y8386)) (= y8387 (f1 y8390)) (= y8390 (f1 y8391)) (= y8391 (f1 y8387)) (distinct y8386 y8387)) 
    (and (= y8392 (f1 y8392)) (= x8418 x8417) (distinct y8392 x8418)) 
    (and (= y8394 (f1 x8416)) (= x8416 (f1 y8397)) (= y8397 (f1 y8398)) (= y8398 (f1 y8394)) (= y8395 (f1 y8399)) (= y8399 (f1 y8400)) (= y8400 (f1 y8401)) (= y8401 (f1 y8395)) (distinct y8394 y8395)) 
    (and (= y8402 (f1 (f1 (f1 y8404)))) (= y8404 (f1 y8402)) (= x8419 (f1 y8405)) (= y8405 (f1 x8413)) (= x8413 (f1 y8407)) (= y8407 (f1 x8419)) (distinct y8402 x8419)) 
    (and (= y8408 (f1 (f1 (f1 y8408)))) (= y8409 (f1 (f1 y8410))) (= y8410 (f1 y8409)) (distinct y8408 y8409))))))
(check-sat)
