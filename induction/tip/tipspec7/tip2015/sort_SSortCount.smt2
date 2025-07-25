(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-sort fun14 0)
(declare-sort fun15 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-fun lam (Int) fun15)
(declare-const lam2 fun14)
(declare-fun lam3 (Int list2) fun15)
(declare-fun lam4 (Int list2) fun15)
(declare-fun lam5 (Int) fun15)
(declare-const lam6 fun14)
(declare-fun lam7 (Int) fun15)
(declare-const lam8 fun14)
(declare-fun lam9 (Int) fun15)
(declare-const lam10 fun14)
(declare-fun lam11 (Int) fun15)
(declare-const lam12 fun14)
(declare-fun lam13 (Int) fun15)
(declare-const lam14 fun14)
(declare-fun lam15 (Int) fun15)
(declare-const lam16 fun14)
(declare-fun lam17 (Int) fun15)
(declare-const lam18 fun14)
(declare-fun lam19 (Int) fun15)
(declare-const lam20 fun14)
(declare-fun lam21 (Int) fun15)
(declare-const lam22 fun14)
(declare-fun lam23 (Int) fun15)
(declare-const lam24 fun14)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) fun13)
(declare-fun apply13 (fun13 sk) Bool)
(declare-fun apply14 (fun14 Int) fun15)
(declare-fun apply15 (fun15 Int) Bool)
(define-fun-rec
  ssort-minimum1
  ((x Int) (y list2)) Int
  (match y
    ((nil2 x)
     ((cons2 y1 ys1)
      (ite (<= y1 x) (ssort-minimum1 y1 ys1) (ssort-minimum1 x ys1))))))
(define-fun-rec
  deleteBy2
  ((x fun12) (y sk) (z list)) list
  (match z
    ((nil nil)
     ((cons y2 ys)
      (ite
        (apply13 (apply12 x y) y2) ys (cons y2 (deleteBy2 x y ys)))))))
(define-fun-rec
  deleteBy
  ((x fun14) (y Int) (z list2)) list2
  (match z
    ((nil2 nil2)
     ((cons2 y2 ys)
      (ite
        (apply15 (apply14 x y) y2) ys (cons2 y2 (deleteBy x y ys)))))))
(define-fun-rec
  ssort
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y ys)
      (let ((m (ssort-minimum1 y ys)))
        (cons2 m (ssort (deleteBy lam2 m (cons2 y ys)))))))))
(define-fun-rec
  count2
  ((x Int) (y list2)) Int
  (match y
    ((nil2 0)
     ((cons2 z ys) (ite (= x z) (+ 1 (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x sk) (y list)) Int
  (match y
    ((nil 0)
     ((cons z ys) (ite (= x z) (+ 1 (count x ys)) (count x ys))))))
(assert (forall ((z Int)) (= (apply14 lam2 z) (lam z))))
(assert
  (forall ((z Int) (x2 Int)) (= (apply15 (lam z) x2) (= z x2))))
(assert
  (forall ((x Int) (z list2) (x3 Int))
    (= (apply15 (lam3 x z) x3)
      (<= (ssort-minimum1 (count2 x z) z) x3))))
(assert
  (forall ((y Int) (z list2) (x3 Int))
    (= (apply15 (lam4 y z) x3)
      (<= (ssort-minimum1 (count2 y z) z) x3))))
(assert (forall ((z Int)) (= (apply14 lam6 z) (lam5 z))))
(assert
  (forall ((z Int) (x2 Int)) (= (apply15 (lam5 z) x2) (<= z x2))))
(assert (forall ((x2 Int)) (= (apply14 lam8 x2) (lam7 x2))))
(assert
  (forall ((x2 Int) (x3 Int)) (= (apply15 (lam7 x2) x3) (<= x2 x3))))
(assert (forall ((x2 Int)) (= (apply14 lam10 x2) (lam9 x2))))
(assert
  (forall ((x2 Int) (x3 Int)) (= (apply15 (lam9 x2) x3) (<= x2 x3))))
(assert (forall ((x4 Int)) (= (apply14 lam12 x4) (lam11 x4))))
(assert
  (forall ((x4 Int) (x5 Int))
    (= (apply15 (lam11 x4) x5) (<= x4 x5))))
(assert (forall ((z Int)) (= (apply14 lam14 z) (lam13 z))))
(assert
  (forall ((z Int) (x2 Int)) (= (apply15 (lam13 z) x2) (<= z x2))))
(assert (forall ((x2 Int)) (= (apply14 lam16 x2) (lam15 x2))))
(assert
  (forall ((x2 Int) (x3 Int))
    (= (apply15 (lam15 x2) x3) (<= x2 x3))))
(assert (forall ((y Int)) (= (apply14 lam18 y) (lam17 y))))
(assert
  (forall ((y Int) (z Int)) (= (apply15 (lam17 y) z) (<= y z))))
(assert (forall ((y Int)) (= (apply14 lam20 y) (lam19 y))))
(assert
  (forall ((y Int) (z Int)) (= (apply15 (lam19 y) z) (<= y z))))
(assert (forall ((x2 Int)) (= (apply14 lam22 x2) (lam21 x2))))
(assert
  (forall ((x2 Int) (x3 Int))
    (= (apply15 (lam21 x2) x3) (<= x2 x3))))
(assert (forall ((z Int)) (= (apply14 lam24 z) (lam23 z))))
(assert
  (forall ((z Int) (x2 Int)) (= (apply15 (lam23 z) x2) (<= z x2))))
(assert-not
  (forall ((x Int) (xs list2))
    (= (count2 x (ssort xs)) (count2 x xs))))
(assert-claim (= (ssort nil2) nil2))
(assert-claim (forall ((y sk)) (= (count y nil) 0)))
(assert-claim (forall ((x list2)) (= (ssort (ssort x)) (ssort x))))
(assert-claim (forall ((x Int)) (= (ssort-minimum1 x nil2) x)))
(assert-claim
  (forall ((x Int) (y list2)) (= (count2 x (ssort y)) (count2 x y))))
(assert-claim
  (forall ((y fun12) (z sk)) (= (deleteBy2 y z nil) nil)))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 x (ssort y)) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Int)) (= (ssort (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (<= y (ssort-minimum1 x z)) (<= y (ssort-minimum1 y z))))))
(assert-claim
  (forall ((x list2) (y Int)) (<= (ssort-minimum1 y x) y)))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (=> (<= x z) (<= (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (ssort-minimum1 y (cons2 x z)) (ssort-minimum1 x (cons2 y z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 x (cons2 x y)) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (ssort-minimum1 y (cons2 x z)) (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (ssort-minimum1 (ssort-minimum1 x z) y)
      (ssort-minimum1 (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 (ssort-minimum1 x y) y) (ssort-minimum1 x y))))
(assert-claim
  (forall ((y sk) (z list))
    (= (+ 1 (count y z)) (count y (cons y z)))))
(assert-claim (forall ((y sk) (z list)) (<= 0 (count y z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y nil)) (count y (cons z nil)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort (cons2 x (ssort y))) (ssort (cons2 x y)))))
(assert-claim
  (forall ((x list2))
    (= (ssort-minimum1 (count2 0 x) x) (ssort-minimum1 0 x))))
(assert-claim
  (forall ((x list2)) (= (count2 0 (cons2 1 x)) (count2 0 x))))
(assert-claim
  (forall ((x list2)) (= (count2 1 (cons2 0 x)) (count2 1 x))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list2))
    (=> (<= z x)
      (= (ssort (cons2 z (cons2 y x2)))
        (ssort (cons2 y (cons2 z x2)))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort (cons2 (ssort-minimum1 x y) y))
      (cons2 (ssort-minimum1 x y) (ssort y)))))
(assert-claim
  (forall ((x fun14) (y Int) (z list2))
    (= (ssort (deleteBy x y (ssort z))) (deleteBy x y (ssort z)))))
(assert-claim
  (forall ((x Int))
    (= (ssort (cons2 x (cons2 x nil2))) (cons2 x (cons2 x nil2)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (ssort (cons2 x (cons2 y nil2))) (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2) (x2 Int))
    (= (apply15 (lam3 x z) x2) (apply15 (lam4 y z) x2))))
(assert-claim
  (forall ((x Int) (y list2)) (= (deleteBy lam6 x (cons2 x y)) y)))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (deleteBy lam8 x (cons2 y z)) z))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (deleteBy lam10 (ssort-minimum1 x z) z)
      (deleteBy lam12 (ssort-minimum1 y z) z))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 x (deleteBy lam14 x y)) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (ssort-minimum1 y (deleteBy lam16 x z)) (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x list2))
    (= (count2 0 (deleteBy lam18 1 x)) (count2 0 x))))
(assert-claim
  (forall ((x list2))
    (= (deleteBy lam20 1 (cons2 0 x)) (cons2 0 (deleteBy lam22 1 x)))))
(assert-claim
  (forall ((x Int) (y fun15) (z Int) (x2 list2))
    (= (apply15 y (ssort-minimum1 (count2 x x2) x2))
      (apply15 y (ssort-minimum1 (count2 z x2) x2)))))
(assert-claim
  (forall ((x Int) (y fun14) (z Int) (x2 list2) (x3 Int))
    (= (apply15 (apply14 y (ssort-minimum1 (count2 x x2) x2)) x3)
      (apply15 (apply14 y (ssort-minimum1 (count2 z x2) x2)) x3))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (<= x (ssort-minimum1 x (cons2 y z)))
      (<= x (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (count2 (+ y y) x) y) (<= (count2 y x) (+ y y)))))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (= (<= (ssort-minimum1 x y) (ssort-minimum1 z y))
      (<= (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (ssort-minimum1 (count2 y x) x) y)
      (<= (ssort-minimum1 0 x) y))))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (= (<= (ssort-minimum1 (count2 z y) y) z)
      (<= (ssort-minimum1 (count2 x y) y) z))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list))
    (= (count y (cons x2 (cons z x3)))
      (count y (cons z (cons x2 x3))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 x (cons2 (+ x x) y)) (count2 x (cons2 0 y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2) (x2 list2))
    (= (count2 (ssort-minimum1 (count2 x z) z) x2)
      (count2 (ssort-minimum1 (count2 y z) z) x2))))
(assert-claim
  (forall ((x list2) (y Int) (z list2) (x2 list2))
    (= (count2 (ssort-minimum1 (count2 y x) x2) x2)
      (count2 (ssort-minimum1 (count2 y z) x2) x2))))
(assert-claim
  (forall ((x Int) (y Int) (z list2) (x2 list2))
    (= (ssort-minimum1 x (cons2 (ssort-minimum1 y x2) z))
      (ssort-minimum1 x (cons2 (ssort-minimum1 y z) x2)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 (+ x (count2 x y)) y) (ssort-minimum1 x y))))
(assert-claim
  (forall ((y Int) (z list2) (x2 sk) (x3 list) (x4 list2))
    (= (ssort-minimum1 (count2 (count2 y z) x4) x4)
      (ssort-minimum1 (count2 (count x2 x3) x4) x4))))
(assert-claim
  (forall ((x Int) (y Int) (z list2) (x2 list2))
    (= (ssort-minimum1 (count2 (count2 x x2) z) x2)
      (ssort-minimum1 (count2 (count2 y x2) z) x2))))
(assert-claim
  (forall ((x Int) (y Int) (z list2) (x2 list2))
    (= (ssort-minimum1 (ssort-minimum1 (count2 x z) z) x2)
      (ssort-minimum1 (ssort-minimum1 (count2 y z) z) x2))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 x (cons2 0 y))) (<= x (count2 x y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= y (count2 y (cons2 1 x))) (<= y 1))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 (+ x 1) y)) (<= x (count2 (+ x x) y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 0 (cons2 x y))) (<= x (count2 0 y)))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (<= x (count2 (ssort-minimum1 1 y) z))
      (<= x (count2 (ssort-minimum1 x y) z)))))
(assert-claim
  (forall ((x list2) (y Int) (z list2))
    (= (<= y (ssort-minimum1 (count2 1 x) z))
      (<= y (ssort-minimum1 0 z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (+ x x) (ssort-minimum1 0 y))
      (<= (+ x x) (ssort-minimum1 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (+ x x) (ssort-minimum1 1 y))
      (<= (+ x x) (ssort-minimum1 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= 0 (ssort-minimum1 (+ x x) y)) (<= 0 (ssort-minimum1 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= 1 (ssort-minimum1 (+ x x) y)) (<= 1 (ssort-minimum1 x y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (count2 1 x) (+ y y)) (<= (count2 (+ y 1) x) y))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (count2 (ssort-minimum1 0 x) x) y)
      (<= (count2 (ssort-minimum1 y x) x) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (ssort-minimum1 (+ x x) y) 0) (<= (ssort-minimum1 x y) 0))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (ssort-minimum1 (+ x 1) y) x)
      (<= 1 (count2 (ssort-minimum1 x y) y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (ssort-minimum1 0 x) (+ y y))
      (<= (ssort-minimum1 y x) (+ y y)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y (cons y nil)))
      (count y (cons z (cons z nil))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (count2 x (cons2 (+ y x) nil2)) (count2 y (cons2 0 nil2)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 x (cons2 (+ x 1) y)) (count2 x y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 (+ x x) (cons2 0 y)) (count2 (+ x x) (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 (+ x x) (cons2 1 y)) (count2 (+ x x) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 (+ x 1) (cons2 x y)) (count2 (+ x 1) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 0 (cons2 (+ x x) y)) (count2 0 (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 1 (cons2 (+ x x) y)) (count2 1 y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 (+ 1 (ssort-minimum1 x y)) y)
      (ssort-minimum1 (+ x 1) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ssort-minimum1 (count2 (count2 0 y) x) y)
      (ssort-minimum1 (count2 0 x) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ssort-minimum1 (count2 (ssort-minimum1 0 y) x) y)
      (ssort-minimum1 (count2 0 x) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ssort-minimum1 (ssort-minimum1 (count2 1 x) y) y)
      (ssort-minimum1 (count2 (ssort-minimum1 1 y) x) y))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (+ x (ssort-minimum1 y (cons2 0 nil2)))
      (ssort-minimum1 x (cons2 (+ x y) nil2)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 (+ 1 1) y)) (<= x (count2 (+ x x) y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (+ x (ssort-minimum1 x y)) 0)
      (<= (+ x (ssort-minimum1 0 y)) 0))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= 0 (+ x (ssort-minimum1 x y)))
      (<= 0 (+ x (ssort-minimum1 0 y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= 1 (+ x (ssort-minimum1 x y)))
      (<= 1 (+ x (ssort-minimum1 0 y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (count2 0 y) (ssort-minimum1 x y))
      (<= 1 (ssort-minimum1 (+ x 1) y)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= (count2 x (cons2 0 nil2)) y)
      (<= (count2 x (cons2 y nil2)) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (<= (ssort-minimum1 0 x) (ssort-minimum1 1 y))
      (<= (ssort-minimum1 0 x) (ssort-minimum1 0 y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count2 1 (cons2 (ssort-minimum1 0 x) y)) (count2 1 y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count2 (ssort-minimum1 0 x) (cons2 1 y))
      (count2 (ssort-minimum1 0 x) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 (count2 0 (cons2 x y)) y)
      (ssort-minimum1 (count2 x (cons2 0 nil2)) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (deleteBy lam24 x (ssort (cons2 x y))) (ssort y))))
