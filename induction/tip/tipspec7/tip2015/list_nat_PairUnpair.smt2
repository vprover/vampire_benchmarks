(declare-sort sk 0)
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype list ((nil) (cons (head pair) (tail list))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  unpair
  ((x list)) list2
  (match x
    ((nil nil2)
     ((cons y xys)
      (match y (((pair2 z y2) (cons2 z (cons2 y2 (unpair xys))))))))))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  pairs
  ((x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y z)
      (match z
        ((nil2 nil)
         ((cons2 y2 xs) (cons (pair2 y y2) (pairs xs)))))))))
(define-fun-rec
  length2
  ((x list2)) Nat
  (match x
    ((nil2 zero)
     ((cons2 y l) (plus (succ zero) (length2 l))))))
(define-fun-rec
  length
  ((x list)) Nat
  (match x
    ((nil zero)
     ((cons y l) (plus (succ zero) (length l))))))
(define-fun-rec
  even
  ((x Nat)) Bool
  (match x
    ((zero true)
     ((succ y) (not (even y))))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-not
  (forall ((xs list2))
    (=> (= (ite (even (length2 xs)) zero (succ zero)) zero)
      (= (unpair (pairs xs)) xs))))
(assert-claim (even zero))
(assert-claim (= (unpair nil) nil2))
(assert-claim (= (pairs nil2) nil))
(assert-claim (= (length2 nil2) zero))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim
  (forall ((x Nat)) (=> (even x) (not (even (succ x))))))
(assert-claim (forall ((y list)) (= (pairs (unpair y)) y)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((x Nat)) (even (plus x x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (even x) (= (even (plus y x)) (even y)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (length2 (cons2 y z)) (succ (length2 z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((y list)) (even (length2 (unpair y)))))
(assert-claim (forall ((y sk)) (= (pairs (cons2 y nil2)) nil)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((y pair) (z pair) (x2 list))
    (= (length2 (unpair (cons y x2))) (length2 (unpair (cons z x2))))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list2))
    (= (length (pairs (cons2 y x2))) (length (pairs (cons2 z x2))))))
(assert-claim
  (forall ((y list))
    (= (plus (length y) (length y)) (length2 (unpair y)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list2))
    (= (pairs (cons2 y (cons2 z x2))) (cons (pair2 y z) (pairs x2)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (= (unpair (cons (pair2 y z) x2))
      (cons2 y (cons2 z (unpair x2))))))
(assert-claim
  (forall ((y sk) (z list))
    (= (length (pairs (cons2 y (unpair z)))) (length z))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (even (plus (length2 z) (length (pairs z))))
      (even (length (pairs (cons2 y z)))))))
