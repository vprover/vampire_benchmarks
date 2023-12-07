; synthesis of addition

; theory of natural numbers
(set-logic UFDT)

; type of natural numbers
(declare-datatypes ((Nat 0)) (((zero) (s (s0 Nat)))))

; k-times successor function
(declare-fun s2(Nat Nat) Nat)

; definition of s' (base case)
; s'(x,zero) = x

(assert (forall ((x Nat)) (=(s2 x zero) x)))

; definition of s' (step case)
; s'(x,s(k))=s(s'(x,k))

(assert (forall ((x Nat) (k Nat)) (=(s2 x (s k)) (s (s2 x k)))))


; specification

(assert-not (forall ((x Nat) (y Nat)) (exists ((z Nat)) (= (s2 x y) z))))

; set s' to uncomputable

(set-option :uncomputable (s2))

(check-sat)
