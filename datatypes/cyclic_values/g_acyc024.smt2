(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y2514 T) (y2515 T) (y2516 T) (y2517 T) (y2510 T) (y2511 T) (y2512 T) (y2513 T) (y2509 T) (y2508 T) (y2503 T) (y2502 T) (y2501 T) (y2500 T) (y2507 T) (y2506 T) (y2505 T) (y2504 T) (y2499 T) (y2498 T) (y2495 T) (y2497 T) (y2496 T)) 
  (or 
    (and (= y2495 (f1 y2496)) (= y2496 (f1 y2497)) (= y2497 (f1 y2495))) 
    (and (= y2498 (f1 y2499)) (= y2499 (f1 y2500)) (= y2500 (f1 y2501)) (= y2501 (f1 y2498))) 
    (and (= y2502 (f1 y2503)) (= y2503 (f1 y2504)) (= y2504 (f1 y2502))) 
    (and (= y2505 (f1 (f1 (f1 (f1 y2506))))) (= y2506 (f1 y2505))) 
    (and (= y2507 (f1 y2508)) (= y2508 (f1 y2509)) (= y2509 (f1 y2507))) (= y2510 (f1 (f1 (f1 (f1 (f1 y2510)))))) 
    (and (= y2511 (f1 y2512)) (= y2512 (f1 y2511))) 
    (and (= y2513 (f1 y2514)) (= y2514 (f1 y2515)) (= y2515 (f1 y2513))) 
    (and (= y2516 (f1 y2517)) (= y2517 (f1 y2516))))))
(check-sat)
