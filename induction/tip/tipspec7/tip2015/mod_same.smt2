(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  minus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero zero)
     ((succ z)
      (match y
        (((succ y2) (minus z y2))
         (zero (succ z))))))))
(define-fun-rec
  lt
  ((x Nat) (y Nat)) Bool
  (match y
    ((zero false)
     ((succ z)
      (match x
        ((zero true)
         ((succ n) (lt n z))))))))
(define-fun-rec
  mod2
  ((x Nat) (y Nat)) Nat
  (match y
    ((zero zero)
     ((succ z)
      (ite (lt x (succ z)) x (mod2 (minus x (succ z)) (succ z)))))))
(define-fun-rec
  go
  ((x Nat) (y Nat) (z Nat)) Nat
  (match z
    ((zero zero)
     ((succ x2)
      (match x
        ((zero
          (match y
            ((zero zero)
             ((succ x3) (minus (succ x2) (succ x3))))))
         ((succ x4)
          (match y
            ((zero (go x4 x2 (succ x2)))
             ((succ x5) (go x4 x5 (succ x2))))))))))))
(define-fun
  mod_structural
  ((x Nat) (y Nat)) Nat (go x zero y))
(assert-not
  (forall ((m Nat) (n Nat)) (= (mod2 m n) (mod_structural m n))))
(assert-claim (forall ((x Nat)) (not (lt x x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt y x) (not (lt x y)))))
(assert-claim (forall ((x Nat)) (= (minus x x) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt x y) (= (minus x y) zero))))
(assert-claim (forall ((x Nat)) (= (mod2 x x) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt y x) (= (mod2 y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (mod2 x y) (mod_structural x y))))
(assert-claim (forall ((x Nat)) (not (lt x zero))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (lt x y) (lt zero y))))
(assert-claim (forall ((x Nat)) (= (minus x zero) x)))
(assert-claim (forall ((x Nat)) (= (minus zero x) zero)))
(assert-claim (forall ((x Nat)) (= (mod2 x zero) zero)))
(assert-claim (forall ((x Nat)) (= (mod2 zero x) zero)))
(assert-claim (forall ((x Nat) (y Nat)) (= (go x x y) zero)))
(assert-claim (forall ((x Nat) (y Nat)) (= (mod2 x y) (go x y y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (go x y zero) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (mod2 x y) (go x zero y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt x y) (= (go zero x y) (go y x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt x y) (= (minus z y) (go zero y z)))))
(assert-claim (forall ((x Nat)) (lt x (succ x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt y x) (not (lt (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt x y) (lt x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt y x) (not (lt x (succ y))))))
(assert-claim
  (forall ((x Nat)) (= (minus (succ x) x) (succ zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt x y) (= (minus (succ x) y) zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt y x) (= (minus (succ x) y) (succ (minus x y))))))
(assert-claim (forall ((x Nat)) (= (mod2 x (succ zero)) zero)))
(assert-claim
  (forall ((x Nat)) (= (mod2 (succ zero) x) (mod2 (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x (succ x) y) (minus y (succ zero)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go (succ x) x y) (mod2 (succ y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt y x) (= (go y (succ x) x) (minus y (succ zero))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt y x) (= (go y x (succ x)) (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt x y) (= (minus y (succ x)) (go y (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt x y) (= (minus y x) (go y x (succ y))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (lt z (minus y x)) (lt x (minus y z)))))
(assert-claim (forall ((x Nat) (y Nat)) (not (lt x (mod2 x y)))))
(assert-claim (forall ((x Nat) (y Nat)) (not (lt y (mod2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt z x) (not (lt x (mod2 y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt y x) (not (lt x (mod2 y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt (minus x y) x) (lt (minus y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt x y) (= (lt (minus z y) z) (lt zero z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat) (x3 Nat))
    (=> (lt x x3)
      (=> (lt y x2) (= (lt (minus z x3) x2) (lt (minus z x2) x3))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt x z) (lt (minus x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt (mod2 x y) y) (lt (minus x x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (=> (lt y z) (lt (mod2 x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt x y) (= (lt (mod2 z y) z) (lt y (succ z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (=> (lt x z) (lt (mod2 x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt x z) (= (lt (mod2 z y) z) (lt y (succ z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus y (minus y x)) (minus x (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt z y) (= (go z y x) (minus x (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (minus (minus x z) y) (minus (minus x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (minus (mod2 y x) y) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (minus (mod2 x y) y) zero)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 y (minus x y)) (mod2 x (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go zero x y) (mod2 (minus y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt y x) (= (go x y z) (mod2 (minus x y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 (mod2 x y) x) (mod2 (minus x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (mod2 (mod2 x y) y) (mod2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt y x) (= (succ (minus x (succ y))) (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go x y (succ zero)) zero)))
(assert-claim
  (forall ((x Nat)) (= (minus x (succ zero)) (go x (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt x y) (= (go (succ zero) x y) (go (succ y) x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt y x) (= (go (succ zero) x y) zero))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt x y) (= (go y (succ zero) z) (go y (succ z) z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (lt (succ x) (succ y)) (lt x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (succ x) (succ y)) (minus x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x y (succ y)) (mod2 (succ x) (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go x y (minus x y)) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go y x (minus x y)) zero)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x y (mod2 y x)) (mod2 (minus x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt y x) (= (go z x (minus y z)) zero))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat) (x3 Nat))
    (=> (lt x2 z) (=> (lt x x3) (= (go y z (minus x2 x3)) zero)))))
