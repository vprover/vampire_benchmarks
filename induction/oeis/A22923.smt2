(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int
  (+ (mod (div (+ (* 2 (+ x x)) x) (+ 1 (* 2 (+ 2 (+ 2 2))))) 2) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 x))
(define-fun
  fast
  ((x Int)) Int
  (+ (mod (mod (+ (mod (+ (v2 x) x) 2) 1) 2) (+ 1 x)) 2))
(define-fun
  f1
  ((x Int) (y Int)) Int (div x (+ 2 y)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  f0
  ((x Int)) Int
  (+ (mod (div (div (+ (div (+ (v1 x) x) 2) x) 2) 2) 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (+ (mod (mod (+ (+ (v0 x) 1) x) 2) (+ 1 x)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
