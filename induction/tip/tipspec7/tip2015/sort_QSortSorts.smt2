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
(declare-fun lam21 (Int) fun13)
(declare-fun lam22 (Int) fun13)
(declare-fun lam23 (Int) fun13)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Bool)
(declare-fun apply13 (fun13 Int) Bool)
(define-fun-rec
  ordered
  ((x list2)) Bool
  (match x
    ((nil2 true)
     ((cons2 y z)
      (match z
        ((nil2 true)
         ((cons2 y2 xs) (and (<= y y2) (ordered (cons2 y2 xs))))))))))
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
  (forall ((x Int) (x2 Int)) (= (apply13 (lam4 x) x2) (<= x x2))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam5 y) x2) (<= y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam6 y) x3) (<= y x3))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam7 y) x2) (<= y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam8 y) x3) (<= y x3))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam9 x) z) (> x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam10 x) x2) (> x x2))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam11 y) x2) (> y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam12 y) x3) (> y x3))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam13 y) x2) (> y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam14 y) x3) (> y x3))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam15 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam16 x) x2) (<= x x2))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam17 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam18 x) x2) (<= x x2))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam19 x) z) (> x z))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam20 y) x2) (<= y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam21 y) x3) (<= y x3))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam22 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam23 x) x2) (> x x2))))
(assert-not (forall ((xs list2)) (ordered (qsort xs))))
(assert-claim (ordered nil2))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (qsort x) x))))
(assert-claim (forall ((y list)) (= (++2 y nil) y)))
(assert-claim (forall ((y list)) (= (++2 nil y) y)))
(assert-claim (forall ((y fun12)) (= (filter2 y nil) nil)))
(assert-claim (forall ((x list2)) (ordered (qsort x))))
(assert-claim
  (forall ((x fun13) (y list2))
    (=> (ordered y) (ordered (filter x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (qsort (++ y x)) (qsort (++ x y)))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (qsort (filter x y)) (filter x (qsort y)))))
(assert-claim (forall ((x Int)) (ordered (cons2 x nil2))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++2 z x2)) (++2 (cons y z) x2))))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 list))
    (= (filter2 z (filter2 y x2)) (filter2 y (filter2 z x2)))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (filter2 y (filter2 y z)) (filter2 y z))))
(assert-claim
  (forall ((x list2))
    (= (ordered (++ x (qsort x))) (ordered (++ x x)))))
(assert-claim
  (forall ((x list2))
    (= (ordered (++ (qsort x) x)) (ordered (++ x x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (qsort (++ x (qsort y))) (qsort (++ x y)))))
(assert-claim
  (forall ((x list2))
    (= (ordered (++ x (++ x x))) (ordered (++ x x)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ordered (cons2 x (cons2 x y))) (ordered (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y)
      (= (ordered (cons2 x (cons2 y z))) (ordered (cons2 y z))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (> x y) (not (ordered (cons2 x (cons2 y z)))))))
(assert-claim
  (forall ((x list2))
    (= (ordered (++ (qsort x) (qsort x))) (ordered (++ x x)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (ordered (cons2 x (cons2 y nil2))) (<= x y))))
(assert-claim
  (forall ((x Int))
    (= (qsort (cons2 x (cons2 x nil2))) (cons2 x (cons2 x nil2)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (qsort (cons2 x (cons2 y nil2))) (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam3 x) (cons2 x y)) (cons2 x (filter (lam4 x) y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (filter (lam5 y) (cons2 x z)) (cons2 x (filter (lam6 y) z))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (> y x)
      (= (filter (lam7 y) (cons2 x z)) (filter (lam8 y) z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam9 x) (cons2 x y)) (filter (lam10 x) y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (filter (lam11 y) (cons2 x z)) (filter (lam12 y) z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (> y x)
      (= (filter (lam13 y) (cons2 x z))
        (cons2 x (filter (lam14 y) z))))))
(assert-claim
  (forall ((y fun12) (z list) (x2 list))
    (= (++2 (filter2 y z) (filter2 y x2)) (filter2 y (++2 z x2)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++ y (++ x (qsort y)))) (ordered (++ y (++ x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++ x (++ y (qsort y)))) (ordered (++ x (++ y y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++ x (++ (qsort x) y))) (ordered (++ x (++ x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++ x (++ (qsort y) y))) (ordered (++ x (++ y y))))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (ordered (++ y (filter x (qsort y))))
      (ordered (++ y (filter x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++ x (qsort (++ x y))))
      (ordered (++ x (++ x (qsort y)))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++ x (qsort (++ y y)))) (ordered (++ x (qsort y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++ (++ (qsort x) x) y)) (ordered (++ x (++ x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++ (++ (qsort y) x) y)) (ordered (++ y (++ x y))))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (ordered (++ (filter x (qsort y)) y))
      (ordered (++ (filter x y) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++ (qsort (++ x x)) y)) (ordered (++ (qsort x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++ (qsort (++ y x)) y))
      (ordered (++ (++ (qsort x) y) y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam15 x) (qsort (cons2 x y)))
      (cons2 x (filter (lam16 x) (qsort y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ordered (cons2 x (filter (lam17 x) y)))
      (ordered (filter (lam18 x) y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ordered (cons2 x (filter (lam19 x) y)))
      (ordered (cons2 x (qsort y))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (ordered (filter (lam20 y) (cons2 x z)))
      (ordered (cons2 x (filter (lam21 y) z))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam22 x) (filter (lam23 x) y)) nil2)))
