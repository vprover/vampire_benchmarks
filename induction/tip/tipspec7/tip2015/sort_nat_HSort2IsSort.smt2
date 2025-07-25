(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(declare-datatype
  Heap
  ((Node (proj1-Node Heap) (proj2-Node Nat) (proj3-Node Heap))
   (Nil)))
(define-fun-rec
  leq
  ((x Nat) (y Nat)) Bool
  (match x
    ((zero true)
     ((succ z)
      (match y
        ((zero false)
         ((succ x2) (leq z x2))))))))
(define-fun-rec
  insert2
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (leq x z) (cons x (cons z xs)) (cons z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (insert2 y (isort xs))))))
(define-fun-rec
  hmerge
  ((x Heap) (y Heap)) Heap
  (match x
    (((Node z x2 x3)
      (match y
        (((Node x4 x5 x6)
          (ite
            (leq x2 x5) (Node (hmerge x3 (Node x4 x5 x6)) x2 z)
            (Node (hmerge (Node z x2 x3) x6) x5 x4)))
         (Nil (Node z x2 x3)))))
     (Nil y))))
(define-fun-rec
  toList
  ((x Heap)) list
  (match x
    (((Node q y r) (cons y (toList (hmerge q r))))
     (Nil nil))))
(define-fun
  hinsert
  ((x Nat) (y Heap)) Heap (hmerge (Node Nil x Nil) y))
(define-fun-rec
  toHeap2
  ((x list)) Heap
  (match x
    ((nil Nil)
     ((cons y xs) (hinsert y (toHeap2 xs))))))
(define-fun
  hsort2
  ((x list)) list (toList (toHeap2 x)))
(assert-not (forall ((xs list)) (= (hsort2 xs) (isort xs))))
(assert-claim (= (toList Nil) nil))
(assert-claim (= (toHeap2 nil) Nil))
(assert-claim (= (hsort2 nil) nil))
(assert-claim (forall ((x list)) (= (hsort2 x) (isort x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Heap)) (= (hmerge x Nil) x)))
(assert-claim (forall ((x Heap)) (= (hmerge Nil x) x)))
(assert-claim
  (forall ((x list)) (= (hsort2 (hsort2 x)) (hsort2 x))))
(assert-claim (forall ((x Nat)) (= (insert2 x nil) (cons x nil))))
(assert-claim
  (forall ((x list)) (= (insert2 zero x) (cons zero x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim
  (forall ((x list)) (= (hsort2 x) (toList (toHeap2 x)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (hsort2 (insert2 x y)) (hsort2 (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (hsort2 y)) (hsort2 (cons x y)))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (toHeap2 (cons x y)) (hinsert x (toHeap2 y)))))
(assert-claim
  (forall ((x Heap)) (= (hinsert zero x) (Node x zero Nil))))
(assert-claim
  (forall ((x Nat)) (= (hinsert x Nil) (Node Nil x Nil))))
(assert-claim
  (forall ((x Heap))
    (= (toList (hinsert zero x)) (cons zero (toList x)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (insert2 x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (hinsert y (hinsert x Nil)) (hinsert x (hinsert y Nil)))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (hmerge (hinsert x Nil) y) (hinsert x y))))
(assert-claim
  (forall ((x Heap))
    (= (hmerge (hinsert zero x) x) (Node x zero x))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (hsort2 (toList (hinsert x y))) (hsort2 (cons x (toList y))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort2 (toList (hmerge y x))) (hsort2 (toList (hmerge x y))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (toList (Node y x Nil)) (cons x (toList y)))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (toList (Node Nil x y)) (cons x (toList y)))))
(assert-claim
  (forall ((x Heap))
    (= (toList (hinsert (succ zero) x))
      (insert2 (succ zero) (toList x)))))
(assert-claim
  (forall ((x Heap) (y Nat) (z Heap))
    (= (cons y (toList (hmerge x z))) (toList (Node x y z)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hmerge (Node y zero y) x) (Node (hmerge y x) zero y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (succ x) (cons x y)) (cons x (insert2 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (insert2 (succ y) (cons x z)) (cons x (insert2 (succ y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Heap))
    (=> (leq z x)
      (= (insert2 z (toList (hinsert y x2)))
        (insert2 y (toList (hinsert z x2)))))))
(assert-claim
  (forall ((x Nat))
    (= (Node (hinsert x Nil) x Nil) (hinsert x (hinsert x Nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (Node (hinsert y Nil) x Nil) (hinsert x (hinsert y Nil))))))
(assert-claim
  (forall ((x Heap))
    (= (hmerge (Node Nil zero x) x) (hinsert zero (hmerge x x)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (toHeap2 (insert2 x (cons y nil)))
      (hinsert x (hinsert y Nil)))))
(assert-claim
  (forall ((x Heap))
    (= (toList (hmerge x (hinsert zero x))) (toList (Node x zero x)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (toList (hmerge (hinsert zero y) x)) (toList (Node x zero y)))))
(assert-claim
  (forall ((x Heap))
    (= (toList (hmerge x (hinsert zero Nil))) (cons zero (toList x)))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Nat))
    (= (hinsert z (Node x z y)) (Node (Node x z y) z Nil))))
(assert-claim
  (forall ((x Heap) (y Nat) (z Heap))
    (= (hinsert (succ y) (Node z y x))
      (Node (hinsert (succ y) x) y z))))
(assert-claim
  (forall ((x Nat) (y Heap) (z Heap))
    (= (Node (hinsert (succ x) z) zero y)
      (hinsert (succ x) (Node y zero z)))))
(assert-claim
  (forall ((x Heap) (y Nat) (z Heap))
    (= (Node (hinsert y z) zero x)
      (hmerge (hinsert zero x) (hinsert y z)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hmerge (hinsert zero y) (hmerge y x))
      (Node (hmerge y x) zero y))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hmerge (hinsert zero y) (hmerge x y))
      (Node (hmerge x y) zero y))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hmerge (hinsert zero x) (hmerge y y))
      (hmerge (Node x zero y) y))))
(assert-claim
  (forall ((x Heap))
    (= (hmerge (hinsert zero (hmerge x x)) x)
      (Node x zero (hmerge x x)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hmerge (hmerge (hinsert zero x) y) y)
      (Node (hmerge x y) zero y))))
(assert-claim
  (forall ((x Heap) (y Nat) (z Heap))
    (= (hsort2 (toList (hmerge x (hinsert y z))))
      (hsort2 (toList (Node x y z))))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Heap))
    (= (hsort2 (toList (hmerge (hmerge x y) z)))
      (hsort2 (toList (hmerge x (hmerge y z)))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Heap))
    (= (toList (hinsert x (Node z y Nil)))
      (insert2 x (cons y (toList z))))))
(assert-claim
  (forall ((x Nat) (y Heap) (z Heap))
    (= (toList (Node (hinsert x z) zero y))
      (toList (hinsert x (Node y zero z))))))
(assert-claim
  (forall ((x Nat) (y Heap) (z Nat))
    (= (toList (hinsert x (Node Nil z y)))
      (toList (hinsert x (Node y z Nil))))))
(assert-claim
  (forall ((x Heap))
    (= (toList (hmerge x (Node x zero x)))
      (toList (Node (hmerge x x) zero x)))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Heap))
    (= (toList (hmerge (Node z zero x) y))
      (toList (Node (hmerge x y) zero z)))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (toList (hmerge (Node Nil x y) y))
      (toList (hmerge (Node y x Nil) y)))))
(assert-claim
  (forall ((x Heap))
    (= (hmerge (hinsert zero x) (toHeap2 (toList x)))
      (Node (toHeap2 (toList x)) zero x))))
(assert-claim
  (forall ((x Heap))
    (= (hmerge (hinsert zero (toHeap2 (toList x))) x)
      (Node x zero (toHeap2 (toList x))))))
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
  (forall ((x Nat) (y list))
    (= (insert2 (succ zero) (cons (succ x) y))
      (cons (succ zero) (cons (succ x) y)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (toList (hmerge x (Node Nil zero y)))
      (toList (Node x zero y)))))
