(define-fun
  h2
  ((x Int)) Int (+ 1 (+ (+ x x) x)))
(define-fun
  h0
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  g3
  ((x Int)) Int (div x 2))
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (+ x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  f2
  ((x Int)) Int
  (-
    (+ (mod (+ (ite (<= (- (mod (+ 1 (v3 x)) (+ 1 x)) 2) 0) 1 x) x) 2)
      x)
    1))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun
  fast
  ((x Int)) Int (+ (v2 x) 1))
(define-fun
  f1
  ((x Int)) Int (+ x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 2))
(define-fun
  f0
  ((x Int)) Int
  (+ (- (mod (+ (ite (<= (mod (- (v1 x) 1) (+ 2 x)) 0) 2 x) x) 2) 1)
    x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
