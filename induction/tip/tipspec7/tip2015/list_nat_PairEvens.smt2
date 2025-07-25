(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype list ((nil) (cons (head pair) (tail list))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-const lam fun12)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 pair) sk)
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  pairs
  ((x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y z)
      (match z
        ((nil2 nil)
         ((cons2 y2 xs) (cons (pair2 y y2) (pairs xs)))))))))
(define-fun-rec
  map3
  ((f fun1) (x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (cons2 (apply1 f y) (map3 f xs))))))
(define-fun-rec
  map2
  ((f fun12) (x list)) list2
  (match x
    ((nil nil2)
     ((cons y xs) (cons2 (apply12 f y) (map2 f xs))))))
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
(define-funs-rec
  ((evens2
    ((x list2)) list2)
   (odds2
    ((x list2)) list2))
  ((match x
     ((nil2 nil2)
      ((cons2 y xs) (cons2 y (odds2 xs)))))
   (match x
     ((nil2 nil2)
      ((cons2 y xs) (evens2 xs))))))
(define-funs-rec
  ((evens
    ((x list)) list)
   (odds
    ((x list)) list))
  ((match x
     ((nil nil)
      ((cons y xs) (cons y (odds xs)))))
   (match x
     ((nil nil)
      ((cons y xs) (evens xs))))))
(define-fun-rec
  even
  ((x Nat)) Bool
  (match x
    ((zero true)
     ((succ y) (not (even y))))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert
  (forall ((x pair))
    (= (apply12 lam x) (match x (((pair2 y z) y))))))
(assert-not
  (forall ((xs list2))
    (=> (= (ite (even (length2 xs)) zero (succ zero)) zero)
      (= (map2 lam (pairs xs)) (evens2 xs)))))
(assert-claim (even zero))
(assert-claim (= (pairs nil2) nil))
(assert-claim (= (length2 nil2) zero))
(assert-claim (= (evens2 nil2) nil2))
(assert-claim (= (odds2 nil2) nil2))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim
  (forall ((x Nat)) (=> (even x) (not (even (succ x))))))
(assert-claim
  (forall ((y list2)) (= (length (pairs y)) (length2 (odds2 y)))))
(assert-claim (forall ((z fun1)) (= (map3 z nil2) nil2)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((x Nat)) (even (plus x x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (even x) (= (even (plus y x)) (even y)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (evens2 (cons2 y z)) (cons2 y (odds2 z)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (length2 (cons2 y z)) (succ (length2 z)))))
(assert-claim
  (forall ((z fun1) (x2 list2))
    (= (length2 (map3 z x2)) (length2 x2))))
(assert-claim
  (forall ((z fun1) (x2 list2))
    (= (map3 z (evens2 x2)) (evens2 (map3 z x2)))))
(assert-claim
  (forall ((y sk) (z list2)) (= (odds2 (cons2 y z)) (evens2 z))))
(assert-claim
  (forall ((z fun1) (x2 list2))
    (= (odds2 (map3 z x2)) (map3 z (odds2 x2)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((y list2))
    (= (length (evens (pairs y))) (length2 (evens2 (odds2 y))))))
(assert-claim
  (forall ((y list2))
    (= (length (odds (pairs y))) (length2 (odds2 (odds2 y))))))
(assert-claim (forall ((y sk)) (= (pairs (cons2 y nil2)) nil)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((z fun1) (x2 sk))
    (= (map3 z (cons2 x2 nil2)) (cons2 (apply1 z x2) nil2))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list2))
    (= (odds (pairs (cons2 y x2))) (odds (pairs (cons2 z x2))))))
(assert-claim
  (forall ((y list))
    (= (evens (evens (odds (evens y)))) (evens (odds (evens y))))))
(assert-claim
  (forall ((y list))
    (= (evens (evens (odds (odds y)))) (evens (odds (odds y))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (evens (evens y)))) (odds (evens (evens y))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (evens (odds y)))) (odds (evens (odds y))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (odds (evens y)))) (odds (odds (evens y))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (odds (odds y)))) (odds (odds (odds y))))))
(assert-claim
  (forall ((y list2))
    (= (length (evens (evens (pairs y))))
      (length2 (evens2 (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (length (evens (odds (pairs y))))
      (length2 (evens2 (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (length (odds (evens (pairs y))))
      (length2 (odds2 (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (length (odds (odds (pairs y))))
      (length2 (odds2 (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list2))
    (= (pairs (cons2 y (cons2 z x2))) (cons (pair2 y z) (pairs x2)))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (odds2 (evens2 (evens2 y)))))
      (evens2 (odds2 (evens2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (odds2 (evens2 (odds2 y)))))
      (evens2 (odds2 (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (odds2 (odds2 (evens2 y)))))
      (evens2 (odds2 (odds2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (odds2 (odds2 (odds2 y)))))
      (evens2 (odds2 (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (evens2 (evens2 (evens2 y)))))
      (odds2 (evens2 (evens2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (evens2 (evens2 (odds2 y)))))
      (odds2 (evens2 (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (evens2 (odds2 (evens2 y)))))
      (odds2 (evens2 (odds2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (evens2 (odds2 (odds2 y)))))
      (odds2 (evens2 (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (odds2 (evens2 (evens2 y)))))
      (odds2 (odds2 (evens2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (odds2 (evens2 (odds2 y)))))
      (odds2 (odds2 (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (odds2 (odds2 (evens2 y)))))
      (odds2 (odds2 (odds2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (odds2 (odds2 (odds2 y)))))
      (odds2 (odds2 (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (evens (odds (pairs (evens2 y)))))
      (evens (odds (pairs (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (evens (odds (pairs (odds2 y)))))
      (evens (odds (pairs (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (evens (pairs (evens2 (evens2 y)))))
      (evens (pairs (evens2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (evens (pairs (evens2 (odds2 y)))))
      (evens (pairs (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (evens (pairs (odds2 (evens2 y)))))
      (evens (pairs (odds2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (evens (pairs (odds2 (odds2 y)))))
      (evens (pairs (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (odds (evens (pairs (evens2 y)))))
      (odds (evens (pairs (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (odds (evens (pairs (odds2 y)))))
      (odds (evens (pairs (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (odds (odds (pairs (evens2 y)))))
      (odds (odds (pairs (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (odds (odds (pairs (odds2 y)))))
      (odds (odds (pairs (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (odds (pairs (evens2 (evens2 y)))))
      (odds (pairs (evens2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (odds (pairs (evens2 (odds2 y)))))
      (odds (pairs (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (odds (pairs (odds2 (evens2 y)))))
      (odds (pairs (odds2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (odds (pairs (odds2 (odds2 y)))))
      (odds (pairs (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (pairs (evens2 (evens2 (evens2 y)))))
      (pairs (evens2 (evens2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (pairs (evens2 (evens2 (odds2 y)))))
      (pairs (evens2 (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (pairs (evens2 (odds2 (evens2 y)))))
      (pairs (evens2 (odds2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (pairs (evens2 (odds2 (odds2 y)))))
      (pairs (evens2 (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (pairs (odds2 (evens2 (evens2 y)))))
      (pairs (odds2 (evens2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (pairs (odds2 (evens2 (odds2 y)))))
      (pairs (odds2 (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (pairs (odds2 (odds2 (evens2 y)))))
      (pairs (odds2 (odds2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens (pairs (odds2 (odds2 (odds2 y)))))
      (pairs (odds2 (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (length (evens (evens (evens (pairs y)))))
      (length2 (evens2 (evens2 (evens2 (odds2 y))))))))
(assert-claim
  (forall ((y list2))
    (= (odds2 (evens2 (odds2 (evens2 (evens2 y))))) nil2)))
(assert-claim
  (forall ((z fun1) (x2 sk) (x3 list2))
    (= (cons2 (apply1 z x2) (map3 z x3)) (map3 z (cons2 x2 x3)))))
(assert-claim
  (forall ((y list2))
    (= (even (plus (length2 y) (length2 (evens2 y))))
      (even (length2 (odds2 y))))))
(assert-claim
  (forall ((y list2))
    (= (plus (length2 (evens2 y)) (length2 (odds2 y))) (length2 y))))
