ometa OMeta <: OMetaCore{
  . = anything

  regch :regex = char:c &{Regexp.new("[#{regex}]").match(c)} -> c
	
  end= ~.

	empty = -> true
	
  endline=  ("\r" "\n" ) | "\r" | "\n"
	
  char= .:c &{Character === c } -> c

	space=<\s\t\r\n\f>

	spaces=space* 

	digit=<0-9>

	lower=<a-z>

	upper=<A-Z>
		
  letter=lower | upper

	letterOrDigit=letter | digit
	
	alpha = letter

	alnum = letterOrDigit

	xdigit = <0-9a-fA-F>

	word = alpha | '_'

	exactly :wanted = :got -> wanted == got ? wanted : (raise Fail)

	notLast :rule = apply(rule):r &apply(rule) -> r

	token :cs = spaces seq(cs)

	firstAndRest :first :rest = apply(first):f apply(rest)*:r -> r.unshift(f)

	listOf :rule :delim =  apply(rule):f (apply(delim) apply(rule))*:r -> r.unshift(f)
												 | empty -> []
	
	clas :cls = &{@input.stream.src.is_a? Class.const_get(cls)}	

	foo= %Aue[]
}
["Grammar", "OMeta", "OMetaCore", ["Rule", "_dot_", [], [], ["Or", ["And", ["And"], ["App", "anything", ""]]]], ["Rule", "regch", ["regex", "c"], [], ["Or", ["And", ["Set", "regex", ["App", "anything"]], ["And", ["Set", "c", ["App", "char", ""]], ["Pred", "Regexp.new(\"[\#{regex}]\").match(c)"], ["Act", "c"]]]]], ["Rule", "end", [], [], ["Or", ["And", ["And"], ["Not", ["App", "_dot_", ""]]]]], ["Rule", "empty", [], [], ["Or", ["And", ["And"], ["Act", "true"]]]], ["Rule", "endline", [], [], ["Or", ["And", ["And"], ["Or", ["And", ["App", "token", "\"\\r\""], ["App", "token", "\"\\n\""]], ["App", "token", "\"\\r\""], ["App", "token", "\"\\n\""]]]]], ["Rule", "char", ["c"], [], ["Or", ["And", ["And"], ["And", ["Set", "c", ["App", "_dot_", ""]], ["Pred", "Character === c "], ["Act", "c"]]]]], ["Rule", "space", [], [], ["Or", ["And", ["And"], ["App", "regch", "\" \\t\\r\\n\\f\""]]]], ["Rule", "spaces", [], [], ["Or", ["And", ["And"], ["Many", ["App", "space", ""]]]]], ["Rule", "digit", [], [], ["Or", ["And", ["And"], ["App", "regch", "\"0-9\""]]]], ["Rule", "lower", [], [], ["Or", ["And", ["And"], ["App", "regch", "\"a-z\""]]]], ["Rule", "upper", [], [], ["Or", ["And", ["And"], ["App", "regch", "\"A-Z\""]]]], ["Rule", "letter", [], [], ["Or", ["And", ["And"], ["Or", ["App", "lower", ""], ["App", "upper", ""]]]]], ["Rule", "letterOrDigit", [], [], ["Or", ["And", ["And"], ["Or", ["App", "letter", ""], ["App", "digit", ""]]]]], ["Rule", "alpha", [], [], ["Or", ["And", ["And"], ["App", "letter", ""]]]], ["Rule", "alnum", [], [], ["Or", ["And", ["And"], ["App", "letterOrDigit", ""]]]], ["Rule", "xdigit", [], [], ["Or", ["And", ["And"], ["App", "regch", "\"0-9a-fA-F\""]]]], ["Rule", "word", [], [], ["Or", ["And", ["And"], ["Or", ["App", "alpha", ""], ["App", "seq", "\"_\""]]]]], ["Rule", "exactly", ["wanted", "got"], [], ["Or", ["And", ["Set", "wanted", ["App", "anything"]], ["And", ["Set", "got", ["App", "anything"]], ["Act", "wanted == got ? wanted : (raise Fail)"]]]]], ["Rule", "notLast", ["rule", "r"], [], ["Or", ["And", ["Set", "rule", ["App", "anything"]], ["And", ["Set", "r", ["App", "apply", ['r', 'u', 'l', 'e']]], ["Lookahead", ["App", "apply", ['r', 'u', 'l', 'e']]], ["Act", "r"]]]]], ["Rule", "token", ["cs"], [], ["Or", ["And", ["Set", "cs", ["App", "anything"]], ["And", ["App", "spaces", ""], ["App", "seq", ['c', 's']]]]]], ["Rule", "firstAndRest", ["first", "rest", "f", "r"], [], ["Or", ["And", ["And", ["Set", "first", ["App", "anything"]], ["Set", "rest", ["App", "anything"]]], ["And", ["Set", "f", ["App", "apply", ['f', 'i', 'r', 's', 't']]], ["Set", "r", ["Many", ["App", "apply", ['r', 'e', 's', 't']]]], ["Act", "r.unshift(f)"]]]]], ["Rule", "listOf", ["rule", "delim", "f", "r"], [], ["Or", ["And", ["And", ["Set", "rule", ["App", "anything"]], ["Set", "delim", ["App", "anything"]]], ["Or", ["And", ["Set", "f", ["App", "apply", ['r', 'u', 'l', 'e']]], ["Set", "r", ["Many", ["And", ["App", "apply", ['d', 'e', 'l', 'i', 'm']], ["App", "apply", ['r', 'u', 'l', 'e']]]]], ["Act", "r.unshift(f)"]], ["And", ["App", "empty", ""], ["Act", "[]"]]]]]], ["Rule", "clas", ["cls"], [], ["Or", ["And", ["Set", "cls", ["App", "anything"]], ["Pred", "@input.stream.src.is_a? Class.const_get(cls)"]]]], ["Rule", "foo", [], [], ["Or", ["And", ["And"], #<Klass:0x17ba868 @name="Aue", @args="">]]]]
["Grammar", "OMeta", "OMetaCore", ["Rule", "_dot_", [], [], ["App", "anything", ""]], ["Rule", "regch", ["regex", "c"], [], ["And", ["Set", "regex", ["App", "anything"]], ["Set", "c", ["App", "char", ""]], ["Pred", "Regexp.new(\"[\#{regex}]\").match(c)"], ["Act", "c"]]], ["Rule", "end", [], [], ["Not", ["App", "_dot_", ""]]], ["Rule", "empty", [], [], ["Act", "true"]], ["Rule", "endline", [], [], ["Or", ["And", ["App", "token", "\"\\r\""], ["App", "token", "\"\\n\""]], ["App", "token", "\"\\r\""], ["App", "token", "\"\\n\""]]], ["Rule", "char", ["c"], [], ["And", ["Set", "c", ["App", "_dot_", ""]], ["Pred", "Character === c "], ["Act", "c"]]], ["Rule", "space", [], [], ["App", "regch", "\" \\t\\r\\n\\f\""]], ["Rule", "spaces", [], [], ["Many", ["App", "space", ""]]], ["Rule", "digit", [], [], ["App", "regch", "\"0-9\""]], ["Rule", "lower", [], [], ["App", "regch", "\"a-z\""]], ["Rule", "upper", [], [], ["App", "regch", "\"A-Z\""]], ["Rule", "letter", [], [], ["Or", ["App", "lower", ""], ["App", "upper", ""]]], ["Rule", "letterOrDigit", [], [], ["Or", ["App", "letter", ""], ["App", "digit", ""]]], ["Rule", "alpha", [], [], ["App", "letter", ""]], ["Rule", "alnum", [], [], ["App", "letterOrDigit", ""]], ["Rule", "xdigit", [], [], ["App", "regch", "\"0-9a-fA-F\""]], ["Rule", "word", [], [], ["Or", ["App", "alpha", ""], ["App", "seq", "\"_\""]]], ["Rule", "exactly", ["wanted", "got"], [], ["And", ["Set", "wanted", ["App", "anything"]], ["Set", "got", ["App", "anything"]], ["Act", "wanted == got ? wanted : (raise Fail)"]]], ["Rule", "notLast", ["rule", "r"], [], ["And", ["Set", "rule", ["App", "anything"]], ["Set", "r", ["App", "apply", ['r', 'u', 'l', 'e']]], ["Lookahead", ["App", "apply", ['r', 'u', 'l', 'e']]], ["Act", "r"]]], ["Rule", "token", ["cs"], [], ["And", ["Set", "cs", ["App", "anything"]], ["App", "spaces", ""], ["App", "seq", ['c', 's']]]], ["Rule", "firstAndRest", ["first", "rest", "f", "r"], [], ["And", ["Set", "first", ["App", "anything"]], ["Set", "rest", ["App", "anything"]], ["Set", "f", ["App", "apply", ['f', 'i', 'r', 's', 't']]], ["Set", "r", ["Many", ["App", "apply", ['r', 'e', 's', 't']]]], ["Act", "r.unshift(f)"]]], ["Rule", "listOf", ["rule", "delim", "f", "r"], [], ["And", ["Set", "rule", ["App", "anything"]], ["Set", "delim", ["App", "anything"]], ["Or", ["And", ["Set", "f", ["App", "apply", ['r', 'u', 'l', 'e']]], ["Set", "r", ["Many", ["And", ["App", "apply", ['d', 'e', 'l', 'i', 'm']], ["App", "apply", ['r', 'u', 'l', 'e']]]]], ["Act", "r.unshift(f)"]], ["And", ["App", "empty", ""], ["Act", "[]"]]]]], ["Rule", "clas", ["cls"], [], ["And", ["Set", "cls", ["App", "anything"]], ["Pred", "@input.stream.src.is_a? Class.const_get(cls)"]]], ["Rule", "foo", [], [], #<Klass:0x17ba868 @name="Aue", @args="">]]
Class.new(OMetaCore) do
@name = "OMeta"
def _dot_


_applyWithArgs("anything", )
end

def regch
regex = c = nil

(regex = _apply("anything");c = _applyWithArgs("char", );_pred(Regexp.new("[#{regex}]").match(c));c)
end

def end


_xnot { _applyWithArgs("_dot_", ) }
end

def empty


true
end

def endline


_or(proc { (_applyWithArgs("token", "\r");_applyWithArgs("token", "\n")) }, proc { _applyWithArgs("token", "\r") }, proc { _applyWithArgs("token", "\n") })
end

def char
c = nil

(c = _applyWithArgs("_dot_", );_pred(Character === c );c)
end

def space


_applyWithArgs("regch", " \t\r\n\f")
end

def spaces


_xmany { _applyWithArgs("space", ) }
end

def digit


_applyWithArgs("regch", "0-9")
end

def lower


_applyWithArgs("regch", "a-z")
end

def upper


_applyWithArgs("regch", "A-Z")
end

def letter


_or(proc { _applyWithArgs("lower", ) }, proc { _applyWithArgs("upper", ) })
end

def letterOrDigit


_or(proc { _applyWithArgs("letter", ) }, proc { _applyWithArgs("digit", ) })
end

def alpha


_applyWithArgs("letter", )
end

def alnum


_applyWithArgs("letterOrDigit", )
end

def xdigit


_applyWithArgs("regch", "0-9a-fA-F")
end

def word


_or(proc { _applyWithArgs("alpha", ) }, proc { _applyWithArgs("seq", "_") })
end

def exactly
wanted = got = nil

(wanted = _apply("anything");got = _apply("anything");wanted == got ? wanted : (raise Fail))
end

def notLast
rule = r = nil

(rule = _apply("anything");r = _applyWithArgs("apply", rule);_xlookahead { _applyWithArgs("apply", rule) };r)
end

def token
cs = nil

(cs = _apply("anything");_applyWithArgs("spaces", );_applyWithArgs("seq", cs))
end

def firstAndRest
first = rest = f = r = nil

(first = _apply("anything");rest = _apply("anything");f = _applyWithArgs("apply", first);r = _xmany { _applyWithArgs("apply", rest) };r.unshift(f))
end

def listOf
rule = delim = f = r = nil

(rule = _apply("anything");delim = _apply("anything");_or(proc { (f = _applyWithArgs("apply", rule);r = _xmany { (_applyWithArgs("apply", delim);_applyWithArgs("apply", rule)) };r.unshift(f)) }, proc { (_applyWithArgs("empty", );[]) }))
end

def clas
cls = nil

(cls = _apply("anything");_pred(@input.stream.src.is_a? Class.const_get(cls)))
end

def foo


Aue.new()
end
end
ometa NullOptimizer {
  setHelped = ->{@_didSomething = true},
  helped    = &{@_didSomething},
  trans     = [:t &{respond_to?(t)} apply(t):ans]   -> { ans }
            | anything,
  optimize  = trans:x helped     -> { x },
  Or      =  trans*:xs            -> { ['Or',      *xs] },
  And     =  trans*:xs            -> { ['And',     *xs] },
  Many    =  trans:x              -> { ['Many',      x] },
  Many1   =  trans:x              -> { ['Many1',     x] },
  Set     =  :n trans:v           -> { ['Set',    n, v] },
  Not     =  trans:x              -> { ['Not',       x] },
  Lookahead= trans:x              -> { ['Lookahead', x] },
  Form     = trans:x              -> { ['Form',      x] },
  Key			 = :name trans:x							-> { ['Key',name,			x] },
	Rule     = :name :ls :ar trans:body -> { ['Rule', name, ls,ar, body] },
  initialize =                    -> { @_didSomething = false }
}

["Grammar", "NullOptimizer", "OMeta", ["Rule", "setHelped", [], [], ["Or", ["And", ["And"], ["Act", "@_didSomething = true"]]]], ["Rule", "helped", [], [], ["Or", ["And", ["And"], ["Pred", "@_didSomething"]]]], ["Rule", "trans", ["t", "ans"], [], ["Or", ["And", ["And"], ["Or", ["And", ["Form", ["And", ["Set", "t", ["App", "anything"]], ["Pred", "respond_to?(t)"], ["Set", "ans", ["App", "apply", ['t']]]]], ["Act", " ans "]], ["App", "anything", ""]]]]], ["Rule", "optimize", ["x"], [], ["Or", ["And", ["And"], ["And", ["Set", "x", ["App", "trans", ""]], ["App", "helped", ""], ["Act", " x "]]]]], ["Rule", "Or", ["xs"], [], ["Or", ["And", ["And"], ["And", ["Set", "xs", ["Many", ["App", "trans", ""]]], ["Act", " ['Or',      *xs] "]]]]], ["Rule", "And", ["xs"], [], ["Or", ["And", ["And"], ["And", ["Set", "xs", ["Many", ["App", "trans", ""]]], ["Act", " ['And',     *xs] "]]]]], ["Rule", "Many", ["x"], [], ["Or", ["And", ["And"], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " ['Many',      x] "]]]]], ["Rule", "Many1", ["x"], [], ["Or", ["And", ["And"], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " ['Many1',     x] "]]]]], ["Rule", "Set", ["n", "v"], [], ["Or", ["And", ["And"], ["And", ["Set", "n", ["App", "anything"]], ["Set", "v", ["App", "trans", ""]], ["Act", " ['Set',    n, v] "]]]]], ["Rule", "Not", ["x"], [], ["Or", ["And", ["And"], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " ['Not',       x] "]]]]], ["Rule", "Lookahead", ["x"], [], ["Or", ["And", ["And"], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " ['Lookahead', x] "]]]]], ["Rule", "Form", ["x"], [], ["Or", ["And", ["And"], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " ['Form',      x] "]]]]], ["Rule", "Key", ["name", "x"], [], ["Or", ["And", ["And"], ["And", ["Set", "name", ["App", "anything"]], ["Set", "x", ["App", "trans", ""]], ["Act", " ['Key',name,\t\t\tx] "]]]]], ["Rule", "Rule", ["name", "ls", "ar", "body"], [], ["Or", ["And", ["And"], ["And", ["Set", "name", ["App", "anything"]], ["Set", "ls", ["App", "anything"]], ["Set", "ar", ["App", "anything"]], ["Set", "body", ["App", "trans", ""]], ["Act", " ['Rule', name, ls,ar, body] "]]]]], ["Rule", "initialize", [], [], ["Or", ["And", ["And"], ["Act", " @_didSomething = false "]]]]]
["Grammar", "NullOptimizer", "OMeta", ["Rule", "setHelped", [], [], ["Act", "@_didSomething = true"]], ["Rule", "helped", [], [], ["Pred", "@_didSomething"]], ["Rule", "trans", ["t", "ans"], [], ["Or", ["And", ["Form", ["And", ["Set", "t", ["App", "anything"]], ["Pred", "respond_to?(t)"], ["Set", "ans", ["App", "apply", ['t']]]]], ["Act", " ans "]], ["App", "anything", ""]]], ["Rule", "optimize", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["App", "helped", ""], ["Act", " x "]]], ["Rule", "Or", ["xs"], [], ["And", ["Set", "xs", ["Many", ["App", "trans", ""]]], ["Act", " ['Or',      *xs] "]]], ["Rule", "And", ["xs"], [], ["And", ["Set", "xs", ["Many", ["App", "trans", ""]]], ["Act", " ['And',     *xs] "]]], ["Rule", "Many", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " ['Many',      x] "]]], ["Rule", "Many1", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " ['Many1',     x] "]]], ["Rule", "Set", ["n", "v"], [], ["And", ["Set", "n", ["App", "anything"]], ["Set", "v", ["App", "trans", ""]], ["Act", " ['Set',    n, v] "]]], ["Rule", "Not", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " ['Not',       x] "]]], ["Rule", "Lookahead", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " ['Lookahead', x] "]]], ["Rule", "Form", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " ['Form',      x] "]]], ["Rule", "Key", ["name", "x"], [], ["And", ["Set", "name", ["App", "anything"]], ["Set", "x", ["App", "trans", ""]], ["Act", " ['Key',name,\t\t\tx] "]]], ["Rule", "Rule", ["name", "ls", "ar", "body"], [], ["And", ["Set", "name", ["App", "anything"]], ["Set", "ls", ["App", "anything"]], ["Set", "ar", ["App", "anything"]], ["Set", "body", ["App", "trans", ""]], ["Act", " ['Rule', name, ls,ar, body] "]]], ["Rule", "initialize", [], [], ["Act", " @_didSomething = false "]]]
Class.new(OMeta) do
@name = "NullOptimizer"
def setHelped


@_didSomething = true
end

def helped


_pred(@_didSomething)
end

def trans
t = ans = nil

_or(proc { (_xform { (t = _apply("anything");_pred(respond_to?(t));ans = _applyWithArgs("apply", t)) }; ans ) }, proc { _applyWithArgs("anything", ) })
end

def optimize
x = nil

(x = _applyWithArgs("trans", );_applyWithArgs("helped", ); x )
end

def Or
xs = nil

(xs = _xmany { _applyWithArgs("trans", ) }; ['Or',      *xs] )
end

def And
xs = nil

(xs = _xmany { _applyWithArgs("trans", ) }; ['And',     *xs] )
end

def Many
x = nil

(x = _applyWithArgs("trans", ); ['Many',      x] )
end

def Many1
x = nil

(x = _applyWithArgs("trans", ); ['Many1',     x] )
end

def Set
n = v = nil

(n = _apply("anything");v = _applyWithArgs("trans", ); ['Set',    n, v] )
end

def Not
x = nil

(x = _applyWithArgs("trans", ); ['Not',       x] )
end

def Lookahead
x = nil

(x = _applyWithArgs("trans", ); ['Lookahead', x] )
end

def Form
x = nil

(x = _applyWithArgs("trans", ); ['Form',      x] )
end

def Key
name = x = nil

(name = _apply("anything");x = _applyWithArgs("trans", ); ['Key',name,			x] )
end

def Rule
name = ls = ar = body = nil

(name = _apply("anything");ls = _apply("anything");ar = _apply("anything");body = _applyWithArgs("trans", ); ['Rule', name, ls,ar, body] )
end

def initialize


 @_didSomething = false 
end
end
ometa AndOrOptimizer <: NullOptimizer {
  And = trans:x end          setHelped  ->  x 
,
  And = transInside("And"):xs         ->  ['And', *xs] 
,
  Or = trans:x end          setHelped  ->  x 
,
  Or = transInside("Or"):xs          ->  ['Or',  *xs] 
,
  transInside :t = [exactly(t) transInside(t):xs] transInside(t):ys setHelped ->  xs + ys 
                 | trans:x                        transInside(t):xs               ->  [x, *xs] 
                 |                                                                  ->  [] 
}

["Grammar", "AndOrOptimizer", "NullOptimizer", ["Rule", "And", ["x", "xs"], [], ["Or", ["And", ["And"], ["And", ["Set", "x", ["App", "trans", ""]], ["App", "end", ""], ["App", "setHelped", ""], ["Act", "x "]]], ["And", ["And"], ["And", ["Set", "xs", ["App", "transInside", ['\"', 'A', 'n', 'd', '\"']]], ["Act", "['And', *xs] "]]]]], ["Rule", "Or", ["x", "xs"], [], ["Or", ["And", ["And"], ["And", ["Set", "x", ["App", "trans", ""]], ["App", "end", ""], ["App", "setHelped", ""], ["Act", "x "]]], ["And", ["And"], ["And", ["Set", "xs", ["App", "transInside", ['\"', 'O', 'r', '\"']]], ["Act", "['Or',  *xs] "]]]]], ["Rule", "transInside", ["t", "xs", "ys", "x"], [], ["Or", ["And", ["Set", "t", ["App", "anything"]], ["Or", ["And", ["Form", ["And", ["App", "exactly", ['t']], ["Set", "xs", ["App", "transInside", ['t']]]]], ["Set", "ys", ["App", "transInside", ['t']]], ["App", "setHelped", ""], ["Act", "xs + ys "]], ["And", ["Set", "x", ["App", "trans", ""]], ["Set", "xs", ["App", "transInside", ['t']]], ["Act", "[x, *xs] "]], ["Act", "[] "]]]]]]
["Grammar", "AndOrOptimizer", "NullOptimizer", ["Rule", "And", ["x", "xs"], [], ["Or", ["And", ["Set", "x", ["App", "trans", ""]], ["App", "end", ""], ["App", "setHelped", ""], ["Act", "x "]], ["And", ["Set", "xs", ["App", "transInside", ['\"', 'A', 'n', 'd', '\"']]], ["Act", "['And', *xs] "]]]], ["Rule", "Or", ["x", "xs"], [], ["Or", ["And", ["Set", "x", ["App", "trans", ""]], ["App", "end", ""], ["App", "setHelped", ""], ["Act", "x "]], ["And", ["Set", "xs", ["App", "transInside", ['\"', 'O', 'r', '\"']]], ["Act", "['Or',  *xs] "]]]], ["Rule", "transInside", ["t", "xs", "ys", "x"], [], ["And", ["Set", "t", ["App", "anything"]], ["Or", ["And", ["Form", ["And", ["App", "exactly", ['t']], ["Set", "xs", ["App", "transInside", ['t']]]]], ["Set", "ys", ["App", "transInside", ['t']]], ["App", "setHelped", ""], ["Act", "xs + ys "]], ["And", ["Set", "x", ["App", "trans", ""]], ["Set", "xs", ["App", "transInside", ['t']]], ["Act", "[x, *xs] "]], ["Act", "[] "]]]]]
Class.new(NullOptimizer) do
@name = "AndOrOptimizer"
def And
x = xs = nil

_or(proc { (x = _applyWithArgs("trans", );_applyWithArgs("end", );_applyWithArgs("setHelped", );x ) }, proc { (xs = _applyWithArgs("transInside", "And");['And', *xs] ) })
end

def Or
x = xs = nil

_or(proc { (x = _applyWithArgs("trans", );_applyWithArgs("end", );_applyWithArgs("setHelped", );x ) }, proc { (xs = _applyWithArgs("transInside", "Or");['Or',  *xs] ) })
end

def transInside
t = xs = ys = x = nil

(t = _apply("anything");_or(proc { (_xform { (_applyWithArgs("exactly", t);xs = _applyWithArgs("transInside", t)) };ys = _applyWithArgs("transInside", t);_applyWithArgs("setHelped", );xs + ys ) }, proc { (x = _applyWithArgs("trans", );xs = _applyWithArgs("transInside", t);[x, *xs] ) }, proc { []  }))
end
end
ometa OMetaOptimizer {
  optimizeGrammar = ['Grammar' :n :sn optimizeRule*:rs]                  -> { ['Grammar', n, sn, *rs] },
  optimizeRule    = :r (AndOrOptimizer::optimize(r):r)* -> { r }
}

["Grammar", "OMetaOptimizer", "OMeta", ["Rule", "optimizeGrammar", ["n", "sn", "rs"], [], ["Or", ["And", ["And"], ["And", ["Form", ["And", ["App", "seq", "\"Grammar\""], ["Set", "n", ["App", "anything"]], ["Set", "sn", ["App", "anything"]], ["Set", "rs", ["Many", ["App", "optimizeRule", ""]]]]], ["Act", " ['Grammar', n, sn, *rs] "]]]]], ["Rule", "optimizeRule", ["r"], [], ["Or", ["And", ["And"], ["And", ["Set", "r", ["App", "anything"]], ["Many", ["Set", "r", ["App", "foreign", "AndOrOptimizer", "\"optimize\"", ['r']]]], ["Act", " r "]]]]]]
["Grammar", "OMetaOptimizer", "OMeta", ["Rule", "optimizeGrammar", ["n", "sn", "rs"], [], ["And", ["Form", ["And", ["App", "seq", "\"Grammar\""], ["Set", "n", ["App", "anything"]], ["Set", "sn", ["App", "anything"]], ["Set", "rs", ["Many", ["App", "optimizeRule", ""]]]]], ["Act", " ['Grammar', n, sn, *rs] "]]], ["Rule", "optimizeRule", ["r"], [], ["And", ["Set", "r", ["App", "anything"]], ["Many", ["Set", "r", ["App", "foreign", "AndOrOptimizer", "\"optimize\"", ['r']]]], ["Act", " r "]]]]
Class.new(OMeta) do
@name = "OMetaOptimizer"
def optimizeGrammar
n = sn = rs = nil

(_xform { (_applyWithArgs("seq", "Grammar");n = _apply("anything");sn = _apply("anything");rs = _xmany { _applyWithArgs("optimizeRule", ) }) }; ['Grammar', n, sn, *rs] )
end

def optimizeRule
r = nil

(r = _apply("anything");_xmany { r = _applyWithArgs("foreign", AndOrOptimizer, "optimize", r) }; r )
end
end

ometa BSRubyParser <: OMeta {
  eChar          = '\\' char:c                            -> { unescapeChar c }
                 | char,
  tsString       = '\'' (~'\'' eChar)*:xs '\''            -> { xs.join('') },
	nonBraChar   = ~'(' ~')' char,
  insideBra   = omproc:o ->{[o]} | innerBra | nonBraChar,
  innerBra    = '(' insideBra*:xs ')'                     -> {"("+xs*"" +")" },
  outerBra    = '(' insideBra*:xs ')'                     -> { [ xs] },
	expr           = outerBra,
  semAction1     = spaces (~seq("\n") anything)*:xs    -> { xs.join('') },
  nonBraceChar   = ~'{' ~'}' char,
  inside         = innerBraces | nonBraceChar,
  innerBraces    = '{' inside*:xs '}'                     -> { "{#{xs.join('')}}" },
  outerBraces    = '{' inside*:xs '}'                     -> { xs.join('') },
  semAction2     = spaces outerBraces,
  semAction      = semAction2 | semAction1,
	omproc =  '`' OMetaParser::expr:x '`' -> x
}
["Grammar", "BSRubyParser", "OMeta", ["Rule", "eChar", ["c"], [], ["Or", ["And", ["And"], ["Or", ["And", ["App", "seq", "\"\\\\\""], ["Set", "c", ["App", "char", ""]], ["Act", " unescapeChar c "]], ["App", "char", ""]]]]], ["Rule", "tsString", ["xs"], [], ["Or", ["And", ["And"], ["And", ["App", "seq", "\"'\""], ["Set", "xs", ["Many", ["And", ["Not", ["App", "seq", "\"'\""]], ["App", "eChar", ""]]]], ["App", "seq", "\"'\""], ["Act", " xs.join('') "]]]]], ["Rule", "nonBraChar", [], [], ["Or", ["And", ["And"], ["And", ["Not", ["App", "seq", "\"(\""]], ["Not", ["App", "seq", "\")\""]], ["App", "char", ""]]]]], ["Rule", "insideBra", ["o"], [], ["Or", ["And", ["And"], ["Or", ["And", ["Set", "o", ["App", "omproc", ""]], ["Act", "[o]"]], ["App", "innerBra", ""], ["App", "nonBraChar", ""]]]]], ["Rule", "innerBra", ["xs"], [], ["Or", ["And", ["And"], ["And", ["App", "seq", "\"(\""], ["Set", "xs", ["Many", ["App", "insideBra", ""]]], ["App", "seq", "\")\""], ["Act", "\"(\"+xs*\"\" +\")\" "]]]]], ["Rule", "outerBra", ["xs"], [], ["Or", ["And", ["And"], ["And", ["App", "seq", "\"(\""], ["Set", "xs", ["Many", ["App", "insideBra", ""]]], ["App", "seq", "\")\""], ["Act", " [ xs] "]]]]], ["Rule", "expr", [], [], ["Or", ["And", ["And"], ["App", "outerBra", ""]]]], ["Rule", "semAction1", ["xs"], [], ["Or", ["And", ["And"], ["And", ["App", "spaces", ""], ["Set", "xs", ["Many", ["And", ["Not", ["App", "seq", ['\"', '\\', 'n', '\"']]], ["App", "anything", ""]]]], ["Act", " xs.join('') "]]]]], ["Rule", "nonBraceChar", [], [], ["Or", ["And", ["And"], ["And", ["Not", ["App", "seq", "\"{\""]], ["Not", ["App", "seq", "\"}\""]], ["App", "char", ""]]]]], ["Rule", "inside", [], [], ["Or", ["And", ["And"], ["Or", ["App", "innerBraces", ""], ["App", "nonBraceChar", ""]]]]], ["Rule", "innerBraces", ["xs"], [], ["Or", ["And", ["And"], ["And", ["App", "seq", "\"{\""], ["Set", "xs", ["Many", ["App", "inside", ""]]], ["App", "seq", "\"}\""], ["Act", " \"{\#{xs.join('')}}\" "]]]]], ["Rule", "outerBraces", ["xs"], [], ["Or", ["And", ["And"], ["And", ["App", "seq", "\"{\""], ["Set", "xs", ["Many", ["App", "inside", ""]]], ["App", "seq", "\"}\""], ["Act", " xs.join('') "]]]]], ["Rule", "semAction2", [], [], ["Or", ["And", ["And"], ["And", ["App", "spaces", ""], ["App", "outerBraces", ""]]]]], ["Rule", "semAction", [], [], ["Or", ["And", ["And"], ["Or", ["App", "semAction2", ""], ["App", "semAction1", ""]]]]], ["Rule", "omproc", ["x"], [], ["Or", ["And", ["And"], ["And", ["App", "seq", "\"`\""], ["Set", "x", ["App", "foreign", "OMetaParser", "\"expr\"", ""]], ["App", "seq", "\"`\""], ["Act", "x"]]]]]]
["Grammar", "BSRubyParser", "OMeta", ["Rule", "eChar", ["c"], [], ["Or", ["And", ["App", "seq", "\"\\\\\""], ["Set", "c", ["App", "char", ""]], ["Act", " unescapeChar c "]], ["App", "char", ""]]], ["Rule", "tsString", ["xs"], [], ["And", ["App", "seq", "\"'\""], ["Set", "xs", ["Many", ["And", ["Not", ["App", "seq", "\"'\""]], ["App", "eChar", ""]]]], ["App", "seq", "\"'\""], ["Act", " xs.join('') "]]], ["Rule", "nonBraChar", [], [], ["And", ["Not", ["App", "seq", "\"(\""]], ["Not", ["App", "seq", "\")\""]], ["App", "char", ""]]], ["Rule", "insideBra", ["o"], [], ["Or", ["And", ["Set", "o", ["App", "omproc", ""]], ["Act", "[o]"]], ["App", "innerBra", ""], ["App", "nonBraChar", ""]]], ["Rule", "innerBra", ["xs"], [], ["And", ["App", "seq", "\"(\""], ["Set", "xs", ["Many", ["App", "insideBra", ""]]], ["App", "seq", "\")\""], ["Act", "\"(\"+xs*\"\" +\")\" "]]], ["Rule", "outerBra", ["xs"], [], ["And", ["App", "seq", "\"(\""], ["Set", "xs", ["Many", ["App", "insideBra", ""]]], ["App", "seq", "\")\""], ["Act", " [ xs] "]]], ["Rule", "expr", [], [], ["App", "outerBra", ""]], ["Rule", "semAction1", ["xs"], [], ["And", ["App", "spaces", ""], ["Set", "xs", ["Many", ["And", ["Not", ["App", "seq", ['\"', '\\', 'n', '\"']]], ["App", "anything", ""]]]], ["Act", " xs.join('') "]]], ["Rule", "nonBraceChar", [], [], ["And", ["Not", ["App", "seq", "\"{\""]], ["Not", ["App", "seq", "\"}\""]], ["App", "char", ""]]], ["Rule", "inside", [], [], ["Or", ["App", "innerBraces", ""], ["App", "nonBraceChar", ""]]], ["Rule", "innerBraces", ["xs"], [], ["And", ["App", "seq", "\"{\""], ["Set", "xs", ["Many", ["App", "inside", ""]]], ["App", "seq", "\"}\""], ["Act", " \"{\#{xs.join('')}}\" "]]], ["Rule", "outerBraces", ["xs"], [], ["And", ["App", "seq", "\"{\""], ["Set", "xs", ["Many", ["App", "inside", ""]]], ["App", "seq", "\"}\""], ["Act", " xs.join('') "]]], ["Rule", "semAction2", [], [], ["And", ["App", "spaces", ""], ["App", "outerBraces", ""]]], ["Rule", "semAction", [], [], ["Or", ["App", "semAction2", ""], ["App", "semAction1", ""]]], ["Rule", "omproc", ["x"], [], ["And", ["App", "seq", "\"`\""], ["Set", "x", ["App", "foreign", "OMetaParser", "\"expr\"", ""]], ["App", "seq", "\"`\""], ["Act", "x"]]]]
Class.new(OMeta) do
@name = "BSRubyParser"
def eChar
c = nil

_or(proc { (_applyWithArgs("seq", "\\");c = _applyWithArgs("char", ); unescapeChar c ) }, proc { _applyWithArgs("char", ) })
end

def tsString
xs = nil

(_applyWithArgs("seq", "'");xs = _xmany { (_xnot { _applyWithArgs("seq", "'") };_applyWithArgs("eChar", )) };_applyWithArgs("seq", "'"); xs.join('') )
end

def nonBraChar


(_xnot { _applyWithArgs("seq", "(") };_xnot { _applyWithArgs("seq", ")") };_applyWithArgs("char", ))
end

def insideBra
o = nil

_or(proc { (o = _applyWithArgs("omproc", );[o]) }, proc { _applyWithArgs("innerBra", ) }, proc { _applyWithArgs("nonBraChar", ) })
end

def innerBra
xs = nil

(_applyWithArgs("seq", "(");xs = _xmany { _applyWithArgs("insideBra", ) };_applyWithArgs("seq", ")");"("+xs*"" +")" )
end

def outerBra
xs = nil

(_applyWithArgs("seq", "(");xs = _xmany { _applyWithArgs("insideBra", ) };_applyWithArgs("seq", ")"); [ xs] )
end

def expr


_applyWithArgs("outerBra", )
end

def semAction1
xs = nil

(_applyWithArgs("spaces", );xs = _xmany { (_xnot { _applyWithArgs("seq", "\n") };_applyWithArgs("anything", )) }; xs.join('') )
end

def nonBraceChar


(_xnot { _applyWithArgs("seq", "{") };_xnot { _applyWithArgs("seq", "}") };_applyWithArgs("char", ))
end

def inside


_or(proc { _applyWithArgs("innerBraces", ) }, proc { _applyWithArgs("nonBraceChar", ) })
end

def innerBraces
xs = nil

(_applyWithArgs("seq", "{");xs = _xmany { _applyWithArgs("inside", ) };_applyWithArgs("seq", "}"); "{#{xs.join('')}}" )
end

def outerBraces
xs = nil

(_applyWithArgs("seq", "{");xs = _xmany { _applyWithArgs("inside", ) };_applyWithArgs("seq", "}"); xs.join('') )
end

def semAction2


(_applyWithArgs("spaces", );_applyWithArgs("outerBraces", ))
end

def semAction


_or(proc { _applyWithArgs("semAction2", ) }, proc { _applyWithArgs("semAction1", ) })
end

def omproc
x = nil

(_applyWithArgs("seq", "`");x = _applyWithArgs("foreign", OMetaParser, "expr", );_applyWithArgs("seq", "`");x)
end
end

ometa BSRubyTranslator <: OMeta {
	trans          = anything
}

["Grammar", "BSRubyTranslator", "OMeta", ["Rule", "trans", [], [], ["Or", ["And", ["And"], ["App", "anything", ""]]]]]
["Grammar", "BSRubyTranslator", "OMeta", ["Rule", "trans", [], [], ["App", "anything", ""]]]
Class.new(OMeta) do
@name = "BSRubyTranslator"
def trans


_applyWithArgs("anything", )
end
end

ometa OMetaParser <: OMeta {
  nameFirst      = <_$.^> | letter

  nameRest       = nameFirst | digit

  className      = upper:xs[] nameRest*:xs[]                   -> leterize(xs.join(''))

  tsName         = nameFirst:xs[] nameRest*:xs[]             ->  leterize(xs.join('')) 

  name           = spaces tsName

  eChar          = '\\' char:c                                         ->  unescapeChar c 
                 | char

  tsString       = '\'' (~'\'' eChar)*:xs '\''                         ->  xs.join('') 

  characters     = tsString:s          ->  ['App', 'seq',     s.inspect] 

  sCharacters    = '"'     (~'"'         eChar)*:xs '"'                ->  ['App', 'token',   xs.join('').inspect] 

  string         = ('#' tsName):xs                  ->  ['App', 'exactly', xs.inspect] 

  number         = ('-' | empty -> { '' }):sign digit+:ds              ->  ['App', 'exactly', sign + ds.join('')] 

  keyword :xs    = token(xs) ~letterOrDigit                          ->  xs 

  hostExpr       = BSRubyParser::expr:r                    BSRubyTranslator::trans(r)

  atomicHostExpr = BSRubyParser::semAction:r               BSRubyTranslator::trans(r)

  inlineHostExpr = BSRubyParser::semAction2:r              BSRubyTranslator::trans(r)

  args           = ~space hostExpr:xs              ->  xs 
                 | empty                                               ->  "" 

  application    =   name:klas "::" name:rule args:as                    ->  ['App', 'foreign',klas,rule.inspect, *as] 
                  |  name:rule args:as                                  ->  ['App', rule, *as] 

  expr           = listOf("expr4", `"|"`):xs                         ->  (xs.size==1 ? xs[0] : ['Or',        *xs] )

  expr4          = expr3*:xs                                           -> (xs.size==1 ? xs[0] : ['And',       *xs] )

  optIter :x     = "*"                                                 ->  ['Many',        x]
                 | "+"                                                 ->  ['Many1',       x] 
                 | "?" ~inlineHostExpr                                 ->  ['Or', x,['App','empty']] 
                 | empty                                               ->  x 

  binding :x     = ':' name:n  ( '[' ']'  ->  @arrays << n; ['Append', n, x] 
                               | empty    ->  @locals << n; ['Set', n, x]
                               )
                    | ':' inlineHostExpr:e -> @locals << "it";  ['And',['Set','it',x],['Pred',e]]

  expr3          = expr2:x optIter(x):x (binding(x) |empty ->{x}) 
                   | spaces ->{ x=['App','anything']}  binding(x)

  expr2          = "~" expr2:x                                         ->  ['Not',         x] 
                 | "&" ~inlineHostExpr expr1:x                         ->  ['Lookahead',   x] 
                 | expr1

  expr1          =spaces className:c '[' expr:x "]"                            ->  ['Form',['And', ['App',"clas",c.inspect]  ,x]]
								 |application
                 | "@" name:var ("=>" application  | empty -> {['App',"anything"]}):x  ->  ['Key',  var,   x]
                 | "->" atomicHostExpr:x                       ->  ['Act',         x]
                 | "&"  inlineHostExpr:x                       ->  ['Pred',        x]
                 | spaces (characters | sCharacters | string | number)
                 | "[" expr:x "]"                                      ->  ['Form', x]
                 | "%" (className | empty ->{"Array"}):c '[' klasargs:args "]" %Klass[c,args]
                 | "<" (~">" eChar)+:x  ">"                            ->  ['App', 'regch', x.join('').inspect] 
                 | "(" expr:x ")"                                      ->  x 

	klasargs = <^\\]>*:a -> a*""

  ruleName       = name
                 | spaces tsString

  rule           = &(ruleName:n) -> @locals = []; @arrays = []
                     rulePart(n):x ("," rulePart(n))*:xs           ->  ['Rule', n, @locals.uniq,@arrays.uniq, ['Or', x, *xs]] 

  rulePart :rn   = ruleName:n &{n == rn} expr4:b1 ( "=" expr:b2        ->  ['And', b1, b2] 
                                                  | empty              ->  b1 
                                                  )

  grammar        = keyword("ometa") name:n
                   ( "<:" name | empty -> { 'OMeta' }):sn
                   "{" listOf("rule", `","`):rs "}"                  ->  ['Grammar', n, sn, *rs]
}
["Grammar", "OMetaParser", "OMeta", ["Rule", "nameFirst", [], [], ["Or", ["And", ["And"], ["Or", ["App", "regch", "\"_$.^\""], ["App", "letter", ""]]]]], ["Rule", "nameRest", [], [], ["Or", ["And", ["And"], ["Or", ["App", "nameFirst", ""], ["App", "digit", ""]]]]], ["Rule", "className", [], ["xs"], ["Or", ["And", ["And"], ["And", ["Append", "xs", ["App", "upper", ""]], ["Append", "xs", ["Many", ["App", "nameRest", ""]]], ["Act", "leterize(xs.join(''))"]]]]], ["Rule", "tsName", [], ["xs"], ["Or", ["And", ["And"], ["And", ["Append", "xs", ["App", "nameFirst", ""]], ["Append", "xs", ["Many", ["App", "nameRest", ""]]], ["Act", "leterize(xs.join('')) "]]]]], ["Rule", "name", [], [], ["Or", ["And", ["And"], ["And", ["App", "spaces", ""], ["App", "tsName", ""]]]]], ["Rule", "eChar", ["c"], [], ["Or", ["And", ["And"], ["Or", ["And", ["App", "seq", "\"\\\\\""], ["Set", "c", ["App", "char", ""]], ["Act", "unescapeChar c "]], ["App", "char", ""]]]]], ["Rule", "tsString", ["xs"], [], ["Or", ["And", ["And"], ["And", ["App", "seq", "\"'\""], ["Set", "xs", ["Many", ["And", ["Not", ["App", "seq", "\"'\""]], ["App", "eChar", ""]]]], ["App", "seq", "\"'\""], ["Act", "xs.join('') "]]]]], ["Rule", "characters", ["s"], [], ["Or", ["And", ["And"], ["And", ["Set", "s", ["App", "tsString", ""]], ["Act", "['App', 'seq',     s.inspect] "]]]]], ["Rule", "sCharacters", ["xs"], [], ["Or", ["And", ["And"], ["And", ["App", "seq", "\"\\\"\""], ["Set", "xs", ["Many", ["And", ["Not", ["App", "seq", "\"\\\"\""]], ["App", "eChar", ""]]]], ["App", "seq", "\"\\\"\""], ["Act", "['App', 'token',   xs.join('').inspect] "]]]]], ["Rule", "string", ["xs"], [], ["Or", ["And", ["And"], ["And", ["Set", "xs", ["And", ["App", "seq", "\"#\""], ["App", "tsName", ""]]], ["Act", "['App', 'exactly', xs.inspect] "]]]]], ["Rule", "number", ["sign", "ds"], [], ["Or", ["And", ["And"], ["And", ["Set", "sign", ["Or", ["App", "seq", "\"-\""], ["And", ["App", "empty", ""], ["Act", " '' "]]]], ["Set", "ds", ["Many1", ["App", "digit", ""]]], ["Act", "['App', 'exactly', sign + ds.join('')] "]]]]], ["Rule", "keyword", ["xs"], [], ["Or", ["And", ["Set", "xs", ["App", "anything"]], ["And", ["App", "token", ['x', 's']], ["Not", ["App", "letterOrDigit", ""]], ["Act", "xs "]]]]], ["Rule", "hostExpr", ["r"], [], ["Or", ["And", ["And"], ["And", ["Set", "r", ["App", "foreign", "BSRubyParser", "\"expr\"", ""]], ["App", "foreign", "BSRubyTranslator", "\"trans\"", ['r']]]]]], ["Rule", "atomicHostExpr", ["r"], [], ["Or", ["And", ["And"], ["And", ["Set", "r", ["App", "foreign", "BSRubyParser", "\"semAction\"", ""]], ["App", "foreign", "BSRubyTranslator", "\"trans\"", ['r']]]]]], ["Rule", "inlineHostExpr", ["r"], [], ["Or", ["And", ["And"], ["And", ["Set", "r", ["App", "foreign", "BSRubyParser", "\"semAction2\"", ""]], ["App", "foreign", "BSRubyTranslator", "\"trans\"", ['r']]]]]], ["Rule", "args", ["xs"], [], ["Or", ["And", ["And"], ["Or", ["And", ["Not", ["App", "space", ""]], ["Set", "xs", ["App", "hostExpr", ""]], ["Act", "xs "]], ["And", ["App", "empty", ""], ["Act", "\"\" "]]]]]], ["Rule", "application", ["klas", "rule", "as"], [], ["Or", ["And", ["And"], ["Or", ["And", ["Set", "klas", ["App", "name", ""]], ["App", "token", "\"::\""], ["Set", "rule", ["App", "name", ""]], ["Set", "as", ["App", "args", ""]], ["Act", "['App', 'foreign',klas,rule.inspect, *as] "]], ["And", ["Set", "rule", ["App", "name", ""]], ["Set", "as", ["App", "args", ""]], ["Act", "['App', rule, *as] "]]]]]], ["Rule", "expr", ["xs"], [], ["Or", ["And", ["And"], ["And", ["Set", "xs", ["App", "listOf", ['\"', 'e', 'x', 'p', 'r', '4', '\"', ',', ' ', [["App", "token", "\"|\""]]]]], ["Act", "(xs.size==1 ? xs[0] : ['Or',        *xs] )"]]]]], ["Rule", "expr4", ["xs"], [], ["Or", ["And", ["And"], ["And", ["Set", "xs", ["Many", ["App", "expr3", ""]]], ["Act", "(xs.size==1 ? xs[0] : ['And',       *xs] )"]]]]], ["Rule", "optIter", ["x"], [], ["Or", ["And", ["Set", "x", ["App", "anything"]], ["Or", ["And", ["App", "token", "\"*\""], ["Act", "['Many',        x]"]], ["And", ["App", "token", "\"+\""], ["Act", "['Many1',       x] "]], ["And", ["App", "token", "\"?\""], ["Not", ["App", "inlineHostExpr", ""]], ["Act", "['Or', x,['App','empty']] "]], ["And", ["App", "empty", ""], ["Act", "x "]]]]]], ["Rule", "binding", ["x", "n", "e"], [], ["Or", ["And", ["Set", "x", ["App", "anything"]], ["Or", ["And", ["App", "seq", "\":\""], ["Set", "n", ["App", "name", ""]], ["Or", ["And", ["App", "seq", "\"[\""], ["App", "seq", "\"]\""], ["Act", "@arrays << n; ['Append', n, x] "]], ["And", ["App", "empty", ""], ["Act", "@locals << n; ['Set', n, x]"]]]], ["And", ["App", "seq", "\":\""], ["Set", "e", ["App", "inlineHostExpr", ""]], ["Act", "@locals << \"it\";  ['And',['Set','it',x],['Pred',e]]"]]]]]], ["Rule", "expr3", ["x"], [], ["Or", ["And", ["And"], ["Or", ["And", ["Set", "x", ["App", "expr2", ""]], ["Set", "x", ["App", "optIter", ['x']]], ["Or", ["App", "binding", ['x']], ["And", ["App", "empty", ""], ["Act", "x"]]]], ["And", ["App", "spaces", ""], ["Act", " x=['App','anything']"], ["App", "binding", ['x']]]]]]], ["Rule", "expr2", ["x"], [], ["Or", ["And", ["And"], ["Or", ["And", ["App", "token", "\"~\""], ["Set", "x", ["App", "expr2", ""]], ["Act", "['Not',         x] "]], ["And", ["App", "token", "\"&\""], ["Not", ["App", "inlineHostExpr", ""]], ["Set", "x", ["App", "expr1", ""]], ["Act", "['Lookahead',   x] "]], ["App", "expr1", ""]]]]], ["Rule", "expr1", ["c", "x", "var", "args"], [], ["Or", ["And", ["And"], ["Or", ["And", ["App", "spaces", ""], ["Set", "c", ["App", "className", ""]], ["App", "seq", "\"[\""], ["Set", "x", ["App", "expr", ""]], ["App", "token", "\"]\""], ["Act", "['Form',['And', ['App',\"clas\",c.inspect]  ,x]]"]], ["App", "application", ""], ["And", ["App", "token", "\"@\""], ["Set", "var", ["App", "name", ""]], ["Set", "x", ["Or", ["And", ["App", "token", "\"=>\""], ["App", "application", ""]], ["And", ["App", "empty", ""], ["Act", "['App',\"anything\"]"]]]], ["Act", "['Key',  var,   x]"]], ["And", ["App", "token", "\"->\""], ["Set", "x", ["App", "atomicHostExpr", ""]], ["Act", "['Act',         x]"]], ["And", ["App", "token", "\"&\""], ["Set", "x", ["App", "inlineHostExpr", ""]], ["Act", "['Pred',        x]"]], ["And", ["App", "spaces", ""], ["Or", ["App", "characters", ""], ["App", "sCharacters", ""], ["App", "string", ""], ["App", "number", ""]]], ["And", ["App", "token", "\"[\""], ["Set", "x", ["App", "expr", ""]], ["App", "token", "\"]\""], ["Act", "['Form', x]"]], ["And", ["App", "token", "\"%\""], ["Set", "c", ["Or", ["App", "className", ""], ["And", ["App", "empty", ""], ["Act", "\"Array\""]]]], ["App", "seq", "\"[\""], ["Set", "args", ["App", "klasargs", ""]], ["App", "token", "\"]\""], #<Klass:0x12b25a8 @name="Klass", @args="c,args">], ["And", ["App", "token", "\"<\""], ["Set", "x", ["Many1", ["And", ["Not", ["App", "token", "\">\""]], ["App", "eChar", ""]]]], ["App", "token", "\">\""], ["Act", "['App', 'regch', x.join('').inspect] "]], ["And", ["App", "token", "\"(\""], ["Set", "x", ["App", "expr", ""]], ["App", "token", "\")\""], ["Act", "x "]]]]]], ["Rule", "klasargs", ["a"], [], ["Or", ["And", ["And"], ["And", ["Set", "a", ["Many", ["App", "regch", "\"^\\\\]\""]]], ["Act", "a*\"\""]]]]], ["Rule", "ruleName", [], [], ["Or", ["And", ["And"], ["Or", ["App", "name", ""], ["And", ["App", "spaces", ""], ["App", "tsString", ""]]]]]], ["Rule", "rule", ["n", "x", "xs"], [], ["Or", ["And", ["And"], ["And", ["Lookahead", ["Set", "n", ["App", "ruleName", ""]]], ["Act", "@locals = []; @arrays = []"], ["Set", "x", ["App", "rulePart", ['n']]], ["Set", "xs", ["Many", ["And", ["App", "token", "\",\""], ["App", "rulePart", ['n']]]]], ["Act", "['Rule', n, @locals.uniq,@arrays.uniq, ['Or', x, *xs]] "]]]]], ["Rule", "rulePart", ["rn", "n", "b1", "b2"], [], ["Or", ["And", ["Set", "rn", ["App", "anything"]], ["And", ["Set", "n", ["App", "ruleName", ""]], ["Pred", "n == rn"], ["Set", "b1", ["App", "expr4", ""]], ["Or", ["And", ["App", "token", "\"=\""], ["Set", "b2", ["App", "expr", ""]], ["Act", "['And', b1, b2] "]], ["And", ["App", "empty", ""], ["Act", "b1 "]]]]]]], ["Rule", "grammar", ["n", "sn", "rs"], [], ["Or", ["And", ["And"], ["And", ["App", "keyword", ['\"', 'o', 'm', 'e', 't', 'a', '\"']], ["Set", "n", ["App", "name", ""]], ["Set", "sn", ["Or", ["And", ["App", "token", "\"<:\""], ["App", "name", ""]], ["And", ["App", "empty", ""], ["Act", " 'OMeta' "]]]], ["App", "token", "\"{\""], ["Set", "rs", ["App", "listOf", ['\"', 'r', 'u', 'l', 'e', '\"', ',', ' ', [["App", "token", "\",\""]]]]], ["App", "token", "\"}\""], ["Act", "['Grammar', n, sn, *rs]"]]]]]]
["Grammar", "OMetaParser", "OMeta", ["Rule", "nameFirst", [], [], ["Or", ["App", "regch", "\"_$.^\""], ["App", "letter", ""]]], ["Rule", "nameRest", [], [], ["Or", ["App", "nameFirst", ""], ["App", "digit", ""]]], ["Rule", "className", [], ["xs"], ["And", ["Append", "xs", ["App", "upper", ""]], ["Append", "xs", ["Many", ["App", "nameRest", ""]]], ["Act", "leterize(xs.join(''))"]]], ["Rule", "tsName", [], ["xs"], ["And", ["Append", "xs", ["App", "nameFirst", ""]], ["Append", "xs", ["Many", ["App", "nameRest", ""]]], ["Act", "leterize(xs.join('')) "]]], ["Rule", "name", [], [], ["And", ["App", "spaces", ""], ["App", "tsName", ""]]], ["Rule", "eChar", ["c"], [], ["Or", ["And", ["App", "seq", "\"\\\\\""], ["Set", "c", ["App", "char", ""]], ["Act", "unescapeChar c "]], ["App", "char", ""]]], ["Rule", "tsString", ["xs"], [], ["And", ["App", "seq", "\"'\""], ["Set", "xs", ["Many", ["And", ["Not", ["App", "seq", "\"'\""]], ["App", "eChar", ""]]]], ["App", "seq", "\"'\""], ["Act", "xs.join('') "]]], ["Rule", "characters", ["s"], [], ["And", ["Set", "s", ["App", "tsString", ""]], ["Act", "['App', 'seq',     s.inspect] "]]], ["Rule", "sCharacters", ["xs"], [], ["And", ["App", "seq", "\"\\\"\""], ["Set", "xs", ["Many", ["And", ["Not", ["App", "seq", "\"\\\"\""]], ["App", "eChar", ""]]]], ["App", "seq", "\"\\\"\""], ["Act", "['App', 'token',   xs.join('').inspect] "]]], ["Rule", "string", ["xs"], [], ["And", ["Set", "xs", ["And", ["App", "seq", "\"#\""], ["App", "tsName", ""]]], ["Act", "['App', 'exactly', xs.inspect] "]]], ["Rule", "number", ["sign", "ds"], [], ["And", ["Set", "sign", ["Or", ["App", "seq", "\"-\""], ["And", ["App", "empty", ""], ["Act", " '' "]]]], ["Set", "ds", ["Many1", ["App", "digit", ""]]], ["Act", "['App', 'exactly', sign + ds.join('')] "]]], ["Rule", "keyword", ["xs"], [], ["And", ["Set", "xs", ["App", "anything"]], ["App", "token", ['x', 's']], ["Not", ["App", "letterOrDigit", ""]], ["Act", "xs "]]], ["Rule", "hostExpr", ["r"], [], ["And", ["Set", "r", ["App", "foreign", "BSRubyParser", "\"expr\"", ""]], ["App", "foreign", "BSRubyTranslator", "\"trans\"", ['r']]]], ["Rule", "atomicHostExpr", ["r"], [], ["And", ["Set", "r", ["App", "foreign", "BSRubyParser", "\"semAction\"", ""]], ["App", "foreign", "BSRubyTranslator", "\"trans\"", ['r']]]], ["Rule", "inlineHostExpr", ["r"], [], ["And", ["Set", "r", ["App", "foreign", "BSRubyParser", "\"semAction2\"", ""]], ["App", "foreign", "BSRubyTranslator", "\"trans\"", ['r']]]], ["Rule", "args", ["xs"], [], ["Or", ["And", ["Not", ["App", "space", ""]], ["Set", "xs", ["App", "hostExpr", ""]], ["Act", "xs "]], ["And", ["App", "empty", ""], ["Act", "\"\" "]]]], ["Rule", "application", ["klas", "rule", "as"], [], ["Or", ["And", ["Set", "klas", ["App", "name", ""]], ["App", "token", "\"::\""], ["Set", "rule", ["App", "name", ""]], ["Set", "as", ["App", "args", ""]], ["Act", "['App', 'foreign',klas,rule.inspect, *as] "]], ["And", ["Set", "rule", ["App", "name", ""]], ["Set", "as", ["App", "args", ""]], ["Act", "['App', rule, *as] "]]]], ["Rule", "expr", ["xs"], [], ["And", ["Set", "xs", ["App", "listOf", ['\"', 'e', 'x', 'p', 'r', '4', '\"', ',', ' ', [["App", "token", "\"|\""]]]]], ["Act", "(xs.size==1 ? xs[0] : ['Or',        *xs] )"]]], ["Rule", "expr4", ["xs"], [], ["And", ["Set", "xs", ["Many", ["App", "expr3", ""]]], ["Act", "(xs.size==1 ? xs[0] : ['And',       *xs] )"]]], ["Rule", "optIter", ["x"], [], ["And", ["Set", "x", ["App", "anything"]], ["Or", ["And", ["App", "token", "\"*\""], ["Act", "['Many',        x]"]], ["And", ["App", "token", "\"+\""], ["Act", "['Many1',       x] "]], ["And", ["App", "token", "\"?\""], ["Not", ["App", "inlineHostExpr", ""]], ["Act", "['Or', x,['App','empty']] "]], ["And", ["App", "empty", ""], ["Act", "x "]]]]], ["Rule", "binding", ["x", "n", "e"], [], ["And", ["Set", "x", ["App", "anything"]], ["Or", ["And", ["App", "seq", "\":\""], ["Set", "n", ["App", "name", ""]], ["Or", ["And", ["App", "seq", "\"[\""], ["App", "seq", "\"]\""], ["Act", "@arrays << n; ['Append', n, x] "]], ["And", ["App", "empty", ""], ["Act", "@locals << n; ['Set', n, x]"]]]], ["And", ["App", "seq", "\":\""], ["Set", "e", ["App", "inlineHostExpr", ""]], ["Act", "@locals << \"it\";  ['And',['Set','it',x],['Pred',e]]"]]]]], ["Rule", "expr3", ["x"], [], ["Or", ["And", ["Set", "x", ["App", "expr2", ""]], ["Set", "x", ["App", "optIter", ['x']]], ["Or", ["App", "binding", ['x']], ["And", ["App", "empty", ""], ["Act", "x"]]]], ["And", ["App", "spaces", ""], ["Act", " x=['App','anything']"], ["App", "binding", ['x']]]]], ["Rule", "expr2", ["x"], [], ["Or", ["And", ["App", "token", "\"~\""], ["Set", "x", ["App", "expr2", ""]], ["Act", "['Not',         x] "]], ["And", ["App", "token", "\"&\""], ["Not", ["App", "inlineHostExpr", ""]], ["Set", "x", ["App", "expr1", ""]], ["Act", "['Lookahead',   x] "]], ["App", "expr1", ""]]], ["Rule", "expr1", ["c", "x", "var", "args"], [], ["Or", ["And", ["App", "spaces", ""], ["Set", "c", ["App", "className", ""]], ["App", "seq", "\"[\""], ["Set", "x", ["App", "expr", ""]], ["App", "token", "\"]\""], ["Act", "['Form',['And', ['App',\"clas\",c.inspect]  ,x]]"]], ["App", "application", ""], ["And", ["App", "token", "\"@\""], ["Set", "var", ["App", "name", ""]], ["Set", "x", ["Or", ["And", ["App", "token", "\"=>\""], ["App", "application", ""]], ["And", ["App", "empty", ""], ["Act", "['App',\"anything\"]"]]]], ["Act", "['Key',  var,   x]"]], ["And", ["App", "token", "\"->\""], ["Set", "x", ["App", "atomicHostExpr", ""]], ["Act", "['Act',         x]"]], ["And", ["App", "token", "\"&\""], ["Set", "x", ["App", "inlineHostExpr", ""]], ["Act", "['Pred',        x]"]], ["And", ["App", "spaces", ""], ["Or", ["App", "characters", ""], ["App", "sCharacters", ""], ["App", "string", ""], ["App", "number", ""]]], ["And", ["App", "token", "\"[\""], ["Set", "x", ["App", "expr", ""]], ["App", "token", "\"]\""], ["Act", "['Form', x]"]], ["And", ["App", "token", "\"%\""], ["Set", "c", ["Or", ["App", "className", ""], ["And", ["App", "empty", ""], ["Act", "\"Array\""]]]], ["App", "seq", "\"[\""], ["Set", "args", ["App", "klasargs", ""]], ["App", "token", "\"]\""], #<Klass:0x12b25a8 @name="Klass", @args="c,args">], ["And", ["App", "token", "\"<\""], ["Set", "x", ["Many1", ["And", ["Not", ["App", "token", "\">\""]], ["App", "eChar", ""]]]], ["App", "token", "\">\""], ["Act", "['App', 'regch', x.join('').inspect] "]], ["And", ["App", "token", "\"(\""], ["Set", "x", ["App", "expr", ""]], ["App", "token", "\")\""], ["Act", "x "]]]], ["Rule", "klasargs", ["a"], [], ["And", ["Set", "a", ["Many", ["App", "regch", "\"^\\\\]\""]]], ["Act", "a*\"\""]]], ["Rule", "ruleName", [], [], ["Or", ["App", "name", ""], ["And", ["App", "spaces", ""], ["App", "tsString", ""]]]], ["Rule", "rule", ["n", "x", "xs"], [], ["And", ["Lookahead", ["Set", "n", ["App", "ruleName", ""]]], ["Act", "@locals = []; @arrays = []"], ["Set", "x", ["App", "rulePart", ['n']]], ["Set", "xs", ["Many", ["And", ["App", "token", "\",\""], ["App", "rulePart", ['n']]]]], ["Act", "['Rule', n, @locals.uniq,@arrays.uniq, ['Or', x, *xs]] "]]], ["Rule", "rulePart", ["rn", "n", "b1", "b2"], [], ["And", ["Set", "rn", ["App", "anything"]], ["Set", "n", ["App", "ruleName", ""]], ["Pred", "n == rn"], ["Set", "b1", ["App", "expr4", ""]], ["Or", ["And", ["App", "token", "\"=\""], ["Set", "b2", ["App", "expr", ""]], ["Act", "['And', b1, b2] "]], ["And", ["App", "empty", ""], ["Act", "b1 "]]]]], ["Rule", "grammar", ["n", "sn", "rs"], [], ["And", ["App", "keyword", ['\"', 'o', 'm', 'e', 't', 'a', '\"']], ["Set", "n", ["App", "name", ""]], ["Set", "sn", ["Or", ["And", ["App", "token", "\"<:\""], ["App", "name", ""]], ["And", ["App", "empty", ""], ["Act", " 'OMeta' "]]]], ["App", "token", "\"{\""], ["Set", "rs", ["App", "listOf", ['\"', 'r', 'u', 'l', 'e', '\"', ',', ' ', [["App", "token", "\",\""]]]]], ["App", "token", "\"}\""], ["Act", "['Grammar', n, sn, *rs]"]]]]
Class.new(OMeta) do
@name = "OMetaParser"
def nameFirst


_or(proc { _applyWithArgs("regch", "_$.^") }, proc { _applyWithArgs("letter", ) })
end

def nameRest


_or(proc { _applyWithArgs("nameFirst", ) }, proc { _applyWithArgs("digit", ) })
end

def className

xs = []
(_append(xs , _applyWithArgs("upper", ));_append(xs , _xmany { _applyWithArgs("nameRest", ) });leterize(xs.join('')))
end

def tsName

xs = []
(_append(xs , _applyWithArgs("nameFirst", ));_append(xs , _xmany { _applyWithArgs("nameRest", ) });leterize(xs.join('')) )
end

def name


(_applyWithArgs("spaces", );_applyWithArgs("tsName", ))
end

def eChar
c = nil

_or(proc { (_applyWithArgs("seq", "\\");c = _applyWithArgs("char", );unescapeChar c ) }, proc { _applyWithArgs("char", ) })
end

def tsString
xs = nil

(_applyWithArgs("seq", "'");xs = _xmany { (_xnot { _applyWithArgs("seq", "'") };_applyWithArgs("eChar", )) };_applyWithArgs("seq", "'");xs.join('') )
end

def characters
s = nil

(s = _applyWithArgs("tsString", );['App', 'seq',     s.inspect] )
end

def sCharacters
xs = nil

(_applyWithArgs("seq", "\"");xs = _xmany { (_xnot { _applyWithArgs("seq", "\"") };_applyWithArgs("eChar", )) };_applyWithArgs("seq", "\"");['App', 'token',   xs.join('').inspect] )
end

def string
xs = nil

(xs = (_applyWithArgs("seq", "#");_applyWithArgs("tsName", ));['App', 'exactly', xs.inspect] )
end

def number
sign = ds = nil

(sign = _or(proc { _applyWithArgs("seq", "-") }, proc { (_applyWithArgs("empty", ); '' ) });ds = _xmany1 { _applyWithArgs("digit", ) };['App', 'exactly', sign + ds.join('')] )
end

def keyword
xs = nil

(xs = _apply("anything");_applyWithArgs("token", xs);_xnot { _applyWithArgs("letterOrDigit", ) };xs )
end

def hostExpr
r = nil

(r = _applyWithArgs("foreign", BSRubyParser, "expr", );_applyWithArgs("foreign", BSRubyTranslator, "trans", r))
end

def atomicHostExpr
r = nil

(r = _applyWithArgs("foreign", BSRubyParser, "semAction", );_applyWithArgs("foreign", BSRubyTranslator, "trans", r))
end

def inlineHostExpr
r = nil

(r = _applyWithArgs("foreign", BSRubyParser, "semAction2", );_applyWithArgs("foreign", BSRubyTranslator, "trans", r))
end

def args
xs = nil

_or(proc { (_xnot { _applyWithArgs("space", ) };xs = _applyWithArgs("hostExpr", );xs ) }, proc { (_applyWithArgs("empty", );"" ) })
end

def application
klas = rule = as = nil

_or(proc { (klas = _applyWithArgs("name", );_applyWithArgs("token", "::");rule = _applyWithArgs("name", );as = _applyWithArgs("args", );['App', 'foreign',klas,rule.inspect, *as] ) }, proc { (rule = _applyWithArgs("name", );as = _applyWithArgs("args", );['App', rule, *as] ) })
end

def expr
xs = nil

(xs = _applyWithArgs("listOf", "expr4", proc { _applyWithArgs("token", "|") });(xs.size==1 ? xs[0] : ['Or',        *xs] ))
end

def expr4
xs = nil

(xs = _xmany { _applyWithArgs("expr3", ) };(xs.size==1 ? xs[0] : ['And',       *xs] ))
end

def optIter
x = nil

(x = _apply("anything");_or(proc { (_applyWithArgs("token", "*");['Many',        x]) }, proc { (_applyWithArgs("token", "+");['Many1',       x] ) }, proc { (_applyWithArgs("token", "?");_xnot { _applyWithArgs("inlineHostExpr", ) };['Or', x,['App','empty']] ) }, proc { (_applyWithArgs("empty", );x ) }))
end

def binding
x = n = e = nil

(x = _apply("anything");_or(proc { (_applyWithArgs("seq", ":");n = _applyWithArgs("name", );_or(proc { (_applyWithArgs("seq", "[");_applyWithArgs("seq", "]");@arrays << n; ['Append', n, x] ) }, proc { (_applyWithArgs("empty", );@locals << n; ['Set', n, x]) })) }, proc { (_applyWithArgs("seq", ":");e = _applyWithArgs("inlineHostExpr", );@locals << "it";  ['And',['Set','it',x],['Pred',e]]) }))
end

def expr3
x = nil

_or(proc { (x = _applyWithArgs("expr2", );x = _applyWithArgs("optIter", x);_or(proc { _applyWithArgs("binding", x) }, proc { (_applyWithArgs("empty", );x) })) }, proc { (_applyWithArgs("spaces", ); x=['App','anything'];_applyWithArgs("binding", x)) })
end

def expr2
x = nil

_or(proc { (_applyWithArgs("token", "~");x = _applyWithArgs("expr2", );['Not',         x] ) }, proc { (_applyWithArgs("token", "&");_xnot { _applyWithArgs("inlineHostExpr", ) };x = _applyWithArgs("expr1", );['Lookahead',   x] ) }, proc { _applyWithArgs("expr1", ) })
end

def expr1
c = x = var = args = nil

_or(proc { (_applyWithArgs("spaces", );c = _applyWithArgs("className", );_applyWithArgs("seq", "[");x = _applyWithArgs("expr", );_applyWithArgs("token", "]");['Form',['And', ['App',"clas",c.inspect]  ,x]]) }, proc { _applyWithArgs("application", ) }, proc { (_applyWithArgs("token", "@");var = _applyWithArgs("name", );x = _or(proc { (_applyWithArgs("token", "=>");_applyWithArgs("application", )) }, proc { (_applyWithArgs("empty", );['App',"anything"]) });['Key',  var,   x]) }, proc { (_applyWithArgs("token", "->");x = _applyWithArgs("atomicHostExpr", );['Act',         x]) }, proc { (_applyWithArgs("token", "&");x = _applyWithArgs("inlineHostExpr", );['Pred',        x]) }, proc { (_applyWithArgs("spaces", );_or(proc { _applyWithArgs("characters", ) }, proc { _applyWithArgs("sCharacters", ) }, proc { _applyWithArgs("string", ) }, proc { _applyWithArgs("number", ) })) }, proc { (_applyWithArgs("token", "[");x = _applyWithArgs("expr", );_applyWithArgs("token", "]");['Form', x]) }, proc { (_applyWithArgs("token", "%");c = _or(proc { _applyWithArgs("className", ) }, proc { (_applyWithArgs("empty", );"Array") });_applyWithArgs("seq", "[");args = _applyWithArgs("klasargs", );_applyWithArgs("token", "]");Klass.new(c,args)) }, proc { (_applyWithArgs("token", "<");x = _xmany1 { (_xnot { _applyWithArgs("token", ">") };_applyWithArgs("eChar", )) };_applyWithArgs("token", ">");['App', 'regch', x.join('').inspect] ) }, proc { (_applyWithArgs("token", "(");x = _applyWithArgs("expr", );_applyWithArgs("token", ")");x ) })
end

def klasargs
a = nil

(a = _xmany { _applyWithArgs("regch", "^\\]") };a*"")
end

def ruleName


_or(proc { _applyWithArgs("name", ) }, proc { (_applyWithArgs("spaces", );_applyWithArgs("tsString", )) })
end

def rule
n = x = xs = nil

(_xlookahead { n = _applyWithArgs("ruleName", ) };@locals = []; @arrays = [];x = _applyWithArgs("rulePart", n);xs = _xmany { (_applyWithArgs("token", ",");_applyWithArgs("rulePart", n)) };['Rule', n, @locals.uniq,@arrays.uniq, ['Or', x, *xs]] )
end

def rulePart
rn = n = b1 = b2 = nil

(rn = _apply("anything");n = _applyWithArgs("ruleName", );_pred(n == rn);b1 = _applyWithArgs("expr4", );_or(proc { (_applyWithArgs("token", "=");b2 = _applyWithArgs("expr", );['And', b1, b2] ) }, proc { (_applyWithArgs("empty", );b1 ) }))
end

def grammar
n = sn = rs = nil

(_applyWithArgs("keyword", "ometa");n = _applyWithArgs("name", );sn = _or(proc { (_applyWithArgs("token", "<:");_applyWithArgs("name", )) }, proc { (_applyWithArgs("empty", ); 'OMeta' ) });_applyWithArgs("token", "{");rs = _applyWithArgs("listOf", "rule", proc { _applyWithArgs("token", ",") });_applyWithArgs("token", "}");['Grammar', n, sn, *rs])
end
end

ometa RubyOMetaTranslator {
  trans = Klass[ @name:name  @args:args	] 	  -> {"#{name}.new(#{args})"}
| [:t apply(t):ans]             -> { ans },
  App  'super' arg+:args      =   -> { "_superApplyWithArgs(#{args*", "})" },
  App  :rule   arg+:args      =   -> { "_applyWithArgs(#{rule.inspect}, #{args*", "})" },
  App  :rule                       =   -> { "_apply(#{rule.inspect})" },	
	arg = [  ag*:m ] -> m*""
				| :s &{s.is_a? String} -> s
	,
	ag= char
	 | [ transFn:t ] -> t
,
  Act  :expr                       =   -> { expr },
  Pred :expr                       =   -> { "_pred(#{expr})" },
  Or   transFn*:xs                 =   -> { "_or(#{xs * ', '})" },
  And  notLast("trans")*:xs trans:y= -> { "(#{(xs + [y]) * ';'})" },
  And                              =   -> { "proc {}" },
  Many  trans:x                    =   -> { "_xmany { #{x} }" },
	Many1 trans:x                    =   -> { "_xmany1 { #{x} }" },
  Set   :n trans:v                 =   -> { "#{n} = #{v}" },
  Append :n trans:v								 = 	 -> { "_append(#{n} , #{v})" },
	Not   trans:x                    =   -> { "_xnot { #{x} }" },
  Lookahead trans:x                =   -> { "_xlookahead { #{x} }" },
  Form  trans:x                    =   -> { "_xform { #{x} }" },
  Key		:name transFn:x							 =   -> {	"_key(#{name.inspect},#{x})"	},
	Rule  :name locals:ls arrays:ars trans:body =   -> { "def #{name}\n#{ls}\n#{ars}\n#{body}\nend\n" },
  Grammar :name :sName
          trans*:rules             =   -> { "Class.new(#{sName}) do\n@name = #{name.inspect}\n#{rules * "\n"}end" },
  locals  = [anything+:vs]            -> { vs.map { |v| "#{v} = " }.join('') + 'nil' }
          | []                        -> { '' },
  arrays  = [anything+:vs]            -> { vs.map { |v| "#{v} = " }.join('') + '[]' }
          | []                        -> { '' },
  transFn = trans:x                   -> { "proc { #{x} }" }
}

["Grammar", "RubyOMetaTranslator", "OMeta", ["Rule", "trans", ["name", "args", "t", "ans"], [], ["Or", ["And", ["And"], ["Or", ["And", ["Form", ["And", ["App", "clas", "\"Klass\""], ["And", ["Set", "name", ["Key", "name", ["App", "anything"]]], ["Set", "args", ["Key", "args", ["App", "anything"]]]]]], ["Act", "\"\#{name}.new(\#{args})\""]], ["And", ["Form", ["And", ["Set", "t", ["App", "anything"]], ["Set", "ans", ["App", "apply", ['t']]]]], ["Act", " ans "]]]]]], ["Rule", "App", ["args", "rule"], [], ["Or", ["And", ["And", ["App", "seq", "\"super\""], ["Set", "args", ["Many1", ["App", "arg", ""]]]], ["Act", " \"_superApplyWithArgs(\#{args*\", \"})\" "]], ["And", ["And", ["Set", "rule", ["App", "anything"]], ["Set", "args", ["Many1", ["App", "arg", ""]]]], ["Act", " \"_applyWithArgs(\#{rule.inspect}, \#{args*\", \"})\" "]], ["And", ["Set", "rule", ["App", "anything"]], ["Act", " \"_apply(\#{rule.inspect})\" "]]]], ["Rule", "arg", ["m", "s"], [], ["Or", ["And", ["And"], ["Or", ["And", ["Form", ["Set", "m", ["Many", ["App", "ag", ""]]]], ["Act", "m*\"\""]], ["And", ["Set", "s", ["App", "anything"]], ["Pred", "s.is_a? String"], ["Act", "s"]]]]]], ["Rule", "ag", ["t"], [], ["Or", ["And", ["And"], ["Or", ["App", "char", ""], ["And", ["Form", ["Set", "t", ["App", "transFn", ""]]], ["Act", "t"]]]]]], ["Rule", "Act", ["expr"], [], ["Or", ["And", ["Set", "expr", ["App", "anything"]], ["Act", " expr "]]]], ["Rule", "Pred", ["expr"], [], ["Or", ["And", ["Set", "expr", ["App", "anything"]], ["Act", " \"_pred(\#{expr})\" "]]]], ["Rule", "Or", ["xs"], [], ["Or", ["And", ["Set", "xs", ["Many", ["App", "transFn", ""]]], ["Act", " \"_or(\#{xs * ', '})\" "]]]], ["Rule", "And", ["xs", "y"], [], ["Or", ["And", ["And", ["Set", "xs", ["Many", ["App", "notLast", ['\"', 't', 'r', 'a', 'n', 's', '\"']]]], ["Set", "y", ["App", "trans", ""]]], ["Act", " \"(\#{(xs + [y]) * ';'})\" "]], ["And", ["And"], ["Act", " \"proc {}\" "]]]], ["Rule", "Many", ["x"], [], ["Or", ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"_xmany { \#{x} }\" "]]]], ["Rule", "Many1", ["x"], [], ["Or", ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"_xmany1 { \#{x} }\" "]]]], ["Rule", "Set", ["n", "v"], [], ["Or", ["And", ["And", ["Set", "n", ["App", "anything"]], ["Set", "v", ["App", "trans", ""]]], ["Act", " \"\#{n} = \#{v}\" "]]]], ["Rule", "Append", ["n", "v"], [], ["Or", ["And", ["And", ["Set", "n", ["App", "anything"]], ["Set", "v", ["App", "trans", ""]]], ["Act", " \"_append(\#{n} , \#{v})\" "]]]], ["Rule", "Not", ["x"], [], ["Or", ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"_xnot { \#{x} }\" "]]]], ["Rule", "Lookahead", ["x"], [], ["Or", ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"_xlookahead { \#{x} }\" "]]]], ["Rule", "Form", ["x"], [], ["Or", ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"_xform { \#{x} }\" "]]]], ["Rule", "Key", ["name", "x"], [], ["Or", ["And", ["And", ["Set", "name", ["App", "anything"]], ["Set", "x", ["App", "transFn", ""]]], ["Act", "\t\"_key(\#{name.inspect},\#{x})\"\t"]]]], ["Rule", "Rule", ["name", "ls", "ars", "body"], [], ["Or", ["And", ["And", ["Set", "name", ["App", "anything"]], ["Set", "ls", ["App", "locals", ""]], ["Set", "ars", ["App", "arrays", ""]], ["Set", "body", ["App", "trans", ""]]], ["Act", " \"def \#{name}\\n\#{ls}\\n\#{ars}\\n\#{body}\\nend\\n\" "]]]], ["Rule", "Grammar", ["name", "sName", "rules"], [], ["Or", ["And", ["And", ["Set", "name", ["App", "anything"]], ["Set", "sName", ["App", "anything"]], ["Set", "rules", ["Many", ["App", "trans", ""]]]], ["Act", " \"Class.new(\#{sName}) do\\n@name = \#{name.inspect}\\n\#{rules * \"\\n\"}end\" "]]]], ["Rule", "locals", ["vs"], [], ["Or", ["And", ["And"], ["Or", ["And", ["Form", ["Set", "vs", ["Many1", ["App", "anything", ""]]]], ["Act", " vs.map { |v| \"\#{v} = \" }.join('') + 'nil' "]], ["And", ["Form", ["And"]], ["Act", " '' "]]]]]], ["Rule", "arrays", ["vs"], [], ["Or", ["And", ["And"], ["Or", ["And", ["Form", ["Set", "vs", ["Many1", ["App", "anything", ""]]]], ["Act", " vs.map { |v| \"\#{v} = \" }.join('') + '[]' "]], ["And", ["Form", ["And"]], ["Act", " '' "]]]]]], ["Rule", "transFn", ["x"], [], ["Or", ["And", ["And"], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"proc { \#{x} }\" "]]]]]]
["Grammar", "RubyOMetaTranslator", "OMeta", ["Rule", "trans", ["name", "args", "t", "ans"], [], ["Or", ["And", ["Form", ["And", ["App", "clas", "\"Klass\""], ["Set", "name", ["Key", "name", ["App", "anything"]]], ["Set", "args", ["Key", "args", ["App", "anything"]]]]], ["Act", "\"\#{name}.new(\#{args})\""]], ["And", ["Form", ["And", ["Set", "t", ["App", "anything"]], ["Set", "ans", ["App", "apply", ['t']]]]], ["Act", " ans "]]]], ["Rule", "App", ["args", "rule"], [], ["Or", ["And", ["App", "seq", "\"super\""], ["Set", "args", ["Many1", ["App", "arg", ""]]], ["Act", " \"_superApplyWithArgs(\#{args*\", \"})\" "]], ["And", ["Set", "rule", ["App", "anything"]], ["Set", "args", ["Many1", ["App", "arg", ""]]], ["Act", " \"_applyWithArgs(\#{rule.inspect}, \#{args*\", \"})\" "]], ["And", ["Set", "rule", ["App", "anything"]], ["Act", " \"_apply(\#{rule.inspect})\" "]]]], ["Rule", "arg", ["m", "s"], [], ["Or", ["And", ["Form", ["Set", "m", ["Many", ["App", "ag", ""]]]], ["Act", "m*\"\""]], ["And", ["Set", "s", ["App", "anything"]], ["Pred", "s.is_a? String"], ["Act", "s"]]]], ["Rule", "ag", ["t"], [], ["Or", ["App", "char", ""], ["And", ["Form", ["Set", "t", ["App", "transFn", ""]]], ["Act", "t"]]]], ["Rule", "Act", ["expr"], [], ["And", ["Set", "expr", ["App", "anything"]], ["Act", " expr "]]], ["Rule", "Pred", ["expr"], [], ["And", ["Set", "expr", ["App", "anything"]], ["Act", " \"_pred(\#{expr})\" "]]], ["Rule", "Or", ["xs"], [], ["And", ["Set", "xs", ["Many", ["App", "transFn", ""]]], ["Act", " \"_or(\#{xs * ', '})\" "]]], ["Rule", "And", ["xs", "y"], [], ["Or", ["And", ["Set", "xs", ["Many", ["App", "notLast", ['\"', 't', 'r', 'a', 'n', 's', '\"']]]], ["Set", "y", ["App", "trans", ""]], ["Act", " \"(\#{(xs + [y]) * ';'})\" "]], ["Act", " \"proc {}\" "]]], ["Rule", "Many", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"_xmany { \#{x} }\" "]]], ["Rule", "Many1", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"_xmany1 { \#{x} }\" "]]], ["Rule", "Set", ["n", "v"], [], ["And", ["Set", "n", ["App", "anything"]], ["Set", "v", ["App", "trans", ""]], ["Act", " \"\#{n} = \#{v}\" "]]], ["Rule", "Append", ["n", "v"], [], ["And", ["Set", "n", ["App", "anything"]], ["Set", "v", ["App", "trans", ""]], ["Act", " \"_append(\#{n} , \#{v})\" "]]], ["Rule", "Not", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"_xnot { \#{x} }\" "]]], ["Rule", "Lookahead", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"_xlookahead { \#{x} }\" "]]], ["Rule", "Form", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"_xform { \#{x} }\" "]]], ["Rule", "Key", ["name", "x"], [], ["And", ["Set", "name", ["App", "anything"]], ["Set", "x", ["App", "transFn", ""]], ["Act", "\t\"_key(\#{name.inspect},\#{x})\"\t"]]], ["Rule", "Rule", ["name", "ls", "ars", "body"], [], ["And", ["Set", "name", ["App", "anything"]], ["Set", "ls", ["App", "locals", ""]], ["Set", "ars", ["App", "arrays", ""]], ["Set", "body", ["App", "trans", ""]], ["Act", " \"def \#{name}\\n\#{ls}\\n\#{ars}\\n\#{body}\\nend\\n\" "]]], ["Rule", "Grammar", ["name", "sName", "rules"], [], ["And", ["Set", "name", ["App", "anything"]], ["Set", "sName", ["App", "anything"]], ["Set", "rules", ["Many", ["App", "trans", ""]]], ["Act", " \"Class.new(\#{sName}) do\\n@name = \#{name.inspect}\\n\#{rules * \"\\n\"}end\" "]]], ["Rule", "locals", ["vs"], [], ["Or", ["And", ["Form", ["Set", "vs", ["Many1", ["App", "anything", ""]]]], ["Act", " vs.map { |v| \"\#{v} = \" }.join('') + 'nil' "]], ["And", ["Form", ["And"]], ["Act", " '' "]]]], ["Rule", "arrays", ["vs"], [], ["Or", ["And", ["Form", ["Set", "vs", ["Many1", ["App", "anything", ""]]]], ["Act", " vs.map { |v| \"\#{v} = \" }.join('') + '[]' "]], ["And", ["Form", ["And"]], ["Act", " '' "]]]], ["Rule", "transFn", ["x"], [], ["And", ["Set", "x", ["App", "trans", ""]], ["Act", " \"proc { \#{x} }\" "]]]]
Class.new(OMeta) do
@name = "RubyOMetaTranslator"
def trans
name = args = t = ans = nil

_or(proc { (_xform { (_applyWithArgs("clas", "Klass");name = _key("name",proc { _apply("anything") });args = _key("args",proc { _apply("anything") })) };"#{name}.new(#{args})") }, proc { (_xform { (t = _apply("anything");ans = _applyWithArgs("apply", t)) }; ans ) })
end

def App
args = rule = nil

_or(proc { (_applyWithArgs("seq", "super");args = _xmany1 { _applyWithArgs("arg", ) }; "_superApplyWithArgs(#{args*", "})" ) }, proc { (rule = _apply("anything");args = _xmany1 { _applyWithArgs("arg", ) }; "_applyWithArgs(#{rule.inspect}, #{args*", "})" ) }, proc { (rule = _apply("anything"); "_apply(#{rule.inspect})" ) })
end

def arg
m = s = nil

_or(proc { (_xform { m = _xmany { _applyWithArgs("ag", ) } };m*"") }, proc { (s = _apply("anything");_pred(s.is_a? String);s) })
end

def ag
t = nil

_or(proc { _applyWithArgs("char", ) }, proc { (_xform { t = _applyWithArgs("transFn", ) };t) })
end

def Act
expr = nil

(expr = _apply("anything"); expr )
end

def Pred
expr = nil

(expr = _apply("anything"); "_pred(#{expr})" )
end

def Or
xs = nil

(xs = _xmany { _applyWithArgs("transFn", ) }; "_or(#{xs * ', '})" )
end

def And
xs = y = nil

_or(proc { (xs = _xmany { _applyWithArgs("notLast", "trans") };y = _applyWithArgs("trans", ); "(#{(xs + [y]) * ';'})" ) }, proc {  "proc {}"  })
end

def Many
x = nil

(x = _applyWithArgs("trans", ); "_xmany { #{x} }" )
end

def Many1
x = nil

(x = _applyWithArgs("trans", ); "_xmany1 { #{x} }" )
end

def Set
n = v = nil

(n = _apply("anything");v = _applyWithArgs("trans", ); "#{n} = #{v}" )
end

def Append
n = v = nil

(n = _apply("anything");v = _applyWithArgs("trans", ); "_append(#{n} , #{v})" )
end

def Not
x = nil

(x = _applyWithArgs("trans", ); "_xnot { #{x} }" )
end

def Lookahead
x = nil

(x = _applyWithArgs("trans", ); "_xlookahead { #{x} }" )
end

def Form
x = nil

(x = _applyWithArgs("trans", ); "_xform { #{x} }" )
end

def Key
name = x = nil

(name = _apply("anything");x = _applyWithArgs("transFn", );	"_key(#{name.inspect},#{x})"	)
end

def Rule
name = ls = ars = body = nil

(name = _apply("anything");ls = _applyWithArgs("locals", );ars = _applyWithArgs("arrays", );body = _applyWithArgs("trans", ); "def #{name}\n#{ls}\n#{ars}\n#{body}\nend\n" )
end

def Grammar
name = sName = rules = nil

(name = _apply("anything");sName = _apply("anything");rules = _xmany { _applyWithArgs("trans", ) }; "Class.new(#{sName}) do\n@name = #{name.inspect}\n#{rules * "\n"}end" )
end

def locals
vs = nil

_or(proc { (_xform { vs = _xmany1 { _applyWithArgs("anything", ) } }; vs.map { |v| "#{v} = " }.join('') + 'nil' ) }, proc { (_xform { proc {} }; '' ) })
end

def arrays
vs = nil

_or(proc { (_xform { vs = _xmany1 { _applyWithArgs("anything", ) } }; vs.map { |v| "#{v} = " }.join('') + '[]' ) }, proc { (_xform { proc {} }; '' ) })
end

def transFn
x = nil

(x = _applyWithArgs("trans", ); "proc { #{x} }" )
end
end
