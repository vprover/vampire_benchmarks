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
  butlast2
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y z)
      (match z
        ((nil2 nil2)
         ((cons2 x2 x3) (cons2 y (butlast2 (cons2 x2 x3))))))))))
(define-fun-rec
  butlast
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y z)
      (match z
        ((nil nil)
         ((cons x2 x3) (cons y (butlast (cons x2 x3))))))))))
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
  (forall ((xs list))
    (=>
      (not
        (match xs
          ((nil true)
           ((cons x y) false))))
      (= (++ (butlast xs) (cons (last xs) nil)) xs))))
(assert-claim (= (last nil) Z))
(assert-claim (= (butlast2 nil2) nil2))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim
  (forall ((y list2)) (= (butlast2 (++2 y y)) (++2 y (butlast2 y)))))
(assert-claim (forall ((x list)) (= (last (++ x x)) (last x))))
(assert-claim (forall ((y sk)) (= (butlast2 (cons2 y nil2)) nil2)))
(assert-claim (forall ((x Nat)) (= (last (cons x nil)) x)))
(assert-claim (forall ((x list)) (= (last (cons Z x)) (last x))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((y list2))
    (= (butlast2 (++2 (butlast2 y) y))
      (++2 (butlast2 y) (butlast2 y)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (butlast2 (butlast2 (cons2 y z)))
      (butlast2 (cons2 y (butlast2 z))))))
(assert-claim
  (forall ((x list)) (= (last (++ (butlast x) x)) (last x))))
(assert-claim
  (forall ((x list) (y list))
    (= (last (cons (last x) y)) (last (++ x y)))))
(assert-claim
  (forall ((x list))
    (= (last (butlast (cons Z x))) (last (butlast x)))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (butlast2 (++2 y (++2 y z))) (++2 y (butlast2 (++2 y z))))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (butlast2 (++2 z (++2 y z))) (++2 z (butlast2 (++2 y z))))))
(assert-claim
  (forall ((y list2) (z sk) (x2 list2))
    (= (butlast2 (++2 y (cons2 z x2)))
      (++2 y (butlast2 (cons2 z x2))))))
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
  (forall ((y list2))
    (= (butlast2 (++2 (butlast2 (butlast2 y)) y))
      (++2 (butlast2 (butlast2 y)) (butlast2 y)))))
(assert-claim
  (forall ((y list2))
    (= (butlast2 (butlast2 (++2 y (butlast2 y))))
      (butlast2 (++2 y (butlast2 (butlast2 y)))))))
(assert-claim
  (forall ((x list))
    (= (last (++ (butlast (butlast x)) x)) (last x))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (last x)) x)) (last (cons (S Z) x)))))
(assert-claim
  (forall ((x list))
    (= (last (butlast (cons (last x) x))) (last (++ x (butlast x))))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (butlast2 (++2 y (++2 (butlast2 z) z)))
      (++2 (butlast2 (++2 y z)) (butlast2 z)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (butlast2 (++2 z (butlast2 (cons2 y z))))
      (++2 z (butlast2 (cons2 y (butlast2 z)))))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (butlast2 (++2 (++2 (butlast2 y) y) z))
      (++2 (butlast2 y) (butlast2 (++2 y z))))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (butlast2 (++2 (++2 (butlast2 z) y) z))
      (++2 (butlast2 z) (butlast2 (++2 y z))))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (butlast2 (++2 (butlast2 (cons2 y z)) z))
      (++2 (butlast2 (cons2 y z)) (butlast2 z)))))
(assert-claim
  (forall ((x list) (y list))
    (= (butlast (cons (last (++ x y)) y))
      (butlast (cons (last y) y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (last (++ x (++ (butlast y) y))) (last (++ x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (last (++ y (butlast (cons x y))))
      (last (butlast (cons x y))))))
(assert-claim
  (forall ((x list) (y list))
    (= (last (++ (++ (butlast y) x) y)) (last (++ x y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (last (++ (butlast (++ y x)) y)) (last (++ (butlast x) y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (last (++ (butlast (++ x y)) y)) (last (++ (butlast x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (last (cons x (butlast (cons x y))))
      (last (cons x (butlast y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (last (butlast (++ (cons x y) y))) (last (++ y (butlast y))))))
(assert-claim
  (forall ((y list2))
    (= (butlast2 (++2 (butlast2 (butlast2 (butlast2 y))) y))
      (++2 (butlast2 (butlast2 (butlast2 y))) (butlast2 y)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (S (last x))) x)) (last (cons (S (S Z)) x)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (last (butlast x))) x)) (last (cons (S Z) x)))))
(assert-claim
  (forall ((x list))
    (= (last (butlast (cons (last x) (butlast x))))
      (last (butlast (++ x (butlast x)))))))
(assert-claim
  (forall ((x list))
    (= (last (butlast (cons (last (butlast x)) x)))
      (last (butlast x)))))
