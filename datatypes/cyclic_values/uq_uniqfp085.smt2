(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y9201 T) (y9200 T) (y9203 T) (y9202 T) (y9205 T) (y9204 T) (y9206 T) (y9173 T) (y9172 T) (y9171 T) (y9170 T) (y9177 T) (y9176 T) (y9175 T) (y9174 T) (y9179 T) (y9159 T) (y9182 T) (y9183 T) (y9180 T) (y9181 T) (y9186 T) (y9187 T) (y9184 T) (y9185 T) (y9188 T) (y9189 T) (y9168 T) (y9169 T) (y9164 T) (y9166 T) (y9167 T) (y9161 T) (y9162 T) (y9190 T) (y9193 T) (y9192 T) (y9195 T) (y9194 T) (y9196 T) (y9199 T) (y9198 T)) (forall ((x9213 T) (x9212 T) (x9210 T) (x9208 T) (x9216 T) (x9215 T) (x9214 T) (x9207 T)) 
  (or 
    (and (= y9159 (f1 (f2 (f2 y9159 x9212 x9212 x9212) x9212 (f1 x9212 x9212 x9212 x9212) x9212) x9212 y9161 (f2 x9212 x9212 x9212 x9212))) (= y9161 (f3 y9162 y9159 (f1 x9212 x9212 x9212 x9212))) (= y9162 (f2 y9159 x9212 x9212 x9212)) (= x9208 (f1 (f2 (f2 x9208 x9212 x9212 x9212) x9212 (f1 x9212 x9212 x9212 x9212) x9212) x9212 x9215 (f2 x9212 x9212 x9212 x9212))) (= x9215 (f3 y9164 x9208 (f1 x9212 x9212 x9212 x9212))) (= y9164 (f2 x9208 x9212 x9212 x9212)) (distinct y9159 x9208)) 
    (and (= x9207 (f3 y9167 (f3 (f1 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212)) (f2 x9212 x9212 x9212 x9212))) (= y9167 (f2 y9168 x9212 x9212 x9212)) (= y9168 (f1 x9207 x9212 x9212 x9212)) (= y9166 (f3 y9169 (f3 (f1 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212)) (f2 x9212 x9212 x9212 x9212))) (= y9169 (f2 y9170 x9212 x9212 x9212)) (= y9170 (f1 y9166 x9212 x9212 x9212)) (distinct x9207 y9166)) 
    (and (= y9171 (f1 (f1 y9173 (f2 (f3 x9212 x9212 x9212) x9212 x9212 x9212) (f2 (f3 x9212 x9212 x9212) (f3 x9212 x9212 x9212) (f3 x9212 x9212 x9212) (f3 x9212 x9212 x9212)) (f1 x9212 x9212 x9212 x9212)) (f1 x9212 x9212 x9212 x9212) (f1 (f2 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212) x9212 (f3 x9212 x9212 x9212)) (f2 x9212 x9212 x9212 x9212))) (= y9173 (f2 (f3 y9171 x9212 x9212) y9174 (f3 x9212 x9212 x9212) x9212)) (= y9174 (f3 y9171 x9212 x9212)) (= y9172 (f1 y9175 (f1 x9212 x9212 x9212 x9212) (f1 (f2 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212) x9212 (f3 x9212 x9212 x9212)) (f2 x9212 x9212 x9212 x9212))) (= y9175 (f1 y9176 (f2 (f3 x9212 x9212 x9212) x9212 x9212 x9212) (f2 (f3 x9212 x9212 x9212) (f3 x9212 x9212 x9212) (f3 x9212 x9212 x9212) (f3 x9212 x9212 x9212)) (f1 x9212 x9212 x9212 x9212))) (= y9176 (f2 (f3 y9172 x9212 x9212) y9177 (f3 x9212 x9212 x9212) x9212)) (= y9177 (f3 y9172 x9212 x9212)) (distinct y9171 y9172)) 
    (and (= x9216 x9213) (= y9180 (f3 x9216 x9212 x9212)) (= y9179 (f3 y9181 y9179 (f3 x9212 x9212 x9212))) (= y9181 (f3 y9179 x9212 x9212)) (distinct x9216 y9179)) 
    (and (= y9182 (f3 y9184 y9182 (f2 x9212 x9212 x9212 x9212))) (= y9184 (f2 y9185 x9212 (f2 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212))) (= y9185 (f3 y9182 x9212 x9212)) (= y9183 (f3 y9186 y9183 (f2 x9212 x9212 x9212 x9212))) (= y9186 (f2 y9187 x9212 (f2 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212))) (= y9187 (f3 y9183 x9212 x9212)) (distinct y9182 y9183)) 
    (and (= y9188 (f1 (f3 y9190 (f1 x9212 x9212 x9212 (f2 x9212 x9212 x9212 x9212)) (f3 x9212 x9212 (f3 x9212 x9212 x9212))) (f3 y9188 x9212 x9212) (f1 (f1 x9212 x9212 (f2 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212)) (f1 (f3 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212) x9212 (f2 x9212 x9212 x9212 x9212)) (f3 x9212 x9212 x9212) (f1 (f2 x9212 x9212 x9212 x9212) x9212 (f1 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212))) x9212)) (= y9190 (f3 y9188 x9210 x9212)) (= x9210 (f1 y9188 x9212 x9212 x9212)) (= y9189 (f1 y9192 (f3 y9189 x9212 x9212) (f1 (f1 x9212 x9212 (f2 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212)) (f1 (f3 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212) x9212 (f2 x9212 x9212 x9212 x9212)) (f3 x9212 x9212 x9212) (f1 (f2 x9212 x9212 x9212 x9212) x9212 (f1 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212))) x9212)) (= y9192 (f3 y9193 (f1 x9212 x9212 x9212 (f2 x9212 x9212 x9212 x9212)) (f3 x9212 x9212 (f3 x9212 x9212 x9212)))) (= y9193 (f3 y9189 y9194 x9212)) (= y9194 (f1 y9189 x9212 x9212 x9212)) (distinct y9188 y9189)) 
    (and (= y9195 (f1 x9214 (f3 y9195 x9212 x9212) (f2 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212))) (= x9214 (f2 (f1 y9195 x9212 x9212 x9212) y9198 (f2 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212))) (= y9198 (f1 y9195 x9212 x9212 x9212)) (= y9196 (f1 (f2 (f1 y9196 x9212 x9212 x9212) (f1 y9196 x9212 x9212 x9212) (f2 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212)) (f3 y9196 x9212 x9212) (f2 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212))) (distinct y9195 y9196)) 
    (and (= y9199 (f1 y9201 (f3 (f3 (f1 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212) (f3 x9212 x9212 x9212)) x9212 (f1 (f2 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212))) (f3 x9212 (f3 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212)) (f1 (f1 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212) x9212 (f1 x9212 x9212 x9212 x9212)))) (= y9201 (f3 (f1 (f2 y9199 x9212 x9212 x9212) (f3 x9212 x9212 x9212) x9212 (f1 x9212 x9212 x9212 x9212)) y9202 (f3 x9212 (f3 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212)))) (= y9202 (f1 y9203 (f3 x9212 x9212 x9212) x9212 x9212)) (= y9203 (f3 y9199 x9212 x9212)) (= y9200 (f1 y9204 (f3 (f3 (f1 x9212 x9212 x9212 x9212) (f3 x9212 x9212 x9212) (f3 x9212 x9212 x9212)) x9212 (f1 (f2 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212))) (f3 x9212 (f3 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212)) (f1 (f1 x9212 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212) x9212 (f1 x9212 x9212 x9212 x9212)))) (= y9204 (f3 (f1 (f2 y9200 x9212 x9212 x9212) (f3 x9212 x9212 x9212) x9212 (f1 x9212 x9212 x9212 x9212)) y9205 (f3 x9212 (f3 x9212 x9212 x9212) (f1 x9212 x9212 x9212 x9212)))) (= y9205 (f1 y9206 (f3 x9212 x9212 x9212) x9212 x9212)) (= y9206 (f3 y9200 x9212 x9212)) (distinct y9199 y9200))))))
(check-sat)