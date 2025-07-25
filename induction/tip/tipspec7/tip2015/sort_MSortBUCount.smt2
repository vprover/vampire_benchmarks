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
(declare-const lam3 fun17)
(declare-const lam4 fun13)
(declare-const lam5 fun13)
(declare-const lam6 fun13)
(declare-const lam7 fun13)
(declare-const lam8 fun13)
(declare-const lam9 fun13)
(declare-fun lam10 (Int) fun17)
(declare-fun lam11 (Int) fun17)
(declare-const lam12 fun13)
(declare-const lam13 fun13)
(declare-const lam14 fun13)
(declare-fun lam15 (Int) fun17)
(declare-fun lam16 (Int) fun13)
(declare-fun lam17 (list2) fun13)
(declare-const lam18 fun13)
(declare-fun lam19 (Int) fun17)
(declare-const lam20 fun13)
(declare-const lam21 fun13)
(declare-fun lam22 (list2 list) fun14)
(declare-fun lam23 (list2 list) fun14)
(declare-fun lam24 (list2) fun13)
(declare-const lam25 fun14)
(declare-fun lam26 (Int) fun17)
(declare-fun lam27 (Int) fun17)
(declare-fun lam28 (Int) fun17)
(declare-fun lam29 (Int) fun14)
(declare-fun lam30 (Int) fun13)
(declare-fun lam31 (list2) fun13)
(declare-fun lam32 (Int) fun14)
(declare-const lam33 fun13)
(declare-fun lam34 (Int) fun14)
(declare-fun lam35 (Int) fun17)
(declare-fun lam36 (Int) fun13)
(declare-fun lam37 (Int) fun17)
(declare-fun lam38 (Int) fun17)
(declare-fun lam39 (Int) fun13)
(declare-fun lam40 (Int) fun17)
(declare-fun lam41 (Int) fun13)
(declare-const lam42 fun13)
(declare-fun lam43 (list2) fun13)
(declare-fun lam44 (list2) fun13)
(declare-fun lam45 (list2) fun13)
(declare-fun lam46 (list2) fun13)
(declare-fun lam47 (list2) fun13)
(declare-fun lam48 (list2) fun13)
(declare-const lam49 fun14)
(declare-const lam50 fun14)
(declare-fun lam51 (Int) fun17)
(declare-fun lam52 (Int) fun17)
(declare-fun lam53 (Int Int) fun17)
(declare-fun lam54 (list2) fun13)
(declare-fun lam55 (list2) fun13)
(declare-fun lam56 (list2 list2) fun13)
(declare-fun lam57 (list2) fun13)
(declare-const lam58 fun13)
(declare-const lam59 fun13)
(declare-fun lam60 (list2) fun13)
(declare-const lam61 fun13)
(declare-fun lam62 (Int) fun17)
(declare-fun lam63 (Int) fun13)
(declare-fun lam64 (Int) fun17)
(declare-fun lam65 (Int) fun13)
(declare-const lam66 fun13)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Int)
(declare-fun apply13 (fun13 list2) list2)
(declare-fun apply14 (fun14 list2) Int)
(declare-fun apply15 (fun15 Int) sk)
(declare-fun apply16 (fun16 Int) list2)
(declare-fun apply17 (fun17 Int) Int)
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
(define-fun-rec
  count3
  ((x Int) (y list2)) Int
  (match y
    ((nil3 0)
     ((cons3 z ys) (ite (= x z) (+ 1 (count3 x ys)) (count3 x ys))))))
(define-fun-rec
  count2
  ((x sk) (y list3)) Int
  (match y
    ((nil2 0)
     ((cons2 z ys) (ite (= x z) (+ 1 (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x list2) (y list)) Int
  (match y
    ((nil 0)
     ((cons z ys) (ite (= x z) (+ 1 (count x ys)) (count x ys))))))
(assert (forall ((y Int)) (= (apply16 lam y) (cons3 y nil3))))
(assert (forall ((y list2)) (= (apply13 lam2 y) (lmerge nil3 y))))
(assert (forall ((y list2)) (= (apply13 lam4 y) (map8 lam3 y))))
(assert (forall ((z Int)) (= (apply17 lam3 z) (+ 0 z))))
(assert (forall ((y list2)) (= (apply13 lam5 y) (lmerge nil3 y))))
(assert (forall ((y list2)) (= (apply13 lam6 y) (msortbu y))))
(assert (forall ((y list2)) (= (apply13 lam7 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply13 lam8 z) (msortbu z))))
(assert (forall ((z list2)) (= (apply13 lam9 z) (msortbu z))))
(assert
  (forall ((x Int) (z Int)) (= (apply17 (lam10 x) z) (+ x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply17 (lam11 x) x2) (+ x x2))))
(assert (forall ((y list2)) (= (apply13 lam12 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply13 lam13 z) (msortbu z))))
(assert (forall ((x2 list2)) (= (apply13 lam14 x2) (msortbu x2))))
(assert
  (forall ((x Int) (z Int)) (= (apply17 (lam15 x) z) (+ x z))))
(assert
  (forall ((z Int) (x3 list2))
    (= (apply13 (lam16 z) x3) (cons3 z x3))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam17 x) z) (lmerge x z))))
(assert (forall ((x2 list2)) (= (apply13 lam18 x2) (msortbu x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply17 (lam19 y) x3) (+ y x3))))
(assert (forall ((z list2)) (= (apply13 lam20 z) (msortbu z))))
(assert (forall ((x2 list2)) (= (apply13 lam21 x2) (msortbu x2))))
(assert
  (forall ((x list2) (y list) (x2 list2))
    (= (apply14 (lam22 x y) x2)
      (count3 (count x (pairwise (pairwise y))) x2))))
(assert
  (forall ((x list2) (y list) (x2 list2))
    (= (apply14 (lam23 x y) x2) (count3 (count x (pairwise y)) x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam24 x) z) (lmerge x z))))
(assert (forall ((y list2)) (= (apply14 lam25 y) (count3 0 y))))
(assert
  (forall ((x Int) (z Int)) (= (apply17 (lam26 x) z) (+ x z))))
(assert
  (forall ((x Int) (z Int)) (= (apply17 (lam27 x) z) (+ x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply17 (lam28 x) x2) (+ x x2))))
(assert
  (forall ((y Int) (x2 list2))
    (= (apply14 (lam29 y) x2) (count3 y x2))))
(assert
  (forall ((y Int) (x2 list2))
    (= (apply13 (lam30 y) x2) (cons3 y x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam31 x) z) (lmerge x z))))
(assert
  (forall ((y Int) (x2 list2))
    (= (apply14 (lam32 y) x2) (count3 y x2))))
(assert
  (forall ((y Int) (x4 list2))
    (= (apply14 (lam34 y) x4) (count3 y x4))))
(assert (forall ((x3 list2)) (= (apply13 lam33 x3) (msortbu x3))))
(assert
  (forall ((x Int) (z list2))
    (= (apply13 (lam36 x) z) (map8 (lam35 x) z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply17 (lam35 x) x2) (+ x x2))))
(assert
  (forall ((x Int) (x3 Int)) (= (apply17 (lam37 x) x3) (+ x x3))))
(assert
  (forall ((x Int) (z list2))
    (= (apply13 (lam39 x) z) (map8 (lam38 x) z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply17 (lam38 x) x2) (+ x x2))))
(assert
  (forall ((x Int) (x3 list2))
    (= (apply13 (lam41 x) x3) (map8 (lam40 x) x3))))
(assert
  (forall ((x Int) (x4 Int)) (= (apply17 (lam40 x) x4) (+ x x4))))
(assert (forall ((z list2)) (= (apply13 lam42 z) (msortbu z))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam43 x) z) (lmerge x z))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam44 x) z) (lmerge x z))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam45 x) z) (lmerge (msortbu x) z))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply13 (lam46 x) x2) (lmerge x x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam47 x) z) (lmerge x z))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply13 (lam48 x) x2) (lmerge x x2))))
(assert (forall ((y list2)) (= (apply14 lam49 y) (count3 0 y))))
(assert (forall ((z list2)) (= (apply14 lam50 z) (count3 0 z))))
(assert
  (forall ((x Int) (y Int) (x4 Int))
    (= (apply17 (lam53 x y) x4) (+ (+ x y) x4))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply17 (lam51 x) x2) (+ x x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply17 (lam52 y) x3) (+ y x3))))
(assert
  (forall ((x list2) (y list2) (x4 list2))
    (= (apply13 (lam56 x y) x4) (lmerge (lmerge x y) x4))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply13 (lam54 x) x2) (lmerge x x2))))
(assert
  (forall ((y list2) (x3 list2))
    (= (apply13 (lam55 y) x3) (lmerge y x3))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam57 x) z) (lmerge (msortbu x) z))))
(assert
  (forall ((x list2) (x4 list2))
    (= (apply13 (lam60 x) x4) (lmerge x x4))))
(assert (forall ((x2 list2)) (= (apply13 lam58 x2) (msortbu x2))))
(assert (forall ((x3 list2)) (= (apply13 lam59 x3) (msortbu x3))))
(assert
  (forall ((x Int) (x2 list2))
    (= (apply13 (lam63 x) x2) (map8 (lam62 x) x2))))
(assert
  (forall ((x Int) (x3 Int)) (= (apply17 (lam62 x) x3) (+ x x3))))
(assert
  (forall ((x Int) (x4 list2))
    (= (apply13 (lam65 x) x4) (map8 (lam64 x) x4))))
(assert
  (forall ((x Int) (x5 Int)) (= (apply17 (lam64 x) x5) (+ x x5))))
(assert (forall ((z list2)) (= (apply13 lam61 z) (msortbu z))))
(assert (forall ((x6 list2)) (= (apply13 lam66 x6) (msortbu x6))))
(assert-not
  (forall ((x Int) (xs list2))
    (= (count3 x (msortbu xs)) (count3 x xs))))
(assert-claim (= (pairwise nil) nil))
(assert-claim (= (mergingbu nil) nil3))
(assert-claim (= (msortbu nil3) nil3))
(assert-claim (forall ((y sk)) (= (count2 y nil2) 0)))
(assert-claim (forall ((x list2)) (= (lmerge x nil3) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil3 x) x)))
(assert-claim (forall ((z fun1)) (= (map5 z nil2) nil2)))
(assert-claim
  (forall ((x list)) (= (mergingbu (pairwise x)) (mergingbu x))))
(assert-claim
  (forall ((x list2)) (= (msortbu (msortbu x)) (msortbu x))))
(assert-claim
  (forall ((x list2)) (= (apply13 lam2 x) (apply13 lam4 x))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 x (msortbu y)) (count3 x y))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count (msortbu x) y) (count x y))))
(assert-claim
  (forall ((x list2) (y list))
    (= (mergingbu (cons x y)) (lmerge x (mergingbu y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (msortbu (lmerge y x)) (msortbu (lmerge x y)))))
(assert-claim
  (forall ((x Int)) (= (msortbu (cons3 x nil3)) (cons3 x nil3))))
(assert-claim
  (forall ((x list2)) (= (pairwise (cons x nil)) (cons x nil))))
(assert-claim (forall ((x list)) (= (map3 lam5 x) x)))
(assert-claim
  (forall ((x list))
    (= (mergingbu (map3 lam6 x)) (msortbu (mergingbu x)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (map3 lam7 x)) (map3 lam8 (pairwise x)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (lmerge (lmerge x y) z) (lmerge x (lmerge y z)))))
(assert-claim
  (forall ((y sk) (z list3))
    (= (+ 1 (count2 y z)) (count2 y (cons2 y z)))))
(assert-claim (forall ((y sk) (z list3)) (<= 0 (count2 y z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y nil2)) (count2 y (cons2 z nil2)))))
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
  (forall ((x list2)) (= (count3 0 (cons3 1 x)) (count3 0 x))))
(assert-claim
  (forall ((x list2)) (= (count3 1 (cons3 0 x)) (count3 1 x))))
(assert-claim
  (forall ((x list))
    (= (pairwise (pairwise (pairwise (pairwise x))))
      (pairwise (pairwise (pairwise x))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (map3 lam9 y)) (count x y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (msortbu (map8 (lam10 x) y)) (map8 (lam11 x) (msortbu y)))))
(assert-claim
  (forall ((x list)) (= (map3 lam12 (map3 lam13 x)) (map3 lam14 x))))
(assert-claim
  (forall ((x Int) (y Int) (z list2) (x2 list))
    (=> (<= y x)
      (= (<= y (count z (pairwise x2))) (<= y (count z x2))))))
(assert-claim
  (forall ((x list2) (y list) (z Int))
    (= (<= (count x (pairwise y)) z) (<= (count x y) z))))
(assert-claim
  (forall ((y sk) (z fun15) (x2 list2))
    (= (count2 y (map7 z (msortbu x2))) (count2 y (map7 z x2)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (count (cons3 x (mergingbu y)) y) 0)))
(assert-claim
  (forall ((x Int) (y Int) (z list2) (x2 list))
    (=> (<= x y)
      (= (count (cons3 y z) (pairwise x2)) (count (cons3 y z) x2)))))
(assert-claim
  (forall ((x fun14) (y list))
    (= (count (msortbu (map4 x y)) y)
      (count (map4 x y) (pairwise y)))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list2))
    (=> (<= z x)
      (= (msortbu (cons3 z (cons3 y x2)))
        (msortbu (cons3 y (cons3 z x2)))))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (msortbu (lmerge y (cons3 x z)))
      (msortbu (cons3 x (lmerge y z))))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (pairwise (cons x (cons y z)))
      (cons (lmerge x y) (pairwise z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= x y)
      (= (<= y (count3 y (mergingbu z)))
        (<= y (count3 1 (mergingbu z)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (pairwise (pairwise (pairwise y))))
      (count x (pairwise (pairwise y))))))
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
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (cons x (pairwise y))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (pairwise (cons x y))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim (forall ((x list)) (<= (count nil3 (pairwise x)) 1)))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 x (map8 (lam15 x) y)) (count3 0 y))))
(assert-claim
  (forall ((x Int) (y list2) (z Int) (x2 list))
    (=> (<= x z) (= (count y (map3 (lam16 z) x2)) 0))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (map3 (lam17 x) y)) (count nil3 (map3 lam18 y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2) (x2 list))
    (=> (<= x y)
      (= (count (map8 (lam19 y) z) x2) (count (lmerge z z) x2)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (cons (msortbu x) (map3 lam20 y)) (map3 lam21 (cons x y)))))
(assert-claim
  (forall ((x list2) (y list) (z list2))
    (= (apply14 (lam22 x y) z) (apply14 (lam23 x y) z))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil3 (map3 (lam24 x) y)) (count (lmerge x x) y))))
(assert-claim (forall ((x list)) (= (count (map4 lam25 x) x) 0)))
(assert-claim
  (forall ((x Int) (y Int))
    (= (map8 (lam26 x) (cons3 y nil3)) (cons3 (+ x y) nil3))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (cons3 x (map8 (lam27 x) y)) (map8 (lam28 x) (cons3 0 y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (map4 (lam29 y) (cons z nil)) (cons3 (count3 y z) nil3)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (map3 (lam30 y) (cons z nil)) (cons (cons3 y z) nil)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (map3 (lam31 x) (cons y nil)) (cons (lmerge x y) nil))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= y x)
      (= (map4 (lam32 y) (map3 lam33 z)) (map4 (lam34 y) z)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (mergingbu (map3 (lam36 x) y)) (map8 (lam37 x) (mergingbu y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (pairwise (map3 (lam39 x) y)) (map3 (lam41 x) (pairwise y)))))
(assert-claim
  (forall ((z fun1) (x2 sk) (x3 list3))
    (= (cons2 (apply1 z x2) (map5 z x3)) (map5 z (cons2 x2 x3)))))
(assert-claim
  (forall ((x list) (y fun17) (z list2))
    (= (count3 (apply17 y (count z x)) z) (count3 (apply17 y 0) z))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (+ (count3 x y) (count3 x z)) (count3 x (lmerge y z)))))
(assert-claim
  (forall ((x list) (y Int) (z list2))
    (= (<= y (count3 (count z x) z)) (<= y (count3 0 z)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (count3 (+ y y) x) y) (<= (count3 y x) (+ y y)))))
(assert-claim
  (forall ((x list) (y list2) (z Int))
    (= (<= (count3 (count y x) y) z) (<= (count3 0 y) z))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list3))
    (= (count2 y (cons2 x2 (cons2 z x3)))
      (count2 y (cons2 z (cons2 x2 x3))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 x (cons3 (+ x x) y)) (count3 x (cons3 0 y)))))
(assert-claim
  (forall ((x list2) (y list) (z list2))
    (= (count3 (count (lmerge z x) y) z) (count3 (count z y) z))))
(assert-claim
  (forall ((y sk) (z list3) (x2 list2) (x3 list))
    (= (count (cons3 (count2 y z) x2) x3) (count (cons3 0 x2) x3))))
(assert-claim
  (forall ((y fun12) (z list2) (x2 fun12) (x3 list3) (x4 list))
    (= (count (lmerge z (map6 y x3)) x4)
      (count (lmerge z (map6 x2 x3)) x4))))
(assert-claim
  (forall ((x list2) (y Int) (z list2))
    (= (lmerge (cons3 y x) (cons3 y z))
      (cons3 y (lmerge x (cons3 y z))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count3 x (cons3 0 y))) (<= x (count3 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count3 0 (cons3 x y))) (<= x (count3 0 y)))))
(assert-claim
  (forall ((x fun14) (y list) (z Int))
    (= (<= (count3 0 (map4 x y)) z) (<= (count3 z (map4 x y)) z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y (cons2 y nil2)))
      (count2 y (cons2 z (cons2 z nil2))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (count3 x (cons3 (+ y x) nil3)) (count3 y (cons3 0 nil3)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 (+ x x) (cons3 0 y)) (count3 (+ x x) (cons3 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 0 (cons3 (+ x x) y)) (count3 0 (cons3 x y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (cons (cons3 0 x) y)) (count x y))))
(assert-claim
  (forall ((x fun16) (y list2))
    (= (count y (pairwise (map2 x (msortbu y))))
      (count y (pairwise (map2 x y))))))
(assert-claim
  (forall ((x list2) (y fun13) (z list))
    (= (count x (pairwise (map3 y (pairwise z))))
      (count x (map3 y (pairwise (pairwise z)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (pairwise (pairwise (cons x y))))
      (count nil3 (cons (mergingbu y) nil)))))
(assert-claim
  (forall ((x fun16) (y list2))
    (= (count y (pairwise (pairwise (map2 x y))))
      (count y (pairwise (map2 x y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count (cons3 0 x) (cons x y)) (count (cons3 0 x) y))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil3 (cons (lmerge x x) y))
      (count nil3 (cons (msortbu x) y)))))
(assert-claim
  (forall ((x fun14) (y list))
    (= (count (map4 x y) (pairwise (pairwise y)))
      (count (map4 x y) (pairwise y)))))
(assert-claim
  (forall ((x fun13) (y list))
    (= (count (mergingbu y) (pairwise (map3 x y)))
      (count (mergingbu y) (map3 x (pairwise y))))))
(assert-claim
  (forall ((x fun13) (y list))
    (= (count (mergingbu (map3 x y)) (pairwise y))
      (count (mergingbu y) (map3 x (pairwise y))))))
(assert-claim
  (forall ((x fun14) (y list) (z list2))
    (= (lmerge (msortbu z) (map4 x (pairwise y)))
      (lmerge (map4 x (pairwise y)) (msortbu z)))))
(assert-claim
  (forall ((y fun12) (z fun15) (x2 list2))
    (= (msortbu (map6 y (map7 z (msortbu x2))))
      (msortbu (map6 y (map7 z x2))))))
(assert-claim
  (forall ((x Int)) (= (<= (count3 x (cons3 0 nil3)) x) (<= 1 x))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= (count3 x (cons3 0 nil3)) y)
      (<= (count3 x (cons3 y nil3)) y))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil3 (cons (cons3 0 x) y)) (count nil3 (map3 lam42 y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (cons x (pairwise (pairwise (pairwise y)))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x fun13) (y list))
    (= (pairwise (map3 x (pairwise (pairwise (pairwise y)))))
      (map3 x (pairwise (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x fun13) (y list))
    (= (pairwise (pairwise (map3 x (pairwise (pairwise y)))))
      (pairwise (map3 x (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x fun13) (y list))
    (= (pairwise (pairwise (pairwise (map3 x (pairwise y)))))
      (pairwise (pairwise (map3 x (pairwise y)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count (mergingbu (map3 (lam43 x) y)) y)
      (count (lmerge x (mergingbu y)) y))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count (lmerge x x) (pairwise y))
      (count nil3 (pairwise (map3 (lam44 x) y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (msortbu (mergingbu (map3 (lam45 x) y)))
      (msortbu (mergingbu (map3 (lam46 x) y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (map3 (lam47 x) (pairwise (pairwise y))))
      (map3 (lam48 x) (pairwise (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x list))
    (= (msortbu (cons3 0 (map4 lam49 x)))
      (cons3 0 (msortbu (map4 lam50 x))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (map8 (lam51 x) (map8 (lam52 y) z)) (map8 (lam53 x y) z))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (map3 (lam54 x) (map3 (lam55 y) z)) (map3 (lam56 x y) z))))
(assert-claim
  (forall ((x list2) (y list))
    (= (map3 (lam57 x) (map3 lam58 y))
      (map3 lam59 (map3 (lam60 x) y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (map3 lam61 (map3 (lam63 x) y))
      (map3 (lam65 x) (map3 lam66 y)))))
