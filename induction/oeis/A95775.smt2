(define-fun
  j8
  ((x Int)) Int x)
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int)) Int (div x 2))
(define-fun
  h6
  ((x Int)) Int (div x 2))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  g8
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v8
    ((x Int) (y Int) (z Int)) Int)
   (u8
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g8 (u8 (- x 1) y z) (v8 (- x 1) y z)))
   (ite (<= x 0) y (+ (u8 (- x 1) y z) (v8 (- x 1) y z)))))
(define-fun
  w8
  ((x Int)) Int (u8 x 1 x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (w8 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 1 (h7 x)))
(define-fun
  g3
  ((x Int)) Int (+ 1 x))
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (+ (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 x))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f6
  ((x Int)) Int (mod (+ (v7 x) x) 2))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 1 (h6 x)))
(define-fun
  f5
  ((x Int)) Int (+ (mod (+ (v6 x) x) 2) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 2 x))
(define-fun
  f4
  ((x Int)) Int (mod (- (mod (+ (+ (v5 x) x) x) 2) (mod x 2)) 2))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (h4 x)))
(define-fun
  f3
  ((x Int)) Int (mod (+ (v4 x) 1) 2))
(define-fun-rec
  t3
  ((x Int)) Int (ite (<= (f3 x) 0) x (t3 (+ x 1))))
(define-fun-rec
  u3
  ((x Int)) Int (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x)))
(define-fun
  f1
  ((x Int)) Int (+ (mod (w2 x) 2) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 (h1 x)))
(define-fun
  f0
  ((x Int)) Int (mod (+ (+ (v1 x) 1) x) 2))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v3 c)))))
