(declare-sort sk 0)
(declare-datatype list3 ((nil2) (cons2 (head2 sk) (tail2 list3))))
(declare-datatype list2 ((nil3) (cons3 (head3 Int) (tail3 list2))))
(declare-datatype list ((nil) (cons (head list2) (tail list))))
(define-fun-rec
  risers
  ((x list2)) list
  (match x
    ((nil3 nil)
     ((cons3 y z)
      (match z
        ((nil3 (cons (cons3 y nil3) nil))
         ((cons3 y2 xs)
          (ite
            (<= y y2)
            (match (risers (cons3 y2 xs))
              ((nil nil)
               ((cons ys yss) (cons (cons3 y ys) yss))))
            (cons (cons3 y nil3) (risers (cons3 y2 xs)))))))))))
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
  mergingbu2
  ((x list)) list2
  (match x
    ((nil nil3)
     ((cons xs y)
      (match y
        ((nil xs)
         ((cons z x2) (mergingbu2 (pairwise (cons xs (cons z x2)))))))))))
(define-fun
  msortbu2
  ((x list2)) list2 (mergingbu2 (risers x)))
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
(assert-not
  (forall ((x Int) (xs list2))
    (= (count3 x (msortbu2 xs)) (count3 x xs))))
(assert-claim (= (risers nil3) nil))
(assert-claim (= (pairwise nil) nil))
(assert-claim (= (mergingbu2 nil) nil3))
(assert-claim (= (msortbu2 nil3) nil3))
(assert-claim (forall ((y sk)) (= (count2 y nil2) 0)))
(assert-claim (forall ((x list2)) (= (lmerge x nil3) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil3 x) x)))
(assert-claim
  (forall ((x list)) (= (mergingbu2 (pairwise x)) (mergingbu2 x))))
(assert-claim
  (forall ((x list2)) (= (msortbu2 x) (mergingbu2 (risers x)))))
(assert-claim
  (forall ((x list2)) (= (msortbu2 (msortbu2 x)) (msortbu2 x))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 x (msortbu2 y)) (count3 x y))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count (msortbu2 x) y) (count x y))))
(assert-claim
  (forall ((x list2) (y list))
    (= (mergingbu2 (cons x y)) (lmerge x (mergingbu2 y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (msortbu2 (lmerge y x)) (msortbu2 (lmerge x y)))))
(assert-claim (forall ((x list2)) (= (count nil3 (risers x)) 0)))
(assert-claim
  (forall ((x Int)) (= (msortbu2 (cons3 x nil3)) (cons3 x nil3))))
(assert-claim
  (forall ((x list2)) (= (pairwise (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list2))
    (= (pairwise (risers (msortbu2 x))) (risers (msortbu2 x)))))
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
  (forall ((x list2))
    (= (count x (pairwise (risers x))) (count x (risers x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (risers (msortbu2 x)))
      (count x (risers (msortbu2 y))))))
(assert-claim
  (forall ((x list2))
    (= (count x (risers (msortbu2 x))) (count x (risers x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (msortbu2 x) (msortbu2 y)) (msortbu2 (lmerge x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (msortbu2 (cons3 x (msortbu2 y))) (msortbu2 (cons3 x y)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= y x)
      (= (risers (cons3 y nil3)) (cons (cons3 y nil3) nil)))))
(assert-claim
  (forall ((x list2)) (= (count3 0 (cons3 1 x)) (count3 0 x))))
(assert-claim
  (forall ((x list2)) (= (count3 1 (cons3 0 x)) (count3 1 x))))
(assert-claim
  (forall ((x list2)) (= (count nil3 (pairwise (risers x))) 0)))
(assert-claim
  (forall ((x list))
    (= (pairwise (pairwise (pairwise (pairwise x))))
      (pairwise (pairwise (pairwise x))))))
(assert-claim
  (forall ((x list2))
    (= (pairwise (pairwise (pairwise (risers x))))
      (risers (msortbu2 x)))))
(assert-claim
  (forall ((x Int) (y list2) (z list))
    (= (<= x (count y (pairwise z))) (<= x (count y z)))))
(assert-claim
  (forall ((x list) (y list2))
    (= (count3 (count y (pairwise x)) y) (count3 (count y x) y))))
(assert-claim
  (forall ((x list2)) (= (count x (risers (lmerge x x))) 0)))
(assert-claim
  (forall ((x Int) (y list2)) (= (count (cons3 x y) (risers y)) 0)))
(assert-claim
  (forall ((x Int) (y list))
    (= (count (cons3 x (mergingbu2 y)) y) 0)))
(assert-claim
  (forall ((x Int) (y list2) (z list))
    (= (count (cons3 x (msortbu2 y)) z)
      (count (cons3 x y) (pairwise z)))))
(assert-claim
  (forall ((x list2)) (= (count (lmerge x x) (risers x)) 0)))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (count (msortbu2 x) (cons y z))
      (count x (cons (msortbu2 y) z)))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list2))
    (=> (<= z x)
      (= (msortbu2 (cons3 z (cons3 y x2)))
        (msortbu2 (cons3 y (cons3 z x2)))))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (msortbu2 (lmerge y (cons3 x z)))
      (msortbu2 (cons3 x (lmerge y z))))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (pairwise (cons x (cons y z)))
      (cons (lmerge x y) (pairwise z)))))
(assert-claim
  (forall ((x list2) (y list)) (<= (count x (pairwise y)) 1)))
(assert-claim
  (forall ((x list2) (y list2)) (<= (count x (risers y)) 1)))
(assert-claim
  (forall ((x Int) (y list2))
    (= (cons (msortbu2 (cons3 x y)) nil)
      (risers (msortbu2 (cons3 x y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (pairwise (pairwise (pairwise y))))
      (count x (pairwise (pairwise y))))))
(assert-claim
  (forall ((x Int))
    (= (msortbu2 (cons3 x (cons3 x nil3))) (cons3 x (cons3 x nil3)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (msortbu2 (cons3 x (cons3 y nil3))) (cons3 x (cons3 y nil3))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairwise (cons x (risers (msortbu2 y))))
      (cons (lmerge x (msortbu2 y)) nil))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (cons x (pairwise y))))
      (cons (lmerge x (mergingbu2 y)) nil))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (pairwise (cons x y))))
      (cons (lmerge x (mergingbu2 y)) nil))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (pairwise (risers (cons3 x (msortbu2 y))))
      (risers (msortbu2 (cons3 x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count nil3 (cons (msortbu2 x) nil))
      (count nil3 (cons x (risers y))))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (+ (count3 x y) (count3 x z)) (count3 x (lmerge y z)))))
(assert-claim
  (forall ((x list2) (y list) (z Int))
    (= (<= (+ z z) (count x y)) (<= z 0))))
(assert-claim
  (forall ((x list2) (y list) (z Int))
    (= (<= (count x y) (+ z z)) (<= (count x y) z))))
(assert-claim
  (forall ((x Int) (y list2) (z list2) (x2 list))
    (= (<= (count3 x y) (count y x2)) (<= (count3 x y) (count z x2)))))
(assert-claim
  (forall ((x list2) (y list) (z list2) (x2 Int))
    (= (<= (count3 (count x y) z) x2) (<= (count3 0 z) x2))))
(assert-claim
  (forall ((x list2) (y list2) (z list) (x2 Int))
    (= (<= (count (lmerge y x) z) x2) (<= (count y z) x2))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list3))
    (= (count2 y (cons2 x2 (cons2 z x3)))
      (count2 y (cons2 z (cons2 x2 x3))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 x (cons3 (+ x x) y)) (count3 x (cons3 0 y)))))
(assert-claim
  (forall ((x list) (y list2))
    (= (count3 (count y (cons y x)) y) (count3 1 y))))
(assert-claim
  (forall ((x Int) (y list2) (z list))
    (= (count (cons3 (count3 x y) y) z) (count (cons3 0 y) z))))
(assert-claim
  (forall ((x Int) (y list2) (z list2) (x2 list))
    (= (count (cons3 (count3 x z) z) x2)
      (count (cons3 (count3 x y) z) x2))))
(assert-claim
  (forall ((x list2) (y Int) (z list2))
    (= (lmerge (cons3 y x) (cons3 y z))
      (cons3 y (lmerge x (cons3 y z))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count3 x (cons3 0 y))) (<= x (count3 x y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= y (count3 y (cons3 1 x))) (<= y 1))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count3 (+ x 1) y)) (<= x (count3 (+ x x) y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count3 0 (cons3 x y))) (<= x (count3 0 y)))))
(assert-claim
  (forall ((x list2) (y list) (z Int))
    (= (<= z (count (cons3 1 x) y)) (<= z 0))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (+ x x) (count3 1 y)) (<= (+ x x) (count3 x y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (count3 y (cons3 1 x)) y) (<= (count3 y (lmerge x x)) y))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y (cons2 y nil2)))
      (count2 y (cons2 z (cons2 z nil2))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (count3 x (cons3 (+ y x) nil3)) (count3 y (cons3 0 nil3)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 x (cons3 (+ x 1) y)) (count3 x y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 (+ x x) (cons3 0 y)) (count3 (+ x x) (cons3 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 (+ x x) (cons3 1 y)) (count3 (+ x x) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 (+ x 1) (cons3 x y)) (count3 (+ x 1) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count3 0 (cons3 (+ x x) y)) (count3 0 (cons3 x y)))))
(assert-claim
  (forall ((x list2) (y list) (z list2))
    (= (count3 (count x (pairwise (pairwise y))) z)
      (count3 (count x (pairwise y)) z))))
(assert-claim
  (forall ((x list) (y list2) (z list) (x2 list2))
    (= (count3 (count (lmerge x2 y) x) x2)
      (count3 (count (lmerge x2 y) z) x2))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (cons x (risers (msortbu2 y))))
      (count y (cons x (pairwise (risers y)))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (cons x (risers (msortbu2 x))))
      (count x (cons y (risers (msortbu2 y)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (cons (cons3 0 x) y)) (count x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (cons (lmerge y x) nil))
      (count nil3 (cons x (risers y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (cons (msortbu2 x) (risers y)))
      (count y (cons x (pairwise (risers y)))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count x (pairwise (cons x (risers x))))
      (count nil3 (cons x (risers y))))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (count y (pairwise (pairwise (cons x z))))
      (count x (pairwise (pairwise (cons y z)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (pairwise (pairwise (cons x y))))
      (count nil3 (cons (mergingbu2 y) nil)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count y (pairwise (risers (cons3 x y)))) 0)))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (count x (pairwise (risers (lmerge z y))))
      (count x (pairwise (risers (lmerge y z)))))))
(assert-claim
  (forall ((x list2))
    (= (count x (pairwise (risers (lmerge x x)))) 0)))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count y (risers (cons3 x (msortbu2 y))))
      (count y (risers (cons3 x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (risers (lmerge y (msortbu2 x))))
      (count (lmerge y x) (risers y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (risers (lmerge x (msortbu2 y))))
      (count y (risers (lmerge x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count x (risers (lmerge (msortbu2 x) y)))
      (count x (risers (lmerge x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count x (risers (msortbu2 (lmerge y y)))) 0)))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil3 (cons (lmerge x x) y))
      (count nil3 (cons (msortbu2 x) y)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (count (lmerge y z) (pairwise (risers x)))
      (count x (risers (msortbu2 (lmerge y z)))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count nil3 (cons x (pairwise (risers y))))
      (count nil3 (cons x (risers y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count nil3 (pairwise (cons y (risers x))))
      (count x (cons (lmerge y y) nil)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil3 (pairwise (cons (msortbu2 x) y)))
      (count nil3 (pairwise (cons x y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (cons x (pairwise (pairwise (pairwise y)))))
      (cons (lmerge x (mergingbu2 y)) nil))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil3 (cons (cons3 0 nil3) y))
      (count nil3 (cons (cons3 0 x) y)))))
