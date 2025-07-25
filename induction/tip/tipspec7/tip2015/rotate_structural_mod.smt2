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
  length
  ((x list)) Nat
  (match x
    ((nil zero)
     ((cons y l) (plus (succ zero) (length l))))))
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
      (++ (drop (mod_structural n (length xs)) xs)
        (take (mod_structural n (length xs)) xs)))))
(assert-claim (= (length nil) zero))
(assert-claim (forall ((x Nat)) (= (minus x x) zero)))
(assert-claim (forall ((x Nat)) (= (mod_structural x x) zero)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y Nat)) (= (drop y nil) nil)))
(assert-claim (forall ((y list)) (= (drop zero y) y)))
(assert-claim (forall ((x Nat)) (= (minus x zero) x)))
(assert-claim (forall ((x Nat)) (= (minus zero x) zero)))
(assert-claim (forall ((x Nat)) (= (mod_structural x zero) zero)))
(assert-claim (forall ((x Nat)) (= (mod_structural zero x) zero)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((y Nat)) (= (rotate y nil) nil)))
(assert-claim (forall ((y list)) (= (rotate zero y) y)))
(assert-claim (forall ((y Nat)) (= (take y nil) nil)))
(assert-claim (forall ((y list)) (= (take zero y) nil)))
(assert-claim (forall ((x Nat) (y Nat)) (= (go x x y) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (mod_structural x y) (go x y y))))
(assert-claim (forall ((y list)) (= (drop (length y) y) nil)))
(assert-claim (forall ((x Nat) (y Nat)) (= (go x y zero) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (mod_structural x y) (go x zero y))))
(assert-claim
  (forall ((y list) (z list))
    (= (length (++ z y)) (length (++ y z)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (length (cons y z)) (succ (length z)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (length (rotate y z)) (length z))))
(assert-claim (forall ((x Nat)) (= (minus x (succ x)) zero)))
(assert-claim
  (forall ((x Nat)) (= (minus (succ x) x) (succ zero))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (minus (length z) y) (length (drop y z)))))
(assert-claim (forall ((x Nat)) (= (mod_structural x (succ x)) x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((y list)) (= (rotate (length y) y) y)))
(assert-claim (forall ((y list)) (= (take (length y) y) y)))
(assert-claim
  (forall ((x Nat)) (= (mod_structural x (succ zero)) zero)))
(assert-claim
  (forall ((x Nat))
    (= (mod_structural (succ zero) x) (mod_structural (succ x) x))))
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
    (= (drop (plus y z) x2) (drop y (drop z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x (succ x) y) (minus y (succ zero)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (succ x) x y) (mod_structural (succ y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus y (minus y x)) (minus x (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (minus x (plus x y)) zero)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (minus (minus x y) z) (minus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (minus (mod_structural y x) y) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (minus (mod_structural x y) y) zero)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (plus x y) x) (mod_structural y (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural y (minus x y)) (mod_structural x (minus x y)))))
(assert-claim
  (forall ((x Nat)) (= (mod_structural x (plus x x)) x)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go zero x y) (mod_structural (minus y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural (mod_structural x y) x)
      (mod_structural (minus x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural (mod_structural x y) y) (mod_structural x y))))
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
  (forall ((x Nat) (y Nat)) (= (go x y (succ zero)) zero)))
(assert-claim
  (forall ((x Nat)) (= (minus x (succ zero)) (go x (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus y (succ x)) (go zero (succ x) y))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (length (take (length x2) z)) (length (take (length z) x2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x y (succ y)) (mod_structural (succ x) (succ y)))))
(assert-claim
  (forall ((y list) (z list))
    (= (plus (length y) (length z)) (length (++ y z)))))
(assert-claim
  (forall ((y Nat) (z sk)) (= (rotate y (cons z nil)) (cons z nil))))
(assert-claim (forall ((y list)) (= (take (succ (length y)) y) y)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go x y (minus x y)) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go y x (minus x y)) zero)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x y (mod_structural y x)) (mod_structural (minus x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go y (minus y x) z) (go x (minus x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go x (mod_structural x y) y) zero)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go x (plus x y) z) (mod_structural (minus z y) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go x (plus z y) z) (mod_structural (minus x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go (minus x y) x z) (go (minus y x) y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (minus y x) x y) (go y (plus x x) y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go (mod_structural x y) x y) zero)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (= (minus (go x y z) z) zero)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (mod_structural (go x y z) z) (go x y z))))
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
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go (succ x) (succ y) z) (go x y z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go zero x (minus x y)) zero)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go zero y (minus x y)) (minus (go x y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go zero (minus y x) y) (go y (minus y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go zero (plus y y) x) (minus (go x y x) y))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (length (take z (rotate y x2))) (length (take z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus y (succ (minus y x))) (minus x (succ (minus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus y (go zero y x)) (minus y (minus x y)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (minus y (length (take y z))) (minus y (length z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (minus y (minus y (length z))) (length (take y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (succ x) (minus x y)) (succ (minus x (minus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (succ (minus x y)) y) (minus (succ x) (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (succ (minus x y)) x) (minus (succ (minus y x)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (succ (mod_structural x y)) y)
      (minus (succ x) (plus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (minus (go zero x y) z) (go zero x (minus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural y (go zero y x))
      (mod_structural y (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural x (go zero y x))
      (mod_structural x (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (mod_structural x (minus (succ y) z))
      (mod_structural x (succ (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural y (mod_structural (succ x) y))
      (mod_structural y (succ (mod_structural x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural (succ (mod_structural x y)) y)
      (mod_structural (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural (go zero y x) y)
      (mod_structural (minus x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (succ zero) x y) (mod_structural (minus (succ y) x) y))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (mod_structural (mod_structural y (length z)) y)
      (mod_structural y (length (take y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural (mod_structural (succ y) y) x)
      (mod_structural (mod_structural (succ x) x) y))))
(assert-claim
  (forall ((x Nat))
    (= (minus x (succ zero)) (mod_structural (plus x x) (succ x)))))
(assert-claim
  (forall ((y list) (z list))
    (= (rotate (length z) (++ z y)) (++ y z))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (rotate (length z) (drop y z)) (rotate y (drop y z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (rotate (mod_structural y (length z)) z) (rotate y z))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take y (take (succ y) z)) (take y z))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (take (succ z) (cons y x2)) (cons y (take z x2)))))
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
  (forall ((x Nat))
    (= (minus x (succ (succ zero))) (go x (succ (succ zero)) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x (succ zero) (succ y))
      (mod_structural (plus x y) (succ y)))))
(assert-claim
  (forall ((y sk) (z Nat))
    (= (length (take z (cons y nil))) (go zero z (succ z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural (succ zero) (minus x y))
      (minus (mod_structural (succ y) x) y))))
(assert-claim
  (forall ((x Nat))
    (= (go zero x (succ x)) (mod_structural (succ zero) (plus x x)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural (minus (succ zero) y) x)
      (minus (mod_structural (succ x) x) y))))
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
    (= (drop y (take (minus y z) x2)) nil)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop z (take (plus z y) x2)) (take y (drop z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x y (succ (minus x y))) (minus x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go x y (go zero x y)) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go y x (go zero x y)) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (go y x (minus x (succ y))) zero)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (go x y (minus (succ z) x2)) (go x y (succ (minus z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x y (mod_structural y (succ x)))
      (mod_structural (minus x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x (succ y) (minus x y)) (minus x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x (succ y) (mod_structural y x))
      (mod_structural (minus x (succ y)) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go y (succ (minus y x)) z) (go x (succ (minus x y)) z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x (succ (mod_structural x y)) y) (go x (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go y (succ (mod_structural x y)) y)
      (minus y (succ (mod_structural x y))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go x (go zero z y) z) (go x (minus y z) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go x (go zero y z) z) (go x (minus z y) z))))
(assert-claim
  (forall ((y Nat) (z list) (x2 Nat))
    (= (go y (length (take y z)) x2)
      (mod_structural (minus y (length z)) x2))))
(assert-claim
  (forall ((y Nat) (z list) (x2 Nat))
    (= (mod_structural (length (take y z)) x2)
      (go y (minus y (length z)) x2))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go x (minus (succ x) y) y) (minus x (minus (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go x (mod_structural (succ y) z) z)
      (go x (succ (mod_structural y z)) z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (succ x) y (minus x y))
      (minus (mod_structural (succ y) x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (succ y) x (minus x y))
      (minus (mod_structural (succ y) x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (succ x) (mod_structural x y) y)
      (mod_structural (succ y) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go (succ x) (plus x y) z)
      (mod_structural (minus (succ z) y) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go (succ (minus x y)) x z) (go (succ (minus y x)) y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (succ (minus y x)) x y) (go (succ y) (plus x x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go zero y (go x y x)) (minus (go x y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (go (go zero z x) y z) (go (minus x z) y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (go zero x y) x y) (go y (plus x x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (minus y x) (succ x) y) (go y (succ (plus x x)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (minus (succ y) x) x y) (go (succ y) (plus x x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (mod_structural x y) (succ x) x)
      (minus (mod_structural x y) (succ zero)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (mod_structural x y) (succ y) y)
      (minus (mod_structural x y) (succ zero)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (mod_structural x (succ y)) x y) zero)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (go (mod_structural (succ y) y) x y) (go (succ zero) x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus x (minus x (minus y x))) (go x (go x y x) y))))
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
    (= (minus x (plus y (mod_structural y x))) (minus x (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (go x y (succ x)) y) (minus x (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (go x (succ y) x) y) (minus x (succ (plus y y))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (minus (go y (succ x) x) y) zero)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (mod_structural x y) (minus x y)) (go x (minus x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (mod_structural x y) (minus y x))
      (mod_structural (go x y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (minus (mod_structural x (minus z y)) z) zero)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (minus (mod_structural (minus z x) y) z) zero)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (minus (plus x (minus y z)) y)
      (minus x (minus y (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (plus x (minus x y)) y) (minus (minus (plus x x) y) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (mod_structural z (go (succ x) y z))
      (mod_structural z (succ (go x y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (mod_structural z (minus z (minus y x))) (go y x (go x y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural x (minus x (mod_structural x y)))
      (mod_structural (minus x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mod_structural x (minus (plus y y) x))
      (mod_structural x (minus y (minus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (mod_structural x (mod_structural y (mod_structural y z)))
      (mod_structural z (mod_structural y (minus y z))))))
