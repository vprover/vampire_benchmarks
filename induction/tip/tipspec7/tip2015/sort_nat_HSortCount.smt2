(declare-sort sk 0)
(declare-datatype list3 ((nil3) (cons3 (head3 sk) (tail3 list3))))
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
(define-fun-rec
  count3
  ((x sk) (y list3)) Nat
  (match y
    ((nil3 zero)
     ((cons3 z ys)
      (ite (= x z) (plus (succ zero) (count3 x ys)) (count3 x ys))))))
(define-fun-rec
  count2
  ((x Heap) (y list2)) Nat
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
  (forall ((x Nat) (xs list)) (= (count x (hsort xs)) (count x xs))))
(assert-claim (= (toHeap nil) nil2))
(assert-claim (= (hpairwise nil2) nil2))
(assert-claim (= (hmerging nil2) Nil))
(assert-claim (= (toHeap2 nil) Nil))
(assert-claim (= (toList Nil) nil))
(assert-claim (= (hsort nil) nil))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y sk)) (= (count3 y nil3) zero)))
(assert-claim (forall ((x Heap)) (= (hmerge x Nil) x)))
(assert-claim (forall ((x Heap)) (= (hmerge Nil x) x)))
(assert-claim
  (forall ((x list2)) (= (hmerging (hpairwise x)) (hmerging x))))
(assert-claim
  (forall ((x list)) (= (toHeap2 x) (hmerging (toHeap x)))))
(assert-claim (forall ((x list)) (= (hsort (hsort x)) (hsort x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim
  (forall ((x list)) (= (hsort x) (toList (toHeap2 x)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (count x (hsort y)) (count x y))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((x list)) (= (count2 Nil (toHeap x)) zero)))
(assert-claim (forall ((x Heap)) (= (hmerging (cons2 x nil2)) x)))
(assert-claim
  (forall ((x Heap)) (= (hpairwise (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((x Nat)) (= (hsort (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list))
    (= (hsort (cons zero x)) (cons zero (hsort x)))))
(assert-claim
  (forall ((x Nat)) (= (toHeap2 (cons x nil)) (Node Nil x Nil))))
(assert-claim
  (forall ((y sk) (z list3))
    (= (count3 y (cons3 y z)) (succ (count3 y z)))))
(assert-claim
  (forall ((x Heap) (y Heap) (z list2))
    (= (count2 (hmerge y x) z) (count2 (hmerge x y) z))))
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
    (= (count3 z (cons3 y nil3)) (count3 y (cons3 z nil3)))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (count2 x (toHeap (hsort y))) (count2 x (toHeap y)))))
(assert-claim
  (forall ((x list) (y list2))
    (= (count2 (toHeap2 (hsort x)) y) (count2 (toHeap2 x) y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (hsort (cons x (hsort y))) (hsort (cons x y)))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (hsort (toList (hmerge y x))) (hsort (toList (hmerge x y))))))
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
  (forall ((x list)) (= (count2 Nil (hpairwise (toHeap x))) zero)))
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
  (forall ((x Heap) (y Nat) (z Heap) (x2 list2))
    (= (count2 (Node z y x) x2) (count2 (Node x y z) x2))))
(assert-claim
  (forall ((x Nat) (y Heap) (z list2))
    (= (count2 (Node y x y) z) (count2 (Node Nil x y) z))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (count2 (hmerge x x) (toHeap y)) zero)))
(assert-claim
  (forall ((x Heap) (y list2) (z list2))
    (= (count2 (hmerging (cons2 x y)) z)
      (count2 (hmerge x (hmerging y)) z))))
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
  (forall ((x Nat) (y Nat))
    (= (leq (succ x) (plus y x)) (leq (succ zero) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (succ x) (plus y y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ x)) (leq y (succ zero)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (=> (leq z x)
      (= (toHeap2 (cons z (cons y x2)))
        (toHeap2 (cons y (cons z x2)))))))
(assert-claim
  (forall ((x list) (y Heap))
    (= (count2 Nil (cons2 y (toHeap x))) (count2 y (cons2 Nil nil2)))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (count2 (toHeap2 (toList x)) (toHeap y))
      (count2 x (toHeap y)))))
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
    (=> (leq x y)
      (= (leq (succ zero) (plus x y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat)) (= (leq (plus x x) (succ zero)) (leq x zero))))
(assert-claim
  (forall ((x Nat))
    (= (toHeap (cons x nil)) (cons2 (Node Nil x Nil) nil2))))
(assert-claim
  (forall ((x list))
    (= (count2 Nil (hpairwise (hpairwise (toHeap x)))) zero)))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list3))
    (= (count3 y (cons3 x2 (cons3 z x3)))
      (count3 y (cons3 z (cons3 x2 x3))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (plus x x) y)) (count x (cons zero y)))))
(assert-claim
  (forall ((x Heap) (y Heap) (z Heap) (x2 list2))
    (= (count2 x (cons2 (hmerge z y) x2))
      (count2 x (cons2 (hmerge y z) x2)))))
(assert-claim
  (forall ((x Heap) (y list2))
    (= (count2 x (cons2 (hmerge x x) y)) (count2 x (cons2 Nil y)))))
(assert-claim
  (forall ((x Heap) (y Nat) (z list2))
    (= (count2 (Node x y (hmerging z)) z) zero)))
(assert-claim
  (forall ((x Heap) (y Heap) (z Heap) (x2 list2))
    (= (count2 (hmerge (hmerge x y) z) x2)
      (count2 (hmerge x (hmerge y z)) x2))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (leq (plus y x) (plus z x)) (leq y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus x x) (plus y y)) (leq x y))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count3 z (cons3 y (cons3 y nil3)))
      (count3 y (cons3 z (cons3 z nil3))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count x (cons (plus y x) nil)) (count y (cons zero nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count zero (cons (plus x x) y)) (count zero (cons x y)))))
(assert-claim
  (forall ((x Heap) (y list2) (z list))
    (= (count (count2 (toHeap2 (toList x)) y) z)
      (count (count2 x y) z))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (plus x x) (cons zero y))
      (count (plus x x) (cons x y)))))
(assert-claim
  (forall ((x Heap) (y Heap) (z list))
    (= (count2 x (cons2 y (toHeap (hsort z))))
      (count2 x (cons2 y (toHeap z))))))
(assert-claim
  (forall ((x Heap) (y Heap))
    (= (count2 x (cons2 (hmerge y x) nil2))
      (count2 y (cons2 Nil nil2)))))
(assert-claim
  (forall ((x Heap) (y list) (z list2))
    (= (count2 x (cons2 (toHeap2 (hsort y)) z))
      (count2 x (cons2 (toHeap2 y) z)))))
(assert-claim
  (forall ((x Heap) (y list2))
    (= (count2 Nil (cons2 (hmerge x x) y)) (count2 Nil (cons2 x y)))))
(assert-claim
  (forall ((x Heap) (y list2))
    (= (count2 (hmerge x x) (cons2 Nil y))
      (count2 (hmerge x x) (cons2 x y)))))
(assert-claim
  (forall ((x Heap) (y list) (z list2))
    (= (count2 (hmerge x (toHeap2 (hsort y))) z)
      (count2 (hmerge x (toHeap2 y)) z))))
(assert-claim
  (forall ((x Heap) (y Heap) (z list2))
    (= (count2 (hmerge x (toHeap2 (toList y))) z)
      (count2 (hmerge x y) z))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count2 (toHeap2 (cons x y)) (toHeap y)) zero)))
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
  (forall ((x Heap) (y Nat))
    (= (toList (hmerge x (Node Nil y x)))
      (toList (hmerge x (Node x y Nil))))))
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
  (forall ((x Nat) (y Nat))
    (= (count (succ x) (cons (succ y) nil)) (count x (cons y nil)))))
(assert-claim
  (forall ((x Heap) (y list))
    (= (count2 x (hpairwise (hpairwise (toHeap (hsort y)))))
      (count2 x (hpairwise (hpairwise (hpairwise (toHeap y))))))))
(assert-claim
  (forall ((x Heap))
    (= (count2 x (hpairwise (toHeap (hsort (toList x)))))
      (count2 x (hpairwise (toHeap (toList x)))))))
(assert-claim
  (forall ((x list) (y Heap))
    (= (count2 Nil (cons2 y (hpairwise (toHeap x))))
      (count2 y (cons2 Nil nil2)))))
(assert-claim
  (forall ((x Heap) (y list2))
    (= (count2 Nil (cons2 (toHeap2 (toList x)) y))
      (count2 Nil (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count2 (Node Nil x Nil) (toHeap y)) (count x y))))
(assert-claim
  (forall ((x list))
    (= (count2 (toHeap2 x) (hpairwise (toHeap (hsort x))))
      (count2 (toHeap2 x) (hpairwise (toHeap x))))))
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
    (= (toHeap2 (hsort (cons x (cons y nil))))
      (toHeap2 (cons x (cons y nil))))))
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
  (forall ((x list))
    (= (count2 Nil (hpairwise (cons2 Nil (toHeap x))))
      (count2 Nil (cons2 (toHeap2 x) nil2)))))
(assert-claim
  (forall ((x Nat))
    (= (hpairwise (cons2 Nil (toHeap (cons x nil))))
      (toHeap (cons x nil)))))
(assert-claim
  (forall ((x list2))
    (= (hpairwise (hpairwise (cons2 Nil (hpairwise (hpairwise x)))))
      (cons2 (hmerging x) nil2))))
(assert-claim
  (forall ((x Heap))
    (= (toList (hmerge x (Node Nil zero Nil)))
      (cons zero (toList x)))))
