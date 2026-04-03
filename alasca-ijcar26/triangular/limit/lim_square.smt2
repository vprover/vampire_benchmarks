
(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
(declare-fun absolute (Real) Real)

(assert (forall ((x Real)) 
            (=> (< x 0) 
                (= (absolute x) (- x))
            )))
(assert (forall ((x Real)) 
            (=> (>= x 0) 
                (= (absolute x) x)
            )))

(declare-fun f1 (Real) Real)
(declare-fun f2 (Real) Real)
(declare-const l1 Real)
(declare-const l2 Real)
(declare-const a Real)
(assert (not
  ; lim{x -> a}(* x x) = (* a a)
  (forall ((epsilon Real)) (=> (< 0 epsilon) 
    (exists ( (delta Real) ) (and (< 0 delta) 
      (forall ((x Real)) (=> (and ; (1) & (2) ==> (3) 
  
                                    ; (1)  x != a 
                                    (not (= x a))               
  
                                    ; (2) | x - a | < delta
                                    (< (absolute (- x a)) delta)
  
                               ) ; =================================
  
                                    ; (3) | f(x) - l | < epsilon
                                    (< (absolute (- (* x x) (* a a))) epsilon)
      ))
    ))
  ))

))
(check-sat)
