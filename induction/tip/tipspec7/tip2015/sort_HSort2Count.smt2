(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype
  Heap
  ((Node (proj1-Node Heap) (proj2-Node Int) (proj3-Node Heap))
   (Nil)))
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
  toList
  ((x Heap)) list2
  (match x
    (((Node p y q) (cons2 y (toList (hmerge p q))))
     (Nil nil2))))
(define-fun
  hinsert
  ((x Int) (y Heap)) Heap (hmerge (Node Nil x Nil) y))
(define-fun-rec
  toHeap2
  ((x list2)) Heap
  (match x
    ((nil2 Nil)
     ((cons2 y xs) (hinsert y (toHeap2 xs))))))
(define-fun
  hsort2
  ((x list2)) list2 (toList (toHeap2 x)))
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
(assert-not
  (forall ((x Int) (xs list2))
    (= (count2 x (hsort2 xs)) (count2 x xs))))
(assert-claim (= (toList Nil) nil2))
(assert-claim (= (toHeap2 nil2) Nil))
(assert-claim (= (hsort2 nil2) nil2))
(assert-claim (forall ((y sk)) (= (count y nil) 0)))
(assert-claim (forall ((x Heap)) (= (hmerge x Nil) x)))
(assert-claim (forall ((x Heap)) (= (hmerge Nil x) x)))
(assert-claim
  (forall ((x list2)) (= (hsort2 (hsort2 x)) (hsort2 x))))
(assert-claim
  (forall ((x list2)) (= (hsort2 x) (toList (toHeap2 x)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 x (hsort2 y)) (count2 x y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (toHeap2 (cons2 x y)) (hinsert x (toHeap2 y)))))
(assert-claim
  (forall ((x Int)) (= (hinsert x Nil) (Node Nil x Nil))))
(assert-claim
  (forall ((x Int)) (= (hsort2 (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((y sk) (z list))
    (= (+ 1 (count y z)) (count y (cons y z)))))
(assert-claim (forall ((y sk) (z list)) (<= 0 (count y z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y nil)) (count y (cons z nil)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (hinsert y (hinsert x Nil)) (hinsert x (hinsert y Nil)))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (hmerge (hinsert x Nil) y) (hinsert x y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (hsort2 (cons2 x (hsort2 y))) (hsort2 (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (hsort2 (toList (hinsert x y))) (hsort2 (cons2 x (toList y))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort2 (toList (hmerge y x))) (hsort2 (toList (hmerge x y))))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (toList (Node y x Nil)) (cons2 x (toList y)))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (toList (Node Nil x y)) (cons2 x (toList y)))))
(assert-claim
  (forall ((x list2)) (= (count2 0 (cons2 1 x)) (count2 0 x))))
(assert-claim
  (forall ((x list2)) (= (count2 1 (cons2 0 x)) (count2 1 x))))
(assert-claim
  (forall ((x Heap) (y Int) (z Heap))
    (= (cons2 y (toList (hmerge x z))) (toList (Node x y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list2))
    (=> (<= z x)
      (= (hsort2 (cons2 z (cons2 y x2)))
        (hsort2 (cons2 y (cons2 z x2)))))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 Heap))
    (=> (<= z x)
      (= (toList (hinsert z (hinsert y x2)))
        (toList (hinsert y (hinsert z x2)))))))
(assert-claim
  (forall ((x Int) (y Int) (z Heap))
    (=> (<= y x)
      (= (<= y (count2 y (toList z))) (<= y (count2 1 (toList z)))))))
(assert-claim
  (forall ((x Int))
    (= (Node (hinsert x Nil) x Nil) (hinsert x (hinsert x Nil)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (Node (hinsert y Nil) x Nil) (hinsert x (hinsert y Nil))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (Node (hinsert 1 y) 0 x) (hinsert 1 (Node x 0 y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (count2 y x) (+ y y)) (<= (count2 y x) y))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Int))
    (= (hinsert z (Node x z y)) (Node (Node x z y) z Nil))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list))
    (= (count y (cons x2 (cons z x3)))
      (count y (cons z (cons x2 x3))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 x (cons2 (+ x x) y)) (count2 x (cons2 0 y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= y (count2 y (cons2 1 x))) (<= y 1))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 0 (cons2 x y))) (<= x (count2 0 y)))))
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
  (forall ((x Heap) (y Int) (z Heap))
    (= (hsort2 (toList (hmerge x (hinsert y z))))
      (hsort2 (toList (Node x y z))))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Heap))
    (= (hsort2 (toList (hmerge (hmerge x y) z)))
      (hsort2 (toList (hmerge x (hmerge y z)))))))
(assert-claim
  (forall ((x Int) (y Heap) (z Int))
    (= (toList (hinsert x (Node Nil z y)))
      (toList (hinsert x (Node y z Nil))))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (toList (hmerge (Node Nil x y) y))
      (toList (hmerge (Node y x Nil) y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 (+ x x) y)) (<= x (count2 (+ 1 1) y)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= (count2 x (cons2 0 nil2)) y)
      (<= (count2 x (cons2 y nil2)) y))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hinsert 0 (Node x 1 y)) (Node (Node x 1 y) 0 Nil))))
(assert-claim
  (forall ((x Heap) (y list2))
    (= (hsort2 (toList (hmerge x (toHeap2 (hsort2 y)))))
      (hsort2 (toList (hmerge x (toHeap2 y)))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort2 (toList (hmerge x (toHeap2 (toList y)))))
      (hsort2 (toList (hmerge x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (hsort2 (toList (hmerge (toHeap2 x) (toHeap2 y))))
      (toList (hmerge (toHeap2 x) (toHeap2 y))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (toHeap2 (hsort2 (cons2 x (cons2 y nil2))))
      (hinsert x (hinsert y Nil)))))
