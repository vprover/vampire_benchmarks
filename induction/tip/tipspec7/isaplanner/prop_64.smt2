(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  last
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y z)
      (match z
        ((nil y)
         ((cons x2 x3) (last (cons x2 x3)))))))))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((x Nat) (xs list)) (= (last (++ xs (cons x nil))) x)))
(assert-claim (= (last nil) Z))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((x list)) (= (last (++ x x)) (last x))))
(assert-claim (forall ((x Nat)) (= (last (cons x nil)) x)))
(assert-claim (forall ((x list)) (= (last (cons Z x)) (last x))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((x list) (y list))
    (= (last (cons (last x) y)) (last (++ x y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (last (++ y (++ x y))) (last (++ x y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (last (++ x (++ y y))) (last (++ x y)))))
(assert-claim
  (forall ((x list) (y Nat) (z list))
    (= (last (++ x (cons y z))) (last (cons y z)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (last x)) x)) (last (cons (S Z) x)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (S (last x))) x)) (last (cons (S (S Z)) x)))))
