(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec fib ((x nat)) nat
  (match x ((zero (s zero))
            ((s x0) (match x0 ((zero (s zero))
                               ((s x1) (add (fib x1) (fib (s x1))))))))))

; SPECIFICATION
(assert-synth ((x nat)) ((y nat)) (= (fib x) y))

(set-option :uncomputable (fib))

