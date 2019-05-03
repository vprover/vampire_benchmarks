(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T)))))
(assert (exists ((y573 T) (y580 T) (y577 T) (y576 T) (y575 T) (y574 T) (y579 T) (y578 T)) 
  (or 
    (and (= y573 (f1 y574)) (= y574 (f1 y575)) (= y575 (f2 y573))) 
    (and (= y576 (f2 y577)) (= y577 (f2 y578)) (= y578 (f2 y576))) 
    (and (= y579 (f2 (f2 (f1 (f2 y580))))) (= y580 (f2 y579))))))
(check-sat)
