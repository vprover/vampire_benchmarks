(declare-datatype list ((nil) (cons (head Int) (tail list))))
(declare-datatype
  Heap
  ((Node (proj1-Node Heap) (proj2-Node Int) (proj3-Node Heap))
   (Nil)))
(define-fun-rec
  ordered
  ((x list)) Bool
  (match x
    ((nil true)
     ((cons y z)
      (match z
        ((nil true)
         ((cons y2 xs) (and (<= y y2) (ordered (cons y2 xs))))))))))
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
  ((x Heap)) list
  (match x
    (((Node p y q) (cons y (toList (hmerge p q))))
     (Nil nil))))
(define-fun
  hinsert
  ((x Int) (y Heap)) Heap (hmerge (Node Nil x Nil) y))
(define-fun-rec
  toHeap2
  ((x list)) Heap
  (match x
    ((nil Nil)
     ((cons y xs) (hinsert y (toHeap2 xs))))))
(define-fun
  hsort2
  ((x list)) list (toList (toHeap2 x)))
(assert-not (forall ((xs list)) (ordered (hsort2 xs))))
(assert-claim (ordered nil))
(assert-claim (= (toList Nil) nil))
(assert-claim (= (toHeap2 nil) Nil))
(assert-claim (= (hsort2 nil) nil))
(assert-claim
  (forall ((x list)) (=> (ordered x) (= (hsort2 x) x))))
(assert-claim (forall ((x Heap)) (= (hmerge x Nil) x)))
(assert-claim (forall ((x Heap)) (= (hmerge Nil x) x)))
(assert-claim
  (forall ((x list)) (= (hsort2 (hsort2 x)) (hsort2 x))))
(assert-claim (forall ((x list)) (ordered (hsort2 x))))
(assert-claim
  (forall ((x list)) (= (hsort2 x) (toList (toHeap2 x)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (toHeap2 (cons x y)) (hinsert x (toHeap2 y)))))
(assert-claim
  (forall ((x Int)) (= (hinsert x Nil) (Node Nil x Nil))))
(assert-claim
  (forall ((x Int)) (= (hsort2 (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (hinsert y (hinsert x Nil)) (hinsert x (hinsert y Nil)))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (hmerge (hinsert x Nil) y) (hinsert x y))))
(assert-claim
  (forall ((x Int) (y list))
    (= (hsort2 (cons x (hsort2 y))) (hsort2 (cons x y)))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (hsort2 (toList (hinsert x y))) (hsort2 (cons x (toList y))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort2 (toList (hmerge y x))) (hsort2 (toList (hmerge x y))))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (ordered (toList (hinsert x y))) (ordered (toList y)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (ordered (toList (hmerge y x)))
      (ordered (toList (hmerge x y))))))
(assert-claim
  (forall ((x Heap))
    (= (ordered (toList (hmerge x x))) (ordered (toList x)))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (toList (Node y x Nil)) (cons x (toList y)))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (toList (Node Nil x y)) (cons x (toList y)))))
(assert-claim
  (forall ((x Heap) (y Int) (z Heap))
    (= (cons y (toList (hmerge x z))) (toList (Node x y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list))
    (=> (<= z x)
      (= (hsort2 (cons z (cons y x2))) (hsort2 (cons y (cons z x2)))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (ordered (cons x (cons x y))) (ordered (cons x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= x y)
      (= (ordered (cons x (cons y z))) (ordered (cons y z))))))
(assert-claim
  (forall ((x Heap) (y Int) (z Heap))
    (= (ordered (toList (Node z y x)))
      (ordered (toList (Node x y z))))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (ordered (toList (Node y x y))) (ordered (cons x (toList y))))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 Heap))
    (=> (<= z x)
      (= (toList (hinsert z (hinsert y x2)))
        (toList (hinsert y (hinsert z x2)))))))
(assert-claim
  (forall ((x Int))
    (= (Node (hinsert x Nil) x Nil) (hinsert x (hinsert x Nil)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (Node (hinsert y Nil) x Nil) (hinsert x (hinsert y Nil))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (ordered (cons x (cons y nil))) (<= x y))))
(assert-claim
  (forall ((x list) (y Heap))
    (= (ordered (toList (hmerge y (toHeap2 x))))
      (ordered (toList y)))))
(assert-claim
  (forall ((x list) (y list))
    (=> (ordered y)
      (= (toList (hmerge (toHeap2 y) (toHeap2 x)))
        (toList (hmerge (toHeap2 x) (toHeap2 y)))))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Int))
    (= (hinsert z (Node x z y)) (Node (Node x z y) z Nil))))
(assert-claim
  (forall ((x Heap) (y Int) (z Heap))
    (= (hsort2 (toList (hmerge x (hinsert y z))))
      (hsort2 (toList (Node x y z))))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Heap))
    (= (hsort2 (toList (hmerge (hmerge x y) z)))
      (hsort2 (toList (hmerge x (hmerge y z)))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (ordered (cons x (hsort2 (cons x y))))
      (ordered (cons x (hsort2 y))))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (ordered (cons x (toList (hinsert x y))))
      (ordered (cons x (toList y))))))
(assert-claim
  (forall ((x Int) (y Heap) (z Heap))
    (= (ordered (toList (hmerge y (hinsert x z))))
      (ordered (toList (hmerge y z))))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Heap))
    (= (ordered (toList (hmerge x (hmerge z y))))
      (ordered (toList (hmerge x (hmerge y z)))))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Heap))
    (= (ordered (toList (hmerge y (hmerge x z))))
      (ordered (toList (hmerge x (hmerge y z)))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (ordered (toList (hmerge x (hmerge x y))))
      (ordered (toList (hmerge x y))))))
(assert-claim
  (forall ((x Int) (y Heap) (z Int))
    (= (toList (hinsert x (Node Nil z y)))
      (toList (hinsert x (Node y z Nil))))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (hsort2 (toList (hmerge x (toHeap2 (hsort2 y)))))
      (hsort2 (toList (hmerge x (toHeap2 y)))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort2 (toList (hmerge x (toHeap2 (toList y)))))
      (hsort2 (toList (hmerge x y))))))
(assert-claim
  (forall ((x list) (y list))
    (= (hsort2 (toList (hmerge (toHeap2 x) (toHeap2 y))))
      (toList (hmerge (toHeap2 x) (toHeap2 y))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (toHeap2 (hsort2 (cons x (cons y nil))))
      (hinsert x (hinsert y Nil)))))
