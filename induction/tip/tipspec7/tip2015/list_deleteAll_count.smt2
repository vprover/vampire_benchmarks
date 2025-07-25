(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-fun lam (sk) fun13)
(declare-const lam2 fun12)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) fun13)
(declare-fun apply13 (fun13 sk) Bool)
(define-fun-rec
  deleteBy
  ((x fun12) (y sk) (z list)) list
  (match z
    ((nil nil)
     ((cons y2 ys)
      (ite (apply13 (apply12 x y) y2) ys (cons y2 (deleteBy x y ys)))))))
(define-fun-rec
  deleteAll
  ((x sk) (y list)) list
  (match y
    ((nil nil)
     ((cons z ys)
      (ite (= x z) (deleteAll x ys) (cons z (deleteAll x ys)))))))
(define-fun-rec
  count
  ((x sk) (y list)) Int
  (match y
    ((nil 0)
     ((cons z ys) (ite (= x z) (+ 1 (count x ys)) (count x ys))))))
(assert (forall ((y sk)) (= (apply12 lam2 y) (lam y))))
(assert (forall ((y sk) (z sk)) (= (apply13 (lam y) z) (= y z))))
(assert-not
  (forall ((x sk) (xs list))
    (=> (= (deleteAll x xs) (deleteBy lam2 x xs))
      (<= (count x xs) 1))))
(assert-claim (forall ((y sk)) (= (count y nil) 0)))
(assert-claim (forall ((y sk)) (= (deleteAll y nil) nil)))
(assert-claim
  (forall ((y fun12) (z sk)) (= (deleteBy y z nil) nil)))
(assert-claim
  (forall ((y sk) (z list)) (= (count y (deleteAll y z)) 0)))
(assert-claim
  (forall ((y sk) (z list))
    (= (deleteAll y (cons y z)) (deleteAll y z))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (= (deleteAll z (deleteAll y x2)) (deleteAll y (deleteAll z x2)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (deleteAll y (deleteAll y z)) (deleteAll y z))))
(assert-claim
  (forall ((y sk) (z list))
    (= (+ 1 (count y z)) (count y (cons y z)))))
(assert-claim (forall ((y sk) (z list)) (<= 0 (count y z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y nil)) (count y (cons z nil)))))
(assert-claim
  (forall ((y list) (z sk) (x2 sk))
    (= (count z (cons x2 (deleteAll z y))) (count z (cons x2 nil)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (= (deleteAll y (cons z (cons y x2))) (deleteAll y (cons z x2)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (= (deleteAll y (cons z (deleteAll y x2)))
      (deleteAll y (cons z x2)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list))
    (= (count y (cons x2 (cons z x3)))
      (count y (cons z (cons x2 x3))))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y (cons y nil)))
      (count y (cons z (cons z nil))))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk))
    (= (count x2 (deleteAll z (cons y nil)))
      (count y (deleteAll z (cons x2 nil))))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count y (deleteAll z (cons y nil)))
      (count z (deleteAll y (cons z nil))))))
(assert-claim
  (forall ((y sk) (z sk)) (<= (count y (cons z nil)) 1)))
