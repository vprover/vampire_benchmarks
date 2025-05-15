import sys

import argparse

from utils import parse, ast_to_string

def indent(s_arr,n):
  res = []
  for s in s_arr:
    res.append(''.join([' ' for i in range(n)]) + s)
  return res

def format_formula(f):
  if isinstance(f, str):
    return ast_to_string(f)
  res = []
  res.append('(' + ast_to_string(f[0]))
  match f[0]:
    case 'forall':
      res[-1] += ' ' + f[1]
      res += indent(format_formula(f[2]),2)
    case 'and':
      for sf in f[1:]:
        res += indent(format_formula(sf),2)
    case 'or':
      for sf in f[1:]:
        res += indent(format_formula(sf),2)
    case 'match':
      res[-1] += ' ' + ast_to_string(f[1])
      first = True
      for sf in f[2]:
        if first:
          first = False
          first_f = format_formula(sf)
          res.append('  (' + first_f[0])
          for fsf in first_f[1:]:
            res += indent(fsf,3)
        else:
          res += indent(format_formula(sf),3)
      res[-1] += ')'
    case _:
      return [ ast_to_string(f) ]
  res[-1] += ')'
  return res

def main(i, o):
  s = open(i).read()
  # print(s)
  ast = parse(s)
  # print(ast)

  output = []
  for l in ast:
    # print(l)
    match l[0]:
      case "assert-synth":
        output.append('(' + l[0])
        output.append('  ' + ast_to_string(l[1]))
        output.append('  ' + ast_to_string(l[2]))
        output += indent(format_formula(l[3]),2)
        output[-1] += ')'
      case "assert":
        sr = format_formula(l[1])
        output.append('(' + l[0] + sr[0])
        for sl in sr[1:]:
          output.append('  ' + sl)
      case "define-fun-rec":
        output.append('(' + l[0] + ' ' + ast_to_string(l[1]) + ' ' + ast_to_string(l[2]) + ' ' + ast_to_string(l[3]))
        output += indent(format_formula(l[4]),2)
        output[-1] += ')'
        output.append('') # empty line after
      case _:
        output.append(ast_to_string(l))

  # f = open(o, "w")
  for l in output:
    print(l)
    # f.write(l)

if __name__ == '__main__':
  parser = argparse.ArgumentParser(description='SMT2 to SyGuS converter')
  parser.add_argument("-i", type=str, help="Input file")
  parser.add_argument("-o", type=str, help="Output file")
  args = parser.parse_args()
  main(args.i, args.o)