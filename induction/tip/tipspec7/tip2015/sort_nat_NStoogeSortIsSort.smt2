(declare-sort sk 0)
(declare-datatype
  pair4 ((pair23 (proj1-pair3 sk) (proj2-pair3 sk))))
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype
  pair3 ((pair22 (proj1-pair2 list2) (proj2-pair2 list2))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(declare-datatype
  pair ((pair2 (proj1-pair list) (proj2-pair list))))
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
  third
  ((x Nat)) Nat
  (match x
    ((zero zero)
     ((succ y)
      (match y
        ((zero zero)
         ((succ z)
          (match z
            ((zero zero)
             ((succ x2)
              (plus (succ zero)
                (third
                  (minus (succ (succ (succ x2)))
                    (succ (succ (succ zero))))))))))))))))
(define-fun-rec
  leq
  ((x Nat) (y Nat)) Bool
  (match x
    ((zero true)
     ((succ z)
      (match y
        ((zero false)
         ((succ x2) (leq z x2))))))))
(define-fun
  sort2
  ((x Nat) (y Nat)) list
  (ite (leq x y) (cons x (cons y nil)) (cons y (cons x nil))))
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
  insert2
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (leq x z) (cons x (cons z xs)) (cons z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (insert2 y (isort xs))))))
(define-fun-rec
  drop2
  ((x Nat) (y list2)) list2
  (match x
    ((zero y)
     ((succ z)
      (match y
        ((nil2 nil2)
         ((cons2 z2 xs1) (drop2 z xs1))))))))
(define-fun
  splitAt2
  ((x Nat) (y list2)) pair3 (pair22 (take2 x y) (drop2 x y)))
(define-fun-rec
  drop
  ((x Nat) (y list)) list
  (match x
    ((zero y)
     ((succ z)
      (match y
        ((nil nil)
         ((cons z2 xs1) (drop z xs1))))))))
(define-fun
  splitAt
  ((x Nat) (y list)) pair (pair2 (take x y) (drop x y)))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  reverse2
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (++2 (reverse2 xs) (cons2 y nil2))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  reverse
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (++ (reverse xs) (cons y nil))))))
(define-funs-rec
  ((nstooge1sort2
    ((x list)) list)
   (nstoogesort
    ((x list)) list)
   (nstooge1sort1
    ((x list)) list))
  ((match (splitAt (third (length x)) (reverse x))
     (((pair2 ys1 zs1) (++ (nstoogesort zs1) (reverse ys1)))))
   (match x
     ((nil nil)
      ((cons y z)
       (match z
         ((nil (cons y nil))
          ((cons y2 x2)
           (match x2
             ((nil (sort2 y y2))
              ((cons x3 x4)
               (nstooge1sort2
                 (nstooge1sort1
                   (nstooge1sort2 (cons y (cons y2 (cons x3 x4)))))))))))))))
   (match (splitAt (third (length x)) x)
     (((pair2 ys1 zs) (++ ys1 (nstoogesort zs)))))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-not (forall ((xs list)) (= (nstoogesort xs) (isort xs))))
(assert-claim (= (third zero) zero))
(assert-claim (= (third (succ zero)) zero))
(assert-claim (= (third (succ (succ zero))) zero))
(assert-claim (= (length2 nil2) zero))
(assert-claim (= (isort nil) nil))
(assert-claim (= (reverse2 nil2) nil2))
(assert-claim (= (nstooge1sort2 nil) nil))
(assert-claim (= (nstooge1sort1 nil) nil))
(assert-claim (forall ((x list)) (= (isort x) (nstoogesort x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat)) (= (minus x x) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (= (minus x y) zero))))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (sort2 y x) (sort2 x y))))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((y Nat)) (= (drop2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (drop2 zero y) y)))
(assert-claim (forall ((x Nat)) (= (insert2 x nil) (cons x nil))))
(assert-claim
  (forall ((x list)) (= (insert2 zero x) (cons zero x))))
(assert-claim (forall ((x list)) (= (isort (isort x)) (isort x))))
(assert-claim
  (forall ((x list)) (= (isort (nstooge1sort1 x)) (isort x))))
(assert-claim
  (forall ((x list)) (= (isort (nstooge1sort2 x)) (isort x))))
(assert-claim
  (forall ((x list)) (= (isort (reverse x)) (isort x))))
(assert-claim
  (forall ((y list2)) (= (length2 (reverse2 y)) (length2 y))))
(assert-claim
  (forall ((x list)) (= (length (isort x)) (length x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x Nat)) (= (minus x zero) x)))
(assert-claim
  (forall ((x list)) (= (nstooge1sort1 (isort x)) (isort x))))
(assert-claim
  (forall ((x list))
    (= (nstooge1sort1 (nstooge1sort1 x)) (nstooge1sort1 x))))
(assert-claim
  (forall ((x list)) (= (nstooge1sort2 (isort x)) (isort x))))
(assert-claim
  (forall ((x list))
    (= (nstooge1sort2 (nstooge1sort2 x)) (nstooge1sort2 x))))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((y list2)) (= (reverse2 (reverse2 y)) y)))
(assert-claim
  (forall ((y Nat) (z Nat)) (= (splitAt2 y nil2) (splitAt2 z nil2))))
(assert-claim (forall ((y Nat)) (= (take2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (take2 zero y) nil2)))
(assert-claim (forall ((y list2)) (= (drop2 (length2 y) y) nil2)))
(assert-claim
  (forall ((x list) (y list)) (= (isort (++ y x)) (isort (++ x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (isort (cons x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (isort (sort2 x y)) (sort2 x y))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (length2 (++2 z y)) (length2 (++2 y z)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (length2 (cons2 y z)) (succ (length2 z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (length (sort2 x y)) (succ (succ zero)))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim
  (forall ((x Nat)) (= (leq x (third x)) (leq x zero))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq y (third x)) (leq y zero)))))
(assert-claim (forall ((x Nat)) (leq (third x) x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq (third x) y))))
(assert-claim
  (forall ((x Nat)) (= (minus (succ x) x) (succ zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq y x) (= (minus (succ x) y) (succ (minus x y))))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (minus (length2 z) y) (length2 (drop2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((x Nat)) (= (reverse (sort2 x x)) (sort2 x x))))
(assert-claim (forall ((y list2)) (= (take2 (length2 y) y) y)))
(assert-claim
  (forall ((x list))
    (= (isort x) (nstooge1sort1 (nstooge1sort2 (nstooge1sort1 x))))))
(assert-claim
  (forall ((x list))
    (= (nstooge1sort1 (reverse (nstooge1sort2 x)))
      (nstooge1sort1 (reverse x)))))
(assert-claim
  (forall ((x list))
    (= (isort x) (nstooge1sort2 (nstooge1sort1 (nstooge1sort2 x))))))
(assert-claim
  (forall ((x list))
    (= (nstooge1sort2 (reverse (nstooge1sort1 x)))
      (nstooge1sort2 (reverse x)))))
(assert-claim
  (forall ((y sk)) (= (reverse2 (cons2 y nil2)) (cons2 y nil2))))
(assert-claim
  (forall ((x Nat)) (= (third (third (third x))) zero)))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (cons x (cons x y)) (++ (sort2 x x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (cons x (cons y z)) (++ (sort2 x y) z)))))
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
  (forall ((x Nat) (y list))
    (= (insert2 x (cons x y)) (++ (sort2 x x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (insert2 y (sort2 x z)) (insert2 x (sort2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (insert2 x (cons y z)) (++ (sort2 x y) z)))))
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
    (= (leq (plus y y) x) (leq y (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus x y) x) (leq y (third y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq z y) (= (leq (plus x z) y) (leq x (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq z x) (= (leq (plus z x) y) (leq x (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus y (minus y x)) (minus x (minus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (minus (minus x y) z) (minus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (minus (plus y x) y) (minus x (minus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq z y) (= (minus (plus x z) y) (minus x (minus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus x (minus y x)) (plus y (minus x y)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (=> (leq z y)
      (= (splitAt2 y (take2 z x2)) (splitAt2 z (take2 z x2))))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (take2 z (take2 y x2)) (take2 y (take2 z x2)))))
(assert-claim
  (forall ((y Nat) (z list2)) (= (take2 y (take2 y z)) (take2 y z))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (=> (leq z y) (= (take2 z (take2 y x2)) (take2 z x2)))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (++2 (reverse2 z) (reverse2 y)) (reverse2 (++2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (sort2 x y) (insert2 x (cons y nil)))))
(assert-claim
  (forall ((x list) (y list))
    (= (isort (++ x (isort y))) (isort (++ x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (isort (drop x (isort y))) (drop x (isort y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (isort (take x (isort y))) (take x (isort y)))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (length2 (++2 y (reverse2 z))) (length2 (++2 y z)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (length2 (take2 y (reverse2 z))) (length2 (take2 y z)))))
(assert-claim
  (forall ((z list2) (x2 list2))
    (= (length2 (take2 (length2 x2) z))
      (length2 (take2 (length2 z) x2)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (length (take x (isort y))) (length (take x y)))))
(assert-claim
  (forall ((x Nat))
    (= (leq x (succ (third x))) (leq x (succ zero)))))
(assert-claim
  (forall ((x Nat))
    (= (leq (succ (third x)) x) (leq (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (succ (third x)) y) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq y (succ (third x))) (leq y (succ zero))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (leq (third x) (third y)))))
(assert-claim
  (forall ((x Nat))
    (= (minus (succ (third x)) x) (minus (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (minus (succ (third x)) y) (minus (succ zero) y)))))
(assert-claim
  (forall ((x list))
    (= (nstooge1sort1 (++ x (isort x))) (nstooge1sort1 (++ x x)))))
(assert-claim
  (forall ((x list) (y list))
    (= (nstooge1sort1 (++ x (nstooge1sort1 y)))
      (nstooge1sort1 (++ x y)))))
(assert-claim
  (forall ((x list))
    (= (nstooge1sort1 (++ x (nstooge1sort2 x)))
      (nstooge1sort1 (++ x x)))))
(assert-claim
  (forall ((x list))
    (= (nstooge1sort1 (++ x (reverse x))) (nstooge1sort1 (++ x x)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (nstooge1sort1 (drop x (nstooge1sort1 y)))
      (drop x (nstooge1sort1 y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (nstooge1sort1 (reverse (sort2 x y))) (sort2 x y))))
(assert-claim
  (forall ((x list))
    (= (nstooge1sort2 (++ (isort x) x)) (nstooge1sort2 (++ x x)))))
(assert-claim
  (forall ((x list))
    (= (nstooge1sort2 (++ (nstooge1sort1 x) x))
      (nstooge1sort2 (++ x x)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (nstooge1sort2 (take x (nstooge1sort2 y)))
      (take x (nstooge1sort2 y)))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (plus (length2 y) (length2 z)) (length2 (++2 y z)))))
(assert-claim
  (forall ((x Nat))
    (= (third (succ (plus x x))) (minus x (third (succ x))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (third (minus (succ x) y)) (third (succ (minus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq y z)
      (=> (leq z x)
        (= (third (minus (third y) z)) (minus (third (third y)) z))))))
(assert-claim
  (forall ((x list))
    (= (isort (take (succ zero) x)) (take (succ zero) x))))
(assert-claim
  (forall ((x Nat))
    (= (leq x (succ (succ zero))) (leq (third x) zero))))
(assert-claim
  (forall ((x list))
    (= (nstooge1sort1 (nstooge1sort2 (cons zero x)))
      (nstooge1sort1 (cons zero (nstooge1sort2 x))))))
(assert-claim
  (forall ((x list))
    (= (nstooge1sort2 (cons zero (nstooge1sort2 x)))
      (cons zero (nstooge1sort2 x)))))
(assert-claim
  (forall ((y list2))
    (= (reverse2 (take2 (succ zero) y)) (take2 (succ zero) y))))
(assert-claim
  (forall ((x Nat))
    (= (third (succ (succ (succ x)))) (succ (third x)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (drop2 y (reverse2 (take2 y z))) nil2)))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list2))
    (= (drop2 (succ z) (cons2 y x2)) (drop2 z x2))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (drop2 (length2 y) (++2 y z)) (take2 (length2 z) z))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (drop2 (length2 (drop2 y z)) z)
      (reverse2 (take2 y (reverse2 z))))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (drop2 (length2 (take2 y z)) z) (drop2 y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (drop x (sort2 y (third x))) (drop x (sort2 y zero)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (drop (succ x) (sort2 x y)) (drop x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq x y)
      (= (drop (succ y) (sort2 z x)) (drop y (cons z nil))))))
