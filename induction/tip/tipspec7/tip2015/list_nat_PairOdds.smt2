(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype list ((nil) (cons (head pair) (tail list))))
(declare-const lam fun12)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 pair) sk)
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
(assert
  (forall ((x pair))
    (= (apply12 lam x) (match x (((pair2 y z) z))))))
(assert-not
  (forall ((xs list2)) (= (map2 lam (pairs xs)) (odds2 xs))))
(assert-claim (= (pairs nil2) nil))
(assert-claim (= (evens2 nil2) nil2))
(assert-claim (= (odds2 nil2) nil2))
(assert-claim (forall ((z fun1)) (= (map3 z nil2) nil2)))
(assert-claim
  (forall ((y sk) (z list2))
    (= (evens2 (cons2 y z)) (cons2 y (odds2 z)))))
(assert-claim
  (forall ((z fun1) (x2 list2))
    (= (map3 z (evens2 x2)) (evens2 (map3 z x2)))))
(assert-claim
  (forall ((y sk) (z list2)) (= (odds2 (cons2 y z)) (evens2 z))))
(assert-claim
  (forall ((z fun1) (x2 list2))
    (= (odds2 (map3 z x2)) (map3 z (odds2 x2)))))
(assert-claim (forall ((y sk)) (= (pairs (cons2 y nil2)) nil)))
(assert-claim
  (forall ((z fun1) (x2 sk))
    (= (map3 z (cons2 x2 nil2)) (cons2 (apply1 z x2) nil2))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list2))
    (= (odds (pairs (cons2 y x2))) (odds (pairs (cons2 z x2))))))
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
  (forall ((y sk) (z sk) (x2 list2))
    (= (pairs (cons2 y (cons2 z x2))) (cons (pair2 y z) (pairs x2)))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (evens2 (odds2 (odds2 y)))))
      (evens2 (evens2 (odds2 (odds2 y)))))))
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
    (= (evens (evens (evens (pairs (odds2 y)))))
      (evens (evens (pairs (odds2 y)))))))
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
    (= (odds2 (evens2 (evens2 (odds2 (odds2 y))))) nil2)))
(assert-claim
  (forall ((z fun1) (x2 sk) (x3 list2))
    (= (cons2 (apply1 z x2) (map3 z x3)) (map3 z (cons2 x2 x3)))))
