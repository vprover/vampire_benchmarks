(define-fun
  h2
  ((x Int)) Int (+ x x))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ x x))
(define-fun
  f2
  ((x Int)) Int
  (+
    (mod (+ (div (- (div x (+ 2 (* 2 (* 2 (+ 2 2))))) x) (+ 2 2)) x) 2)
    x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (mod (mod (+ (v2 x) 1) 2) (+ 1 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ 2 (+ (div (* y y) x) y)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
