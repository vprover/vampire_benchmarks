(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  take2
  ((x Nat) (y list2)) list2
  (match x
    ((zero nil2)
     ((succ z)
      (match y
        ((nil2 nil2)
         ((cons2 z2 xs) (cons2 z2 (take2 z xs)))))))))
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
  nmsorttd-half1
  ((x Nat)) Nat
  (match x
    ((zero zero)
     ((succ y)
      (match y
        ((zero zero)
         ((succ z)
          (plus (succ zero)
            (nmsorttd-half1 (minus (succ (succ z)) (succ (succ zero))))))))))))
(define-fun-rec
  leq
  ((x Nat) (y Nat)) Bool
  (match x
    ((zero true)
     ((succ z)
      (match y
        ((zero false)
         ((succ x2) (leq z x2))))))))
(define-fun-rec
  lmerge
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z x2)
      (match y
        ((nil (cons z x2))
         ((cons x3 x4)
          (ite
            (leq z x3) (cons z (lmerge x2 (cons x3 x4)))
            (cons x3 (lmerge (cons z x2) x4))))))))))
(define-fun-rec
  ordered
  ((x list)) Bool
  (match x
    ((nil true)
     ((cons y z)
      (match z
        ((nil true)
         ((cons y2 xs) (and (leq y y2) (ordered (cons y2 xs))))))))))
(define-fun-rec
  length2
  ((x list2)) Nat
  (match x
    ((nil2 zero)
     ((cons2 y l) (plus (succ zero) (length2 l))))))
(define-fun-rec
  length
  ((x list)) Nat
  (match x
    ((nil zero)
     ((cons y l) (plus (succ zero) (length l))))))
(define-fun-rec
  drop2
  ((x Nat) (y list2)) list2
  (match x
    ((zero y)
     ((succ z)
      (match y
        ((nil2 nil2)
         ((cons2 z2 xs1) (drop2 z xs1))))))))
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
  nmsorttd
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y z)
      (match z
        ((nil (cons y nil))
         ((cons x2 x3)
          (let ((k (nmsorttd-half1 (length (cons y (cons x2 x3))))))
            (lmerge (nmsorttd (take k (cons y (cons x2 x3))))
              (nmsorttd (drop k (cons y (cons x2 x3)))))))))))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-not (forall ((xs list)) (ordered (nmsorttd xs))))
(assert-claim (ordered nil))
(assert-claim (= (nmsorttd-half1 zero) zero))
(assert-claim (= (nmsorttd-half1 (succ zero)) zero))
(assert-claim (= (length2 nil2) zero))
(assert-claim (= (nmsorttd nil) nil))
(assert-claim
  (forall ((x list)) (=> (ordered x) (= (nmsorttd x) x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim
  (forall ((x list) (y list))
    (=> (ordered y) (=> (ordered x) (= (lmerge y x) (lmerge x y))))))
(assert-claim (forall ((x Nat)) (= (minus x x) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (= (minus x y) zero))))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y Nat)) (= (drop2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (drop2 zero y) y)))
(assert-claim
  (forall ((x list)) (= (length (nmsorttd x)) (length x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list)) (= (lmerge x nil) x)))
(assert-claim (forall ((x list)) (= (lmerge nil x) x)))
(assert-claim (forall ((x Nat)) (= (minus x zero) x)))
(assert-claim
  (forall ((x list)) (= (nmsorttd (nmsorttd x)) (nmsorttd x))))
(assert-claim (forall ((x list)) (ordered (nmsorttd x))))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((y Nat)) (= (take2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (take2 zero y) nil2)))
(assert-claim (forall ((y list2)) (= (drop2 (length2 y) y) nil2)))
(assert-claim
  (forall ((y sk) (z list2))
    (= (length2 (cons2 y z)) (succ (length2 z)))))
(assert-claim
  (forall ((x list) (y list))
    (= (length (lmerge y x)) (length (lmerge x y)))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim
  (forall ((x Nat)) (= (leq x (nmsorttd-half1 x)) (leq x zero))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq y (nmsorttd-half1 x)) (leq y zero)))))
(assert-claim (forall ((x Nat)) (leq (nmsorttd-half1 x) x)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (leq (nmsorttd-half1 x) y))))
(assert-claim
  (forall ((x Nat))
    (= (minus x (nmsorttd-half1 x)) (nmsorttd-half1 (succ x)))))
(assert-claim
  (forall ((x Nat)) (= (minus (succ x) x) (succ zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq y x) (= (minus (succ x) y) (succ (minus x y))))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (minus (length2 z) y) (length2 (drop2 y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (=> (ordered y) (= (nmsorttd (drop x y)) (drop x y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (nmsorttd (lmerge y x)) (nmsorttd (lmerge x y)))))
(assert-claim
  (forall ((x list) (y list))
    (=> (ordered y)
      (= (nmsorttd (lmerge x y)) (lmerge (nmsorttd x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (=> (ordered y) (= (nmsorttd (take x y)) (take x y)))))
(assert-claim (forall ((x Nat)) (= (nmsorttd-half1 (plus x x)) x)))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (lmerge y x)) (ordered (lmerge x y)))))
(assert-claim
  (forall ((x list)) (= (ordered (lmerge x x)) (ordered x))))
(assert-claim
  (forall ((x list) (y list))
    (=> (ordered x) (= (ordered (lmerge y x)) (ordered y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((y list2)) (= (take2 (length2 y) y) y)))
(assert-claim
  (forall ((x Nat))
    (= (leq (nmsorttd-half1 x) zero) (leq x (succ zero)))))
(assert-claim
  (forall ((x Nat)) (= (nmsorttd (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list))
    (= (nmsorttd (cons zero x)) (cons zero (nmsorttd x)))))
(assert-claim
  (forall ((x Nat))
    (= (nmsorttd-half1 (succ (succ x))) (succ (nmsorttd-half1 x)))))
(assert-claim
  (forall ((x list)) (= (ordered (cons zero x)) (ordered x))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (drop2 z (drop2 y x2)) (drop2 y (drop2 z x2)))))
(assert-claim
  (forall ((y Nat) (z list2)) (= (drop2 y (take2 y z)) nil2)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (=> (leq z y) (= (drop2 y (take2 z x2)) nil2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (drop2 (plus y z) x2) (drop2 y (drop2 z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x) (= (drop x (cons x z)) (drop x (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq x (minus y x)) (leq x (nmsorttd-half1 y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq y (minus y x)) (leq x (minus x y)))))
(assert-claim (forall ((x Nat) (y Nat)) (leq x (plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq x z) (leq x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (leq (minus x y) z) (leq x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus x x) y) (leq x (nmsorttd-half1 y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus x y) x) (leq y (nmsorttd-half1 y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq z y) (= (leq (plus x z) y) (leq x (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq z x) (= (leq (plus z x) y) (leq x (minus y z))))))
(assert-claim
  (forall ((x list) (y list) (z list))
    (= (lmerge (lmerge x y) z) (lmerge x (lmerge y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus y (minus y x)) (minus x (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (minus (minus x y) z) (minus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (plus x y) x) (nmsorttd-half1 (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq z y) (= (minus (plus x z) y) (minus x (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus x (minus y x)) (plus y (minus x y)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (take2 z (take2 y x2)) (take2 y (take2 z x2)))))
(assert-claim
  (forall ((y Nat) (z list2)) (= (take2 y (take2 y z)) (take2 y z))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (=> (leq z y) (= (take2 z (take2 y x2)) (take2 z x2)))))
(assert-claim
  (forall ((z list2) (x2 list2))
    (= (length2 (take2 (length2 x2) z))
      (length2 (take2 (length2 z) x2)))))
(assert-claim
  (forall ((x list) (y list))
    (= (length (lmerge x (nmsorttd y))) (length (lmerge x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (length (take x (nmsorttd y))) (length (take x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (leq (succ (nmsorttd-half1 x)) y) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (nmsorttd-half1 (succ x)) y) (leq x (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (leq (nmsorttd-half1 x) (nmsorttd-half1 y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (lmerge x (cons zero y)) (cons zero (lmerge x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (=> (ordered y)
      (= (nmsorttd (cons x y)) (lmerge (cons x nil) y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (lmerge (cons zero x) y) (cons zero (lmerge x y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (lmerge (nmsorttd x) (nmsorttd y)) (nmsorttd (lmerge x y)))))
(assert-claim
  (forall ((x Nat))
    (= (minus (succ (nmsorttd-half1 x)) x) (minus (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (minus (succ (nmsorttd-half1 x)) y) (minus (succ zero) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (nmsorttd (cons x (nmsorttd y))) (nmsorttd (cons x y)))))
(assert-claim
  (forall ((x list))
    (= (nmsorttd-half1 (length (lmerge x x))) (length x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (nmsorttd-half1 (minus (succ x) y))
      (nmsorttd-half1 (succ (minus x y))))))
(assert-claim
  (forall ((x list) (y list))
    (= (plus (length x) (length y)) (length (lmerge x y)))))
(assert-claim
  (forall ((x list))
    (= (nmsorttd (take (succ zero) x)) (take (succ zero) x))))
(assert-claim
  (forall ((x list) (y list))
    (=> (ordered x)
      (=> (ordered y)
        (= (nmsorttd-half1 (nmsorttd-half1 (nmsorttd-half1 (length x))))
          (nmsorttd-half1 (nmsorttd-half1 (nmsorttd-half1 (length y)))))))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (drop2 (length2 (take2 y z)) z) (drop2 y z))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (minus y (length2 (take2 y z))) (minus y (length2 z)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (minus y (minus y (length2 z))) (length2 (take2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus x (nmsorttd-half1 (plus x y)))
      (nmsorttd-half1 (succ (minus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (minus y (nmsorttd-half1 (minus y x)))
        (nmsorttd-half1 (succ (plus x y)))))))
