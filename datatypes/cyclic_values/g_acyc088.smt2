(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (exists ((y9322 T) (y9323 T) (y9320 T) (y9321 T) (y9326 T) (y9327 T) (y9324 T) (y9325 T) (y9328 T) (y9329 T) (y9333 T) (y9332 T) (y9330 T) (y9336 T) (y9337 T) (y9335 T) (y9334 T) (y9331 T)) 
  (or (= y9320 (f1 y9320 y9320 PLACEHOLDER PLACEHOLDER)) 
    (and (= y9321 (f2 y9322 (f1 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER) (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER)))) (= y9322 (f1 y9323 (f2 (f2 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER))) (= y9323 (f3 y9324 (f3 PLACEHOLDER PLACEHOLDER))) (= y9324 (f1 y9321 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y9325 (f1 (f1 (f2 y9326 (f1 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER))) (f2 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER)) (f1 (f3 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f3 PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (f2 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER)) (f3 (f2 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER))) (f3 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER))) (f3 y9325 PLACEHOLDER) PLACEHOLDER)) (= y9326 (f1 y9327 (f3 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER))) (= y9327 (f1 y9325 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y9328 (f1 (f2 (f1 y9329 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f2 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER))) PLACEHOLDER (f1 (f2 (f3 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f2 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER))))) (= y9329 (f1 y9328 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y9330 (f1 (f1 y9331 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER PLACEHOLDER)) (= y9331 (f1 y9330 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y9332 (f2 y9333 (f2 PLACEHOLDER PLACEHOLDER))) (= y9333 (f1 y9332 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y9334 (f3 (f2 y9334 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y9335 (f1 (f1 (f3 (f3 (f2 y9335 PLACEHOLDER) PLACEHOLDER) PLACEHOLDER) (f3 y9336 PLACEHOLDER) PLACEHOLDER (f1 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f2 (f1 (f2 y9335 PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER) (f2 (f3 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER)) (f2 (f3 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f3 PLACEHOLDER PLACEHOLDER))) (= y9336 (f2 y9337 PLACEHOLDER)) (= y9337 (f3 y9335 PLACEHOLDER))))))
(check-sat)
