# Synthesis (recursive)

* Half:
    ```
    $ ./bin/vampire_z3_rel_static_synthesis-recursive_7003 --induction struct ../benchmarks/half.smt2 --question_answering synthesis --induction_unit_only off
    % Running in auto input_syntax mode. Trying SMTLIB2
    % Refutation found. Thanks to Tanya!
    % SZS status Unsatisfiable for half
    % SZS answers Tuple [[rec4(s(zero),s(s(sK6)),X0)]|_] for half
    % SZS output start Proof for half
    1. half(X0) = $match(X0,zero,zero,s(X1),$match(X1,zero,zero,s(X2),s(half(X2)))) [input]
    2. ! [X0 : 'nat()'] : ? [X1 : 'nat()'] : half(X1) = X0 [input]
    3. ~! [X0 : 'nat()'] : ? [X1 : 'nat()'] : half(X1) = X0 [negated conjecture 2]
    9. ! [X2 : 'nat()',X1 : 'nat()',X0 : 'nat()'] : half(X0) = $match(X0,zero,zero,s(X1),$match(X1,zero,zero,s(X2),s(half(X2)))) [closure 1]
    10. ! [X2 : 'nat()',X1 : 'nat()',X0 : 'nat()'] : (zero = X0 => zero = mG0(X2,X1,X0)) [fool match definition]
    11. ! [X2 : 'nat()',X1 : 'nat()'] : (zero = X1 => zero = mG1(X2,X1)) [fool match definition]
    12. ! [X2 : 'nat()',X1 : 'nat()'] : (s(X2) = X1 => s(half(X2)) = mG1(X2,X1)) [fool match definition]
    13. ! [X2 : 'nat()',X1 : 'nat()',X0 : 'nat()'] : (s(X1) = X0 => mG0(X2,X1,X0) = mG1(X2,X1)) [fool match definition]
    14. ! [X2 : 'nat()',X1 : 'nat()',X0 : 'nat()'] : half(X0) = mG0(X2,X1,X0) [fool elimination 9,13,12,11,10]
    15. ! [X1 : 'nat()'] : ~(half(X1) = sK3_in & ans2(X1)) [answer literal with input var skolemisation 3]
    16. ! [X0 : 'nat()',X1 : 'nat()',X2 : 'nat()'] : (s(X1) = X2 => mG0(X0,X1,X2) = mG1(X0,X1)) [rectify 13]
    17. ! [X0 : 'nat()',X1 : 'nat()'] : (s(X0) = X1 => mG1(X0,X1) = s(half(X0))) [rectify 12]
    18. ! [X0 : 'nat()',X1 : 'nat()'] : (zero = X1 => zero = mG1(X0,X1)) [rectify 11]
    20. ! [X0 : 'nat()'] : ~(half(X0) = sK3_in & ans2(X0)) [rectify 15]
    21. ! [X0 : 'nat()',X1 : 'nat()',X2 : 'nat()'] : half(X2) = mG0(X0,X1,X2) [rectify 14]
    22. ! [X0 : 'nat()',X1 : 'nat()',X2 : 'nat()'] : (mG0(X0,X1,X2) = mG1(X0,X1) | s(X1) != X2) [ennf transformation 16]
    23. ! [X0 : 'nat()',X1 : 'nat()'] : (mG1(X0,X1) = s(half(X0)) | s(X0) != X1) [ennf transformation 17]
    24. ! [X0 : 'nat()',X1 : 'nat()'] : (zero = mG1(X0,X1) | zero != X1) [ennf transformation 18]
    26. ! [X0 : 'nat()'] : (half(X0) != sK3_in | ~ans2(X0)) [ennf transformation 20]
    27. mG0(X0,X1,X2) = mG1(X0,X1) | s(X1) != X2 [cnf transformation 22]
    28. s(X0) != X1 | mG1(X0,X1) = s(half(X0)) [cnf transformation 23]
    29. zero != X1 | zero = mG1(X0,X1) [cnf transformation 24]
    31. half(X0) != sK3_in | ~ans2(X0) [cnf transformation 26]
    32. half(X2) = mG0(X0,X1,X2) [cnf transformation 21]
    33. s(X1) != X2 | half(X2) = mG1(X0,X1) [definition unfolding 27,32]
    35. ? [X2 : 'nat()'] : ? [X3 : 'nat()'] : ! [X4 : 'nat()',X1 : 'nat()'] : ! [X5 : 'nat()'] : ((zero = half(X1) & (half(X3) = X2 => s(X2) = half(X4))) => half(rec4(X1,X4,X5)) = X5) [structural induction hypothesis]
    36. ? [X2 : 'nat()'] : ? [X3 : 'nat()'] : ! [X4 : 'nat()',X1 : 'nat()'] : ! [X5 : 'nat()'] : (half(rec4(X1,X4,X5)) = X5 | (zero != half(X1) | (s(X2) != half(X4) & half(X3) = X2))) [ennf transformation 35]
    37. sK5 = half(sK6) | zero != half(X1) | half(rec4(X1,X4,X5)) = X5 [cnf transformation 36]
    38. half(X4) != s(sK5) | zero != half(X1) | half(rec4(X1,X4,X5)) = X5 [cnf transformation 36]
    39. half(X1) != s(sK5) | zero != half(X0) | ~ans2(rec4(X0,X1,sK3_in)) [resolution 38,31]
    40. zero != half(X0) | sK5 = half(sK6) | ~ans2(rec4(X0,X1,sK3_in)) [resolution 37,31]
    65. zero = mG1(X0,zero) [equality resolution 29]
    68. half(s(X0)) = mG1(X1,X0) [equality resolution 33]
    71. s(half(X0)) = mG1(X0,s(X0)) [equality resolution 28]
    73. zero = half(s(zero)) [superposition 68,65]
    79. s(half(X0)) = half(s(s(X0))) [superposition 71,68]
    153. zero != zero | sK5 = half(sK6) | ~ans2(rec4(s(zero),X0,sK3_in)) [superposition 40,73]
    157. sK5 = half(sK6) | ~ans2(rec4(s(zero),X0,sK3_in)) [trivial inequality removal 153]
    173. s(half(X0)) != s(sK5) | zero != half(X1) | ~ans2(rec4(X1,s(s(X0)),sK3_in)) [superposition 39,79]
    1356. s(sK5) != s(sK5) | zero != half(s(zero)) | ~ans2(rec4(s(zero),s(s(sK6)),sK3_in)) [superposition 173,157]
    1373. zero != half(s(zero)) | ~ans2(rec4(s(zero),s(s(sK6)),sK3_in)) [trivial inequality removal 1356]
    1378. ~ans2(rec4(s(zero),s(s(sK6)),sK3_in)) [subsumption resolution 1373,73]
    1379. ans2(X0) [answer literal]
    1380. $false [unit resulting resolution 1379,1378]
    % SZS output end Proof for half
    % ------------------------------
    % Version: Vampire 4.8 (commit 57b4e0e21 on 2023-11-30 16:35:28 +0100)
    % Linked with Z3 4.12.2.0 e417f7d78509b2d0c9ebc911fee7632e6ef546b6 z3-4.8.4-7517-ge417f7d78
    % Termination reason: Refutation

    % Memory used [KB]: 622
    % Time elapsed: 0.137 s
    % ------------------------------
    % ------------------------------

    ```

* Len of concat of two lists:
    ```
    $./bin/vampire_z3_rel_static_synthesis-recursive_7023 --induction struct --question_answering synthesis --induction_unit_only off --equality_resolution_with_deletion off ../benchmarks/list-lenapp.smt2 
    % Running in auto input_syntax mode. Trying SMTLIB2
    % Refutation found. Thanks to Tanya!
    % SZS status Unsatisfiable for list-lenapp
    % SZS answers Tuple [[rec131(len(X1),s(sK134),X0)]|_] for list-lenapp
    % SZS output start Proof for list-lenapp
    1. ! [X0 : 'nat()',X2 : 'lst()',X1 : 'lst()'] : cons(X0,app(X1,X2)) = app(cons(X0,X1),X2) [input]
    2. ! [X0 : 'nat()',X1 : 'lst()'] : s(len(X1)) = len(cons(X0,X1)) [input]
    3. ! [X0 : 'lst()'] : len(X0) = len(app(nil,X0)) [input]
    4. ! [X1 : 'lst()',X0 : 'lst()'] : ? [X2 : 'nat()'] : len(app(X0,X1)) = X2 [input]
    5. ~! [X1 : 'lst()',X0 : 'lst()'] : ? [X2 : 'nat()'] : len(app(X0,X1)) = X2 [negated conjecture 4]
    13. ! [X2 : 'nat()'] : ~(len(app(sK2_in,sK1_in)) = X2 & ans0(X2)) [answer literal with input var skolemisation 5]
    14. ! [X0 : 'nat()'] : ~(len(app(sK2_in,sK1_in)) = X0 & ans0(X0)) [rectify 13]
    15. ! [X0 : 'nat()',X1 : 'lst()',X2 : 'lst()'] : cons(X0,app(X2,X1)) = app(cons(X0,X2),X1) [rectify 1]
    16. ! [X0 : 'nat()'] : (len(app(sK2_in,sK1_in)) != X0 | ~ans0(X0)) [ennf transformation 14]
    17. len(app(sK2_in,sK1_in)) != X0 | ~ans0(X0) [cnf transformation 16]
    18. len(X0) = len(app(nil,X0)) [cnf transformation 3]
    19. s(len(X1)) = len(cons(X0,X1)) [cnf transformation 2]
    20. cons(X0,app(X2,X1)) = app(cons(X0,X2),X1) [cnf transformation 15]
    31458. ? [X3 : 'lst()',X2 : 'nat()'] : ? [X4 : 'nat()'] : ! [X5 : 'nat()',X1 : 'nat()'] : ! [X6 : 'lst()'] : ((len(app(nil,sK1_in)) = X1 & (len(app(X3,sK1_in)) = X4 => len(app(cons(X2,X3),sK1_in)) = X5)) => len(app(X6,sK1_in)) = rec131(X1,X5,X6)) [structural induction hypothesis]
    31459. ? [X3 : 'lst()',X2 : 'nat()'] : ? [X4 : 'nat()'] : ! [X5 : 'nat()',X1 : 'nat()'] : ! [X6 : 'lst()'] : (len(app(X6,sK1_in)) = rec131(X1,X5,X6) | (len(app(nil,sK1_in)) != X1 | (len(app(cons(X2,X3),sK1_in)) != X5 & len(app(X3,sK1_in)) = X4))) [ennf transformation 31458]
    31460. sK134 = len(app(sK132,sK1_in)) | len(app(nil,sK1_in)) != X1 | len(app(X6,sK1_in)) = rec131(X1,X5,X6) [cnf transformation 31459]
    31461. len(app(cons(sK133,sK132),sK1_in)) != X5 | len(app(nil,sK1_in)) != X1 | len(app(X6,sK1_in)) = rec131(X1,X5,X6) [cnf transformation 31459]
    31462. len(app(cons(sK133,sK132),sK1_in)) != X1 | len(app(nil,sK1_in)) != X0 | ~ans0(rec131(X0,X1,sK2_in)) [resolution 31461,17]
    31463. sK134 = len(app(sK132,sK1_in)) | len(app(nil,sK1_in)) != X0 | ~ans0(rec131(X0,X1,sK2_in)) [resolution 31460,17]
    31468. len(sK1_in) != X0 | sK134 = len(app(sK132,sK1_in)) | ~ans0(rec131(X0,X1,sK2_in)) [forward demodulation 31463,18]
    31469. len(cons(sK133,app(sK132,sK1_in))) != X1 | len(app(nil,sK1_in)) != X0 | ~ans0(rec131(X0,X1,sK2_in)) [forward demodulation 31462,20]
    31470. s(len(app(sK132,sK1_in))) != X1 | len(app(nil,sK1_in)) != X0 | ~ans0(rec131(X0,X1,sK2_in)) [forward demodulation 31469,19]
    31471. s(len(app(sK132,sK1_in))) != X1 | len(sK1_in) != X0 | ~ans0(rec131(X0,X1,sK2_in)) [forward demodulation 31470,18]
    31472. sK134 = len(app(sK132,sK1_in)) | ~ans0(rec131(len(sK1_in),X0,sK2_in)) [equality resolution 31468]
    31706. s(sK134) != X0 | len(sK1_in) != len(sK1_in) | ~ans0(rec131(len(sK1_in),X0,sK2_in)) [superposition 31471,31472]
    31967. s(sK134) != X0 | ~ans0(rec131(len(sK1_in),X0,sK2_in)) [trivial inequality removal 31706]
    32300. ~ans0(rec131(len(sK1_in),s(sK134),sK2_in)) [equality resolution 31967]
    32301. ans0(X0) [answer literal]
    32302. $false [unit resulting resolution 32301,32300]
    % SZS output end Proof for list-lenapp
    % ------------------------------
    % Version: Vampire 4.8 (commit 57b4e0e21 on 2023-11-30 16:35:28 +0100)
    % Linked with Z3 4.12.2.0 e417f7d78509b2d0c9ebc911fee7632e6ef546b6 z3-4.8.4-7517-ge417f7d78
    % Termination reason: Refutation

    % Memory used [KB]: 9846
    % Time elapsed: 0.968 s
    % ------------------------------
    % ------------------------------

    ```