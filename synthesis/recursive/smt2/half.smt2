(declare-datatype nat ((zero) (s (s_0 nat))))

(define-fun-rec half ((x nat)) nat
  (match x (
        (zero zero)
        ((s z) 
          (match z (
            (zero zero)
            ((s n) (s (half n)))
            )
          )
        )
    )                       
  )
)

(assert-not (forall ((x nat)) (exists ((y nat)) (= (half y) x))))