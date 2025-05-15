(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat
  (match y ((zero zero)
           ((s y0) (add (mult x y0) x)))))

(define-fun less ((x nat) (y nat)) Bool
 (exists ((k nat))(= (add x (s k)) y))
)

(define-fun divides ((x nat) (y nat)) Bool
  (exists ((k nat)) (= (mult k x) y))
)

; encoded definition of gcd
(define-fun gcd ((x0 nat) (x1 nat) (y nat)) Bool
 (forall ((z nat)) (= (and (divides z x0) (divides z x1)) (divides z y)))
)

;SPECIFICATION
(assert-synth ((x0 nat) (x1 nat)) ((y nat)) (=> (and (distinct x0 zero) (distinct x1 zero)) (gcd x0 x1 y)))