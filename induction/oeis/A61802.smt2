(define-fun
  j5
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i0
  ((x Int)) Int (+ 1 x))
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g9
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  g8
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g7
  ((x Int) (y Int)) Int y)
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g5
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g4
  ((x Int)) Int (div x 2))
(define-fun
  g3
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f9
  ((x Int)) Int (+ x x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int)) Int (u9 (g9 x) 2))
(define-fun
  f8
  ((x Int)) Int (mod (- 1 (v9 x)) (+ 1 x)))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 (g8 x) x))
(define-fun
  f7
  ((x Int)) Int (- (v8 x) 2))
(define-fun-rec
  t7
  ((x Int)) Int (ite (<= (f7 x) 0) x (t7 (+ x 1))))
(define-fun-rec
  u7
  ((x Int)) Int (ite (<= x 0) (t7 0) (t7 (+ (u7 (- x 1)) 1))))
(define-fun
  v7
  ((x Int) (y Int)) Int (u7 y))
(define-fun
  f6
  ((x Int) (y Int)) Int (+ (v7 x y) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 y x))
(define-funs-rec
  ((u5
    ((x Int) (y Int) (z Int)) Int)
   (v5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v6 (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z)))))
(define-fun
  w5
  ((x Int)) Int (u5 2 1 x))
(define-fun
  fast
  ((x Int)) Int (- (+ (+ (+ (w5 x) 2) x) x) 2))
(define-fun
  f4
  ((x Int)) Int (+ x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) 1))
(define-fun
  f3
  ((x Int)) Int (mod (- 1 (v4 x)) (+ 1 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun
  f2
  ((x Int)) Int (- (v3 x) 2))
(define-fun-rec
  t2
  ((x Int)) Int (ite (<= (f2 x) 0) x (t2 (+ x 1))))
(define-fun-rec
  u2
  ((x Int)) Int (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (v2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v1 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 (i0 x) x))
(define-fun
  small
  ((x Int)) Int (+ (w0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
