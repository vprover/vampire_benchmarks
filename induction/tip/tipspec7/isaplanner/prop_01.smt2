(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  take
  ((x Nat) (y list)) list
  (match x
    ((Z nil)
     ((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (cons x2 (take z x3)))))))))
(define-fun-rec
  drop
  ((x Nat) (y list)) list
  (match x
    ((Z y)
     ((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (drop z x3))))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((n Nat) (xs list)) (= (++ (take n xs) (drop n xs)) xs)))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y Nat)) (= (drop y nil) nil)))
(assert-claim (forall ((y list)) (= (drop Z y) y)))
(assert-claim (forall ((y Nat)) (= (take y nil) nil)))
(assert-claim (forall ((y list)) (= (take Z y) nil)))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop z (drop y x2)) (drop y (drop z x2)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (drop y (take y z)) nil)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take z (take y x2)) (take y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take y (take y z)) (take y z))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop (S z) (cons y x2)) (drop z x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop (S y) (drop z x2)) (drop y (drop (S z) x2)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take y (take (S y) z)) (take y z))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (take (S z) (cons y x2)) (cons y (take z x2)))))
(assert-claim
  (forall ((y list))
    (= (drop (S Z) (++ y y)) (++ (drop (S Z) y) y))))
(assert-claim
  (forall ((y list)) (= (take (S Z) (++ y y)) (take (S Z) y))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop y (take (S y) z)) (take (S Z) (drop y z)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (++ (take y z) (drop y z)) z)))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop y (++ z (drop y z))) (++ (drop y z) (drop y z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop y (drop y (++ z z))) (drop y (++ (drop y z) z)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop z (drop z (cons y x2))) (drop z (cons y (drop z x2))))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take y (++ z (drop y z))) (take y z))))
(assert-claim
  (forall ((y Nat) (z list) (x2 list))
    (= (take y (++ z (take y x2))) (take y (++ z x2)))))
(assert-claim
  (forall ((y Nat) (z list) (x2 list))
    (= (take y (++ (take y z) x2)) (take y (++ z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 sk))
    (= (take z (drop y (cons x2 nil)))
      (drop y (take z (cons x2 nil))))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop (S Z) (take (S y) z)) (take y (drop (S Z) z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop y (take (S (S y)) z)) (take (S (S Z)) (drop y z)))))
