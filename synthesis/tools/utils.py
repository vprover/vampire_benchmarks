
# strip whitespaces and comments
def wstrip(s, i):
  while i < len(s):
    if s[i].isspace():
      i += 1
      continue
    if s[i] == ';':
      # skip until end of string or next line
      while i < len(s):
        i += 1
        if s[i-1] == '\n':
          break
      continue
    break
  return i

def parse_helper(s, i):
  i = wstrip(s, i)
  if s[i] == ')':
    raise ValueError("unmatched right parenthesis")

  # found atom, parse until next whitespace, comment or parenthesis
  if s[i] != '(':
    res = ""
    for j,c in enumerate(s[i:]):
      if c.isspace() or c == ';' or c == '(' or c == ')':
        return [res, i+j]
      res += c
    return [res, len(s)]

  # otherwise parse list elements
  i += 1
  res = []
  while i < len(s):
    # remove whitespace in front
    i = wstrip(s, i)
    # found right parenthesis
    if s[i] == ')':
      return [res,i+1]
    # otherwise next list element
    sr,i = parse_helper(s,i)
    res.append(sr)
  raise ValueError("right parenthesis not found")

def parse(s):
  ast = []
  i = 0
  while i < len(s):
    i = wstrip(s, i)
    if i >= len(s):
      break
    if s[i] == ')':
      raise ValueError("unmatched right parenthesis")
    sr,i = parse_helper(s,i)
    ast.append(sr)
  assert(i == len(s))
  return ast

def ast_to_string(l):
  if isinstance(l, str):
    return l
  s = "("
  for i,e in enumerate(l):
    s += ast_to_string(e)
    if i+1 < len(l):
      s += ' '
  s += ')'
  return s
