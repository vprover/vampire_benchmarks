# Synthesis (recursive)

For each benchmark, you will find the options used to execute Vampire, and the produced refutation:

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

* Addition of two natural numbers 
    ```
    $ ./bin/vampire_z3_rel_static_synthesis-recursive_7028 --induction struct --question_answering synthesis --induction_unit_only off ../benchmarks/addition.smt2 
    % Running in auto input_syntax mode. Trying SMTLIB2
    % Refutation found. Thanks to Tanya!
    % SZS status Unsatisfiable for addition
    % SZS answers Tuple [[rec3(X0,s(sK5),X1)]|_] for addition
    % SZS output start Proof for addition
    1. ! [X0 : 'Nat()'] : s2(X0,zero) = X0 [input]
    2. ! [X1 : 'Nat()',X0 : 'Nat()'] : s(s2(X0,X1)) = s2(X0,s(X1)) [input]
    3. ! [X1 : 'Nat()',X0 : 'Nat()'] : ? [X2 : 'Nat()'] : s2(X0,X1) = X2 [input]
    4. ~! [X1 : 'Nat()',X0 : 'Nat()'] : ? [X2 : 'Nat()'] : s2(X0,X1) = X2 [negated conjecture 3]
    8. ! [X2 : 'Nat()'] : ~(s2(sK2_in,sK1_in) = X2 & ans0(X2)) [answer literal with input var skolemisation 4]
    9. ! [X0 : 'Nat()'] : ~(s2(sK2_in,sK1_in) = X0 & ans0(X0)) [rectify 8]
    10. ! [X0 : 'Nat()',X1 : 'Nat()'] : s(s2(X1,X0)) = s2(X1,s(X0)) [rectify 2]
    11. ! [X0 : 'Nat()'] : (s2(sK2_in,sK1_in) != X0 | ~ans0(X0)) [ennf transformation 9]
    12. s2(sK2_in,sK1_in) != X0 | ~ans0(X0) [cnf transformation 11]
    13. s(s2(X1,X0)) = s2(X1,s(X0)) [cnf transformation 10]
    14. s2(X0,zero) = X0 [cnf transformation 1]
    16. ? [X2 : 'Nat()'] : ? [X3 : 'Nat()'] : ! [X4 : 'Nat()',X1 : 'Nat()'] : ! [X5 : 'Nat()'] : ((s2(sK2_in,zero) = X1 & (s2(sK2_in,X2) = X3 => s2(sK2_in,s(X2)) = X4)) => rec3(X1,X4,X5) = s2(sK2_in,X5)) [structural induction hypothesis]
    17. ? [X2 : 'Nat()'] : ? [X3 : 'Nat()'] : ! [X4 : 'Nat()',X1 : 'Nat()'] : ! [X5 : 'Nat()'] : (rec3(X1,X4,X5) = s2(sK2_in,X5) | (s2(sK2_in,zero) != X1 | (s2(sK2_in,s(X2)) != X4 & s2(sK2_in,X2) = X3))) [ennf transformation 16]
    18. sK5 = s2(sK2_in,sK4) | s2(sK2_in,zero) != X1 | rec3(X1,X4,X5) = s2(sK2_in,X5) [cnf transformation 17]
    19. s2(sK2_in,s(sK4)) != X4 | s2(sK2_in,zero) != X1 | rec3(X1,X4,X5) = s2(sK2_in,X5) [cnf transformation 17]
    20. s2(sK2_in,s(sK4)) != X1 | s2(sK2_in,zero) != X0 | ~ans0(rec3(X0,X1,sK1_in)) [resolution 19,12]
    21. sK5 = s2(sK2_in,sK4) | s2(sK2_in,zero) != X0 | ~ans0(rec3(X0,X1,sK1_in)) [resolution 18,12]
    28. sK2_in != X0 | sK5 = s2(sK2_in,sK4) | ~ans0(rec3(X0,X1,sK1_in)) [forward demodulation 21,14]
    29. s(s2(sK2_in,sK4)) != X1 | s2(sK2_in,zero) != X0 | ~ans0(rec3(X0,X1,sK1_in)) [forward demodulation 20,13]
    30. s(s2(sK2_in,sK4)) != X1 | sK2_in != X0 | ~ans0(rec3(X0,X1,sK1_in)) [forward demodulation 29,14]
    60. sK5 = s2(sK2_in,sK4) | ~ans0(rec3(sK2_in,X0,sK1_in)) [equality resolution 28]
    93. s(sK5) != X0 | sK2_in != sK2_in | ~ans0(rec3(sK2_in,X0,sK1_in)) [superposition 30,60]
    96. s(sK5) != X0 | ~ans0(rec3(sK2_in,X0,sK1_in)) [trivial inequality removal 93]
    107. ~ans0(rec3(sK2_in,s(sK5),sK1_in)) [equality resolution 96]
    108. ans0(X0) [answer literal]
    109. $false [unit resulting resolution 108,107]
    % SZS output end Proof for addition
    % ------------------------------
    % Version: Vampire 4.8 (commit 6a2544246 on 2023-12-02 00:34:45 +0100)
    % Linked with Z3 4.12.2.0 e417f7d78509b2d0c9ebc911fee7632e6ef546b6 z3-4.8.4-7517-ge417f7d78
    % Termination reason: Refutation

    % Memory used [KB]: 428
    % Time elapsed: 0.059 s
    % ------------------------------
    % ------------------------------

    ```

* Associativity in natural numbers:
    ```
        $ ./bin/vampire_z3_rel_static_synthesis-recursive_7041 --induction struct --question_answering synthesis --induction_unit_only off ../benchmarks/nat_assoc.smt2 
    % Running in auto input_syntax mode. Trying SMTLIB2
    % Refutation found. Thanks to Tanya!
    % SZS status Unsatisfiable for nat_assoc
    % SZS answers Tuple [[rec13(sK15,plus(X1,X2),X0)]|_] for nat_assoc
    % SZS output start Proof for nat_assoc
    1. ! [X0 : 'nat()'] : plus(zero,X0) = X0 [input]
    2. ! [X1 : 'nat()',X0 : 'nat()'] : succ(plus(X0,X1)) = plus(succ(X0),X1) [input]
    3. ! [X1 : 'nat()',X0 : 'nat()',X2 : 'nat()'] : ? [X3 : 'nat()'] : plus(X0,X3) = plus(plus(X0,X1),X2) [input]
    4. ~! [X1 : 'nat()',X0 : 'nat()',X2 : 'nat()'] : ? [X3 : 'nat()'] : plus(X0,X3) = plus(plus(X0,X1),X2) [negated conjecture 3]
    8. ! [X3 : 'nat()'] : ~(plus(sK2_in,X3) = plus(plus(sK2_in,sK1_in),sK3_in) & ans0(X3)) [answer literal with input var skolemisation 4]
    9. ! [X0 : 'nat()'] : ~(plus(plus(sK2_in,sK1_in),sK3_in) = plus(sK2_in,X0) & ans0(X0)) [rectify 8]
    10. ! [X0 : 'nat()',X1 : 'nat()'] : succ(plus(X1,X0)) = plus(succ(X1),X0) [rectify 2]
    11. ! [X0 : 'nat()'] : (plus(plus(sK2_in,sK1_in),sK3_in) != plus(sK2_in,X0) | ~ans0(X0)) [ennf transformation 9]
    12. plus(plus(sK2_in,sK1_in),sK3_in) != plus(sK2_in,X0) | ~ans0(X0) [cnf transformation 11]
    13. succ(plus(X1,X0)) = plus(succ(X1),X0) [cnf transformation 10]
    14. plus(zero,X0) = X0 [cnf transformation 1]
    42. ? [X1 : 'nat()'] : ? [X2 : 'nat()'] : ! [X4 : 'nat()',X3 : 'nat()'] : ! [X5 : 'nat()'] : (((plus(plus(X1,sK1_in),sK3_in) = plus(X1,X2) => plus(plus(succ(X1),sK1_in),sK3_in) = plus(succ(X1),X3)) & ($true => plus(plus(zero,sK1_in),sK3_in) = plus(zero,X4))) => plus(plus(X5,sK1_in),sK3_in) = plus(X5,rec13(X3,X4,X5))) [structural induction hypothesis]
    43. ? [X1 : 'nat()'] : ? [X2 : 'nat()'] : ! [X4 : 'nat()',X3 : 'nat()'] : ! [X5 : 'nat()'] : (plus(plus(X5,sK1_in),sK3_in) = plus(X5,rec13(X3,X4,X5)) | ((plus(plus(succ(X1),sK1_in),sK3_in) != plus(succ(X1),X3) & plus(plus(X1,sK1_in),sK3_in) = plus(X1,X2)) | (plus(plus(zero,sK1_in),sK3_in) != plus(zero,X4) & $true))) [ennf transformation 42]
    44. plus(plus(zero,sK1_in),sK3_in) != plus(zero,X4) | plus(plus(sK14,sK1_in),sK3_in) = plus(sK14,sK15) | plus(plus(X5,sK1_in),sK3_in) = plus(X5,rec13(X3,X4,X5)) [cnf transformation 43]
    45. plus(plus(zero,sK1_in),sK3_in) != plus(zero,X4) | plus(plus(succ(sK14),sK1_in),sK3_in) != plus(succ(sK14),X3) | plus(plus(X5,sK1_in),sK3_in) = plus(X5,rec13(X3,X4,X5)) [cnf transformation 43]
    46. plus(plus(zero,sK1_in),sK3_in) != plus(zero,X1) | plus(plus(succ(sK14),sK1_in),sK3_in) != plus(succ(sK14),X0) | ~ans0(rec13(X0,X1,sK2_in)) [resolution 45,12]
    47. plus(plus(zero,sK1_in),sK3_in) != plus(zero,X1) | plus(plus(sK14,sK1_in),sK3_in) = plus(sK14,sK15) | ~ans0(rec13(X0,X1,sK2_in)) [resolution 44,12]
    48. plus(plus(zero,sK1_in),sK3_in) != X1 | plus(plus(sK14,sK1_in),sK3_in) = plus(sK14,sK15) | ~ans0(rec13(X0,X1,sK2_in)) [forward demodulation 47,14]
    49. plus(sK1_in,sK3_in) != X1 | plus(plus(sK14,sK1_in),sK3_in) = plus(sK14,sK15) | ~ans0(rec13(X0,X1,sK2_in)) [forward demodulation 48,14]
    50. plus(plus(zero,sK1_in),sK3_in) != X1 | plus(plus(succ(sK14),sK1_in),sK3_in) != plus(succ(sK14),X0) | ~ans0(rec13(X0,X1,sK2_in)) [forward demodulation 46,14]
    51. plus(sK1_in,sK3_in) != X1 | plus(plus(succ(sK14),sK1_in),sK3_in) != plus(succ(sK14),X0) | ~ans0(rec13(X0,X1,sK2_in)) [forward demodulation 50,14]
    52. plus(plus(succ(sK14),sK1_in),sK3_in) != succ(plus(sK14,X0)) | plus(sK1_in,sK3_in) != X1 | ~ans0(rec13(X0,X1,sK2_in)) [forward demodulation 51,13]
    53. succ(plus(sK14,X0)) != plus(succ(plus(sK14,sK1_in)),sK3_in) | plus(sK1_in,sK3_in) != X1 | ~ans0(rec13(X0,X1,sK2_in)) [forward demodulation 52,13]
    54. succ(plus(sK14,X0)) != succ(plus(plus(sK14,sK1_in),sK3_in)) | plus(sK1_in,sK3_in) != X1 | ~ans0(rec13(X0,X1,sK2_in)) [forward demodulation 53,13]
    82. plus(plus(sK14,sK1_in),sK3_in) = plus(sK14,sK15) | ~ans0(rec13(X0,plus(sK1_in,sK3_in),sK2_in)) [equality resolution 49]
    519. succ(plus(sK14,X0)) != succ(plus(sK14,sK15)) | plus(sK1_in,sK3_in) != plus(sK1_in,sK3_in) | ~ans0(rec13(X0,plus(sK1_in,sK3_in),sK2_in)) [superposition 54,82]
    532. succ(plus(sK14,X0)) != succ(plus(sK14,sK15)) | ~ans0(rec13(X0,plus(sK1_in,sK3_in),sK2_in)) [trivial inequality removal 519]
    533. plus(sK14,sK15) != plus(sK14,X0) | ~ans0(rec13(X0,plus(sK1_in,sK3_in),sK2_in)) [term algebras injectivity 532]
    536. ~ans0(rec13(sK15,plus(sK1_in,sK3_in),sK2_in)) [equality resolution 533]
    537. ans0(X0) [answer literal]
    538. $false [unit resulting resolution 537,536]
    % SZS output end Proof for nat_assoc
    % ------------------------------
    % Version: Vampire 4.8 (commit 972db973f on 2023-12-09 16:49:58 +0100)
    % Linked with Z3 4.12.2.0 e417f7d78509b2d0c9ebc911fee7632e6ef546b6 z3-4.8.4-7517-ge417f7d78
    % Termination reason: Refutation

    % Memory used [KB]: 830
    % Time elapsed: 0.117 s
    % ------------------------------
    % ------------------------------
    ```

* size of a binary tree:

    ```
    $ ./bin/vampire_z3_rel_static_synthesis-recursive_7053 --induction struct --question_answering synthesis --induction_unit_only off ../benchmarks/bt-size.smt2
    % Running in auto input_syntax mode. Trying SMTLIB2
    % Refutation found. Thanks to Tanya!
    % SZS status Unsatisfiable for bt-size
    % SZS answers Tuple [[rec2(zero,s(s2(sK7,sK6)),X0)]|_] for bt-size
    % SZS output start Proof for bt-size
    3. zero = size('Nil') [input]
    4. ! [X2 : 'nat()',X1 : 'tree()',X0 : 'tree()'] : s(s2(size(X0),size(X1))) = size(node(X0,X2,X1)) [input]
    5. ! [X0 : 'tree()'] : ? [X1 : 'nat()'] : size(X0) = X1 [input]
    6. ~! [X0 : 'tree()'] : ? [X1 : 'nat()'] : size(X0) = X1 [negated conjecture 5]
    15. ! [X1 : 'nat()'] : ~(size(sK1_in) = X1 & ans0(X1)) [answer literal with input var skolemisation 6]
    16. ! [X0 : 'nat()'] : ~(size(sK1_in) = X0 & ans0(X0)) [rectify 15]
    17. ! [X0 : 'nat()',X1 : 'tree()',X2 : 'tree()'] : s(s2(size(X2),size(X1))) = size(node(X2,X0,X1)) [rectify 4]
    19. ! [X0 : 'nat()'] : (size(sK1_in) != X0 | ~ans0(X0)) [ennf transformation 16]
    20. size(sK1_in) != X0 | ~ans0(X0) [cnf transformation 19]
    21. s(s2(size(X2),size(X1))) = size(node(X2,X0,X1)) [cnf transformation 17]
    22. zero = size('Nil') [cnf transformation 3]
    26. ? [X5 : 'tree()',X4 : 'nat()',X2 : 'tree()'] : ? [X6 : 'nat()',X3 : 'nat()'] : ! [X7 : 'nat()',X1 : 'nat()'] : ! [X8 : 'tree()'] : ((size('Nil') = X1 & ((size(X2) = X3 & size(X5) = X6) => size(node(X2,X4,X5)) = X7)) => rec2(X1,X7,X8) = size(X8)) [structural induction hypothesis]
    27. ? [X5 : 'tree()',X4 : 'nat()',X2 : 'tree()'] : ? [X6 : 'nat()',X3 : 'nat()'] : ! [X7 : 'nat()',X1 : 'nat()'] : ! [X8 : 'tree()'] : (rec2(X1,X7,X8) = size(X8) | (size('Nil') != X1 | (size(node(X2,X4,X5)) != X7 & (size(X2) = X3 & size(X5) = X6)))) [ennf transformation 26]
    28. sK6 = size(sK3) | size('Nil') != X1 | rec2(X1,X7,X8) = size(X8) [cnf transformation 27]
    29. sK7 = size(sK5) | size('Nil') != X1 | rec2(X1,X7,X8) = size(X8) [cnf transformation 27]
    30. size(node(sK5,sK4,sK3)) != X7 | size('Nil') != X1 | rec2(X1,X7,X8) = size(X8) [cnf transformation 27]
    31. size(node(sK5,sK4,sK3)) != X1 | size('Nil') != X0 | ~ans0(rec2(X0,X1,sK1_in)) [resolution 30,20]
    32. sK7 = size(sK5) | size('Nil') != X0 | ~ans0(rec2(X0,X1,sK1_in)) [resolution 29,20]
    33. sK6 = size(sK3) | size('Nil') != X0 | ~ans0(rec2(X0,X1,sK1_in)) [resolution 28,20]
    34. zero != X0 | sK6 = size(sK3) | ~ans0(rec2(X0,X1,sK1_in)) [forward demodulation 33,22]
    35. zero != X0 | sK7 = size(sK5) | ~ans0(rec2(X0,X1,sK1_in)) [forward demodulation 32,22]
    36. size(node(sK5,sK4,sK3)) != X1 | zero != X0 | ~ans0(rec2(X0,X1,sK1_in)) [forward demodulation 31,22]
    217. sK6 = size(sK3) | ~ans0(rec2(zero,X0,sK1_in)) [equality resolution 34]
    218. sK7 = size(sK5) | ~ans0(rec2(zero,X0,sK1_in)) [equality resolution 35]
    222. size(node(X0,X1,sK3)) = s(s2(size(X0),sK6)) | ~ans0(rec2(zero,X2,sK1_in)) [superposition 21,217]
    120657. s(s2(size(sK5),sK6)) != X0 | zero != zero | ~ans0(rec2(zero,X0,sK1_in)) [superposition 36,222]
    120952. s(s2(size(sK5),sK6)) != X0 | ~ans0(rec2(zero,X0,sK1_in)) [trivial inequality removal 120657]
    589983. s(s2(sK7,sK6)) != X0 | ~ans0(rec2(zero,X0,sK1_in)) [superposition 120952,218]
    590074. ~ans0(rec2(zero,s(s2(sK7,sK6)),sK1_in)) [equality resolution 589983]
    590075. ans0(X0) [answer literal]
    590076. $false [unit resulting resolution 590075,590074]
    % SZS output end Proof for bt-size
    % ------------------------------
    % Version: Vampire 4.8 (commit 7ca158189 on 2023-12-15 16:22:43 +0100)
    % Linked with Z3 4.12.2.0 e417f7d78509b2d0c9ebc911fee7632e6ef546b6 z3-4.8.4-7517-ge417f7d78
    % Termination reason: Refutation

    % Memory used [KB]: 146672
    % Time elapsed: 12.745 s
    % ------------------------------
    % ------------------------------
    ```