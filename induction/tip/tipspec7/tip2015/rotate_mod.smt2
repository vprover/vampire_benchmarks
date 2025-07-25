(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  take
  ((x Nat) (y list)) list
  (match x
    ((zero nil)
     ((succ z)
      (match y
        ((nil nil)
         ((cons z2 xs) (cons z2 (take z xs)))))))))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
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
  length
  ((x list)) Nat
  (match x
    ((nil zero)
     ((cons y l) (plus (succ zero) (length l))))))
(define-fun-rec
  drop
  ((x Nat) (y list)) list
  (match x
    ((zero y)
     ((succ z)
      (match y
        ((nil nil)
         ((cons z2 xs1) (drop z xs1))))))))
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
    ((zero y)
     ((succ z)
      (match y
        ((nil nil)
         ((cons z2 xs1) (rotate z (++ xs1 (cons z2 nil))))))))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-not
  (forall ((n Nat) (xs list))
    (= (rotate n xs)
      (++ (drop (mod2 n (length xs)) xs)
        (take (mod2 n (length xs)) xs)))))
(assert-claim (= (length nil) zero))
(assert-claim (forall ((x Nat)) (not (lt x x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt y x) (not (lt x y)))))
(assert-claim (forall ((x Nat)) (= (minus x x) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt x y) (= (minus x y) zero))))
(assert-claim (forall ((x Nat)) (= (mod2 x x) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt y x) (= (mod2 y x) y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y Nat)) (= (drop y nil) nil)))
(assert-claim (forall ((y list)) (= (drop zero y) y)))
(assert-claim (forall ((x Nat)) (not (lt x zero))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (lt x y) (lt zero y))))
(assert-claim (forall ((x Nat)) (= (minus x zero) x)))
(assert-claim (forall ((x Nat)) (= (minus zero x) zero)))
(assert-claim (forall ((x Nat)) (= (mod2 x zero) zero)))
(assert-claim (forall ((x Nat)) (= (mod2 zero x) zero)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((y Nat)) (= (rotate y nil) nil)))
(assert-claim (forall ((y list)) (= (rotate zero y) y)))
(assert-claim (forall ((y Nat)) (= (take y nil) nil)))
(assert-claim (forall ((y list)) (= (take zero y) nil)))
(assert-claim (forall ((y list)) (= (drop (length y) y) nil)))
(assert-claim
  (forall ((y list) (z list))
    (= (length (++ z y)) (length (++ y z)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (length (cons y z)) (succ (length z)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (length (rotate y z)) (length z))))
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
(assert-claim
  (forall ((y Nat) (z list))
    (= (minus (length z) y) (length (drop y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((y list)) (= (rotate (length y) y) y)))
(assert-claim (forall ((y list)) (= (take (length y) y) y)))
(assert-claim (forall ((x Nat)) (= (mod2 x (succ zero)) zero)))
(assert-claim
  (forall ((x Nat)) (= (mod2 (succ zero) x) (mod2 (succ x) x))))
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
  (forall ((y Nat) (z sk) (x2 Nat) (x3 sk) (x4 list))
    (=> (lt y x2) (= (drop x2 (cons z x4)) (drop x2 (cons x3 x4))))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (=> (lt z y) (= (drop y (take z x2)) nil))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop (plus y z) x2) (drop y (drop z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (lt z (minus y x)) (lt x (minus y z)))))
(assert-claim (forall ((x Nat) (y Nat)) (not (lt x (mod2 x y)))))
(assert-claim (forall ((x Nat) (y Nat)) (not (lt y (mod2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (lt x (plus y x)) (lt zero y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (=> (lt x z) (lt x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt z x) (not (lt x (mod2 y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt y x) (not (lt x (mod2 y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt (minus x y) y) (lt x (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt (minus x y) x) (lt (minus y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (=> (lt x x2) (= (lt (minus y z) x2) (lt y (plus z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt z x) (= (lt (minus x z) y) (lt x (plus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (lt (mod2 x y) y) (lt x (plus x y)))))
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
  (forall ((x Nat) (y Nat) (z Nat))
    (= (lt (plus x z) y) (lt x (minus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus y (minus y x)) (minus x (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (minus x (plus x y)) zero)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (minus (minus x y) z) (minus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (plus x y) x) (mod2 y (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt z y) (= (minus (plus x z) y) (minus x (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 y (minus x y)) (mod2 x (minus x y)))))
(assert-claim (forall ((x Nat)) (= (mod2 x (plus x x)) x)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt x z) (= (mod2 (minus y z) y) (minus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt y x) (= (mod2 (minus y z) x) (minus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt y x) (= (mod2 (minus x y) y) (mod2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 (mod2 x y) x) (mod2 (minus x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (mod2 (mod2 x y) y) (mod2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus x (minus y x)) (plus y (minus x y)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (rotate z (rotate y x2)) (rotate y (rotate z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (rotate (plus y z) x2) (rotate y (rotate z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take z (take y x2)) (take y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take y (take y z)) (take y z))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (=> (lt z y) (= (take z (take y x2)) (take z x2)))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (length (take (length x2) z)) (length (take (length z) x2)))))
(assert-claim
  (forall ((y list) (z list))
    (= (plus (length y) (length z)) (length (++ y z)))))
(assert-claim
  (forall ((y Nat) (z sk)) (= (rotate y (cons z nil)) (cons z nil))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 sk))
    (=> (lt y z) (= (take z (cons x2 nil)) (cons x2 nil)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop (succ z) (cons y x2)) (drop z x2))))
(assert-claim
  (forall ((y list) (z list))
    (= (drop (length y) (++ y z)) (rotate (length z) z))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop (length (take y z)) z) (drop y z))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (=> (lt z y) (= (drop y (take (succ z) x2)) nil))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (length (take z (rotate y x2))) (length (take z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt y (succ (minus y x))) (lt x (succ (minus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt y (succ (mod2 x y))) (lt y (succ zero)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt x z) (= (lt y (succ (mod2 y z))) (lt y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt y (minus (succ x) y)) (lt y (succ (minus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt x (mod2 (succ x) y)) (lt (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt y z)
      (= (lt (succ (minus x y)) z) (lt (succ x) (plus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt x y)
      (= (lt (succ (minus y z)) z) (lt (succ y) (plus z z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt y z) (= (lt (succ (mod2 x y)) z) (lt (succ zero) z)))))
(assert-claim
  (forall ((y list) (z Nat))
    (= (lt (length (take z y)) z) (lt (length y) z))))
(assert-claim
  (forall ((y Nat) (z list) (x2 Nat))
    (=> (lt y x2) (lt (length (take y z)) x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (=> (lt z y) (= (lt z (length (take y x2))) (lt z (length x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt x z) (= (lt (mod2 (succ z) y) z) (lt y (succ (succ z)))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt y x) (= (lt (mod2 (succ x) x) y) (lt (succ zero) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus y (succ (minus y x))) (minus x (succ (minus x y))))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (minus y (length (take y z))) (minus y (length z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (minus y (minus y (length z))) (length (take y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (succ (minus x y)) y) (minus (succ x) (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (succ (minus x y)) x) (minus (succ (minus y x)) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (=> (lt x x2)
      (= (minus (succ (minus y z)) x2) (minus (succ y) (plus z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (succ (mod2 x y)) y) (minus (succ x) (plus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt y x)
      (= (minus y (mod2 (succ x) x)) (minus y (succ zero))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (mod2 x (minus (succ y) z)) (mod2 x (succ (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 y (mod2 (succ x) y)) (mod2 y (succ (mod2 x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 (succ (mod2 x y)) y) (mod2 (succ x) y))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (=> (lt z y)
      (= (mod2 z (length (take y x2))) (mod2 z (length x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (lt z x) (= (mod2 (mod2 y (succ z)) x) (mod2 y (succ z))))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (mod2 (mod2 y (length z)) y) (mod2 y (length (take y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 (mod2 (succ y) y) x) (mod2 (mod2 (succ x) x) y))))
(assert-claim
  (forall ((x Nat))
    (= (minus x (succ zero)) (mod2 (plus x x) (succ x)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt x y)
      (= (plus x (mod2 (succ y) y)) (mod2 (succ x) (plus x y))))))
(assert-claim
  (forall ((y list) (z list))
    (= (rotate (length z) (++ z y)) (++ y z))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (rotate (length z) (drop y z)) (rotate y (drop y z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (rotate (mod2 y (length z)) z) (rotate y z))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (take (succ z) (cons y x2)) (cons y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (=> (lt z y) (= (take (succ z) (take y x2)) (take (succ z) x2)))))
(assert-claim
  (forall ((y list) (z list)) (= (take (length z) (++ z y)) z)))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take (length z) (drop y z)) (drop y z))))
(assert-claim
  (forall ((z Nat) (x2 list) (x3 list))
    (= (take (length (take z x2)) x3) (take z (take (length x2) x3)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take (plus y (length z)) z) z)))
(assert-claim
  (forall ((y list))
    (= (drop (succ zero) (++ y y)) (++ (drop (succ zero) y) y))))
(assert-claim
  (forall ((x Nat)) (= (lt (succ zero) (plus x x)) (lt zero x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt zero (mod2 (succ x) y)) (lt (succ (mod2 x y)) y))))
(assert-claim
  (forall ((x Nat)) (= (minus x (minus (succ zero) x)) x)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 (succ zero) (minus x y)) (minus (mod2 (succ y) x) y))))
(assert-claim
  (forall ((x Nat))
    (= (mod2 (succ zero) (plus x x)) (mod2 (succ zero) (succ x)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt x y) (= (mod2 (succ zero) (plus x y)) (mod2 (succ y) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt x y)
      (= (mod2 x (minus y (succ zero))) (mod2 x (mod2 (succ x) y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 (minus (succ zero) y) x) (minus (mod2 (succ x) x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (lt y x)
      (= (mod2 (minus x (succ zero)) y) (mod2 (minus x (succ y)) y)))))
(assert-claim
  (forall ((x Nat))
    (= (plus x (minus x (succ zero))) (minus (plus x x) (succ zero)))))
(assert-claim
  (forall ((y list))
    (= (take (succ zero) (++ y y)) (take (succ zero) y))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop y (take (succ y) z)) (take (succ zero) (drop y z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take (minus (succ zero) y) z) (drop y (take (succ zero) z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (++ (drop y z) (take y z)) (rotate (length (take y z)) z))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (++ (rotate y z) (rotate y z)) (rotate y (++ z z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (++ (take y z) (rotate y z)) (++ z (rotate y (take y z))))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop y (++ z (drop y z))) (++ (drop y z) (drop y z)))))
(assert-claim
  (forall ((y Nat) (z list) (x2 list))
    (= (drop y (++ (take y z) x2)) (drop (minus y (length z)) x2))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop y (drop y (++ z z))) (drop y (++ (drop y z) z)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop z (drop z (cons y x2))) (drop z (cons y (drop z x2))))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop z (rotate y (take z x2))) nil)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop z (take (plus z y) x2)) (take y (drop z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt y (minus x (mod2 y x))) (lt y (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt x (minus (plus y y) x)) (lt x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt x (mod2 (plus x x) y)) (lt x (mod2 (minus y x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt x (plus y (minus y x))) (lt x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (lt x (plus y (mod2 x y))) (lt x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt (minus x y) (mod2 x y)) (lt x (mod2 y (plus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (lt (minus y (minus z x)) y) (lt x (mod2 z (plus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt (minus y (plus x x)) y) (lt (minus y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (lt (minus (mod2 y z) x) z) (lt y (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (lt (minus (plus y x) z) y) (lt x (mod2 z (plus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt (mod2 x y) (mod2 y x)) (lt y (mod2 x (plus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt (mod2 x (plus y y)) x) (lt y (minus x (mod2 x y))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (lt (mod2 (minus z y) x) z) (lt (minus (mod2 z x) y) z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt (mod2 (minus x y) x) y) (lt x (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (lt (mod2 (mod2 z y) x) z) (lt (mod2 (mod2 z x) y) z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (lt (mod2 (plus y y) x) y) (lt (minus x (succ y)) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (minus x (minus (plus x z) y))
      (minus x (minus x (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus x (minus (plus y y) x))
      (minus x (minus y (minus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus x (mod2 y (plus x y))) (minus x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus y (mod2 (minus x y) x)) (minus y (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus x (plus y (mod2 y x))) (minus x (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (mod2 y (plus y x)) x) (mod2 (minus y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (minus (plus x (minus y z)) y)
      (minus x (minus y (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (plus x (minus x y)) y) (minus (minus (plus x x) y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 x (minus x (minus x y))) (mod2 (minus x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 x (minus x (mod2 x y))) (mod2 (minus x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 x (minus (plus y y) x)) (mod2 x (minus y (minus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (mod2 x (mod2 z (mod2 z x2))) (mod2 y (mod2 z (mod2 z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (mod2 x (mod2 x (plus x y))) zero)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod2 x (mod2 y (plus x y))) (mod2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (mod2 x (mod2 (minus z y) y)) (mod2 x (mod2 z (mod2 y z))))))
