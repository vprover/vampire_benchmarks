(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (exists ((y11380 T) (y11381 T) (y11383 T) (y11385 T) (y11386 T) (y11387 T) (y11388 T) (y11389 T) (y11371 T) (y11370 T) (y11359 T) (y11372 T) (y11375 T) (y11374 T) (y11377 T) (y11376 T) (y11353 T) (y11352 T) (y11351 T) (y11350 T) (y11357 T) (y11356 T) (y11354 T) (y11406 T) (y11404 T) (y11403 T) (y11402 T) (y11401 T) (y11400 T) (y11409 T) (y11408 T) (y11399 T) (y11398 T) (y11397 T) (y11396 T) (y11395 T) (y11394 T) (y11393 T) (y11373 T) (y11391 T) (y11390 T) (y11358 T) (y11349 T) (y11362 T) (y11360 T) (y11361 T) (y11366 T) (y11367 T) (y11365 T) (y11368 T) (y11369 T) (y11378 T) (y11392 T)) (forall ((x11419 T) (x11418 T) (x11413 T) (x11412 T) (x11411 T) (x11410 T) (x11417 T) (x11416 T) (x11415 T) (x11414 T)) 
  (or 
    (and (= y11349 (f1 y11351 (f1 PLACEHOLDER PLACEHOLDER))) (= y11351 (f1 y11349 PLACEHOLDER)) (= y11350 x11414) (= y11352 x11412) (distinct y11349 y11350)) 
    (and (= y11353 (f1 x11418 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)))) (= x11418 (f1 y11356 (f1 PLACEHOLDER PLACEHOLDER))) (= y11356 (f1 y11357 PLACEHOLDER)) (= y11357 (f1 y11358 (f1 PLACEHOLDER PLACEHOLDER))) (= y11358 (f1 y11353 PLACEHOLDER)) (= y11354 (f1 y11359 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)))) (= y11359 (f1 y11360 (f1 PLACEHOLDER PLACEHOLDER))) (= y11360 (f1 y11361 PLACEHOLDER)) (= y11361 (f1 y11362 (f1 PLACEHOLDER PLACEHOLDER))) (= y11362 (f1 y11354 PLACEHOLDER)) (distinct y11353 y11354)) 
    (and (= x11410 (f1 y11365 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y11365 (f1 y11366 (f1 PLACEHOLDER PLACEHOLDER))) (= y11366 (f1 x11410 PLACEHOLDER)) (= x11416 (f1 y11367 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y11367 (f1 y11368 (f1 PLACEHOLDER PLACEHOLDER))) (= y11368 (f1 x11416 PLACEHOLDER)) (distinct x11410 x11416)) 
    (and (= y11369 (f1 y11371 (f1 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER))) (= y11371 (f1 y11372 PLACEHOLDER)) (= y11372 (f1 y11373 PLACEHOLDER)) (= y11373 (f1 y11374 PLACEHOLDER)) (= y11374 (f1 y11369 PLACEHOLDER)) (= y11370 (f1 y11375 (f1 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER))) (= y11375 (f1 y11376 PLACEHOLDER)) (= y11376 (f1 y11377 PLACEHOLDER)) (= y11377 (f1 y11378 PLACEHOLDER)) (= y11378 (f1 y11370 PLACEHOLDER)) (distinct y11369 y11370)) 
    (and (= x11417 (f1 y11381 PLACEHOLDER)) (= y11381 (f1 x11417 PLACEHOLDER)) (= y11380 (f1 x11419 PLACEHOLDER)) (= x11419 (f1 y11380 PLACEHOLDER)) (distinct x11417 y11380)) 
    (and (= y11383 (f1 (f1 (f1 (f1 y11383 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER) (f1 PLACEHOLDER (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))))) (= x11411 (f1 y11385 (f1 PLACEHOLDER (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))))) (= y11385 (f1 y11386 PLACEHOLDER)) (= y11386 (f1 y11387 (f1 PLACEHOLDER PLACEHOLDER))) (= y11387 (f1 x11411 PLACEHOLDER)) (distinct y11383 x11411)) 
    (and (= y11388 (f1 y11390 PLACEHOLDER)) (= y11390 (f1 y11388 PLACEHOLDER)) (= y11389 (f1 y11391 PLACEHOLDER)) (= y11391 (f1 y11389 PLACEHOLDER)) (distinct y11388 y11389)) 
    (and (= y11392 (f1 y11394 (f1 PLACEHOLDER PLACEHOLDER))) (= y11394 (f1 y11395 (f1 PLACEHOLDER PLACEHOLDER))) (= y11395 (f1 y11392 PLACEHOLDER)) (= y11393 (f1 y11396 (f1 PLACEHOLDER PLACEHOLDER))) (= y11396 (f1 y11397 (f1 PLACEHOLDER PLACEHOLDER))) (= y11397 (f1 y11393 PLACEHOLDER)) (distinct y11392 y11393)) 
    (and (= y11398 (f1 y11400 (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y11400 (f1 y11401 PLACEHOLDER)) (= y11401 (f1 y11398 PLACEHOLDER)) (= y11399 (f1 y11402 (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y11402 (f1 y11403 PLACEHOLDER)) (= y11403 (f1 y11399 PLACEHOLDER)) (distinct y11398 y11399)) 
    (and (= y11404 (f1 y11406 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y11406 (f1 x11413 PLACEHOLDER)) (= x11413 (f1 y11404 PLACEHOLDER)) (= x11415 (f1 y11408 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y11408 (f1 y11409 PLACEHOLDER)) (= y11409 (f1 x11415 PLACEHOLDER)) (distinct y11404 x11415))))))
(check-sat)