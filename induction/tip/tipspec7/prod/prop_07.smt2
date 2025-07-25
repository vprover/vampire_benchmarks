(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  qrev
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (qrev xs (cons z y))))))
(define-fun-rec
  length
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y xs) (S (length xs))))))
(define-fun-rec
  +2
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z) (S (+2 z y))))))
(assert-not
  (forall ((x list) (y list))
    (= (length (qrev x y)) (+2 (length x) (length y)))))
(assert-claim (= (length nil) Z))
(assert-claim (forall ((x Nat) (y Nat)) (= (+2 y x) (+2 x y))))
(assert-claim (forall ((x Nat)) (= (+2 x Z) x)))
(assert-claim (forall ((y list)) (= (qrev nil y) y)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (+2 y (S x)) (+2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (S (+2 x y)) (+2 x (S y)))))
(assert-claim
  (forall ((y sk) (z list)) (= (length (cons y z)) (S (length z)))))
(assert-claim
  (forall ((y list) (z list))
    (= (length (qrev z y)) (length (qrev y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (+2 (+2 x y) z) (+2 x (+2 y z)))))
(assert-claim
  (forall ((y list) (z sk) (x2 list))
    (= (qrev (cons z y) x2) (qrev y (cons z x2)))))
(assert-claim
  (forall ((y list) (z list))
    (= (+2 (length y) (length z)) (length (qrev y z)))))
(assert-claim
  (forall ((y list) (z list)) (= (qrev (qrev z y) nil) (qrev y z))))
(assert-claim
  (forall ((y list) (z list) (x2 list) (x3 list))
    (= (qrev x2 (qrev (qrev z y) x3)) (qrev (qrev (qrev y z) x2) x3))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (qrev (qrev z (cons y nil)) x2)
      (cons y (qrev (qrev z nil) x2)))))
