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
  ordered
  ((x list)) Bool
  (match x
    ((nil true)
     ((cons y z)
      (match z
        ((nil true)
         ((cons y2 xs) (and (leq y y2) (ordered (cons y2 xs))))))))))
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
(assert-not (forall ((xs list)) (ordered (hsort2 xs))))
(assert-claim (ordered nil))
(assert-claim (= (toList Nil) nil))
(assert-claim (= (toHeap2 nil) Nil))
(assert-claim (= (hsort2 nil) nil))
(assert-claim
  (forall ((x list)) (=> (ordered x) (= (hsort2 x) x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Heap)) (= (hmerge x Nil) x)))
(assert-claim (forall ((x Heap)) (= (hmerge Nil x) x)))
(assert-claim
  (forall ((x list)) (= (hsort2 (hsort2 x)) (hsort2 x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list)) (ordered (hsort2 x))))
(assert-claim
  (forall ((x list)) (= (hsort2 x) (toList (toHeap2 x)))))
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
  (forall ((x Nat)) (= (hsort2 (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list))
    (= (hsort2 (cons zero x)) (cons zero (hsort2 x)))))
(assert-claim
  (forall ((x list)) (= (ordered (cons zero x)) (ordered x))))
(assert-claim
  (forall ((x Heap))
    (= (toList (hinsert zero x)) (cons zero (toList x)))))
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
  (forall ((x Nat) (y Heap))
    (= (ordered (toList (hinsert x y))) (ordered (toList y)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (ordered (toList (hmerge y x)))
      (ordered (toList (hmerge x y))))))
(assert-claim
  (forall ((x Heap))
    (= (ordered (toList (hmerge x x))) (ordered (toList x)))))
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
  (forall ((x Heap) (y Heap))
    (= (hmerge (Node y zero y) x) (Node (hmerge y x) zero y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (=> (leq z x)
      (= (hsort2 (cons z (cons y x2))) (hsort2 (cons y (cons z x2)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (cons x y))) (ordered (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (ordered (cons x (cons y z))) (ordered (cons y z))))))
(assert-claim
  (forall ((x Heap) (y Nat) (z Heap))
    (= (ordered (toList (Node z y x)))
      (ordered (toList (Node x y z))))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (ordered (toList (Node y x y))) (ordered (cons x (toList y))))))
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
    (= (leq x y) (ordered (cons x (cons y nil))))))
(assert-claim
  (forall ((x list) (y Nat))
    (=> (ordered x)
      (= (ordered (cons y (cons zero x))) (leq y zero)))))
(assert-claim
  (forall ((x list) (y Heap))
    (= (ordered (toList (hmerge y (toHeap2 x))))
      (ordered (toList y)))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (toList (hinsert x (hinsert zero y)))
      (cons zero (toList (hinsert x y))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (toList (hmerge (hinsert zero y) x)) (toList (Node x zero y)))))
(assert-claim
  (forall ((x list) (y list))
    (=> (ordered y)
      (= (toList (hmerge (toHeap2 y) (toHeap2 x)))
        (toList (hmerge (toHeap2 x) (toHeap2 y)))))))
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
  (forall ((x Nat) (y list))
    (= (ordered (cons x (hsort2 (cons x y))))
      (ordered (cons x (hsort2 y))))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (ordered (cons x (toList (hinsert x y))))
      (ordered (cons x (toList y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons x y))))))
(assert-claim
  (forall ((x Nat) (y Heap) (z Heap))
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
  (forall ((x Nat) (y Heap) (z Heap))
    (= (toList (Node (hinsert x z) zero y))
      (toList (hinsert x (Node y zero z))))))
(assert-claim
  (forall ((x Nat) (y Heap) (z Nat))
    (= (toList (hinsert x (Node Nil z y)))
      (toList (hinsert x (Node y z Nil))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (toList (hmerge (Node y zero x) y))
      (toList (Node (hmerge x y) zero y)))))
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
    (not (ordered (cons (succ x) (cons zero y))))))
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
