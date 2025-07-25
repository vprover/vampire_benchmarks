(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-sort fun14 0)
(declare-sort fun15 0)
(declare-sort fun16 0)
(declare-sort fun17 0)
(declare-datatype list3 ((nil2) (cons2 (head2 sk) (tail2 list3))))
(declare-datatype list2 ((nil3) (cons3 (head3 Int) (tail3 list2))))
(declare-datatype list ((nil) (cons (head list2) (tail list))))
(declare-const lam fun16)
(declare-const lam2 fun13)
(declare-const lam3 fun13)
(declare-const lam4 fun13)
(declare-const lam5 fun13)
(declare-const lam6 fun13)
(declare-const lam7 fun13)
(declare-const lam8 fun13)
(declare-const lam9 fun13)
(declare-const lam10 fun13)
(declare-const lam11 fun13)
(declare-const lam12 fun13)
(declare-fun lam13 (Int) fun13)
(declare-fun lam14 (list2) fun13)
(declare-fun lam15 (Int) fun13)
(declare-fun lam16 (list2) fun13)
(declare-const lam17 fun13)
(declare-fun lam18 (list2) fun13)
(declare-fun lam19 (list2) fun13)
(declare-const lam20 fun13)
(declare-fun lam21 (list2) fun13)
(declare-fun lam22 (list2) fun13)
(declare-fun lam23 (list2) fun13)
(declare-fun lam24 (list2) fun13)
(declare-fun lam25 (list) fun13)
(declare-fun lam26 (list2) fun13)
(declare-fun lam27 (list2) fun13)
(declare-fun lam28 (list2 list2) fun13)
(declare-fun lam29 (list2) fun13)
(declare-const lam30 fun13)
(declare-const lam31 fun13)
(declare-fun lam32 (list2) fun13)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Int)
(declare-fun apply13 (fun13 list2) list2)
(declare-fun apply14 (fun14 list2) Int)
(declare-fun apply15 (fun15 Int) sk)
(declare-fun apply16 (fun16 Int) list2)
(declare-fun apply17 (fun17 Int) Int)
(define-fun-rec
  ordered
  ((x list2)) Bool
  (match x
    ((nil3 true)
     ((cons3 y z)
      (match z
        ((nil3 true)
         ((cons3 y2 xs) (and (<= y y2) (ordered (cons3 y2 xs))))))))))
(define-fun-rec
  map8
  ((f fun17) (x list2)) list2
  (match x
    ((nil3 nil3)
     ((cons3 y xs) (cons3 (apply17 f y) (map8 f xs))))))
(define-fun-rec
  map7
  ((f fun15) (x list2)) list3
  (match x
    ((nil3 nil2)
     ((cons3 y xs) (cons2 (apply15 f y) (map7 f xs))))))
(define-fun-rec
  map6
  ((f fun12) (x list3)) list2
  (match x
    ((nil2 nil3)
     ((cons2 y xs) (cons3 (apply12 f y) (map6 f xs))))))
(define-fun-rec
  map5
  ((f fun1) (x list3)) list3
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (cons2 (apply1 f y) (map5 f xs))))))
(define-fun-rec
  map4
  ((f fun14) (x list)) list2
  (match x
    ((nil nil3)
     ((cons y xs) (cons3 (apply14 f y) (map4 f xs))))))
(define-fun-rec
  map3
  ((f fun13) (x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (cons (apply13 f y) (map3 f xs))))))
(define-fun-rec
  map2
  ((f fun16) (x list2)) list
  (match x
    ((nil3 nil)
     ((cons3 y xs) (cons (apply16 f y) (map2 f xs))))))
(define-fun-rec
  lmerge
  ((x list2) (y list2)) list2
  (match x
    ((nil3 y)
     ((cons3 z x2)
      (match y
        ((nil3 (cons3 z x2))
         ((cons3 x3 x4)
          (ite
            (<= z x3) (cons3 z (lmerge x2 (cons3 x3 x4)))
            (cons3 x3 (lmerge (cons3 z x2) x4))))))))))
(define-fun-rec
  pairwise
  ((x list)) list
  (match x
    ((nil nil)
     ((cons xs y)
      (match y
        ((nil (cons xs nil))
         ((cons ys xss) (cons (lmerge xs ys) (pairwise xss)))))))))
(define-fun-rec
  mergingbu
  ((x list)) list2
  (match x
    ((nil nil3)
     ((cons xs y)
      (match y
        ((nil xs)
         ((cons z x2) (mergingbu (pairwise (cons xs (cons z x2)))))))))))
(define-fun
  msortbu
  ((x list2)) list2 (mergingbu (map2 lam x)))
(assert (forall ((y Int)) (= (apply16 lam y) (cons3 y nil3))))
(assert (forall ((y list2)) (= (apply13 lam2 y) (lmerge nil3 y))))
(assert (forall ((y list2)) (= (apply13 lam3 y) (msortbu y))))
(assert (forall ((y list2)) (= (apply13 lam4 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply13 lam5 z) (msortbu z))))
(assert (forall ((z list2)) (= (apply13 lam6 z) (msortbu z))))
(assert (forall ((x2 list2)) (= (apply13 lam7 x2) (msortbu x2))))
(assert (forall ((y list2)) (= (apply13 lam8 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply13 lam9 z) (msortbu z))))
(assert (forall ((x2 list2)) (= (apply13 lam10 x2) (msortbu x2))))
(assert (forall ((z list2)) (= (apply13 lam11 z) (msortbu z))))
(assert (forall ((x2 list2)) (= (apply13 lam12 x2) (msortbu x2))))
(assert
  (forall ((y Int) (x2 list2))
    (= (apply13 (lam13 y) x2) (cons3 y x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam14 x) z) (lmerge x z))))
(assert
  (forall ((y Int) (x2 list2))
    (= (apply13 (lam15 y) x2) (cons3 y x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam16 x) z) (lmerge x z))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply13 (lam18 x) x2) (lmerge x x2))))
(assert
  (forall ((x list2) (x3 list2))
    (= (apply13 (lam19 x) x3) (lmerge x x3))))
(assert (forall ((z list2)) (= (apply13 lam17 z) (msortbu z))))
(assert (forall ((x4 list2)) (= (apply13 lam20 x4) (msortbu x4))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam21 x) z) (lmerge (msortbu x) z))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply13 (lam22 x) x2) (lmerge x x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam23 x) z) (lmerge x z))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply13 (lam24 x) x2) (lmerge x x2))))
(assert
  (forall ((x list) (y list2))
    (= (apply13 (lam25 x) y) (lmerge (mergingbu x) y))))
(assert
  (forall ((x list2) (y list2) (x4 list2))
    (= (apply13 (lam28 x y) x4) (lmerge (lmerge x y) x4))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply13 (lam26 x) x2) (lmerge x x2))))
(assert
  (forall ((y list2) (x3 list2))
    (= (apply13 (lam27 y) x3) (lmerge y x3))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam29 x) z) (lmerge (msortbu x) z))))
(assert
  (forall ((x list2) (x4 list2))
    (= (apply13 (lam32 x) x4) (lmerge x x4))))
(assert (forall ((x2 list2)) (= (apply13 lam30 x2) (msortbu x2))))
(assert (forall ((x3 list2)) (= (apply13 lam31 x3) (msortbu x3))))
(assert-not (forall ((xs list2)) (ordered (msortbu xs))))
(assert-claim (ordered nil3))
(assert-claim (= (pairwise nil) nil))
(assert-claim (= (mergingbu nil) nil3))
(assert-claim (= (msortbu nil3) nil3))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (msortbu x) x))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y) (=> (ordered x) (= (lmerge y x) (lmerge x y))))))
(assert-claim (forall ((x list2)) (= (lmerge x nil3) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil3 x) x)))
(assert-claim (forall ((z fun1)) (= (map5 z nil2) nil2)))
(assert-claim
  (forall ((x list)) (= (mergingbu (pairwise x)) (mergingbu x))))
(assert-claim
  (forall ((x list2)) (= (msortbu (msortbu x)) (msortbu x))))
(assert-claim (forall ((x list2)) (ordered (msortbu x))))
(assert-claim
  (forall ((x list2) (y list))
    (= (mergingbu (cons x y)) (lmerge x (mergingbu y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (msortbu (lmerge y x)) (msortbu (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (msortbu (lmerge x y)) (lmerge (msortbu x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (lmerge y x)) (ordered (lmerge x y)))))
(assert-claim
  (forall ((x list2)) (= (ordered (lmerge x x)) (ordered x))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered x) (= (ordered (lmerge y x)) (ordered y)))))
(assert-claim
  (forall ((x Int)) (= (msortbu (cons3 x nil3)) (cons3 x nil3))))
(assert-claim
  (forall ((x list2)) (= (pairwise (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list))
    (= (pairwise (pairwise (pairwise x))) (pairwise (pairwise x)))))
(assert-claim (forall ((x list)) (= (map3 lam2 x) x)))
(assert-claim
  (forall ((x list))
    (= (mergingbu (map3 lam3 x)) (msortbu (mergingbu x)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (map3 lam4 x)) (map3 lam5 (pairwise x)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (lmerge (lmerge x y) z) (lmerge x (lmerge y z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (=> (ordered y)
      (= (msortbu (cons3 x y)) (lmerge (cons3 x nil3) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (msortbu x) (msortbu y)) (msortbu (lmerge x y)))))
(assert-claim
  (forall ((z fun1) (x2 sk))
    (= (map5 z (cons2 x2 nil2)) (cons2 (apply1 z x2) nil2))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (msortbu (cons3 x (msortbu y))) (msortbu (cons3 x y)))))
(assert-claim
  (forall ((x fun17) (y list2))
    (= (msortbu (map8 x (msortbu y))) (msortbu (map8 x y)))))
(assert-claim
  (forall ((x list2) (y list))
    (=> (ordered x)
      (= (map3 lam6 (cons x y)) (cons x (map3 lam7 y))))))
(assert-claim
  (forall ((x list)) (= (map3 lam8 (map3 lam9 x)) (map3 lam10 x))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ordered (cons3 x (cons3 x y))) (ordered (cons3 x y)))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (ordered (cons3 x (lmerge z y)))
      (ordered (cons3 x (lmerge y z))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ordered (cons3 x (lmerge y y))) (ordered (cons3 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y)
      (= (ordered (cons3 x (cons3 y z))) (ordered (cons3 y z))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ordered (lmerge y (cons3 x y))) (ordered (cons3 x y)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (ordered (lmerge x (lmerge z y)))
      (ordered (lmerge x (lmerge y z))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (lmerge x (lmerge x y))) (ordered (lmerge x y)))))
(assert-claim
  (forall ((x fun17) (y list2))
    (=> (ordered y)
      (= (ordered (map8 x (lmerge y y))) (ordered (map8 x y))))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (pairwise (cons x (cons y z)))
      (cons (lmerge x y) (pairwise z)))))
(assert-claim
  (forall ((x Int))
    (= (msortbu (cons3 x (cons3 x nil3))) (cons3 x (cons3 x nil3)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (msortbu (cons3 x (cons3 y nil3))) (cons3 x (cons3 y nil3))))))
(assert-claim
  (forall ((x fun14) (y list))
    (= (msortbu (map4 x (pairwise (pairwise y))))
      (map4 x (pairwise (pairwise y))))))
(assert-claim
  (forall ((x fun16) (y list2))
    (= (msortbu (mergingbu (map2 x (msortbu y))))
      (msortbu (mergingbu (map2 x y))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (ordered (cons3 x (cons3 y nil3))) (<= x y))))
(assert-claim
  (forall ((x fun16) (y list2))
    (= (ordered (mergingbu (map2 x (msortbu y))))
      (ordered (mergingbu (map2 x y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (cons x (pairwise (pairwise y))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x fun13) (y list))
    (= (pairwise (map3 x (pairwise (pairwise y))))
      (map3 x (pairwise (pairwise y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (cons x (pairwise y))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x fun13) (y list))
    (= (pairwise (pairwise (map3 x (pairwise y))))
      (pairwise (map3 x (pairwise y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (cons (msortbu x) (map3 lam11 y)) (map3 lam12 (cons x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (map3 (lam13 y) (cons z nil)) (cons (cons3 y z) nil)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (map3 (lam14 x) (cons y nil)) (cons (lmerge x y) nil))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= y x)
      (= (ordered (mergingbu (map3 (lam15 y) z)))
        (ordered (cons3 y (mergingbu z)))))))
(assert-claim
  (forall ((x list2) (y list))
    (=> (ordered x)
      (= (ordered (mergingbu (map3 (lam16 x) y)))
        (ordered (mergingbu y))))))
(assert-claim
  (forall ((x list2) (y list))
    (=> (ordered x)
      (= (map3 lam17 (map3 (lam18 x) y))
        (map3 (lam19 x) (map3 lam20 y))))))
(assert-claim
  (forall ((z fun1) (x2 sk) (x3 list3))
    (= (cons2 (apply1 z x2) (map5 z x3)) (map5 z (cons2 x2 x3)))))
(assert-claim
  (forall ((x fun14) (y list2))
    (= (ordered (cons3 (apply14 x (msortbu y)) y))
      (ordered (cons3 (apply14 x y) y)))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (ordered (lmerge y (apply13 x (msortbu y))))
      (ordered (lmerge y (apply13 x y))))))
(assert-claim
  (forall ((x list2) (y Int) (z list2))
    (= (lmerge (cons3 y x) (cons3 y z))
      (cons3 y (lmerge x (cons3 y z))))))
(assert-claim
  (forall ((y fun12) (z fun15) (x2 list2))
    (= (msortbu (map6 y (map7 z (msortbu x2))))
      (msortbu (map6 y (map7 z x2))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ordered (cons3 x (lmerge y (msortbu y))))
      (ordered (cons3 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ordered (cons3 x (msortbu (cons3 x y))))
      (ordered (cons3 x (msortbu y))))))
(assert-claim
  (forall ((x fun17) (y list2))
    (= (ordered (lmerge y (map8 x (msortbu y))))
      (ordered (lmerge y (map8 x y))))))
(assert-claim
  (forall ((x fun17) (y list2))
    (= (ordered (map8 x (lmerge y (msortbu y))))
      (ordered (map8 x (lmerge y y))))))
(assert-claim
  (forall ((x fun17) (y list2))
    (= (ordered (map8 x (lmerge (msortbu y) y)))
      (ordered (map8 x (lmerge y (msortbu y)))))))
(assert-claim
  (forall ((x fun16) (y list2))
    (= (ordered (mergingbu (map2 x (lmerge y y))))
      (ordered (mergingbu (map2 x y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (msortbu (mergingbu (map3 (lam21 x) y)))
      (msortbu (mergingbu (map3 (lam22 x) y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (ordered (mergingbu (map3 (lam23 x) (pairwise y))))
      (ordered (mergingbu (map3 (lam24 x) y))))))
(assert-claim
  (forall ((x list))
    (= (ordered (mergingbu (map3 (lam25 x) x)))
      (ordered (mergingbu x)))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (map3 (lam26 x) (map3 (lam27 y) z)) (map3 (lam28 x y) z))))
(assert-claim
  (forall ((x list2) (y list))
    (= (map3 (lam29 x) (map3 lam30 y))
      (map3 lam31 (map3 (lam32 x) y)))))
