(set-logic UFDT)

; TYPES OF NATURAL NUMBERS AND LISTS
(declare-datatypes ((nat 0) (lst 0)) (((s (s0 nat)) (zero)) ((nil) (cons (cons0 nat) (cons1 lst)))))

(declare-fun app (lst lst) lst)
(declare-fun len (lst) nat)
(declare-fun suff (lst lst) Bool)
(declare-fun inlst (nat lst) Bool)

;; LIST AXIOMS
; A1
(assert (forall ((x lst)) (= x (app x nil))))
; A2
(assert (forall ((x lst) (l lst) (n nat)) (= (app (cons n l) x) (cons n (app l x)))))
; A3
(assert (= (len nil) zero))
; A4
(assert (forall ((l lst) (n nat)) (= (len (cons n l)) (s (len l)))))
; A5
(assert (forall ((l lst)) (suff nil l)))
; A6
(assert (forall ((l lst) (n nat)) (not (suff (cons n l) nil))))
; A7
(assert (forall ((l1 lst) (l2 lst) (n nat)) (=> (suff l2 l1) (suff l2 (cons n l1)))))
; A8
(assert (forall ((l1 lst) (l2 lst) (n nat)) (=> (suff (cons n l2) l1) (suff l2 l1))))
; A10
(assert (forall ((x nat)) (not (inlst x nil))))
; A11
(assert (forall ((l lst) (n nat) (k nat)) (= (inlst n (cons k l)) (or (inlst n l) (= n k)))))

;; LIST LEMMAS
; L1
(assert (forall ((x lst)) (= (app nil x) x)))
; L2
(assert (forall ((l1 lst) (l2 lst) (n nat)) (=> (suff (cons n l2) l1) (suff l2 l1))))
; L3
(assert (forall ((x lst) (y lst) (z lst) (n nat)) (=> (and (= x (app y z)) (suff (cons n z) x)) (suff (cons n nil) y))))
; L4
(assert (forall ((x lst) (y lst) (n nat)) (=> (suff (cons n x) y) (not (= x y)))))
; L5
(assert (forall ((x lst) (y lst) (z lst)) (=> (and (= x (app y z)) (not (= x z))) (not (= y nil)))))
; L6
(assert (forall ((x lst) (y lst) (z lst)) (=> (= x y) (= (app x z) (app y z)))))

; ENCODING OF THE SPECIFICATION USING A FRESH UNCOMPUTABLE PREDICATE p
(declare-fun p (lst lst lst) Bool)
(assert (forall ((l1 lst) (l2 lst) (k lst)) (= (p l1 l2 k) (=> (suff l2 l1) (= l1 (app k l2))))))

(assert-not (forall ((l1 lst) (l2 lst)) (exists ((k lst)) (p l1 l2 k))))

(set-option :uncomputable (p))

(check-sat)
