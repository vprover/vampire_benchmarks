
(set-logic UFLRA)

(declare-fun f (Real Real) Real)
(declare-fun g (Real Real) Real)
(declare-fun h (Real) Real)

(declare-const a1 Real)
(declare-const a2 Real)
(declare-const a3 Real)
(declare-const a4 Real)
(declare-const a5 Real)

(assert (forall ((x Real) (y Real)) (= (+ (g x y) x (- y)) 0.0) ))

(assert (forall ((y Real)
    (x1 Real)
    (x2 Real)
    (x3 Real)
    (x4 Real)
    (x5 Real)
  ) (or
    (> (+ (- (f x1 a1)) (g y x1)) 0.0)
    (> (+ (- (f x2 a2)) (g y x2)) 0.0)
    (> (+ (- (f x3 a3)) (g y x3)) 0.0)
    (> (+ (- (f x4 a4)) (g y x4)) 0.0)
    (> (+ (- (f x5 a5)) (g y x5)) 0.0)
    (> y 0.0)
)))

(assert (forall ((x Real) (y Real)) (or
  (> (+ (f x y) (- y)) 0.0)
  (= (+ (- (f x y)) y) 0.0)
  (not (= (+ (- (h x)) (h y)) 0.0))
)))

(check-sat)

