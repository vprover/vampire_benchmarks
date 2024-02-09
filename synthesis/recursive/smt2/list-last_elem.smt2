(set-logic UFDT)

; TYPES OF NATURAL NUMBERS AND LISTS
(declare-datatypes ((nat 0) (lst 0)) (((s (s0 nat)) (zero)) ((nil) (cons (cons0 nat) (cons1 lst)))))

(declare-fun app (lst lst) lst)

;; LIST AXIOMS
; A1
(assert (forall ((x lst)) (= x (app x nil))))
; A2
(assert (forall ((x lst) (l lst) (n nat)) (= (app (cons n l) x) (cons n (app l x)))))

;; LIST LEMMAS
; L1
(assert (forall ((x lst)) (= (app nil x) x)))
; L5
(assert (forall ((x lst) (y lst) (z lst)) (=> (and (= x (app y z)) (not (= x z))) (not (= y nil)))))
; L6
(assert (forall ((x lst) (y lst) (z lst)) (=> (= x y) (= (app x z) (app y z)))))

; ENCODING OF THE SPECIFICATION USING A FRESH UNCOMPUTABLE PREDICATE p
(declare-fun p (lst nat) Bool)
(assert (forall ((l lst) (n nat)) (= (p l n) (exists ((k lst)) (= l (app k (cons n nil)))))))

(assert-not (forall ((l lst)) (exists ((n nat)) (=> (not (= l nil)) (p l n)))))

(set-option :uncomputable (p))

(check-sat)
