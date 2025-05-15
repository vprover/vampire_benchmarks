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

(define-fun-rec divides ((x nat) (y nat)) Bool
  (or (= y zero) (and (distinct x zero) (exists ((z nat)) (and (= y (add z x)) (divides x z))))))


;SPECIFICATION
(assert-synth ((x0 nat) (x1 nat)) ((y nat)) (=> (and (and (divides x0 x1) (distinct x0 zero))(distinct x1 zero)) (= x1 (mult y x0))))


