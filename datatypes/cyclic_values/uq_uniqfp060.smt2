(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T)))))
(assert (exists ((y6334 T) (y6337 T) (y6346 T) (y6369 T) (y6368 T) (y6349 T) (y6348 T) (y6363 T) (y6362 T) (y6361 T) (y6360 T) (y6367 T) (y6340 T) (y6365 T) (y6342 T) (y6338 T) (y6339 T) (y6380 T) (y6383 T) (y6382 T) (y6384 T) (y6345 T) (y6344 T) (y6347 T) (y6374 T) (y6375 T) (y6376 T) (y6377 T) (y6370 T) (y6371 T) (y6341 T) (y6333 T) (y6378 T) (y6335 T) (y6366 T) (y6343 T) (y6358 T) (y6359 T) (y6356 T) (y6357 T) (y6354 T) (y6352 T) (y6353 T) (y6350 T) (y6351 T)) (forall ((x6393 T) (x6392 T) (x6391 T) (x6390 T) (x6388 T) (x6389 T) (x6394 T) (x6385 T) (x6386 T) (x6387 T)) 
  (or 
    (and (= y6333 (f1 y6335 (f2 (f1 x6394 x6394 x6394)) (f2 x6394))) (= y6335 (f2 x6388)) (= x6388 (f1 y6337 y6333 x6394)) (= y6337 (f2 y6333)) (= y6334 (f1 y6338 (f2 (f1 x6394 x6394 x6394)) (f2 x6394))) (= y6338 (f2 y6339)) (= y6339 (f1 y6340 y6334 x6394)) (= y6340 (f2 y6334)) (distinct y6333 y6334)) 
    (and (= y6341 (f2 y6343)) (= y6343 (f1 y6344 x6392 (f1 x6394 x6394 (f1 x6394 x6394 x6394)))) (= y6344 (f2 y6345)) (= y6345 (f1 y6341 x6394 x6394)) (= y6342 (f2 y6346)) (= y6346 (f1 y6347 x6392 (f1 x6394 x6394 (f1 x6394 x6394 x6394)))) (= y6347 (f2 y6348)) (= y6348 x6387) (distinct y6341 y6342)) 
    (and (= y6349 (f1 y6351 y6349 (f2 (f2 (f1 x6394 x6394 x6394))))) (= y6351 (f2 y6352)) (= y6352 (f1 y6353 (f2 x6394) (f1 x6394 x6394 x6394))) (= y6353 (f2 y6354)) (= y6354 (f1 y6349 x6394 x6394)) (= y6350 (f1 (f2 (f1 (f2 (f1 y6350 x6394 x6394)) (f2 x6394) (f1 x6394 x6394 x6394))) y6350 (f2 (f2 (f1 x6394 x6394 x6394))))) (distinct y6349 y6350)) 
    (and (= x6391 (f1 x6391 y6357 (f1 x6394 x6394 x6394))) (= y6357 (f1 x6391 x6394 x6394)) (= y6356 (f1 y6356 y6358 (f1 x6394 x6394 x6394))) (= y6358 (f1 y6356 x6394 x6394)) (distinct x6391 y6356)) 
    (and (= y6359 (f1 y6359 x6394 x6394)) (= y6360 (f1 y6360 x6394 x6394)) (distinct y6359 y6360)) 
    (and (= y6361 (f1 y6363 (f1 x6394 x6394 x6394) (f2 (f2 x6394)))) (= y6363 (f2 x6389)) (= x6389 (f1 y6365 x6394 (f2 (f1 x6394 x6394 x6394)))) (= y6365 (f2 y6366)) (= y6366 (f1 y6361 x6394 x6394)) (= y6362 (f1 y6367 (f1 x6394 x6394 x6394) (f2 (f2 x6394)))) (= y6367 (f2 y6368)) (= y6368 (f1 y6369 x6394 (f2 (f1 x6394 x6394 x6394)))) (= y6369 (f2 y6370)) (= y6370 (f1 y6362 x6394 x6394)) (distinct y6361 y6362)) 
    (and (= y6371 (f2 x6393)) (= x6393 (f2 y6374)) (= y6374 (f2 y6375)) (= y6375 (f1 (f1 y6371 x6394 x6394) y6376 (f1 x6394 x6394 x6394))) (= y6376 (f1 y6371 y6371 x6394)) (= x6386 (f2 y6377)) (= y6377 (f2 y6378)) (= y6378 (f2 x6390)) (= x6390 (f1 (f1 x6386 x6394 x6394) y6380 (f1 x6394 x6394 x6394))) (= y6380 (f1 x6386 x6386 x6394)) (distinct y6371 x6386)) 
    (and (= x6385 (f1 x6385 x6385 x6394)) (= y6382 (f1 y6382 y6382 x6394)) (distinct x6385 y6382)) 
    (and (= y6383 (f2 y6383)) (= y6384 (f2 y6384)) (distinct y6383 y6384))))))
(check-sat)