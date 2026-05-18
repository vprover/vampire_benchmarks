
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

(declare-fun f (Real) Real)
(declare-const l Real)
(declare-const a Real)
(assert (not
  (=> 
    (and
      ; lim{x -> a}(f x) = l
      (forall ((epsilon Real)) (=> (< 0 epsilon) 
        (exists ( (delta Real) ) (and (< 0 delta) 
          (forall ((x Real)) (=> (and ; (1) & (2) ==> (3) 
      
                                        ; (1)  x != a 
                                        (not (= x a))               
      
                                        ; (2) | x - a | < delta
                                        (< (absolute (- x a)) delta)
      
                                   ) ; =================================
      
                                        ; (3) | f(x) - l | < epsilon
                                        (< (absolute (- (f x) l)) epsilon)
          ))
        ))
      ))
    
      (not (= 0 l))
    
    )
  
    ; lim{x -> a}(/ 1 (f x)) = (/ 1 l)
    (forall ((epsilon Real)) (=> (< 0 epsilon) 
      (exists ( (delta Real) ) (and (< 0 delta) 
        (forall ((x Real)) (=> (and ; (1) & (2) ==> (3) 
    
                                      ; (1)  x != a 
                                      (not (= x a))               
    
                                      ; (2) | x - a | < delta
                                      (< (absolute (- x a)) delta)
    
                                 ) ; =================================
    
                                      ; (3) | f(x) - l | < epsilon
                                      (< (absolute (- (/ 1 (f x)) (/ 1 l))) epsilon)
        ))
      ))
    ))
  )

))
(check-sat)
