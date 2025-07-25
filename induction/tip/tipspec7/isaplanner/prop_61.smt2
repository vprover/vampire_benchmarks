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
(define-fun
  lastOfTwo
  ((x list) (y list)) Nat
  (match y
    ((nil (last x))
     ((cons z x2) (last (cons z x2))))))
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
  (forall ((xs list) (ys list))
    (= (last (++ xs ys)) (lastOfTwo xs ys))))
(assert-claim (= (last nil) Z))
(assert-claim (forall ((x list)) (= (last x) (lastOfTwo x x))))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((x list)) (= (last x) (last x))))
(assert-claim (forall ((x list)) (= (last x) (lastOfTwo nil x))))
(assert-claim
  (forall ((x list) (y list)) (= (lastOfTwo x y) (last (++ x y)))))
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
    (= (lastOfTwo x (++ x y)) (lastOfTwo x y))))
(assert-claim
  (forall ((x list) (y list))
    (= (lastOfTwo y (++ x y)) (lastOfTwo x y))))
(assert-claim
  (forall ((x list) (y list))
    (= (lastOfTwo x (++ y y)) (lastOfTwo x y))))
(assert-claim
  (forall ((x list) (y Nat) (z list))
    (= (last (cons y z)) (last (cons y z)))))
(assert-claim
  (forall ((x list) (y list))
    (= (lastOfTwo x y) (last (cons (last x) y)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (last x)) x)) (last (cons (S Z) x)))))
(assert-claim
  (forall ((x list) (y list) (z list))
    (= (lastOfTwo x (++ z (++ y z))) (lastOfTwo x (++ y z)))))
(assert-claim
  (forall ((x list) (y list))
    (= (last (cons (S (lastOfTwo y x)) y))
      (last (cons (S (last x)) y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (last (cons (S (lastOfTwo x y)) y))
      (last (cons (S (last x)) y)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (S (last x))) x)) (last (cons (S (S Z)) x)))))
