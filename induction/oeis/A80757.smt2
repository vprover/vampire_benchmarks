(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int
  (+ (mod (div (+ (div x (+ 2 (* 2 (+ 2 (+ 2 2))))) x) 2) 2) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 x))
(define-fun
  fast
  ((x Int)) Int (+ (mod (+ (+ (v2 x) 1) x) 2) (ite (<= x 0) 0 1)))
(define-fun
  f1
  ((x Int)) Int (* 2 (+ 1 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  f0
  ((x Int)) Int (+ (mod (div (+ (div x v1) x) 2) 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (+ (mod (+ (+ (v0 x) 1) x) 2) (ite (<= x 0) 0 1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
