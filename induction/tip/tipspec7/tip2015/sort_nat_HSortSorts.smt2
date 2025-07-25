(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(declare-datatype
  Heap
  ((Node (proj1-Node Heap) (proj2-Node Nat) (proj3-Node Heap))
   (Nil)))
(declare-datatype
  list2 ((nil2) (cons2 (head2 Heap) (tail2 list2))))
(define-fun-rec
  toHeap
  ((x list)) list2
  (match x
    ((nil nil2)
     ((cons y z) (cons2 (Node Nil y Nil) (toHeap z))))))
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
  hpairwise
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 q y)
      (match y
        ((nil2 (cons2 q nil2))
         ((cons2 r qs) (cons2 (hmerge q r) (hpairwise qs)))))))))
(define-fun-rec
  hmerging
  ((x list2)) Heap
  (match x
    ((nil2 Nil)
     ((cons2 q y)
      (match y
        ((nil2 q)
         ((cons2 z x2) (hmerging (hpairwise (cons2 q (cons2 z x2)))))))))))
(define-fun
  toHeap2
  ((x list)) Heap (hmerging (toHeap x)))
(define-fun-rec
  toList
  ((x Heap)) list
  (match x
    (((Node q y r) (cons y (toList (hmerge q r))))
     (Nil nil))))
(define-fun
  hsort
  ((x list)) list (toList (toHeap2 x)))
(assert-not (forall ((xs list)) (ordered (hsort xs))))
(assert-claim (ordered nil))
(assert-claim (= (toHeap nil) nil2))
(assert-claim (= (hpairwise nil2) nil2))
(assert-claim (= (hmerging nil2) Nil))
(assert-claim (= (toHeap2 nil) Nil))
(assert-claim (= (toList Nil) nil))
(assert-claim (= (hsort nil) nil))
(assert-claim (forall ((x list)) (=> (ordered x) (= (hsort x) x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Heap)) (= (hmerge x Nil) x)))
(assert-claim (forall ((x Heap)) (= (hmerge Nil x) x)))
(assert-claim
  (forall ((x list2)) (= (hmerging (hpairwise x)) (hmerging x))))
(assert-claim
  (forall ((x list)) (= (toHeap2 x) (hmerging (toHeap x)))))
(assert-claim (forall ((x list)) (= (hsort (hsort x)) (hsort x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list)) (ordered (hsort x))))
(assert-claim
  (forall ((x list)) (= (hsort x) (toList (toHeap2 x)))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim (forall ((x Heap)) (= (hmerging (cons2 x nil2)) x)))
(assert-claim
  (forall ((x Heap)) (= (hpairwise (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((x Nat)) (= (hsort (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list))
    (= (hsort (cons zero x)) (cons zero (hsort x)))))
(assert-claim
  (forall ((x list)) (= (ordered (cons zero x)) (ordered x))))
(assert-claim
  (forall ((x Nat)) (= (toHeap2 (cons x nil)) (Node Nil x Nil))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (hsort (cons x (hsort y))) (hsort (cons x y)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort (toList (hmerge y x))) (hsort (toList (hmerge x y))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
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
  (forall ((x list2))
    (= (hmerging (cons2 Nil (hpairwise x))) (hmerging x))))
(assert-claim
  (forall ((x list2))
    (= (hpairwise (hpairwise (hpairwise (hpairwise x))))
      (hpairwise (hpairwise (hpairwise x))))))
(assert-claim
  (forall ((x Nat))
    (= (hpairwise (toHeap (cons x nil))) (toHeap (cons x nil)))))
(assert-claim
  (forall ((x list2))
    (= (toList (hmerging (cons2 Nil x))) (toList (hmerging x)))))
(assert-claim
  (forall ((x Heap) (y Nat) (z Heap))
    (= (cons y (toList (hmerge x z))) (toList (Node x y z)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hmerge (Node y zero y) x) (Node (hmerge y x) zero y))))
(assert-claim
  (forall ((x Heap) (y Heap) (z list2))
    (= (hpairwise (cons2 x (cons2 y z)))
      (cons2 (hmerge x y) (hpairwise z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (=> (leq z x)
      (= (hsort (cons z (cons y x2))) (hsort (cons y (cons z x2)))))))
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
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (=> (leq z x)
      (= (toHeap2 (cons z (cons y x2)))
        (toHeap2 (cons y (cons z x2)))))))
(assert-claim
  (forall ((x Heap))
    (= (hmerge (Node x zero Nil) x) (Node x zero x))))
(assert-claim
  (forall ((x Heap))
    (= (hmerge (Node Nil zero x) x) (Node (hmerge x x) zero Nil))))
(assert-claim
  (forall ((x Heap) (y list2))
    (= (hpairwise (hpairwise (hpairwise (cons2 x y))))
      (cons2 (hmerging (cons2 x y)) nil2))))
(assert-claim
  (forall ((x Nat))
    (= (hsort (cons x (cons x nil))) (cons x (cons x nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (hsort (cons x (cons y nil))) (cons x (cons y nil))))))
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
  (forall ((x list) (y list))
    (=> (ordered y)
      (= (toList (hmerge (toHeap2 y) (toHeap2 x)))
        (toList (hmerge (toHeap2 x) (toHeap2 y)))))))
(assert-claim
  (forall ((x Nat))
    (= (toHeap (cons x nil)) (cons2 (Node Nil x Nil) nil2))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (hsort (cons x y))))
      (ordered (cons x (hsort y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons x y))))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Heap))
    (= (ordered (toList (hmerge x (hmerge z y))))
      (ordered (toList (hmerge x (hmerge y z)))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (ordered (toList (hmerge x (hmerge x y))))
      (ordered (toList (hmerge x y))))))
(assert-claim
  (forall ((x Nat) (y Heap))
    (= (toList (hmerge (Node Nil x y) y))
      (toList (hmerge (Node y x Nil) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (cons2 (Node Nil x Nil) (toHeap y)) (toHeap (cons x y)))))
(assert-claim
  (forall ((x Nat))
    (= (toHeap2 (cons x (cons x nil))) (Node (Node Nil x Nil) x Nil))))
(assert-claim
  (forall ((x Heap) (y list2))
    (= (hpairwise (cons2 x (hpairwise (hpairwise (hpairwise y)))))
      (cons2 (hmerge x (hmerging y)) nil2))))
(assert-claim
  (forall ((x Heap) (y list2))
    (= (hpairwise (cons2 Nil (hpairwise (cons2 x y))))
      (hpairwise (cons2 x (hpairwise (cons2 Nil y)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (hpairwise (toHeap (cons zero (cons x y))))
      (hpairwise (toHeap (cons x (cons zero y)))))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (hsort (toList (hmerge x (toHeap2 (hsort y)))))
      (hsort (toList (hmerge x (toHeap2 y)))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort (toList (hmerge x (toHeap2 (toList y)))))
      (hsort (toList (hmerge x y))))))
(assert-claim
  (forall ((x list) (y list))
    (= (hsort (toList (hmerge (toHeap2 x) (toHeap2 y))))
      (toList (hmerge (toHeap2 x) (toHeap2 y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons zero y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (toHeap2 (hsort (cons x (cons y nil))))
      (toHeap2 (cons x (cons y nil))))))
(assert-claim
  (forall ((x Heap))
    (= (toList (hmerge x (Node x zero Nil)))
      (toList (Node x zero x)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (toList (hmerge x (Node Nil zero y)))
      (toList (Node x zero y)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (toList (hmerge (Node y zero Nil) x))
      (toList (Node x zero y)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (toList (hmerge (Node Nil zero x) y))
      (toList (Node x zero y)))))
(assert-claim
  (forall ((x list2) (y Heap))
    (= (toList (hmerge (hmerging (cons2 Nil x)) y))
      (toList (hmerge (hmerging x) y)))))
(assert-claim
  (forall ((x Nat))
    (= (toHeap2 (cons x (cons zero nil)))
      (Node (Node Nil x Nil) zero Nil))))
(assert-claim
  (forall ((x Nat))
    (= (hpairwise (cons2 Nil (toHeap (cons x nil))))
      (toHeap (cons x nil)))))
(assert-claim
  (forall ((x list2))
    (= (hpairwise (hpairwise (cons2 Nil (hpairwise (hpairwise x)))))
      (cons2 (hmerging x) nil2))))
