import sys

import argparse

from utils import parse, ast_to_string

def replace_subast(ast, subast, new):
  if ast == subast:
    return new
  if isinstance(ast, str):
    return ast
  res = []
  for e in ast:
    res.append(replace_subast(e, subast, new))
  return res

class SMT2Container:
  higher_order = False
  set_logic = None
  sorts = []
  datatypes = []
  defined_funs = []
  uninterpreted_funs = []
  uncomputable_funs = []
  assertions = []
  synth_funs = []
  constraint = None

  def add_uninterpreted_fun(self, name, args, ret):
    if len(args) > 0:
      self.higher_order = True
      self.uninterpreted_funs.append([name, ["->"] + args + [ret]])
    else:
      self.uninterpreted_funs.append([name, ret])

  def add_assertion(self, ass):
    self.assertions.append(ass)

  def add_defined_fun(self, name, args, ret, body):
    self.add_uninterpreted_fun(name, [sort for _,sort in args], ret)
    self.add_assertion(["assert"] + [["forall"] + [args] + [["=", [name] + [var for var,_ in args], body]]])


def main(i, o):
  s = open(i).read()

  leading_comments = []
  # save leading comments with benchmark info
  while s[0] == ';':
    parts = s.split('\n', 1)
    leading_comments.append(parts[0])
    s = parts[1]

  # print(s)
  ast = parse(s)
  # print(ast)

  sc = SMT2Container()

  for i,l in enumerate(ast):
    # print(l)
    match l[0]:
      case "declare-fun":
        sc.add_uninterpreted_fun(l[1], l[2], l[3])
      case "declare-const":
        sc.add_uninterpreted_fun(l[1], [], l[2])
      case "assert-synth":
        if sc.constraint:
          raise ValueError("There should be only one assert-synth")
        forall = l[1]
        exists = l[2]
        sc.constraint = l[3]
        for var,sort in forall:
          sc.add_uninterpreted_fun(var, [], sort)
        for e in exists:
          sc.synth_funs.append(e)
      case "assert":
        sc.add_assertion(l)
      case "assert-claim":
        sc.add_assertion(l)
      case "set-logic":
        if sc.set_logic:
          raise ValueError("There should be only one set-logic")
        sc.set_logic = l
      case "declare-sort":
        sc.sorts.append(l)
      case "declare-datatype":
        sc.datatypes.append(l)
      case "define-fun":
        sc.defined_funs.append(l)
      case "define-fun-rec":
        sc.defined_funs.append(l)
      case "set-option":
        if l[1] == ":uncomputable":
          sc.uncomputable_funs += l[2]
      case _:
        raise ValueError("unknown command {}".format(l[0]))
  
  if sc.constraint is None:
    raise ValueError("no assert-synth found")
  if sc.set_logic is None:
    raise ValueError("logic is not set")

  computable_funs = [[dvar,sort] for dvar,sort in sc.uninterpreted_funs if dvar not in sc.uncomputable_funs]
  final_defined_funs = []
  for d in sc.defined_funs:
    if d[1] in sc.uncomputable_funs:
      sc.add_defined_fun(d[1], d[2], d[3], d[4])
    else:
      final_defined_funs.append(d)

  # to add extra lines
  LINE_SEP = None

  new_ast = []
  if sc.set_logic:
    if sc.higher_order and not sc.set_logic[1].startswith("HO_"):
      sc.set_logic[1] = "HO_" + sc.set_logic[1]
    new_ast.append(sc.set_logic)
  new_ast.append(["set-feature", ":recursion", "true"])
  new_ast.append(LINE_SEP)

  new_ast += sc.sorts
  new_ast += sc.datatypes
  new_ast.append(LINE_SEP)

  new_ast += [["declare-var"] + e for e in sc.uninterpreted_funs]
  new_ast.append(LINE_SEP)

  for d in final_defined_funs:
    new_ast.append(d)
    new_ast.append(LINE_SEP)

  new_ast += [["assume", e[1]] for e in sc.assertions]
  new_ast.append(LINE_SEP)

  for var,sort in sc.synth_funs:
    fun = 'f' + var
    new_ast.append(["synth-fun", fun, computable_funs, sort])
    appl = [fun] + [dvar for dvar,sort in computable_funs]
    sc.constraint = replace_subast(sc.constraint, var, appl)
  new_ast.append(LINE_SEP)

  new_ast.append(["constraint", sc.constraint])
  new_ast.append(LINE_SEP)
  new_ast += [["check-synth"]]

  f = open(o, "w")
  for comment in leading_comments:
    f.write(comment + '\n')
  for l in new_ast:
    if l is LINE_SEP:
      f.write('\n')
    else:
      # print(ast_to_string(l))
      f.write(ast_to_string(l)+'\n')

if __name__ == '__main__':
  parser = argparse.ArgumentParser(description='SMT2 to SyGuS converter')
  parser.add_argument("-i", type=str, help="Input file")
  parser.add_argument("-o", type=str, help="Output file")
  args = parser.parse_args()
  main(args.i, args.o)