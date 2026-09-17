
(set-logic UFLRA)

(declare-fun f (Real Real) Real)
(declare-fun g (Real Real) Real)
(declare-fun h (Real) Real)

(declare-const a1 Real)

(assert (forall ((x Real) (y Real)) (= (+ (g x y) x (- y)) 0.0) ))

(assert (forall ((y Real)
    (x1 Real)
  ) (or
    (> (+ (- (f x1 a1)) (g y x1)) 0.0)
    (> y 0.0)
)))

(assert (forall ((x Real) (y Real)) (or
  (> (+ (f x y) (- y)) 0.0)
  (= (+ (- (f x y)) y) 0.0)
  (not (= (+ (- (h x)) (h y)) 0.0))
)))

(check-sat)

