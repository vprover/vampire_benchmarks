(set-logic UFDT)

; TYPES OF NATURAL NUMBERS AND LISTS
(declare-datatypes ((nat 0) (lst 0)) (((s (s0 nat)) (zero)) ((nil) (cons (cons0 nat) (cons1 lst)))))

(declare-fun app (lst lst) lst)
(declare-fun len (lst) nat)

;; LIST AXIOMS
; A1
(assert (forall ((x lst)) (= x (app x nil))))
; A2
(assert (forall ((x lst) (l lst) (n nat)) (= (app (cons n l) x) (cons n (app l x)))))
; A3
(assert (= (len nil) zero))
; A4
(assert (forall ((l lst) (n nat)) (= (len (cons n l)) (s (len l)))))

;; LIST LEMMAS
; L1
(assert (forall ((x lst)) (= (app nil x) x)))
; L5
(assert (forall ((x lst) (y lst) (z lst)) (=> (and (= x (app y z)) (not (= x z))) (not (= y nil)))))
; L6
(assert (forall ((x lst) (y lst) (z lst)) (=> (= x y) (= (app x z) (app y z)))))

; SPECIFICATION
(assert-not (forall ((x lst) (y lst)) (exists ((z nat)) (= z (len (app x y))))))

(set-option :uncomputable (app))

(check-sat)
