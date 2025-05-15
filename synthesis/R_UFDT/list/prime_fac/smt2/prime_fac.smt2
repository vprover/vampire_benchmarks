(set-logic UFDT)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat
  (match y ((zero zero)
           ((s y0) (add (mult x y0) x)))))


(define-fun leq ((x nat) (y nat)) Bool
  (exists ((k nat))(= (add x k) y))
)

(define-fun-rec inlst ((x nat) (y lst)) Bool
  (match y ((nil false)
            ((cons y0 y1) (or (= x y0) (inlst x y1))))))

(define-fun-rec sorted ((x lst)) Bool
(match x ((nil true)
           ((cons x0 x1) (match x1 ((nil true)
                                    ((cons x2 x3) (and (leq x0 x2) (sorted (cons x2 x3))))))))))

(define-fun-rec prod ((x lst)) nat
(match x ((nil (s zero))
           ((cons x0 x1) (mult x0 (prod x1))))))

(define-fun divides ((x nat) (y nat)) Bool
  (and (distinct x zero) (exists ((k nat)) (= (mult k x) y)))
)

(define-fun prime ((n nat)) Bool
  (and (and (distinct n zero) (distinct n (s zero)) (forall ((m nat)) (=> (divides m n) (or (= m (s zero)) (= m n))))))
)

;SPECIFICATION
(assert-synth ((x nat)) ((l lst)) (and (and (sorted l) (= x (prod l))) (forall ((n nat)) (=> (inlst n l) (prime n)))))



