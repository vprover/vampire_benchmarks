(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y3356 T) (y3338 T) (y3339 T) (y3352 T) (y3353 T) (y3354 T) (y3351 T) (y3348 T) (y3349 T) (y3336 T) (y3342 T) (y3350 T) (y3340 T) (y3341 T) (y3346 T) (y3347 T) (y3345 T)) (forall ((x3365 T) (x3364 T) (x3367 T) (x3366 T) (x3361 T) (x3363 T) (x3362 T) (x3358 T)) 
  (or 
    (and (= x3358 (f2 x3358 x3358 PLACEHOLDER)) (= y3336 (f2 y3336 y3336 PLACEHOLDER)) (distinct x3358 y3336)) 
    (and (= x3362 (f3 y3339 x3362 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3339 x3361) (= y3340 (f1 x3362 x3362 PLACEHOLDER)) (= y3338 (f3 y3341 y3338 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3341 (f2 y3342 PLACEHOLDER PLACEHOLDER)) (= y3342 (f1 y3338 y3338 PLACEHOLDER)) (distinct x3362 y3338)) 
    (and (= x3367 x3363) (= x3365 (f1 x3365 PLACEHOLDER PLACEHOLDER)) (distinct x3367 x3365)) 
    (and (= y3345 (f3 (f2 y3347 (f3 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f2 y3345 PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y3347 (f1 y3348 PLACEHOLDER PLACEHOLDER)) (= y3348 (f3 y3345 y3345 PLACEHOLDER)) (= y3346 (f3 y3349 (f1 (f2 y3346 PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y3349 (f2 y3350 (f3 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3350 (f1 y3351 PLACEHOLDER PLACEHOLDER)) (= y3351 (f3 y3346 y3346 PLACEHOLDER)) (distinct y3345 y3346)) 
    (and (= y3352 (f3 y3354 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3354 (f2 x3364 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= x3364 (f3 y3352 PLACEHOLDER PLACEHOLDER)) (= y3353 (f3 y3356 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3356 (f2 x3366 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= x3366 (f3 y3353 PLACEHOLDER PLACEHOLDER)) (distinct y3352 y3353))))))
(check-sat)