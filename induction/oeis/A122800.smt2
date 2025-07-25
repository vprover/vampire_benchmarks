(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u3 (- x 1) y) x)))
(define-fun
  j2
  ((x Int)) Int (div x 2))
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h2
  () Int (+ 1 2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (div (u3 x y) (+ 2 x)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 h2 2 (j2 x)))
(define-fun
  f1
  ((x Int)) Int (+ (w2 x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (mod (+ (+ (- (+ (* (div (+ (- (v1 x) x) 1) 2) x) 2) 1) x) x)
      (+ 2 x))
    x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (ite (<= (- (* y y) x) 0) 0 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(define-fun
  small
  ((x Int)) Int (+ (- (v0 x) x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
