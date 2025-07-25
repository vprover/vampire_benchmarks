(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  times
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero zero)
     ((succ z) (plus y (times z y))))))
(define-fun-rec
  add3
  ((x Nat) (y Nat) (z Nat)) Nat
  (match x
    ((zero
      (match y
        ((zero z)
         ((succ x2) (plus (succ zero) (add3 zero x2 z))))))
     ((succ x3) (plus (succ zero) (add3 x3 y z))))))
(define-fun-rec
  mul3
  ((x Nat) (y Nat) (z Nat)) Nat
  (match x
    ((zero zero)
     ((succ x2)
      (match y
        ((zero zero)
         ((succ x3)
          (match z
            ((zero zero)
             ((succ x4)
              (let
                ((fail
                    (plus (succ zero)
                      (add3 (mul3 x2 x3 x4)
                        (add3 (mul3 (succ zero) x3 x4)
                          (mul3 x2 (succ zero) x4) (mul3 x2 x3 (succ zero)))
                        (add3 x2 x3 x4)))))
                (match x2
                  ((zero
                    (match x3
                      ((zero
                        (match x4
                          ((zero (succ zero))
                           ((succ x5) fail))))
                       ((succ x6) fail))))
                   ((succ x7) fail))))))))))))))
(assert-not
  (forall ((x Nat) (y Nat) (z Nat))
    (= (mul3 x y z) (times (times x y) z))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (times x (times y z)) (times (times x y) z))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (times x y) (times y x))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (times x (plus y z)) (plus (times x y) (times x z)))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (times (plus x y) z) (plus (times x z) (times y z)))))
(assert (forall ((x Nat)) (= (times x (succ zero)) x)))
(assert (forall ((x Nat)) (= (times (succ zero) x) x)))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert (forall ((x Nat)) (= (times x zero) zero)))
(assert (forall ((x Nat)) (= (times zero x) zero)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (times y x) (times x y))))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((x Nat)) (= (times x zero) zero)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (= (add3 x z y) (add3 x y z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (= (add3 y x z) (add3 x y z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (= (mul3 x z y) (mul3 x y z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (= (mul3 y x z) (mul3 x y z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x y) (add3 x y zero))))
(assert-claim (forall ((x Nat) (y Nat)) (= (mul3 x y zero) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((x Nat)) (= (times x (succ zero)) x)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (add3 x y (succ z)) (succ (add3 x y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (add3 x y z) (plus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus x (times x y)) (times x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (times y (plus x x)) (times x (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (mul3 x y z) (times x (times y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (times x y) (times x z)) (times x (plus y z)))))
(assert-claim
  (forall ((x Nat))
    (= (succ (times x (succ (succ (succ x)))))
      (plus x (times (succ x) (succ x))))))
