(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(declare-datatype
  pair ((pair2 (proj1-pair Bool) (proj2-pair list))))
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
  ordered
  ((x list)) Bool
  (match x
    ((nil true)
     ((cons y z)
      (match z
        ((nil true)
         ((cons y2 xs) (and (leq y y2) (ordered (cons y2 xs))))))))))
(define-fun-rec
  bubble
  ((x list)) pair
  (match x
    ((nil (pair2 false nil))
     ((cons y z)
      (match z
        ((nil (pair2 false (cons y nil)))
         ((cons y2 xs)
          (ite
            (leq y y2)
            (match (bubble (cons y2 xs))
              (((pair2 b12 ys12) (pair2 b12 (cons y ys12)))))
            (match (bubble (cons y xs))
              (((pair2 b1 ys1) (pair2 true (cons y2 ys1)))))))))))))
(define-fun-rec
  bubsort
  ((x list)) list
  (match (bubble x) (((pair2 c ys1) (ite c (bubsort ys1) x)))))
(assert-not (forall ((xs list)) (ordered (bubsort xs))))
(assert-claim (ordered nil))
(assert-claim (= (bubsort nil) nil))
(assert-claim
  (forall ((x list)) (=> (ordered x) (= (bubsort x) x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim
  (forall ((x list)) (= (bubsort (bubsort x)) (bubsort x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list)) (ordered (bubsort x))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat)) (= (bubsort (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list))
    (= (bubsort (cons zero x)) (cons zero (bubsort x)))))
(assert-claim
  (forall ((x list)) (= (ordered (cons zero x)) (ordered x))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (bubsort (cons x (bubsort y))) (bubsort (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (=> (leq z x)
      (= (bubsort (cons z (cons y x2)))
        (bubsort (cons y (cons z x2)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (cons x y))) (ordered (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (ordered (cons x (cons y z))) (ordered (cons y z))))))
(assert-claim
  (forall ((x Nat))
    (= (bubsort (cons x (cons x nil))) (cons x (cons x nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (bubsort (cons x (cons y nil))) (cons x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq x y) (ordered (cons x (cons y nil))))))
(assert-claim
  (forall ((x list) (y Nat))
    (=> (ordered x)
      (= (ordered (cons y (cons zero x))) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (bubsort (cons x y))))
      (ordered (cons x (bubsort y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons x y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons zero y))))))
