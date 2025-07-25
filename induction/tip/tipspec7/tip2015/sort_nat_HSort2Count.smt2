(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(declare-datatype
  Heap
  ((Node (proj1-Node Heap) (proj2-Node Nat) (proj3-Node Heap))
   (Nil)))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
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
(define-fun-rec
  count2
  ((x sk) (y list2)) Nat
  (match y
    ((nil2 zero)
     ((cons2 z ys)
      (ite (= x z) (plus (succ zero) (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x Nat) (y list)) Nat
  (match y
    ((nil zero)
     ((cons z ys)
      (ite (= x z) (plus (succ zero) (count x ys)) (count x ys))))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-not
  (forall ((x Nat) (xs list))
    (= (count x (hsort2 xs)) (count x xs))))
(assert-claim (= (toList Nil) nil))
(assert-claim (= (toHeap2 nil) Nil))
(assert-claim (= (hsort2 nil) nil))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y sk)) (= (count2 y nil2) zero)))
(assert-claim (forall ((x Heap)) (= (hmerge x Nil) x)))
(assert-claim (forall ((x Heap)) (= (hmerge Nil x) x)))
(assert-claim
  (forall ((x list)) (= (hsort2 (hsort2 x)) (hsort2 x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim
  (forall ((x list)) (= (hsort2 x) (toList (toHeap2 x)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (count x (hsort2 y)) (count x y))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (toHeap2 (cons x y)) (hinsert x (toHeap2 y)))))
(assert-claim
  (forall ((x Heap)) (= (hinsert zero x) (Node x zero Nil))))
(assert-claim
  (forall ((x Nat)) (= (hinsert x Nil) (Node Nil x Nil))))
(assert-claim
  (forall ((x Nat)) (= (hsort2 (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list))
    (= (hsort2 (cons zero x)) (cons zero (hsort2 x)))))
(assert-claim
  (forall ((x Heap))
    (= (toList (hinsert zero x)) (cons zero (toList x)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (count2 y (cons2 y z)) (succ (count2 y z)))))
(assert-claim (forall ((x Nat) (y Nat)) (leq x (plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq x z) (leq x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (plus y x) x) (leq y zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus y y) x) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y nil2)) (count2 y (cons2 z nil2)))))
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
  (forall ((x Nat) (y list))
    (= (hsort2 (cons x (hsort2 y))) (hsort2 (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (hsort2 (toList (hinsert x y))) (hsort2 (cons x (toList y))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort2 (toList (hmerge y x))) (hsort2 (toList (hmerge x y))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus x y) zero) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (toList (Node y x Nil)) (cons x (toList y)))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (toList (Node Nil x y)) (cons x (toList y)))))
(assert-claim
  (forall ((x Heap) (y Nat) (z Heap))
    (= (cons y (toList (hmerge x z))) (toList (Node x y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (succ x) y)) (count x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (succ x) (cons x y)) (count (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (count (succ y) (cons x z)) (count (succ y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x) (= (count y (cons (succ x) z)) (count y z)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hmerge (Node y zero y) x) (Node (hmerge y x) zero y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (=> (leq z x)
      (= (hsort2 (cons z (cons y x2))) (hsort2 (cons y (cons z x2)))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (succ x) (plus y x)) (leq (succ zero) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (succ x) (plus y y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ x)) (leq y (succ zero)))))
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
    (=> (leq x y)
      (= (leq (succ zero) (plus x y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat)) (= (leq (plus x x) (succ zero)) (leq x zero))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (toList (hinsert x (hinsert zero y)))
      (cons zero (toList (hinsert x y))))))
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
  (forall ((y sk) (z sk) (x2 sk) (x3 list2))
    (= (count2 y (cons2 x2 (cons2 z x3)))
      (count2 y (cons2 z (cons2 x2 x3))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (plus x x) y)) (count x (cons zero y)))))
(assert-claim
  (forall ((x Heap) (y Nat) (z Heap))
    (= (hinsert (succ y) (Node z y x))
      (Node (hinsert (succ y) x) y z))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq x (count (plus x x) y)) (leq x (count (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (leq (plus y x) (plus z x)) (leq y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus x x) (plus y y)) (leq x y))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y (cons2 y nil2)))
      (count2 y (cons2 z (cons2 z nil2))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count x (cons (plus y x) nil)) (count y (cons zero nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count zero (cons (plus x x) y)) (count zero (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (plus x x) (cons zero y))
      (count (plus x x) (cons x y)))))
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
  (forall ((x Nat) (y list))
    (= (leq x (count x (cons zero y))) (leq x (count x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq x (count zero (cons x y))) (leq x (count zero y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (succ (succ x)) (plus y x)) (leq (succ (succ zero)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count x (cons y nil)) x) (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ (succ x))) (leq y (succ (succ zero))))))
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
  (forall ((x Heap) (y Heap))
    (= (toList (hmerge (Node y zero x) y))
      (toList (Node (hmerge x y) zero y)))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (toList (hmerge (Node Nil x y) y))
      (toList (hmerge (Node y x Nil) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count (succ x) (cons (succ y) nil)) (count x (cons y nil)))))
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
  (forall ((x Nat))
    (= (leq (succ (succ zero)) (plus x x)) (leq (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count x (cons zero nil)) y)
      (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x Nat))
    (= (leq (plus x x) (succ (succ zero))) (leq x (succ zero)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq (plus x (count x y)) zero)
      (leq (plus x (count zero y)) zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (toHeap2 (hsort2 (cons x (cons y nil))))
      (hinsert x (hinsert y Nil)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (toList (hmerge x (Node Nil zero y)))
      (toList (Node x zero y)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (toList (hmerge (Node Nil zero x) y))
      (toList (Node x zero y)))))
