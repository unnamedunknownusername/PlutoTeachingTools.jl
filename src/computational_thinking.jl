
using Random # , Distributions # not sure if we need that
using Markdown
using LaTeXStrings
using HypertextLiteral 

export hint, tip, protip, almost, warning_box, question_box, answer_box, danger, keyconcept
export correct, still_missing, still_nothing, wrong_type
export var_not_defined, func_not_defined, keep_working
export not_defined  # deprecated
#export keep_working_if_var_contains_substr
export type_isa, type_eq
export code_for_check_type_funcs
export TODO, nbsp
export blockquote
export display_msg_if_fail

"Hint box with arguement as text."
hint(text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("hint", hint_str(lang), [text]));

"Tip box with arguement as text."
tip(text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("tip", tip_str(lang), [text]));

"Tip box with arguement as text."
protip(text; lang::AbstractLanguage = default_language[], invite = protip_invite_str(lang), boxlabel = protip_boxlabel_str(lang)) = Foldable(invite, Markdown.MD(Markdown.Admonition("tip", boxlabel, [text])) );
protip(text, invite, lang::AbstractLanguage = default_language[]; boxlabel = protip_boxlabel_str(lang)) = protip(text; lang, invite, boxlabel);

"Answer box with arguement as text."
answer_box(text; lang::AbstractLanguage = default_language[], invite = answer_invite_str(lang), boxlabel = answer_boxlabel_str(lang)) = Foldable(invite, Markdown.MD(Markdown.Admonition("answer", boxlabel, [text])) );
answer_box(text, invite, lang::AbstractLanguage = default_language[]; boxlabel = answer_boxlabel_str(lang)) = answer(text; lang, invite, boxlabel);

"Admonition box labeled a warning with arguement as text."
almost(text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("warning", almost_str(lang), [text]));

"Warning box with arguement as text."
warning_box(text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("warning", warning_box_str(lang), [text]));

"Question box with arguement as text."
question_box(text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("question", question_box_str(lang), [text]));

"Key concept box with concept name and description as input arguments."
keyconcept(concept, text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("key-concept", keyconcept_str(lang), [md"**$concept**", text]))

"Danger box with arguement as text."
danger(text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("danger", danger_str(lang), [text]));

"Admonition box with reminder to replace missing."
still_missing(;lang::AbstractLanguage = default_language[], text=still_missing_text_str(lang)) = Markdown.MD(Markdown.Admonition("warning", still_missing_str(lang), [text]));
still_missing(text, lang::AbstractLanguage = default_language[]) = still_missing(;lang, text);

"Admonition box with reminder to replace nothing."
still_nothing(; lang::AbstractLanguage = default_language[], text=still_nothing_text_str(lang)) = Markdown.MD(Markdown.Admonition("warning", still_nothing_str(lang), [text]));
still_nothing(text, lang::AbstractLanguage = default_language[]) = still_nothing(;lang, text);

wrong_type(lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("danger", wrong_type_str(lang), [wrong_type_text_str(lang)]))

wrong_type(var::Symbol, type::Type, lang::AbstractLanguage = default_language[]; text=wrong_type_text_str(lang, var, type)) = Markdown.MD(Markdown.Admonition("danger", wrong_type_str(lang), [text]))

"Admonition box with reminder that function name passed is not defined."
func_not_defined(func_name, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("danger", func_not_defined_str(lang), [func_not_defined_text_str(func_name, lang)]));

"Admonition box with reminder that variable name passed is not defined."
var_not_defined(variable_name, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("danger", var_not_defined_str(lang), [var_not_defined_text_str(variable_name, lang)]));

"Admonition box with reminder that variable name passed is not defined. (deprecated)"
not_defined(variable_name, lang::AbstractLanguage = default_language[]) = var_not_defined(variable_name, lang)

"Admonition box warning that the answer isn't quite right."
keep_working(; lang::AbstractLanguage = default_language[], text=keep_working_text_str(lang)) = Markdown.MD(Markdown.Admonition("danger", keep_working_str(lang), [text]));
keep_working(text, lang::AbstractLanguage = default_language[]) = keep_working(;lang, text);

function keep_working_if_var_contains_substr(var::Symbol,str::Union{String,Markdown.MD},substr::String, lang::AbstractLanguage = default_language[])
# I had to remove !@isdefined(var) due to how Pluto puts variables into different modules
# not exported, so provide function with same name in notebook
  if     ismissing(var)
         still_missing()
  elseif isnothing(var)
         still_nothing()
  else
      if typeof(str) == Markdown.MD
         str = Markdown.plain(str)
      end
      if occursin(substr,str)
         keep_working(keep_working_update_str(var, lang))
      end
  end
end

type_isa(var, t::Union{Type,Vector{Type},Vector{DataType}}) = (any(typeof(var) .<: t))
type_eq(var, t::Union{Type,Vector{Type},Vector{DataType}}) = (any(typeof(var) .== t))

# To use functions in notebook, run eval(Meta.parse(code_for_check_type_funcs)) 
code_for_check_type_funcs = """
begin
function check_type_isa(sym::Symbol, var, t::Union{Type,Vector{Type},Vector{DataType}}, lang::AbstractLanguage = PlutoTeachingTools.default_language[])
   if ismissing(var)
        passed = false
        text = PlutoTeachingTools.check_type_isa_missing_text_str(sym, lang)
        msg = still_missing(text, lang)
   elseif !type_isa(var,t) # (any(typeof(var) .<: t))
        passed = false
        text = PlutoTeachingTools.check_type_isa_wrong_type_text_str(sym, lang)
        if typeof(t) <: Type
           text = text * "\$t."
        else
           text = text * PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(lang) * " "
           for tt in t
              if tt == last(t)
                 text = text * " " * PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang) * " \$t."
              else
                 text = text * " \$t,"
              end
           end
        end
        msg = Markdown.MD(Markdown.Admonition("danger", PlutoTeachingTools.check_type_isa_type_error_str(sym, lang), [Markdown.MD(text)]))
   else
        passed = true
        msg = PlutoTeachingTools.check_type_isa_not_missing_text_str(sym, lang)
   end
   return (;passed, msg)
end
function check_type_eq(sym::Symbol, var, t::Union{Type,Vector{Type},Vector{DataType}}, lang::AbstractLanguage = PlutoTeachingTools.default_language[])
   if ismissing(var)
        passed = false
        text = PlutoTeachingTools.check_type_eq_missing_text_str(sym, lang)
        msg = PlutoTeachingTools.still_missing(text, lang)
   elseif !type_eq(var, t) # (any(typeof(var) == t))
        passed = false
        if typeof(t) <: Type
           text = PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(sym, type, lang)
        else
           text = PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(sym, lang)
           for tt in t
              if tt == last(t)
                 text = text * " " * PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang) * " \$t."
              else
                 text = text * " \$t,"
              end
           end
        end
        #text = md"The type of \$sym should be \$t."
        msg = Markdown.MD(Markdown.Admonition("danger", PlutoTeachingTools.check_type_eq_type_error_str(lang), [Markdown.MD(text)]))
   else
        passed = true
        msg = PlutoTeachingTools.check_type_eq_correct_str(sym, lang)
   end
   return (;passed, msg)
end
end
"""

"Box with random positive message."
correct(;lang::AbstractLanguage = default_language[], text=rand(yays(lang))) = Markdown.MD(Markdown.Admonition("correct", correct_str(lang), [text]));
correct(text, lang::AbstractLanguage = default_language[]) = correct(;lang, text);

#TODO_str = html"<span style='display: inline; font-size: 2em; color: purple; font-weight: 900;'>TODO</span>"
#TODO() = TODO_str

"""
Displays nice TODO graphic inline as an H1 heading (so will show up in PlutoUI's table of contents). 
Useful for demarcating work-in-progress sections or parts that could be imporved or will be worked on later, etc.
"""
function TODO end

TODO(text, lang::AbstractLanguage = default_language[]; heading=todo_str(lang)) = TODO(; lang, text, heading)

function TODO(;lang::AbstractLanguage = default_language[], text = "", heading=todo_str(lang))
@htl("""
<div class="todo-tape">
</div> 
<div class="todo-tape-content">
<h1>&#9888; $heading &#9888;</h1>
<p>$text</p>
</div> 
<div class="todo-tape">
</div> 


<style> 
div.todo-tape {
padding: 1rem;
background: repeating-linear-gradient(
45deg,
#FFE41E,
#FFE41E 12px,
#141617 12px,
#141617 24px
);
}

div.todo-tape-content {
padding:1.2rem;
background-color: white;
}
</style>
""")
end

# Useful strings for embedding in markdown
nbsp = html"&nbsp;"

function display_msg_if_fail(x; msg_pass = nothing)
   if !x.passed
      x.msg
   else
      msg_pass
   end 
end



"""
Displays a nice blockquote. Useful for including quotes by well known figures or useful nuggets of wisdom.  
"""
function blockquote(text,author="")
@htl("""
<div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted">
<p class="nice-blockquote__text">
$text
<p>
<div class="nice-blockquote__text nice-blockquote__text--author">
$author
</div> 
</div> 
<style> 
.nice-blockquote{
padding: 25px;
background: light grey;
border: 0.5px solid #ccc;
color: black;
box-sizing:border-box;
overflow-y:hidden;
}
.nice-blockquote__bordered{
border-left-width: 14px;
}
.nice-blockquote--quoted::before{
content:open-quote;
font-size:70px;
font-family: Arial;
font-weight:bold;
color:#ccc;
display:block;
margin-top:-20px;
margin-bottom:-40px;
font-family: Arial;
}
.nice-blockquote__text{
font-family: Arial;
font-style: italic;
fontsize: 1.5em;	
margin:0;
line height: 1.5;
text-align:left;
}
.nice-blockquote__text:not(:last_child){
margin-bottom:10px;
}
.nice-blockquote__text--author{
font-weight:bold;
font-style: normal;
text-align:right;
fontsize: 2em;
}
.nice-blockquote__text--author::before{
content:close-quote;
font-size:70px;
font-family: Arial;
font-weight:bold;
color:#ccc;
display:block;
margin-top:-28px;
margin-bottom:-40px;
}
</style>
""")
end
