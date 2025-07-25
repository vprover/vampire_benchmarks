(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-fun lam (Int) fun13)
(declare-fun lam2 (Int) fun13)
(declare-fun lam3 (Int) fun13)
(declare-fun lam4 (Int) fun13)
(declare-fun lam5 (Int) fun13)
(declare-fun lam6 (Int) fun13)
(declare-fun lam7 (Int) fun13)
(declare-fun lam8 (Int) fun13)
(declare-fun lam9 (Int) fun13)
(declare-fun lam10 (Int) fun13)
(declare-fun lam11 (Int) fun13)
(declare-fun lam12 (Int) fun13)
(declare-fun lam13 (Int) fun13)
(declare-fun lam14 (Int) fun13)
(declare-fun lam15 (Int) fun13)
(declare-fun lam16 (Int) fun13)
(declare-fun lam17 (Int) fun13)
(declare-fun lam18 (Int) fun13)
(declare-fun lam19 (Int) fun13)
(declare-fun lam20 (Int) fun13)
(declare-const lam21 fun13)
(declare-const lam22 fun13)
(declare-const lam23 fun13)
(declare-const lam24 fun13)
(declare-const lam25 fun13)
(declare-const lam26 fun13)
(declare-fun lam27 (Int) fun13)
(declare-fun lam28 (Int) fun13)
(declare-fun lam29 (Int) fun13)
(declare-fun lam30 (Int) fun13)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Bool)
(declare-fun apply13 (fun13 Int) Bool)
(define-fun-rec
  filter2
  ((p fun12) (x list)) list
  (match x
    ((nil nil)
     ((cons y xs)
      (ite (apply12 p y) (cons y (filter2 p xs)) (filter2 p xs))))))
(define-fun-rec
  filter
  ((p fun13) (x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs)
      (ite (apply13 p y) (cons2 y (filter p xs)) (filter p xs))))))
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
(define-fun-rec
  ++2
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++2 xs y))))))
(define-fun-rec
  ++
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++ xs y))))))
(define-fun-rec
  qsort
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs)
      (++ (qsort (filter (lam y) xs))
        (++ (cons2 y nil2) (qsort (filter (lam2 y) xs))))))))
(assert
  (forall ((y Int) (z Int)) (= (apply13 (lam y) z) (<= z y))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam2 y) x2) (> x2 y))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam3 x) z) (<= x z))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam4 x) z) (> x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam5 x) x2) (<= x x2))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam6 y) x2) (> y x2))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam7 y) x2) (<= y x2))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam8 x) x2) (> x x2))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam9 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam10 x) x2) (<= x x2))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam11 y) x2) (<= y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam12 y) x3) (<= y x3))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam13 y) x2) (<= y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam14 y) x3) (<= y x3))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam15 x) z) (> x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam16 x) x2) (> x x2))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam17 y) x2) (> y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam18 y) x3) (> y x3))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam19 y) x2) (> y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam20 y) x3) (> y x3))))
(assert (forall ((y Int)) (= (apply13 lam21 y) (<= 1 y))))
(assert (forall ((y Int)) (= (apply13 lam22 y) (> 1 y))))
(assert (forall ((y Int)) (= (apply13 lam23 y) (<= 1 y))))
(assert (forall ((z Int)) (= (apply13 lam24 z) (<= 1 z))))
(assert (forall ((y Int)) (= (apply13 lam25 y) (> 1 y))))
(assert (forall ((z Int)) (= (apply13 lam26 z) (> 1 z))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam27 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam28 x) x2) (<= x x2))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam29 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam30 x) x2) (> x x2))))
(assert-not
  (forall ((x Int) (xs list2))
    (= (count2 x (qsort xs)) (count2 x xs))))
(assert-claim (= (qsort nil2) nil2))
(assert-claim (forall ((y list)) (= (++2 y nil) y)))
(assert-claim (forall ((y list)) (= (++2 nil y) y)))
(assert-claim (forall ((y sk)) (= (count y nil) 0)))
(assert-claim (forall ((y fun12)) (= (filter2 y nil) nil)))
(assert-claim (forall ((x list2)) (= (qsort (qsort x)) (qsort x))))
(assert-claim
  (forall ((x Int) (y list2)) (= (count2 x (qsort y)) (count2 x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (qsort (++ y x)) (qsort (++ x y)))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (qsort (filter x y)) (filter x (qsort y)))))
(assert-claim
  (forall ((x Int)) (= (qsort (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (=> (> x z) (= (<= z (count2 x y)) (<= z 0)))))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (=> (> x z) (= (> z (count2 x y)) (<= 1 z)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++2 z x2)) (++2 (cons y z) x2))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (count y (++2 x2 z)) (count y (++2 z x2)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (> y x) (= (count2 y (cons2 x z)) (count2 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (> x y) (= (count2 y (cons2 x z)) (count2 y z)))))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 list))
    (= (filter2 z (filter2 y x2)) (filter2 y (filter2 z x2)))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (filter2 y (filter2 y z)) (filter2 y z))))
(assert-claim
  (forall ((y sk) (z list))
    (= (+ 1 (count y z)) (count y (cons y z)))))
(assert-claim (forall ((y sk) (z list)) (<= 0 (count y z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y nil)) (count y (cons z nil)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (qsort (++ x (qsort y))) (qsort (++ x y)))))
(assert-claim
  (forall ((x list2)) (= (count2 0 (cons2 1 x)) (count2 0 x))))
(assert-claim
  (forall ((x list2)) (= (count2 1 (cons2 0 x)) (count2 1 x))))
(assert-claim
  (forall ((x Int))
    (= (qsort (cons2 x (cons2 x nil2))) (cons2 x (cons2 x nil2)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (qsort (cons2 x (cons2 y nil2))) (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 x (filter (lam3 x) y)) (count2 x y))))
(assert-claim
  (forall ((x Int) (y list2)) (= (count2 x (filter (lam4 x) y)) 0)))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (count2 y (filter (lam5 x) z)) (count2 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x) (= (count2 x (filter (lam6 y) z)) 0))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (> y x) (= (count2 x (filter (lam7 y) z)) 0))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (> x y) (= (count2 y (filter (lam8 x) z)) (count2 y z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam9 x) (cons2 x y)) (cons2 x (filter (lam10 x) y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (filter (lam11 y) (cons2 x z))
        (cons2 x (filter (lam12 y) z))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (> y x)
      (= (filter (lam13 y) (cons2 x z)) (filter (lam14 y) z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam15 x) (cons2 x y)) (filter (lam16 x) y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (filter (lam17 y) (cons2 x z)) (filter (lam18 y) z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (> y x)
      (= (filter (lam19 y) (cons2 x z))
        (cons2 x (filter (lam20 y) z))))))
(assert-claim
  (forall ((x list2)) (= (count2 0 (filter lam21 x)) 0)))
(assert-claim
  (forall ((x list2)) (= (count2 0 (filter lam22 x)) (count2 0 x))))
(assert-claim
  (forall ((x list2))
    (= (filter lam23 (cons2 0 x)) (filter lam24 x))))
(assert-claim
  (forall ((x list2))
    (= (filter lam25 (cons2 0 x)) (cons2 0 (filter lam26 x)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (+ (count y z) (count y x2)) (count y (++2 z x2)))))
(assert-claim
  (forall ((y fun12) (z list) (x2 list))
    (= (++2 (filter2 y z) (filter2 y x2)) (filter2 y (++2 z x2)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (count2 (+ y y) x) y) (<= (count2 y x) (+ y y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (> (count2 (+ y y) x) y) (> (count2 y x) (+ y y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 x (cons2 (+ x x) y)) (count2 x (cons2 0 y)))))
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
  (forall ((x Int) (y list2))
    (= (<= (+ x x) (count2 1 y)) (<= (+ x x) (count2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (count2 x (cons2 0 y)) x) (> (+ x x) (count2 x y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (count2 y (cons2 1 x)) y) (<= (count2 y (++ x x)) y))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (count2 1 x) (+ y y)) (<= (count2 (+ y 1) x) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (> x (count2 x (cons2 0 y))) (> x (count2 x y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (> y (count2 y (cons2 1 x))) (> y 1))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (> x (count2 (+ x 1) y)) (> x (count2 (+ x x) y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (> x (count2 0 (cons2 x y))) (> x (count2 0 y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (> (count2 x (cons2 0 y)) x) (<= (+ x x) (count2 x y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (> (count2 y (cons2 1 x)) y) (> (count2 y (++ x x)) y))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (> (count2 1 x) (+ y y)) (> (count2 (+ y 1) x) y))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y (cons y nil)))
      (count y (cons z (cons z nil))))))
(assert-claim
  (forall ((y sk) (z fun12) (x2 sk))
    (= (count x2 (filter2 z (cons y nil)))
      (count y (filter2 z (cons x2 nil))))))
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
  (forall ((x Int) (y Int))
    (= (<= x (count2 y (cons2 1 nil2)))
      (<= x (count2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 (+ 1 1) y)) (<= x (count2 (+ x x) y)))))
(assert-claim
  (forall ((y Int) (z Int) (x2 sk) (x3 sk))
    (= (<= (count2 y (cons2 z nil2)) 1)
      (<= (count x2 (cons x3 nil)) 1))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= (count2 x (cons2 0 nil2)) y)
      (<= (count2 x (cons2 y nil2)) y))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (> x (count2 y (cons2 1 nil2)))
      (> x (count2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (> x (count2 (+ 1 1) y)) (> x (count2 (+ x x) y)))))
(assert-claim
  (forall ((y sk) (z sk)) (not (> (count y (cons z nil)) 1))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam27 x) (qsort (cons2 x y)))
      (cons2 x (filter (lam28 x) (qsort y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam29 x) (filter (lam30 x) y)) nil2)))
