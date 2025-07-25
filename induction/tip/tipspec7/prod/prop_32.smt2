(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  length
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y xs) (S (length xs))))))
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
    ((Z y)
     ((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (rotate z (++ x3 (cons x2 nil))))))))))
(assert-not (forall ((x list)) (= (rotate (length x) x) x)))
(assert-claim (= (length nil) Z))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y Nat)) (= (rotate y nil) nil)))
(assert-claim (forall ((y list)) (= (rotate Z y) y)))
(assert-claim
  (forall ((y list) (z list))
    (= (length (++ z y)) (length (++ y z)))))
(assert-claim
  (forall ((y sk) (z list)) (= (length (cons y z)) (S (length z)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (length (rotate y z)) (length z))))
(assert-claim (forall ((y list)) (= (rotate (length y) y) y)))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (rotate z (rotate y x2)) (rotate y (rotate z x2)))))
(assert-claim
  (forall ((y Nat) (z sk)) (= (rotate y (cons z nil)) (cons z nil))))
(assert-claim
  (forall ((y list)) (= (rotate (S (length y)) y) (rotate (S Z) y))))
(assert-claim
  (forall ((y Nat) (z list) (x2 list))
    (= (length (++ z (rotate y x2))) (length (++ z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (rotate (S y) (rotate z x2)) (rotate y (rotate (S z) x2)))))
(assert-claim
  (forall ((y list) (z list))
    (= (rotate (length z) (++ z y)) (++ y z))))
(assert-claim
  (forall ((y list) (z list))
    (= (rotate (length (++ z y)) z) (rotate (length y) z))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (++ (rotate y z) (rotate y z)) (rotate y (++ z z)))))
(assert-claim
  (forall ((y Nat) (z sk))
    (= (rotate y (cons z (cons z nil))) (cons z (cons z nil)))))
(assert-claim
  (forall ((y list) (z list))
    (= (rotate (S (length z)) (++ z y)) (rotate (S Z) (++ y z)))))
(assert-claim
  (forall ((z list) (x2 list) (x3 list))
    (= (rotate (length z) (rotate (length x2) x3))
      (rotate (length (++ z x2)) x3))))
