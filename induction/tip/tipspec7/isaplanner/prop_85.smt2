(declare-sort sk 0)
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype list ((nil) (cons (head pair) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  zip
  ((x list2) (y list2)) list
  (match x
    ((nil2 nil)
     ((cons2 z x2)
      (match y
        ((nil2 nil)
         ((cons2 x3 x4) (cons (pair2 z x3) (zip x2 x4)))))))))
(define-fun-rec
  len2
  ((x list2)) Nat
  (match x
    ((nil2 Z)
     ((cons2 y xs) (S (len2 xs))))))
(define-fun-rec
  len
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y xs) (S (len xs))))))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  rev2
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (++2 (rev2 xs) (cons2 y nil2))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  rev
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (++ (rev xs) (cons y nil))))))
(assert-not
  (forall ((xs list2) (ys list2))
    (=> (= (len2 xs) (len2 ys))
      (= (zip (rev2 xs) (rev2 ys)) (rev (zip xs ys))))))
(assert-claim (= (len2 nil2) Z))
(assert-claim (= (rev2 nil2) nil2))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((y list2)) (= (len2 (rev2 y)) (len2 y))))
(assert-claim (forall ((y list2)) (= (rev2 (rev2 y)) y)))
(assert-claim (forall ((y list2)) (= (zip y nil2) nil)))
(assert-claim (forall ((y list2)) (= (zip nil2 y) nil)))
(assert-claim
  (forall ((y list2) (z list2))
    (= (len2 (++2 z y)) (len2 (++2 y z)))))
(assert-claim
  (forall ((y sk) (z list2)) (= (len2 (cons2 y z)) (S (len2 z)))))
(assert-claim
  (forall ((z list2) (x2 list2))
    (= (len (zip x2 z)) (len (zip z x2)))))
(assert-claim (forall ((y list2)) (= (len (zip y y)) (len2 y))))
(assert-claim
  (forall ((y sk)) (= (rev2 (cons2 y nil2)) (cons2 y nil2))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((y list2) (z list2)) (= (zip z (++2 z y)) (zip z z))))
(assert-claim
  (forall ((y list2) (z list2)) (= (zip (++2 z y) z) (zip z z))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (++2 (rev2 z) (rev2 y)) (rev2 (++2 y z)))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (len2 (++2 y (rev2 z))) (len2 (++2 y z)))))
(assert-claim
  (forall ((z list2) (x2 list2))
    (= (len (zip z (rev2 x2))) (len (zip z x2)))))
(assert-claim
  (forall ((y list2)) (= (rev (zip y (rev2 y))) (zip (rev2 y) y))))
(assert-claim
  (forall ((y list2)) (= (zip (rev2 y) (rev2 y)) (rev (zip y y)))))
(assert-claim
  (forall ((z list2) (x2 list2) (x3 list2))
    (= (len (zip z (++2 x3 x2))) (len (zip z (++2 x2 x3))))))
(assert-claim
  (forall ((z sk) (x2 list2) (x3 sk) (x4 list2))
    (= (len (zip x2 (cons2 z x4))) (len (zip x2 (cons2 x3 x4))))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (zip z (++2 (rev2 z) y)) (zip z (rev2 z)))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (zip (++2 z y) (rev2 z)) (zip z (rev2 z)))))
(assert-claim
  (forall ((z list2) (x2 sk))
    (= (rev (zip z (cons2 x2 nil2))) (zip z (cons2 x2 nil2)))))
(assert-claim
  (forall ((z sk) (x2 list2))
    (= (rev (zip (cons2 z nil2) x2)) (zip (cons2 z nil2) x2))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (zip x2 (++2 z (++2 x2 y))) (zip x2 (++2 z x2)))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (zip (++2 y z) (++2 y x2)) (++ (zip y y) (zip z x2)))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (zip (++2 z (++2 x2 y)) x2) (zip (++2 z x2) x2))))
(assert-claim
  (forall ((z sk) (x2 sk) (x3 list2) (x4 list2))
    (= (zip (cons2 z x3) (cons2 x2 x4))
      (cons (pair2 z x2) (zip x3 x4)))))
(assert-claim
  (forall ((z list) (x2 list2) (x3 list2))
    (= (len (++ z (zip x2 (rev2 x3)))) (len (++ z (zip x2 x3))))))
(assert-claim
  (forall ((z list) (x2 list2) (x3 list2))
    (= (len (++ z (zip (rev2 x2) x3))) (len (++ z (zip x2 x3))))))
(assert-claim
  (forall ((z list2) (x2 list2) (x3 list2))
    (= (len (zip z (++2 x2 (rev2 x3)))) (len (zip z (++2 x2 x3))))))
(assert-claim
  (forall ((z list2) (x2 sk))
    (= (zip (++2 z z) (cons2 x2 nil2)) (zip z (cons2 x2 nil2)))))
(assert-claim
  (forall ((z sk) (x2 list2))
    (= (zip (cons2 z nil2) (++2 x2 x2)) (zip (cons2 z nil2) x2))))
