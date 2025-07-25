(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype list ((nil) (cons (head list2) (tail list))))
(declare-fun lam (fun1) fun13)
(declare-fun lam2 (sk) fun13)
(declare-fun lam3 (sk) fun13)
(declare-const lam4 fun13)
(declare-const lam5 fun13)
(declare-fun lam6 (list2) fun13)
(declare-fun lam7 (list2) fun13)
(declare-fun lam8 (list2) fun13)
(declare-fun lam9 (list2) fun13)
(declare-fun lam10 (list2) fun13)
(declare-fun lam11 (fun1) fun13)
(declare-fun lam12 (fun1) fun13)
(declare-fun lam13 (list2 list2) fun13)
(declare-fun lam14 (list2) fun13)
(declare-fun lam15 (list2) fun13)
(declare-fun lam16 (list2) fun13)
(declare-fun lam17 (list2) fun13)
(declare-fun lam18 (list2 list2) fun13)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) list2)
(declare-fun apply13 (fun13 list2) list2)
(define-fun-rec
  weird_concat
  ((x list)) list2
  (match x
    ((nil nil2)
     ((cons y xss)
      (match y
        ((nil2 (weird_concat xss))
         ((cons2 z xs) (cons2 z (weird_concat (cons xs xss))))))))))
(define-fun-rec
  map4
  ((f fun1) (x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (cons2 (apply1 f y) (map4 f xs))))))
(define-fun-rec
  map3
  ((f fun12) (x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y xs) (cons (apply12 f y) (map3 f xs))))))
(define-fun-rec
  map2
  ((f fun13) (x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (cons (apply13 f y) (map2 f xs))))))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  >>=
  ((x list) (y fun13)) list2
  (match x
    ((nil nil2)
     ((cons z xs) (++2 (apply13 y z) (>>= xs y))))))
(define-fun-rec
  >>=2
  ((x list2) (y fun12)) list2
  (match x
    ((nil2 nil2)
     ((cons2 z xs) (++2 (apply12 y z) (>>=2 xs y))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert
  (forall ((z fun1) (x3 list2))
    (= (apply13 (lam z) x3) (map4 z x3))))
(assert
  (forall ((y sk) (x2 list2))
    (= (apply13 (lam2 y) x2) (++2 (cons2 y nil2) x2))))
(assert
  (forall ((y sk) (x2 list2))
    (= (apply13 (lam3 y) x2) (cons2 y x2))))
(assert (forall ((z list2)) (= (apply13 lam4 z) (++2 nil2 z))))
(assert (forall ((z list2)) (= (apply13 lam5 z) (++2 nil2 z))))
(assert
  (forall ((y list2) (x2 list2))
    (= (apply13 (lam6 y) x2) (++2 y x2))))
(assert
  (forall ((z list2) (x2 list2))
    (= (apply13 (lam7 z) x2) (++2 z x2))))
(assert
  (forall ((z list2) (x3 list2))
    (= (apply13 (lam8 z) x3) (++2 z x3))))
(assert
  (forall ((y list2) (x2 list2))
    (= (apply13 (lam9 y) x2) (++2 y x2))))
(assert
  (forall ((y list2) (x3 list2))
    (= (apply13 (lam10 y) x3) (++2 y x3))))
(assert
  (forall ((z fun1) (x3 list2))
    (= (apply13 (lam11 z) x3) (map4 z x3))))
(assert
  (forall ((z fun1) (x4 list2))
    (= (apply13 (lam12 z) x4) (map4 z x4))))
(assert
  (forall ((y list2) (x2 list2) (x3 list2))
    (= (apply13 (lam13 y x2) x3) (++2 (++2 x2 y) x3))))
(assert
  (forall ((y list2) (x4 list2))
    (= (apply13 (lam14 y) x4) (++2 y x4))))
(assert
  (forall ((x2 list2) (x5 list2))
    (= (apply13 (lam15 x2) x5) (++2 x2 x5))))
(assert
  (forall ((y list2) (z list2) (x5 list2))
    (= (apply13 (lam18 y z) x5) (++2 (++2 y z) x5))))
(assert
  (forall ((y list2) (x3 list2))
    (= (apply13 (lam16 y) x3) (++2 y x3))))
(assert
  (forall ((z list2) (x4 list2))
    (= (apply13 (lam17 z) x4) (++2 z x4))))
(assert-not
  (forall ((f fun12) (xs list2))
    (= (weird_concat (map3 f xs)) (>>=2 xs f))))
(assert-claim (= (weird_concat nil) nil2))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((z fun12)) (= (>>=2 nil2 z) nil2)))
(assert-claim (forall ((z fun1)) (= (map4 z nil2) nil2)))
(assert-claim
  (forall ((y list2) (z list))
    (= (weird_concat (cons y z)) (++2 y (weird_concat z)))))
(assert-claim
  (forall ((z list2) (x2 fun12))
    (= (weird_concat (map3 x2 z)) (>>=2 z x2))))
(assert-claim
  (forall ((z fun1) (x2 list))
    (= (>>= x2 (lam z)) (map4 z (weird_concat x2)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (apply13 (lam2 y) z) (apply13 (lam3 y) z))))
(assert-claim
  (forall ((y list)) (= (>>= y lam4) (weird_concat y))))
(assert-claim (forall ((y list)) (= (map2 lam5 y) y)))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((y list) (z list))
    (= (++2 (weird_concat y) (weird_concat z))
      (weird_concat (++ y z)))))
(assert-claim
  (forall ((z fun12) (x2 sk))
    (= (>>=2 (cons2 x2 nil2) z) (apply12 z x2))))
(assert-claim
  (forall ((z fun1) (x2 sk))
    (= (map4 z (cons2 x2 nil2)) (cons2 (apply1 z x2) nil2))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (>>= (cons z nil) (lam6 y)) (++2 y z))))
(assert-claim
  (forall ((y list) (z list2))
    (= (++2 z (>>= y (lam7 z))) (>>= (cons nil2 y) (lam8 z)))))
(assert-claim
  (forall ((y list2) (z list))
    (= (cons y (map2 (lam9 y) z)) (map2 (lam10 y) (cons nil2 z)))))
(assert-claim
  (forall ((z fun1) (x2 list))
    (= (map2 (lam11 z) (cons nil2 x2))
      (cons nil2 (map2 (lam12 z) x2)))))
(assert-claim
  (forall ((z sk) (x2 list2) (x3 fun12))
    (= (++2 (apply12 x3 z) (>>=2 x2 x3)) (>>=2 (cons2 z x2) x3))))
(assert-claim
  (forall ((z fun1) (x2 sk) (x3 list2))
    (= (cons2 (apply1 z x2) (map4 z x3)) (map4 z (cons2 x2 x3)))))
(assert-claim
  (forall ((z list2) (x2 list2) (x3 fun12))
    (= (++2 (>>=2 z x3) (>>=2 x2 x3)) (>>=2 (++2 z x2) x3))))
(assert-claim
  (forall ((z fun1) (x2 list2) (x3 list2))
    (= (++2 (map4 z x2) (map4 z x3)) (map4 z (++2 x2 x3)))))
(assert-claim
  (forall ((y list2) (z list) (x2 list2))
    (= (>>= z (lam13 y x2)) (>>= (map2 (lam14 y) z) (lam15 x2)))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list))
    (= (map2 (lam16 y) (map2 (lam17 z) x2)) (map2 (lam18 y z) x2))))
