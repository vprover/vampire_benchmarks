(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y11191 T) (y11200 T) (y11193 T) (y11202 T) (y11186 T) (y11187 T) (y11184 T) (y11185 T) (y11199 T) (y11198 T) (y11188 T) (y11189 T) (y11203 T) (y11205 T) (y11196 T) (y11197 T) (y11201 T) (y11195 T) (y11194 T)) (forall ((x11209 T) (x11210 T) (x11215 T) (x11213 T) (x11212 T) (x11206 T) (x11214 T)) 
  (or (= x11215 (f3 (f3 (f3 x11215 x11206 x11206) (f2 x11206) (f1 x11206 x11206)) (f3 x11210 (f2 x11206) (f1 x11206 x11206)) x11210)) (= y11184 x11212) 
    (and (= y11185 (f3 (f2 y11186) (f1 x11206 x11206) (f1 (f1 (f1 x11206 x11206) x11210) x11206))) (= y11186 (f3 y11187 x11206 x11210)) (= y11187 (f3 y11188 x11206 x11206)) (= y11188 (f1 y11185 x11206))) 
    (and (= y11189 (f1 x11214 x11206)) (= x11214 (f1 y11191 (f1 x11206 x11206))) (= y11191 (f2 y11189))) 
    (and (= x11209 (f1 y11193 (f2 x11206))) (= y11193 (f1 y11194 x11206)) (= y11194 (f3 x11209 x11209 x11206))) 
    (and (= y11195 (f3 (f2 (f2 (f1 y11196 (f2 x11206)))) x11210 x11206)) (= y11196 (f2 y11195))) 
    (and (= y11197 (f1 y11198 x11206)) (= y11198 (f2 y11197))) 
    (and (= y11199 (f1 y11200 (f1 x11206 (f1 x11206 x11206)))) (= y11200 (f2 y11201)) (= y11201 (f3 y11202 x11210 (f2 x11210))) (= y11202 (f2 y11203)) (= y11203 (f3 y11199 x11206 x11206))) 
    (and (= x11213 (f2 y11205)) (= y11205 (f1 x11213 x11206)))))))
(check-sat)
