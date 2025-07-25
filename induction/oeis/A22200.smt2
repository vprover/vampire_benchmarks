(define-fun
  j38
  () Int (+ 2 2))
(define-fun
  h9
  ((x Int) (y Int)) Int y)
(define-fun
  h7
  ((x Int) (y Int)) Int y)
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h38
  ((x Int)) Int x)
(define-fun
  h37
  ((x Int) (y Int)) Int y)
(define-fun
  h35
  ((x Int) (y Int)) Int y)
(define-fun
  h33
  ((x Int) (y Int)) Int y)
(define-fun
  h31
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h29
  ((x Int) (y Int)) Int y)
(define-fun
  h27
  ((x Int) (y Int)) Int y)
(define-fun
  h25
  ((x Int) (y Int)) Int y)
(define-fun
  h16
  ((x Int)) Int x)
(define-fun
  h13
  ((x Int) (y Int)) Int y)
(define-fun
  h11
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g8
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g45
  ((x Int)) Int x)
(define-fun
  g44
  ((x Int)) Int x)
(define-fun
  g43
  ((x Int)) Int x)
(define-fun
  g42
  ((x Int)) Int x)
(define-fun
  g41
  ((x Int)) Int x)
(define-fun
  g40
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g39
  ((x Int)) Int x)
(define-fun
  g38
  ((x Int) (y Int)) Int (+ 1 (+ (+ y y) y)))
(define-fun
  g36
  ((x Int)) Int x)
(define-fun
  g34
  ((x Int)) Int x)
(define-fun
  g32
  ((x Int)) Int x)
(define-fun
  g30
  ((x Int)) Int x)
(define-fun
  g28
  ((x Int)) Int x)
(define-fun
  g26
  ((x Int)) Int x)
(define-fun
  g24
  ((x Int)) Int x)
(define-fun
  g23
  ((x Int)) Int x)
(define-fun
  g22
  ((x Int)) Int x)
(define-fun
  g21
  ((x Int)) Int x)
(define-fun
  g20
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g19
  ((x Int)) Int x)
(define-fun
  g18
  ((x Int)) Int x)
(define-fun
  g17
  ((x Int)) Int x)
(define-fun
  g15
  ((x Int) (y Int)) Int y)
(define-fun
  g14
  ((x Int)) Int x)
(define-fun
  g12
  ((x Int)) Int x)
(define-fun
  g10
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f45
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u45
  ((x Int) (y Int)) Int (ite (<= x 0) y (f45 (u45 (- x 1) y))))
(define-fun
  v45
  ((x Int)) Int (u45 x 1))
(define-fun
  f44
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u44
  ((x Int) (y Int)) Int (ite (<= x 0) y (f44 (u44 (- x 1) y))))
(define-fun
  v44
  ((x Int)) Int (u44 x 1))
(define-fun
  f43
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u43
  ((x Int) (y Int)) Int (ite (<= x 0) y (f43 (u43 (- x 1) y))))
(define-fun
  v43
  ((x Int)) Int (u43 x 1))
(define-fun
  f42
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u42
  ((x Int) (y Int)) Int (ite (<= x 0) y (f42 (u42 (- x 1) y))))
(define-fun
  v42
  ((x Int)) Int (u42 x 1))
(define-fun
  f41
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u41
  ((x Int) (y Int)) Int (ite (<= x 0) y (f41 (u41 (- x 1) y))))
(define-fun
  v41
  ((x Int)) Int (u41 x 1))
(define-fun
  f40
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u40
  ((x Int) (y Int)) Int (ite (<= x 0) y (f40 (u40 (- x 1) y))))
(define-fun
  v40
  ((x Int)) Int (u40 x 1))
(define-fun
  f39
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u39
  ((x Int) (y Int)) Int (ite (<= x 0) y (f39 (u39 (- x 1) y))))
(define-fun
  v39
  ((x Int)) Int (u39 x 1))
(define-fun
  f38
  ((x Int) (y Int)) Int (+ (+ (* 2 (* 2 (+ x x))) x) y))
(define-funs-rec
  ((u38
    ((x Int) (y Int) (z Int)) Int)
   (v38
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f38 (u38 (- x 1) y z) (v38 (- x 1) y z)))
   (ite (<= x 0) z (g38 (u38 (- x 1) y z) (v38 (- x 1) y z)))))
(define-fun
  w38
  ((x Int)) Int (u38 x 1 j38))
(define-fun
  f37
  ((x Int)) Int (* (w38 x) (v39 x)))
(define-fun-rec
  u37
  ((x Int) (y Int)) Int (ite (<= x 0) y (f37 (u37 (- x 1) y))))
(define-fun
  v37
  ((x Int) (y Int)) Int (u37 1 y))
(define-fun
  f36
  ((x Int) (y Int)) Int (+ (v37 x y) x))
(define-fun-rec
  u36
  ((x Int) (y Int)) Int (ite (<= x 0) y (f36 (u36 (- x 1) y) x)))
(define-fun
  v36
  ((x Int)) Int (u36 x 1))
(define-fun
  f35
  ((x Int)) Int (* (v36 x) (v40 x)))
(define-fun-rec
  u35
  ((x Int) (y Int)) Int (ite (<= x 0) y (f35 (u35 (- x 1) y))))
(define-fun
  v35
  ((x Int) (y Int)) Int (u35 1 y))
(define-fun
  f34
  ((x Int) (y Int)) Int (+ (v35 x y) x))
(define-fun-rec
  u34
  ((x Int) (y Int)) Int (ite (<= x 0) y (f34 (u34 (- x 1) y) x)))
(define-fun
  v34
  ((x Int)) Int (u34 x 1))
(define-fun
  f33
  ((x Int)) Int (* (v34 x) (v41 x)))
(define-fun-rec
  u33
  ((x Int) (y Int)) Int (ite (<= x 0) y (f33 (u33 (- x 1) y))))
(define-fun
  v33
  ((x Int) (y Int)) Int (u33 1 y))
(define-fun
  f32
  ((x Int) (y Int)) Int (+ (v33 x y) x))
(define-fun-rec
  u32
  ((x Int) (y Int)) Int (ite (<= x 0) y (f32 (u32 (- x 1) y) x)))
(define-fun
  v32
  ((x Int)) Int (u32 x 1))
(define-fun
  f31
  ((x Int)) Int (* (v32 x) (v42 x)))
(define-fun-rec
  u31
  ((x Int) (y Int)) Int (ite (<= x 0) y (f31 (u31 (- x 1) y))))
(define-fun
  v31
  ((x Int) (y Int)) Int (u31 1 y))
(define-fun
  f30
  ((x Int) (y Int)) Int (+ (v31 x y) x))
(define-fun-rec
  u30
  ((x Int) (y Int)) Int (ite (<= x 0) y (f30 (u30 (- x 1) y) x)))
(define-fun
  v30
  ((x Int)) Int (u30 x 1))
(define-fun
  f29
  ((x Int)) Int (* (v30 x) (v43 x)))
(define-fun-rec
  u29
  ((x Int) (y Int)) Int (ite (<= x 0) y (f29 (u29 (- x 1) y))))
(define-fun
  v29
  ((x Int) (y Int)) Int (u29 1 y))
(define-fun
  f28
  ((x Int) (y Int)) Int (+ (v29 x y) x))
(define-fun-rec
  u28
  ((x Int) (y Int)) Int (ite (<= x 0) y (f28 (u28 (- x 1) y) x)))
(define-fun
  v28
  ((x Int)) Int (u28 x 1))
(define-fun
  f27
  ((x Int)) Int (* (v28 x) (v44 x)))
(define-fun-rec
  u27
  ((x Int) (y Int)) Int (ite (<= x 0) y (f27 (u27 (- x 1) y))))
(define-fun
  v27
  ((x Int) (y Int)) Int (u27 1 y))
(define-fun
  f26
  ((x Int) (y Int)) Int (+ (v27 x y) x))
(define-fun-rec
  u26
  ((x Int) (y Int)) Int (ite (<= x 0) y (f26 (u26 (- x 1) y) x)))
(define-fun
  v26
  ((x Int)) Int (u26 x 1))
(define-fun
  f25
  ((x Int)) Int (* (v26 x) (v45 x)))
(define-fun-rec
  u25
  ((x Int) (y Int)) Int (ite (<= x 0) y (f25 (u25 (- x 1) y))))
(define-fun
  v25
  ((x Int) (y Int)) Int (u25 1 y))
(define-fun
  f24
  ((x Int) (y Int)) Int (+ (v25 x y) x))
(define-fun-rec
  u24
  ((x Int) (y Int)) Int (ite (<= x 0) y (f24 (u24 (- x 1) y) x)))
(define-fun
  v24
  ((x Int)) Int (u24 x 1))
(define-fun
  f23
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u23
  ((x Int) (y Int)) Int (ite (<= x 0) y (f23 (u23 (- x 1) y))))
(define-fun
  v23
  ((x Int)) Int (u23 x 1))
(define-fun
  f22
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u22
  ((x Int) (y Int)) Int (ite (<= x 0) y (f22 (u22 (- x 1) y))))
(define-fun
  v22
  ((x Int)) Int (u22 x 1))
(define-fun
  f21
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u21
  ((x Int) (y Int)) Int (ite (<= x 0) y (f21 (u21 (- x 1) y))))
(define-fun
  v21
  ((x Int)) Int (u21 x 1))
(define-fun
  f20
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u20
  ((x Int) (y Int)) Int (ite (<= x 0) y (f20 (u20 (- x 1) y))))
(define-fun
  v20
  ((x Int)) Int (u20 x 1))
(define-fun
  f19
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u19
  ((x Int) (y Int)) Int (ite (<= x 0) y (f19 (u19 (- x 1) y))))
(define-fun
  v19
  ((x Int)) Int (u19 x 1))
(define-fun
  f18
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u18
  ((x Int) (y Int)) Int (ite (<= x 0) y (f18 (u18 (- x 1) y))))
(define-fun
  v18
  ((x Int)) Int (u18 x 1))
(define-fun
  f17
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u17
  ((x Int) (y Int)) Int (ite (<= x 0) y (f17 (u17 (- x 1) y))))
(define-fun
  v17
  ((x Int)) Int (u17 x 1))
(define-fun
  f16
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u16
  ((x Int) (y Int)) Int (ite (<= x 0) y (f16 (u16 (- x 1) y))))
(define-fun
  v16
  ((x Int)) Int (u16 2 x))
(define-fun
  f15
  ((x Int)) Int (+ 1 (v16 x)))
(define-fun-rec
  u15
  ((x Int) (y Int)) Int (ite (<= x 0) y (f15 (u15 (- x 1) y))))
(define-fun
  v15
  ((x Int) (y Int)) Int (u15 y 1))
(define-fun
  f14
  ((x Int) (y Int)) Int (+ (+ (+ (v15 x y) x) x) x))
(define-fun-rec
  u14
  ((x Int) (y Int)) Int (ite (<= x 0) y (f14 (u14 (- x 1) y) x)))
(define-fun
  v14
  ((x Int)) Int (u14 x 1))
(define-fun
  f13
  ((x Int)) Int (* (v14 x) (v17 x)))
(define-fun-rec
  u13
  ((x Int) (y Int)) Int (ite (<= x 0) y (f13 (u13 (- x 1) y))))
(define-fun
  v13
  ((x Int) (y Int)) Int (u13 1 y))
(define-fun
  f12
  ((x Int) (y Int)) Int (+ (v13 x y) x))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (f12 (u12 (- x 1) y) x)))
(define-fun
  v12
  ((x Int)) Int (u12 x 1))
(define-fun
  f11
  ((x Int)) Int (* (v12 x) (v18 x)))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (f11 (u11 (- x 1) y))))
(define-fun
  v11
  ((x Int) (y Int)) Int (u11 1 y))
(define-fun
  f10
  ((x Int) (y Int)) Int (+ (v11 x y) x))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y) x)))
(define-fun
  v10
  ((x Int)) Int (u10 x 1))
(define-fun
  f9
  ((x Int)) Int (* (v10 x) (v19 x)))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int) (y Int)) Int (u9 1 y))
(define-fun
  f8
  ((x Int) (y Int)) Int (+ (v9 x y) x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y) x)))
(define-fun
  v8
  ((x Int)) Int (u8 x 1))
(define-fun
  f7
  ((x Int)) Int (* (v8 x) (v20 x)))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int) (y Int)) Int (u7 1 y))
(define-fun
  f6
  ((x Int) (y Int)) Int (+ (v7 x y) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun
  f5
  ((x Int)) Int (* (v6 x) (v21 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 1 y))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (v5 x y) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  f3
  ((x Int)) Int (* (v4 x) (v22 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (v3 x y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int)) Int (* (v2 x) (v23 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v24 c)))))
