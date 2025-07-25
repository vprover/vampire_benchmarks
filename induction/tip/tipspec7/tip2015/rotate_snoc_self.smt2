(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  snoc
  ((x sk) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z ys) (cons z (snoc x ys))))))
(define-fun-rec
  rotate
  ((x Nat) (y list)) list
  (match x
    ((zero y)
     ((succ z)
      (match y
        ((nil nil)
         ((cons z2 xs1) (rotate z (snoc z2 xs1)))))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((n Nat) (xs list))
    (= (rotate n (++ xs xs)) (++ (rotate n xs) (rotate n xs)))))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y Nat)) (= (rotate y nil) nil)))
(assert-claim (forall ((y list)) (= (rotate zero y) y)))
(assert-claim (forall ((y sk)) (= (snoc y nil) (cons y nil))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y list) (z sk) (x2 list))
    (= (++ (snoc z y) x2) (++ y (cons z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (rotate z (rotate y x2)) (rotate y (rotate z x2)))))
(assert-claim
  (forall ((y Nat) (z sk)) (= (rotate y (cons z nil)) (cons z nil))))
(assert-claim
  (forall ((y Nat) (z sk) (x2 list))
    (= (rotate (succ y) (cons z x2)) (rotate y (snoc z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (rotate (succ y) (rotate z x2))
      (rotate y (rotate (succ z) x2)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (++ (rotate y z) (rotate y z)) (rotate y (++ z z)))))
