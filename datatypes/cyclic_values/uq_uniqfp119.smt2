(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (exists ((y13328 T) (y13324 T) (y13325 T) (y13326 T) (y13327 T) (y13323 T) (y13368 T) (y13346 T) (y13348 T) (y13361 T) (y13360 T) (y13347 T) (y13344 T) (y13363 T) (y13364 T) (y13343 T) (y13340 T) (y13341 T) (y13345 T) (y13342 T) (y13365 T) (y13366 T) (y13367 T) (y13339 T) (y13338 T) (y13370 T) (y13333 T) (y13331 T) (y13330 T) (y13337 T) (y13336 T) (y13335 T) (y13334 T) (y13359 T) (y13358 T) (y13354 T) (y13356 T) (y13351 T) (y13350 T) (y13353 T) (y13352 T) (y13362 T) (y13369 T)) (forall ((x13376 T) (x13371 T) (x13372 T) (x13378 T) (x13379 T) (x13380 T)) 
  (or 
    (and (= y13323 (f1 y13325 (f1 x13379 x13379 x13379) (f1 x13379 x13379 (f1 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379))))) (= y13325 (f1 y13326 (f1 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379) x13379) (f1 x13379 x13379 x13379))) (= y13326 (f1 y13327 x13379 (f1 x13379 x13379 x13379))) (= y13327 (f1 y13323 x13379 x13379)) (= y13324 (f1 y13328 (f1 x13379 x13379 x13379) (f1 x13379 x13379 (f1 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379))))) (= y13328 (f1 x13376 (f1 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379) x13379) (f1 x13379 x13379 x13379))) (= x13376 (f1 y13330 x13379 (f1 x13379 x13379 x13379))) (= y13330 (f1 y13324 x13379 x13379)) (distinct y13323 y13324)) 
    (and (= y13331 (f1 y13333 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379))) (= y13333 (f1 y13331 x13379 x13379)) (= x13378 (f1 y13334 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379))) (= y13334 (f1 x13378 x13379 x13379)) (distinct y13331 x13378)) 
    (and (= y13335 (f1 (f1 (f1 (f1 y13335 x13379 x13379) (f1 y13335 x13379 x13379) (f1 x13379 x13379 x13379)) (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379)) y13335 (f1 x13379 (f1 x13379 (f1 x13379 x13379 x13379) x13379) (f1 x13379 (f1 x13379 x13379 x13379) x13379)))) (= y13336 (f1 y13337 y13336 (f1 x13379 (f1 x13379 (f1 x13379 x13379 x13379) x13379) (f1 x13379 (f1 x13379 x13379 x13379) x13379)))) (= y13337 (f1 y13338 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379))) (= y13338 (f1 (f1 y13336 x13379 x13379) y13339 (f1 x13379 x13379 x13379))) (= y13339 (f1 y13336 x13379 x13379)) (distinct y13335 y13336)) 
    (and (= y13340 (f1 (f1 (f1 (f1 (f1 y13340 x13379 x13379) (f1 x13379 x13379 x13379) x13379) (f1 x13379 x13379 x13379) (f1 x13379 x13379 (f1 x13379 x13379 x13379))) (f1 x13379 x13379 x13379) (f1 (f1 x13379 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379)) (f1 x13379 (f1 x13379 x13379 x13379) x13379) (f1 x13379 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379)))) y13342 (f1 (f1 x13379 (f1 (f1 x13379 x13379 x13379) x13379 (f1 x13379 x13379 x13379)) (f1 x13379 x13379 x13379)) (f1 x13379 x13379 (f1 x13379 x13379 x13379)) x13379))) (= y13342 (f1 y13343 x13379 (f1 x13379 x13379 (f1 (f1 x13379 x13379 x13379) x13379 (f1 x13379 x13379 x13379))))) (= y13343 (f1 y13344 (f1 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379) x13379) (f1 x13379 x13379 x13379))) (= y13344 (f1 y13345 x13379 (f1 x13379 x13379 x13379))) (= y13345 (f1 y13340 x13379 x13379)) (= y13341 (f1 (f1 (f1 (f1 (f1 y13341 x13379 x13379) (f1 x13379 x13379 x13379) x13379) (f1 x13379 x13379 x13379) (f1 x13379 x13379 (f1 x13379 x13379 x13379))) (f1 x13379 x13379 x13379) (f1 (f1 x13379 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379)) (f1 x13379 (f1 x13379 x13379 x13379) x13379) (f1 x13379 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379)))) (f1 y13346 x13379 (f1 x13379 x13379 (f1 (f1 x13379 x13379 x13379) x13379 (f1 x13379 x13379 x13379)))) (f1 (f1 x13379 (f1 (f1 x13379 x13379 x13379) x13379 (f1 x13379 x13379 x13379)) (f1 x13379 x13379 x13379)) (f1 x13379 x13379 (f1 x13379 x13379 x13379)) x13379))) (= y13346 (f1 y13347 (f1 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379) x13379) (f1 x13379 x13379 x13379))) (= y13347 (f1 y13348 x13379 (f1 x13379 x13379 x13379))) (= y13348 (f1 y13341 x13379 x13379)) (distinct y13340 y13341)) 
    (and (= x13380 (f1 y13351 (f1 x13380 x13379 x13379) (f1 (f1 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379)) (f1 x13379 x13379 x13379) (f1 (f1 x13379 x13379 x13379) x13379 (f1 x13379 x13379 x13379))))) (= y13351 (f1 y13352 (f1 x13379 (f1 x13379 x13379 x13379) x13379) (f1 (f1 x13379 x13379 x13379) x13379 x13379))) (= y13352 (f1 y13353 x13379 (f1 x13379 x13379 x13379))) (= y13353 (f1 x13380 x13379 x13379)) (= y13350 (f1 (f1 (f1 y13354 x13379 (f1 x13379 x13379 x13379)) (f1 x13379 (f1 x13379 x13379 x13379) x13379) (f1 (f1 x13379 x13379 x13379) x13379 x13379)) (f1 y13350 x13379 x13379) (f1 (f1 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379)) (f1 x13379 x13379 x13379) (f1 (f1 x13379 x13379 x13379) x13379 (f1 x13379 x13379 x13379))))) (= y13354 (f1 y13350 x13379 x13379)) (distinct x13380 y13350)) 
    (and (= x13371 (f1 (f1 x13372 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379)) (f1 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379)) (f1 x13379 x13379 (f1 x13379 x13379 x13379)))) (= x13372 (f1 x13371 x13379 x13379)) (= y13356 (f1 (f1 y13358 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379)) (f1 (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379) (f1 x13379 x13379 x13379)) (f1 x13379 x13379 (f1 x13379 x13379 x13379)))) (= y13358 (f1 y13356 x13379 x13379)) (distinct x13371 y13356)) 
    (and (= y13359 (f1 y13361 (f1 y13359 x13379 x13379) (f1 x13379 x13379 x13379))) (= y13361 (f1 (f1 (f1 y13359 x13379 x13379) x13379 (f1 x13379 x13379 x13379)) y13362 (f1 x13379 x13379 x13379))) (= y13362 (f1 y13363 x13379 (f1 x13379 x13379 x13379))) (= y13363 (f1 y13359 x13379 x13379)) (= y13360 (f1 y13364 (f1 y13360 x13379 x13379) (f1 x13379 x13379 x13379))) (= y13364 (f1 (f1 (f1 y13360 x13379 x13379) x13379 (f1 x13379 x13379 x13379)) y13365 (f1 x13379 x13379 x13379))) (= y13365 (f1 y13366 x13379 (f1 x13379 x13379 x13379))) (= y13366 (f1 y13360 x13379 x13379)) (distinct y13359 y13360)) 
    (and (= y13367 (f1 y13369 (f1 x13379 x13379 x13379) x13379)) (= y13369 (f1 y13367 y13367 x13379)) (= y13368 (f1 y13370 (f1 x13379 x13379 x13379) x13379)) (= y13370 (f1 y13368 y13368 x13379)) (distinct y13367 y13368))))))
(check-sat)
