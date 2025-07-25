(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((S (proj1-S Nat)) (Z)))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  rotate2
  ((x Nat) (y list2)) list2
  (match x
    (((S z)
      (match y
        ((nil2 nil2)
         ((cons2 x2 x3) (rotate2 z (++2 x3 (cons2 x2 nil2)))))))
     (Z y))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  rotate
  ((x Nat) (y list)) list
  (match x
    (((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (rotate z (++ x3 (cons x2 nil)))))))
     (Z y))))
(assert-not
  (forall ((n Nat) (m Nat) (ys list) (xs list))
    (=> (= (rotate n xs) (rotate m ys)) (= n m))))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((y Nat)) (= (rotate2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (rotate2 Z y) y)))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (rotate2 z (rotate2 y x2)) (rotate2 y (rotate2 z x2)))))
(assert-claim
  (forall ((y Nat) (z sk))
    (= (rotate2 y (cons2 z nil2)) (cons2 z nil2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (rotate2 (S y) (rotate2 z x2)) (rotate2 y (rotate2 (S z) x2)))))
(assert-claim
  (forall ((y list2) (z sk))
    (= (rotate2 (S Z) (cons2 z y)) (++2 y (cons2 z nil2)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (++2 (rotate2 y z) (rotate2 y z)) (rotate2 y (++2 z z)))))
(assert-claim
  (forall ((y Nat) (z sk))
    (= (rotate2 y (cons2 z (cons2 z nil2))) (cons2 z (cons2 z nil2)))))
