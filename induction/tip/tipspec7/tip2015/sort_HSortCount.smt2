(declare-sort sk 0)
(declare-datatype list3 ((nil3) (cons3 (head3 Int) (tail3 list3))))
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype
  Heap
  ((Node (proj1-Node Heap) (proj2-Node Int) (proj3-Node Heap))
   (Nil)))
(declare-datatype list ((nil) (cons (head Heap) (tail list))))
(define-fun-rec
  toHeap
  ((x list3)) list
  (match x
    ((nil3 nil)
     ((cons3 y z) (cons (Node Nil y Nil) (toHeap z))))))
(define-fun-rec
  hmerge
  ((x Heap) (y Heap)) Heap
  (match x
    (((Node z x2 x3)
      (match y
        (((Node x4 x5 x6)
          (ite
            (<= x2 x5) (Node (hmerge x3 (Node x4 x5 x6)) x2 z)
            (Node (hmerge (Node z x2 x3) x6) x5 x4)))
         (Nil (Node z x2 x3)))))
     (Nil y))))
(define-fun-rec
  hpairwise
  ((x list)) list
  (match x
    ((nil nil)
     ((cons p y)
      (match y
        ((nil (cons p nil))
         ((cons q qs) (cons (hmerge p q) (hpairwise qs)))))))))
(define-fun-rec
  hmerging
  ((x list)) Heap
  (match x
    ((nil Nil)
     ((cons p y)
      (match y
        ((nil p)
         ((cons z x2) (hmerging (hpairwise (cons p (cons z x2)))))))))))
(define-fun
  toHeap2
  ((x list3)) Heap (hmerging (toHeap x)))
(define-fun-rec
  toList
  ((x Heap)) list3
  (match x
    (((Node p y q) (cons3 y (toList (hmerge p q))))
     (Nil nil3))))
(define-fun
  hsort
  ((x list3)) list3 (toList (toHeap2 x)))
(define-fun-rec
  count3
  ((x Int) (y list3)) Int
  (match y
    ((nil3 0)
     ((cons3 z ys) (ite (= x z) (+ 1 (count3 x ys)) (count3 x ys))))))
(define-fun-rec
  count2
  ((x sk) (y list2)) Int
  (match y
    ((nil2 0)
     ((cons2 z ys) (ite (= x z) (+ 1 (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x Heap) (y list)) Int
  (match y
    ((nil 0)
     ((cons z ys) (ite (= x z) (+ 1 (count x ys)) (count x ys))))))
(assert-not
  (forall ((x Int) (xs list3))
    (= (count3 x (hsort xs)) (count3 x xs))))
(assert-claim (= (toHeap nil3) nil))
(assert-claim (= (hpairwise nil) nil))
(assert-claim (= (hmerging nil) Nil))
(assert-claim (= (toHeap2 nil3) Nil))
(assert-claim
  (= (toHeap2 (cons3 0 (cons3 1 nil3)))
    (Node (Node Nil 1 Nil) 0 Nil)))
(assert-claim (= (toList Nil) nil3))
(assert-claim (= (hsort nil3) nil3))
(assert-claim (forall ((y sk)) (= (count2 y nil2) 0)))
(assert-claim (forall ((x Heap)) (= (hmerge x Nil) x)))
(assert-claim (forall ((x Heap)) (= (hmerge Nil x) x)))
(assert-claim
  (forall ((x list)) (= (hmerging (hpairwise x)) (hmerging x))))
(assert-claim
  (forall ((x list3)) (= (toHeap2 x) (hmerging (toHeap x)))))
(assert-claim (forall ((x list3)) (= (hsort (hsort x)) (hsort x))))
(assert-claim
  (forall ((x list3)) (= (hsort x) (toList (toHeap2 x)))))
(assert-claim
  (forall ((x Int) (y list3)) (= (count3 x (hsort y)) (count3 x y))))
(assert-claim (forall ((x list3)) (= (count Nil (toHeap x)) 0)))
(assert-claim (forall ((x Heap)) (= (hmerging (cons x nil)) x)))
(assert-claim
  (forall ((x list)) (= (hmerging (cons Nil x)) (hmerging x))))
(assert-claim
  (forall ((x Heap)) (= (hpairwise (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list))
    (= (hpairwise (hpairwise (hpairwise x)))
      (hpairwise (hpairwise x)))))
(assert-claim
  (forall ((x Int)) (= (hsort (cons3 x nil3)) (cons3 x nil3))))
(assert-claim
  (forall ((x Int)) (= (toHeap2 (cons3 x nil3)) (Node Nil x Nil))))
(assert-claim
  (forall ((x Heap) (y Heap) (z list))
    (= (count (hmerge y x) z) (count (hmerge x y) z))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (+ 1 (count2 y z)) (count2 y (cons2 y z)))))
(assert-claim (forall ((y sk) (z list2)) (<= 0 (count2 y z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y nil2)) (count2 y (cons2 z nil2)))))
(assert-claim
  (forall ((x Heap) (y list3))
    (= (count x (toHeap (hsort y))) (count x (toHeap y)))))
(assert-claim
  (forall ((x list3) (y list))
    (= (count (toHeap2 (hsort x)) y) (count (toHeap2 x) y))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (hsort (cons3 x (hsort y))) (hsort (cons3 x y)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort (toList (hmerge y x))) (hsort (toList (hmerge x y))))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (toList (Node y x Nil)) (cons3 x (toList y)))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (toList (Node Nil x y)) (cons3 x (toList y)))))
(assert-claim
  (forall ((x list3)) (= (count3 0 (cons3 1 x)) (count3 0 x))))
(assert-claim
  (forall ((x list3)) (= (count3 1 (cons3 0 x)) (count3 1 x))))
(assert-claim
  (forall ((x list3)) (= (count Nil (hpairwise (toHeap x))) 0)))
(assert-claim
  (forall ((x Int))
    (= (hpairwise (toHeap (cons3 x nil3))) (toHeap (cons3 x nil3)))))
(assert-claim
  (forall ((x Heap) (y Int) (z Heap))
    (= (cons3 y (toList (hmerge x z))) (toList (Node x y z)))))
(assert-claim
  (forall ((x Heap) (y Int) (z Heap) (x2 list))
    (= (count (Node z y x) x2) (count (Node x y z) x2))))
(assert-claim
  (forall ((x Heap) (y Int) (z list))
    (= (count (Node x y x) z) (count (Node x y Nil) z))))
(assert-claim
  (forall ((x Heap) (y Int) (z Heap) (x2 list))
    (= (count (Node z y z) x2) (count (Node x y z) x2))))
(assert-claim
  (forall ((x Heap) (y list3))
    (= (count (hmerge x x) (toHeap y)) 0)))
(assert-claim
  (forall ((x Heap) (y list) (z list))
    (= (count (hmerging (cons x y)) z)
      (count (hmerge x (hmerging y)) z))))
(assert-claim
  (forall ((x Heap) (y Heap) (z list))
    (= (hpairwise (cons x (cons y z)))
      (cons (hmerge x y) (hpairwise z)))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list3))
    (=> (<= z x)
      (= (hsort (cons3 z (cons3 y x2)))
        (hsort (cons3 y (cons3 z x2)))))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list3))
    (=> (<= z x)
      (= (toHeap2 (cons3 z (cons3 y x2)))
        (toHeap2 (cons3 y (cons3 z x2)))))))
(assert-claim
  (forall ((x Heap) (y list)) (<= (count x (hpairwise y)) 1)))
(assert-claim
  (forall ((x list3) (y Heap))
    (= (count Nil (cons y (toHeap x))) (count y (cons Nil nil)))))
(assert-claim
  (forall ((x Heap) (y list3))
    (= (count (toHeap2 (toList x)) (toHeap y)) (count x (toHeap y)))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (hpairwise (cons x (hpairwise (hpairwise y))))
      (cons (hmerge x (hmerging y)) nil))))
(assert-claim
  (forall ((x Int))
    (= (hsort (cons3 x (cons3 x nil3))) (cons3 x (cons3 x nil3)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (hsort (cons3 x (cons3 y nil3))) (cons3 x (cons3 y nil3))))))
(assert-claim
  (forall ((x Int))
    (= (toHeap (cons3 x nil3)) (cons (Node Nil x Nil) nil))))
(assert-claim
  (forall ((x list3))
    (= (count Nil (hpairwise (hpairwise (toHeap x)))) 0)))
(assert-claim
  (forall ((x list))
    (= (hpairwise (hpairwise (cons Nil (hpairwise x))))
      (cons (hmerging x) nil))))
(assert-claim
  (forall ((x list3) (y Int) (z Int))
    (= (<= (+ y y) (count3 z x)) (<= (+ z y) z))))
(assert-claim
  (forall ((x Heap) (y list) (z Int))
    (= (<= (count x y) (+ z z)) (<= (count x (hpairwise y)) z))))
(assert-claim
  (forall ((x list3) (y Int))
    (= (<= (count3 (+ y y) x) y) (<= (count3 y x) (+ y y)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list2))
    (= (count2 y (cons2 x2 (cons2 z x3)))
      (count2 y (cons2 z (cons2 x2 x3))))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (count3 x (cons3 (+ x x) y)) (count3 x (cons3 0 y)))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Heap) (x2 list))
    (= (count x (cons (hmerge z y) x2))
      (count x (cons (hmerge y z) x2)))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (count x (cons (hmerge x x) y)) (count x (cons Nil y)))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (<= x (count3 x (cons3 0 y))) (<= x (count3 x y)))))
(assert-claim
  (forall ((x list3) (y Int))
    (= (<= y (count3 y (cons3 1 x))) (<= y 1))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (<= x (count3 (+ x 1) y)) (<= x (count3 (+ x x) y)))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (<= x (count3 0 (cons3 x y))) (<= x (count3 0 y)))))
(assert-claim
  (forall ((x Int) (y Heap) (z list))
    (= (<= x (count y (hpairwise (hpairwise z))))
      (<= x (count y (hpairwise z))))))
(assert-claim
  (forall ((x Int) (y Heap) (z list))
    (= (<= x (count (toHeap2 (toList y)) z)) (<= x (count y z)))))
(assert-claim
  (forall ((x list3) (y Int))
    (= (<= (count3 1 x) (+ y y)) (<= (count3 (+ y 1) x) y))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (<= (count (hmerge x x) y) 1) (<= (count x y) 1))))
(assert-claim
  (forall ((x Heap) (y list) (z Int))
    (= (<= (count (toHeap2 (toList x)) y) z) (<= (count x y) z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y (cons2 y nil2)))
      (count2 y (cons2 z (cons2 z nil2))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (count3 x (cons3 (+ y x) nil3)) (count3 y (cons3 0 nil3)))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (count3 x (cons3 (+ x 1) y)) (count3 x y))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (count3 (+ x x) (cons3 0 y)) (count3 (+ x x) (cons3 x y)))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (count3 (+ x x) (cons3 1 y)) (count3 (+ x x) y))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (count3 (+ x 1) (cons3 x y)) (count3 (+ x 1) y))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (count3 0 (cons3 (+ x x) y)) (count3 0 (cons3 x y)))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (count3 1 (cons3 (+ x x) y)) (count3 1 y))))
(assert-claim
  (forall ((x list) (y list3))
    (= (count3 (count (toHeap2 y) (hpairwise x)) y)
      (count3 (count (toHeap2 y) x) y))))
(assert-claim
  (forall ((x Heap) (y list) (z list3))
    (= (count3 (count (toHeap2 (toList x)) y) z)
      (count3 (count x y) z))))
(assert-claim
  (forall ((x Heap) (y Heap) (z list3))
    (= (count x (cons y (toHeap (hsort z))))
      (count x (cons y (toHeap z))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (count x (cons (hmerge y x) nil)) (count y (cons Nil nil)))))
(assert-claim
  (forall ((x Heap) (y list3) (z list))
    (= (count x (cons (toHeap2 (hsort y)) z))
      (count x (cons (toHeap2 y) z)))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (count Nil (cons (hmerge x x) y)) (count Nil (cons x y)))))
(assert-claim
  (forall ((x Heap) (y Heap) (z list))
    (= (count (Node x 1 y) (hpairwise z)) (count (Node x 1 y) z))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (count (hmerge x x) (cons Nil y))
      (count (hmerge x x) (cons x y)))))
(assert-claim
  (forall ((x Heap) (y list3) (z list))
    (= (count (hmerge x (toHeap2 (hsort y))) z)
      (count (hmerge x (toHeap2 y)) z))))
(assert-claim
  (forall ((x Heap) (y Heap) (z list))
    (= (count (hmerge x (toHeap2 (toList y))) z)
      (count (hmerge x y) z))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (toList (hmerge (Node Nil x y) y))
      (toList (hmerge (Node y x Nil) y)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= x (count3 y (cons3 1 nil3)))
      (<= x (count3 x (cons3 y nil3))))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (<= x (count3 (+ 1 1) y)) (<= x (count3 (+ x x) y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (<= x (count3 x (toList (hmerging y))))
      (<= x (count3 1 (toList (hmerging y)))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= (count3 x (cons3 0 nil3)) y)
      (<= (count3 x (cons3 y nil3)) y))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (cons (Node Nil x Nil) (toHeap y)) (toHeap (cons3 x y)))))
(assert-claim
  (forall ((x Int))
    (= (toHeap2 (cons3 x (cons3 x nil3)))
      (Node (Node Nil x Nil) x Nil))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (count x (hpairwise (hpairwise (cons Nil y))))
      (count x (cons (hmerging y) nil)))))
(assert-claim
  (forall ((x Heap))
    (= (count x (hpairwise (toHeap (hsort (toList x)))))
      (count x (hpairwise (toHeap (toList x)))))))
(assert-claim
  (forall ((x list3) (y Heap))
    (= (count Nil (cons y (hpairwise (toHeap x))))
      (count y (cons Nil nil)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (count Nil (cons (hmerge x y) nil))
      (count x (cons (hmerge y y) nil)))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (count Nil (cons (toHeap2 (toList x)) y))
      (count Nil (cons x y)))))
(assert-claim
  (forall ((x list3))
    (= (count (toHeap2 x) (hpairwise (toHeap (hsort x))))
      (count (toHeap2 x) (hpairwise (toHeap x))))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (hpairwise (cons Nil (hpairwise (cons x y))))
      (hpairwise (cons x (hpairwise (cons Nil y)))))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (hpairwise (toHeap (cons3 0 (cons3 x y))))
      (hpairwise (toHeap (cons3 x (cons3 0 y)))))))
(assert-claim
  (forall ((x Int) (y list3))
    (= (hpairwise (toHeap (cons3 1 (cons3 x y))))
      (hpairwise (toHeap (cons3 x (cons3 1 y)))))))
(assert-claim
  (forall ((x Heap) (y list3))
    (= (hsort (toList (hmerge x (toHeap2 (hsort y)))))
      (hsort (toList (hmerge x (toHeap2 y)))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort (toList (hmerge x (toHeap2 (toList y)))))
      (hsort (toList (hmerge x y))))))
(assert-claim
  (forall ((x list3) (y list3))
    (= (hsort (toList (hmerge (toHeap2 x) (toHeap2 y))))
      (toList (hmerge (toHeap2 x) (toHeap2 y))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (toHeap2 (hsort (cons3 x (cons3 y nil3))))
      (toHeap2 (cons3 x (cons3 y nil3))))))
(assert-claim
  (forall ((x list3))
    (= (count Nil (hpairwise (cons Nil (toHeap x))))
      (count Nil (cons (toHeap2 x) nil)))))
(assert-claim
  (forall ((x Int))
    (= (hpairwise (cons Nil (toHeap (cons3 x nil3))))
      (toHeap (cons3 x nil3)))))
