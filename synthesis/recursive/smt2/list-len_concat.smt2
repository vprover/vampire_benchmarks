(set-logic UFDT)

; types of natural numbers and lists
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
(assert (forall ((x lst) (y lst) (z lst)) (=> (= x y) (= (app x z) (app y z)))))
; A4
(assert (= (len nil) zero))
; A5
(assert (forall ((l lst) (n nat)) (= (len (cons n l)) (s (len l)))))


;; LIST LEMMAS
; L1
(assert (forall ((x lst)) (= (app nil x) x)))
; L5
(assert (forall ((x lst) (y lst) (z lst)) (=> (and (= x (app y z)) (not (= x z))) (not (= y nil)))))


; Specification
(assert-not (forall ((x lst) (y lst)) (exists ((z nat)) (= z (len (app x y))))))

(set-option :uncomputable (app))

(check-sat)
