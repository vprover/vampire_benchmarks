(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype
  Heap
  ((Node (proj1-Node Heap) (proj2-Node Int) (proj3-Node Heap))
   (Nil)))
(declare-datatype list ((nil) (cons (head Heap) (tail list))))
(define-fun-rec
  toHeap
  ((x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y z) (cons (Node Nil y Nil) (toHeap z))))))
(define-fun-rec
  insert2
  ((x Int) (y list2)) list2
  (match y
    ((nil2 (cons2 x nil2))
     ((cons2 z xs)
      (ite (<= x z) (cons2 x (cons2 z xs)) (cons2 z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (insert2 y (isort xs))))))
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
  ((x list2)) Heap (hmerging (toHeap x)))
(define-fun-rec
  toList
  ((x Heap)) list2
  (match x
    (((Node p y q) (cons2 y (toList (hmerge p q))))
     (Nil nil2))))
(define-fun
  hsort
  ((x list2)) list2 (toList (toHeap2 x)))
(assert-not (forall ((xs list2)) (= (hsort xs) (isort xs))))
(assert-claim (= (toHeap nil2) nil))
(assert-claim (= (hpairwise nil) nil))
(assert-claim (= (hmerging nil) Nil))
(assert-claim (= (toHeap2 nil2) Nil))
(assert-claim (= (toList Nil) nil2))
(assert-claim (= (hsort nil2) nil2))
(assert-claim (forall ((x list2)) (= (hsort x) (isort x))))
(assert-claim (forall ((x Heap)) (= (hmerge x Nil) x)))
(assert-claim (forall ((x Heap)) (= (hmerge Nil x) x)))
(assert-claim
  (forall ((x list)) (= (hmerging (hpairwise x)) (hmerging x))))
(assert-claim
  (forall ((x list2)) (= (toHeap2 x) (hmerging (toHeap x)))))
(assert-claim (forall ((x list2)) (= (hsort (hsort x)) (hsort x))))
(assert-claim
  (forall ((x Int)) (= (insert2 x nil2) (cons2 x nil2))))
(assert-claim
  (forall ((x list2)) (= (hsort x) (toList (toHeap2 x)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (hsort (insert2 x y)) (hsort (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 x (hsort y)) (hsort (cons2 x y)))))
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
  (forall ((x Int)) (= (toHeap2 (cons2 x nil2)) (Node Nil x Nil))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 x (cons2 x y)) (cons2 x (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (insert2 x (cons2 y z)) (cons2 x (cons2 y z))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort (toList (hmerge y x))) (hsort (toList (hmerge x y))))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (toList (Node y x Nil)) (cons2 x (toList y)))))
(assert-claim
  (forall ((x Int) (y Heap))
    (= (toList (Node Nil x y)) (cons2 x (toList y)))))
(assert-claim
  (forall ((x Int))
    (= (hpairwise (toHeap (cons2 x nil2))) (toHeap (cons2 x nil2)))))
(assert-claim
  (forall ((x Heap) (y Int) (z Heap))
    (= (cons2 y (toList (hmerge x z))) (toList (Node x y z)))))
(assert-claim
  (forall ((x Heap) (y Heap) (z list))
    (= (hpairwise (cons x (cons y z)))
      (cons (hmerge x y) (hpairwise z)))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list2))
    (=> (<= z x)
      (= (toHeap2 (cons2 z (cons2 y x2)))
        (toHeap2 (cons2 y (cons2 z x2)))))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (hpairwise (cons x (hpairwise (hpairwise y))))
      (cons (hmerge x (hmerging y)) nil))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (toHeap2 (insert2 x (cons2 y nil2)))
      (toHeap2 (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int))
    (= (toHeap (cons2 x nil2)) (cons (Node Nil x Nil) nil))))
(assert-claim
  (forall ((x list))
    (= (hpairwise (hpairwise (cons Nil (hpairwise x))))
      (cons (hmerging x) nil))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (hpairwise (toHeap (cons2 y (cons2 x z))))
      (hpairwise (toHeap (cons2 x (cons2 y z)))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (cons (Node Nil x Nil) (toHeap y)) (toHeap (cons2 x y)))))
(assert-claim
  (forall ((x Int))
    (= (toHeap2 (cons2 x (cons2 x nil2)))
      (Node (Node Nil x Nil) x Nil))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (hpairwise (cons Nil (hpairwise (cons x y))))
      (hpairwise (cons x (hpairwise (cons Nil y)))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (hpairwise (toHeap (insert2 x (cons2 y nil2))))
      (hpairwise (toHeap (cons2 x (cons2 y nil2)))))))
(assert-claim
  (forall ((x Heap) (y list2))
    (= (hsort (toList (hmerge x (toHeap2 (hsort y)))))
      (hsort (toList (hmerge x (toHeap2 y)))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort (toList (hmerge x (toHeap2 (toList y)))))
      (hsort (toList (hmerge x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (hsort (toList (hmerge (toHeap2 x) (toHeap2 y))))
      (toList (hmerge (toHeap2 x) (toHeap2 y))))))
(assert-claim
  (forall ((x Int))
    (= (hpairwise (cons Nil (toHeap (cons2 x nil2))))
      (toHeap (cons2 x nil2)))))
