(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T))
  (f4 (proj0f4 T)))))
(assert (exists ((y10149 T) (y10148 T) (y10158 T) (y10159 T) (y10153 T) (y10150 T) (y10151 T) (y10156 T) (y10157 T) (y10155 T) (y10174 T) (y10164 T) (y10163 T) (y10162 T) (y10176 T) (y10160 T) (y10167 T) (y10166 T) (y10172 T) (y10173 T) (y10170 T) (y10168 T) (y10171 T)) (forall ((x10178 T) (x10177 T) (x10186 T) (x10179 T) (x10185 T) (x10182 T) (x10184 T) (x10180 T) (x10181 T)) 
  (or 
    (and (= y10148 (f4 y10149)) (= y10149 (f3 y10150 (f3 x10185 x10185))) (= y10150 (f1 y10151)) (= y10151 (f4 x10179)) (= x10179 (f1 y10148))) 
    (and (= y10153 x10186) (= x10178 (f3 y10153 x10185))) 
    (and (= y10155 (f3 y10156 (f2 (f3 (f3 x10185 x10185) (f2 x10185))))) (= y10156 (f3 y10157 (f1 x10185))) (= y10157 (f2 y10158)) (= y10158 (f2 y10159)) (= y10159 (f2 y10155))) 
    (and (= y10160 (f1 x10184)) (= x10184 (f4 y10160))) (= y10162 x10181) 
    (and (= y10163 (f3 y10164 (f1 (f4 (f2 x10185))))) (= y10164 (f1 x10180)) (= x10180 (f3 y10166 x10185)) (= y10166 (f4 y10167)) (= y10167 (f3 y10163 x10185))) 
    (and (= y10168 (f3 x10182 x10185)) (= x10182 (f3 y10168 x10185))) 
    (and (= y10170 (f1 y10171)) (= y10171 (f2 y10170))) 
    (and (= y10172 (f3 y10173 (f2 (f3 x10185 x10185)))) (= y10173 (f2 y10174)) (= y10174 (f2 x10177)) (= x10177 (f4 y10176)) (= y10176 (f1 y10172)))))))
(check-sat)
