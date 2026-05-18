
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
  (=> 
    (and
      ; lim{x -> a}(f1 x) = l1
      (forall ((epsilon Real)) (=> (< 0 epsilon) 
        (exists ( (delta Real) ) (and (< 0 delta) 
          (forall ((x Real)) (=> (and ; (1) & (2) ==> (3) 
      
                                        ; (1)  x != a 
                                        (not (= x a))               
      
                                        ; (2) | x - a | < delta
                                        (< (absolute (- x a)) delta)
      
                                   ) ; =================================
      
                                        ; (3) | f(x) - l | < epsilon
                                        (< (absolute (- (f1 x) l1)) epsilon)
          ))
        ))
      ))
    
      ; lim{x -> a}(f2 x) = l2
      (forall ((epsilon Real)) (=> (< 0 epsilon) 
        (exists ( (delta Real) ) (and (< 0 delta) 
          (forall ((x Real)) (=> (and ; (1) & (2) ==> (3) 
      
                                        ; (1)  x != a 
                                        (not (= x a))               
      
                                        ; (2) | x - a | < delta
                                        (< (absolute (- x a)) delta)
      
                                   ) ; =================================
      
                                        ; (3) | f(x) - l | < epsilon
                                        (< (absolute (- (f2 x) l2)) epsilon)
          ))
        ))
      ))
    
    )
  
    ; lim{x -> a}(* (f1 x) (f2 x)) = (* l1 l2)
    (forall ((epsilon Real)) (=> (< 0 epsilon) 
      (exists ( (delta Real) ) (and (< 0 delta) 
        (forall ((x Real)) (=> (and ; (1) & (2) ==> (3) 
    
                                      ; (1)  x != a 
                                      (not (= x a))               
    
                                      ; (2) | x - a | < delta
                                      (< (absolute (- x a)) delta)
    
                                 ) ; =================================
    
                                      ; (3) | f(x) - l | < epsilon
                                      (< (absolute (- (* (f1 x) (f2 x)) (* l1 l2))) epsilon)
        ))
      ))
    ))
  )

))
(check-sat)
