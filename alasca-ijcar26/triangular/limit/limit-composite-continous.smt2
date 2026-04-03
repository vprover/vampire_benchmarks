
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
(declare-fun g (Real) Real)
(declare-const a Real)
(assert (not
  (=> 
    (and
      ; \x.(f x) continous at (g a)
      ; lim{x -> (g a)}(f x) = (f (g a))
      (forall ((epsilon Real)) (=> (< 0 epsilon) 
        (exists ( (delta Real) ) (and (< 0 delta) 
          (forall ((x Real)) (=> (and ; (1) & (2) ==> (3) 
      
                                        ; (1)  x != a 
                                        (not (= x (g a)))               
      
                                        ; (2) | x - a | < delta
                                        (< (absolute (- x (g a))) delta)
      
                                   ) ; =================================
      
                                        ; (3) | f(x) - l | < epsilon
                                        (< (absolute (- (f x) (f (g a)))) epsilon)
          ))
        ))
      ))
    
      ; \x.(g x) continous at a
      ; lim{x -> a}(g x) = (g a)
      (forall ((epsilon Real)) (=> (< 0 epsilon) 
        (exists ( (delta Real) ) (and (< 0 delta) 
          (forall ((x Real)) (=> (and ; (1) & (2) ==> (3) 
      
                                        ; (1)  x != a 
                                        (not (= x a))               
      
                                        ; (2) | x - a | < delta
                                        (< (absolute (- x a)) delta)
      
                                   ) ; =================================
      
                                        ; (3) | f(x) - l | < epsilon
                                        (< (absolute (- (g x) (g a))) epsilon)
          ))
        ))
      ))
    
    )
  
    ; lim{x -> a}(f (g x)) = (f (g a))
    (forall ((epsilon Real)) (=> (< 0 epsilon) 
      (exists ( (delta Real) ) (and (< 0 delta) 
        (forall ((x Real)) (=> (and ; (1) & (2) ==> (3) 
    
                                      ; (1)  x != a 
                                      (not (= x a))               
    
                                      ; (2) | x - a | < delta
                                      (< (absolute (- x a)) delta)
    
                                 ) ; =================================
    
                                      ; (3) | f(x) - l | < epsilon
                                      (< (absolute (- (f (g x)) (f (g a)))) epsilon)
        ))
      ))
    ))
  )

))
(check-sat)
