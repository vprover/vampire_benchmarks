# Synthesis

The directories `smt2` and `sl` contain examples encoded in an extended SMT-LIB2 syntax and SyGuS 2.1 syntax, respectively.
Examples with filenames starting with `group` are only in `smt2` version, because they cannot be encoded in SyGuS 2.1 syntax (as they use uninterpreted functions).

The times it takes Vampire and cvc5 to solve the examples are in results.tsv (`TMO` means the solver did not solve the problem within a 5 minute time limit).

The `smt2` examples can be solved by Vampire 4.7 (linked with Z3 4.9.1.0), `synthesis` branch, using the following options.
- Group and polynomial examples: `--decode lrs+10_3:1_av=off:ep=off:lcm=reverse:qa=synthesis:sp=reverse_arity:urr=on_300`
- Maximum of N integers: `--decode lrs-2_8:1_add=large:afp=100000:afq=1.4:amm=sco:anc=none:bs=on:bsr=on:cond=fast:ep=off:fsr=off:fde=none:gs=on:gsaa=from_current:gsem=on:ile=on:irw=on:lma=on:nm=64:newcnf=on:nwc=4:nicw=on:proof=off:qa=synthesis:sas=z3:sp=reverse_arity:updr=off_3000`. Within 5 minutes, Vampire is able to synthesize a program finding the maximum of up to 23 variables.

The `sl` examples can be solved by cvc5 1.0.4 using the following options.
- Polynomial examples: we tried running in the default configuration and with `--nl-cov`
- Maximum of N integers: default configuration. Within 5 minutes, cvc5 is also able to synthesize a program finding the maximum of up to 23 variables.


