# vampire_benchmarks
A repository of benchmarks produced by and used by the Vampire team

Please add new benchmarks in their own directory with a README describing 
- Their source/some context
- What features they are targetting (which options etc)
- The version (commit) of Vampire that they were most recently tested with
- How Vampire should be run on the benchmarks (in particular if it relies on a special mode)

Wherever possible benchmarks should also be commented with expected behaviour. For TPTP and SMT-LIB problems ideally this would be in the form of status information. 

For TPTP one should include a comment at the top of the file of the form
```
% Status   : Unsatisfiable
```
using the SZS ontology for statuses.

For SMT-LIB one should include something like
```
(set-info :status unsat)
```
at the top of the file.

For other usages (e.g. interpolation, question answering) some other comment on expected output (e.g. that some interpolant or answer should be found with a given set of options) will suffice for now.
