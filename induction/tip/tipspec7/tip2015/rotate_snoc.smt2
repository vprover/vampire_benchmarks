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
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  length
  ((x list)) Nat
  (match x
    ((nil zero)
     ((cons y l) (plus (succ zero) (length l))))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-not (forall ((xs list)) (= (rotate (length xs) xs) xs)))
(assert-claim (= (length nil) zero))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((y Nat)) (= (rotate y nil) nil)))
(assert-claim (forall ((y list)) (= (rotate zero y) y)))
(assert-claim (forall ((y sk)) (= (snoc y nil) (cons y nil))))
(assert-claim
  (forall ((y sk) (z list))
    (= (length (cons y z)) (succ (length z)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (length (rotate y z)) (length z))))
(assert-claim
  (forall ((y sk) (z list))
    (= (length (snoc y z)) (succ (length z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((y list)) (= (rotate (length y) y) y)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (rotate z (rotate y x2)) (rotate y (rotate z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (rotate (plus y z) x2) (rotate y (rotate z x2)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (= (snoc z (cons y x2)) (cons y (snoc z x2)))))
(assert-claim
  (forall ((y Nat) (z sk)) (= (rotate y (cons z nil)) (cons z nil))))
(assert-claim
  (forall ((y Nat) (z sk) (x2 list))
    (= (rotate (succ y) (cons z x2)) (rotate y (snoc z x2)))))
(assert-claim
  (forall ((y Nat) (z sk))
    (= (rotate y (cons z (cons z nil))) (cons z (cons z nil)))))
