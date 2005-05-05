
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MODULE      : math-menu.scm
;; DESCRIPTION : menus for mathematical mode and mathematical symbols
;; COPYRIGHT   : (C) 1999  Joris van der Hoeven
;;
;; This software falls under the GNU general public license and comes WITHOUT
;; ANY WARRANTY WHATSOEVER. See the file $TEXMACS_PATH/LICENSE for details.
;; If you don't have this file, write to the Free Software Foundation, Inc.,
;; 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(texmacs-module (math math-menu)
  (:use (table table-edit)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The Mathematics menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind mathematics-menu
  ("Fraction" (make-fraction))
  ("Square root" (make-sqrt))
  ("N-th root" (make-var-sqrt))
  ("Negation" (make-neg))
  ("Tree" (make-tree))
  ("Text" (make-with "mode" "text"))
  ---
  (-> "Size tag" (link size-tag-menu))
  (-> "Script"
      ("Left subscript" (make-script #f #f))
      ("Left superscript" (make-script #t #f))
      ("Right subscript" (make-script #f #t))
      ("Right superscript" (make-script #t #t))
      ("Script below" (make-below))
      ("Script above" (make-above)))
  (-> "Accent#above"
      ("Tilda" (make-wide "~"))
      ("Hat" (make-wide "^"))
      ("Bar" (make-wide "<bar>"))
      ("Vector" (make-wide "<vect>"))
      ("Check" (make-wide "<check>"))
      ("Breve" (make-wide "<breve>"))
      ("Acute" (make-wide "<acute>"))
      ("Grave" (make-wide "<grave>"))
      ("Dot" (make-wide "<dot>"))
      ("Two dots" (make-wide "<ddot>"))
      ("Circle" (make-wide "<abovering>"))
      ---
      ("Overbrace" (make-wide "<wide-overbrace>"))
      ("Underbrace" (make-wide "<wide-underbrace*>"))
      ("Right arrow" (make-wide "<wide-varrightarrow>"))
      ("Left arrow" (make-wide "<wide-varleftarrow>"))
      ("Wide bar" (make-wide "<wide-bar>")))
  (-> "Accent#below"
      ("Tilda" (make-wide-under "~"))
      ("Hat" (make-wide-under "^"))
      ("Bar" (make-wide-under "<bar>"))
      ("Vector" (make-wide-under "<vect>"))
      ("Check" (make-wide-under "<check>"))
      ("Breve" (make-wide-under "<breve>"))
      ("Acute" (make-wide-under "<acute>"))
      ("Grave" (make-wide-under "<grave>"))
      ("Dot" (make-wide-under "<dot>"))
      ("Two dots" (make-wide-under "<ddot>"))
      ("Circle" (make-wide-under "<abovering>"))
      ---
      ("Overbrace" (make-wide-under "<wide-overbrace*>"))
      ("Underbrace" (make-wide-under "<wide-underbrace>"))
      ("Right arrow" (make-wide-under "<wide-varrightarrow>"))
      ("Left arrow" (make-wide-under "<wide-varleftarrow>"))
      ("Wide bar" (make-wide-under "<wide-bar>")))
  (-> "Symbol" (link symbol-menu))
  (if (or (table-inside? "eqnarray") (table-inside? "eqnarray*"))
      ---
      (if (not (table-equation-numbered?))
	  ("Number equation" (table-toggle-number-equation)))
      (if (table-equation-numbered?)
	  ("Remove number" (table-toggle-number-equation))))
  (if (inside? "equation")
      ---
      ("Remove number" (table-toggle-number-equation)))
  (if (inside? "equation*")
      ---
      ("Number equation" (table-toggle-number-equation)))
  (if (not (or (table-inside? "eqnarray") (table-inside? "eqnarray*")
	       (inside? "equation") (inside? "equation*")))
      (when #f ("Number equation" (table-toggle-number-equation)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The mathematical Symbol menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind symbol-menu
  (-> "Large opening bracket" (tile 8 (link left-delimiter-menu)))
  (-> "Large separator" (tile 8 (link middle-delimiter-menu)))
  (-> "Large closing bracket" (tile 8 (link right-delimiter-menu)))
  (-> "Big operator"
      (tile 8 (link big-operator-menu)))
  ---
  (-> "Binary operation"
      (tile 8 (link binary-operation-menu)))
  (-> "Binary relation"
      (tile 8 (link binary-relation-menu-1))
      ---
      (tile 8 (link binary-relation-menu-2)))
  (-> "Arrow"
      (tile 9 (link horizontal-arrow-menu))
      ---
      (tile 8 (link vertical-arrow-menu))
      ---
      (tile 6 (link long-arrow-menu)))
  (-> "Negation"
      ("General negation" "/" (key-press "/"))
      ---
      (tile 9 (link negation-menu-1))
      ---
      (tile 9 (link negation-menu-2)))
  ---
  (-> "Greek letter"
      (tile 8 (link lower-greek-menu))
      ---
      (tile 8 (link upper-greek-menu)))
  (-> "Miscellaneous"
      (tile 8 (link miscellaneous-symbol-menu))
      ---
      (tile 6 (link dots-menu))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Large delimiters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind left-delimiter-menu
  (symbol "<left-(-2>" (left "(") "A-(")
  (symbol "<left-)-2>" (left ")") "A-l )")
  (symbol "<left-[-2>" (left "[") "A-[")
  (symbol "<left-]-2>" (left "]") "A-l ]")
  (symbol "<left-{-2>" (left "{") "A-{")
  (symbol "<left-}-2>" (left "}") "A-l }")
  (symbol "<left-langle-2>" (left "langle") "A-<")
  (symbol "<left-rangle-2>" (left "rangle") "A-l >")
  (symbol "<left-lfloor-2>" (left "lfloor"))
  (symbol "<left-rfloor-2>" (left "rfloor"))
  (symbol "<left-lceil-2>" (left "lceil"))
  (symbol "<left-rceil-2>" (left "rceil"))
  (symbol "<left-llbracket-2>" (left "llbracket"))
  (symbol "<left-rrbracket-2>" (left "rrbracket"))
  (symbol "<left-|-4>" (left "|") "A-l |")
  (symbol "<left-||-4>" (left "||"))
  (symbol "<left-/-2>" (left "/") "A-l /")
  (symbol "<left-\\-2>" (left "\\") "A-l b")
  (symbol "<left-.-2>" (left ".") "A-l ."))

(menu-bind middle-delimiter-menu
  (symbol "<mid-(-2>" (mid "(") "A-m (")
  (symbol "<mid-)-2>" (mid ")") "A-m )")
  (symbol "<mid-[-2>" (mid "[") "A-m [")
  (symbol "<mid-]-2>" (mid "]") "A-m ]")
  (symbol "<mid-{-2>" (mid "{") "A-m {")
  (symbol "<mid-}-2>" (mid "}") "A-m }")
  (symbol "<mid-langle-2>" (mid "langle") "A-m <")
  (symbol "<mid-rangle-2>" (mid "rangle") "A-m >")
  (symbol "<mid-lfloor-2>" (mid "lfloor"))
  (symbol "<mid-rfloor-2>" (mid "rfloor"))
  (symbol "<mid-lceil-2>" (mid "lceil"))
  (symbol "<mid-rceil-2>" (mid "rceil"))
  (symbol "<mid-llbracket-2>" (mid "llbracket"))
  (symbol "<mid-rrbracket-2>" (mid "rrbracket"))
  (symbol "<mid-|-4>" (mid "|") "A-|")
  (symbol "<mid-||-4>" (mid "||"))
  (symbol "<mid-/-2>" (mid "/") "A-/")
  (symbol "<mid-\\-2>" (mid "\\") "A-b"))

(menu-bind right-delimiter-menu
  (symbol "<right-(-2>" (right "(") "A-r (")
  (symbol "<right-)-2>" (right ")") "A-)")
  (symbol "<right-[-2>" (right "[") "A-r [")
  (symbol "<right-]-2>" (right "]") "A-]")
  (symbol "<right-{-2>" (right "{") "A-r {")
  (symbol "<right-}-2>" (right "}") "A-}")
  (symbol "<right-langle-2>" (right "langle") "A-r <")
  (symbol "<right-rangle-2>" (right "rangle") "A->")
  (symbol "<right-lfloor-2>" (right "lfloor"))
  (symbol "<right-rfloor-2>" (right "rfloor"))
  (symbol "<right-lceil-2>" (right "lceil"))
  (symbol "<right-rceil-2>" (right "rceil"))
  (symbol "<right-llbracket-2>" (right "llbracket"))
  (symbol "<right-rrbracket-2>" (right "rrbracket"))
  (symbol "<right-|-4>" (right "|") "A-r |")
  (symbol "<right-||-4>" (right "||"))
  (symbol "<right-/-2>" (right "/") "A-r /")
  (symbol "<right-\\-2>" (right "\\") "A-r b")
  (symbol "<right-.-2>" (right ".") "A-r ."))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Big operators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind big-operator-menu
  (symbol "<big-sum-2>" (big "sum") "S-F5 S")
  (symbol "<big-prod-2>" (big "prod") "S-F5 P")
  (symbol "<big-int-2>" (big "int") "S-F5 I")
  (symbol "<big-oint-2>" (big "oint") "S-F5 O")
  (symbol "<big-amalg-2>" (big "amalg") "S-F5 A")
  (symbol "<big-cap-2>" (big "cap") "S-F5 N")
  (symbol "<big-cup-2>" (big "cup") "S-F5 U")
  (symbol "<big-wedge-2>" (big "wedge") "S-F5 W")
  (symbol "<big-vee-2>" (big "vee") "S-F5 V")
  (symbol "<big-odot-2>" (big "odot") "S-F5 @ .")
  (symbol "<big-oplus-2>" (big "oplus") "S-F5 @ +")
  (symbol "<big-otimes-2>" (big "otimes") "S-F5 @ x")
  (symbol "<big-sqcap-2>" (big "sqcap"))
  (symbol "<big-sqcup-2>" (big "sqcup"))
  (symbol "<big-curlywedge-2>" (big "curlywedge"))
  (symbol "<big-curlyvee-2>" (big "curlyvee"))
  (symbol "<big-triangleup-2>" (big "triangleup"))
  (symbol "<big-triangledown-2>" (big "triangledown"))
  (symbol "<big-box-2>" (big "box"))
  (symbol "<big-pluscup-2>" (big "pluscup"))
  (symbol "<big-parallel-2>" (big "parallel"))
  (symbol "<big-interleave-2>" (big "interleave"))
  (symbol "<big-.-2>" (big ".") "S-F5 ."))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Binary operations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind binary-operation-menu
  (symbol "<oplus>")
  (symbol "<ominus>")
  (symbol "<otimes>")
  (symbol "<oslash>")
  (symbol "<odot>")
  (symbol "<varocircle>")
  (symbol "<circledast>")
  (symbol "<obar>")
  (symbol "<boxplus>")
  (symbol "<boxminus>")
  (symbol "<boxtimes>")
  (symbol "<boxslash>")
  (symbol "<boxdot>")
  (symbol "<boxbox>")
  (symbol "<boxast>")
  (symbol "<boxbar>")

  (symbol "<pm>")
  (symbol "<mp>")
  (symbol "<times>")
  (symbol "<div>")
  (symbol "<ast>")
  (symbol "<star>")
  (symbol "<circ>")
  (symbol "<bullet>")
  (symbol "<cdot>")
  (symbol "<cap>")
  (symbol "<cup>")
  (symbol "<uplus>")
  (symbol "<sqcap>")
  (symbol "<sqcup>")
  (symbol "<vee>")
  (symbol "<wedge>")
  
  (symbol "<ltimes>")
  (symbol "<rtimes>")
  (symbol "<leftthreetimes>")
  (symbol "<rightthreetimes>")
  (symbol "<curlyvee>")
  (symbol "<curlywedge>")
  (symbol "<veebar>")
  (symbol "<barwedge>"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Binary relations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind binary-relation-menu-1
  (symbol "<sim>")
  (symbol "<simeq>")
  (symbol "<approx>")
  (symbol "<cong>")
  (symbol "<asymp>")
  (symbol "<equiv>")
  (symbol "<asympasymp>")
  (symbol "<simsim>")
  (symbol "<bumpeq>")
  (symbol "<Bumpeq>")
  (symbol "<circeq>")
  (symbol "<backsim>")
  (symbol "<backsimeq>")
  (symbol "<eqcirc>")
  (symbol "<thicksim>")
  (symbol "<thickapprox>")
  (symbol "<approxeq>")
  (symbol "<triangleq>")
  (symbol "<neq>" "= /")
  (symbol "<nin>")
  (symbol "<perp>")
  (symbol "<smile>")
  (symbol "<frown>")
  (symbol "<propto>"))

(menu-bind binary-relation-menu-2
  (symbol "<less>")
  (symbol "<leqslant>")
  (symbol "<leq>")
  (symbol "<leqq>")
  (symbol "<ll>")
  (symbol "<lleq>")
  (symbol "<lll>")
  (symbol "<llleq>")
  (symbol "<gtr>")
  (symbol "<geqslant>")
  (symbol "<geq>")
  (symbol "<geqq>")
  (symbol "<gg>")
  (symbol "<ggeq>")
  (symbol "<ggg>")
  (symbol "<gggeq>")

  (symbol "<prec>")
  (symbol "<preccurlyeq>")
  (symbol "<preceq>")
  (symbol "<precsim>")
  (symbol "<precprec>")
  (symbol "<precpreceq>")
  (symbol "<precprecprec>")
  (symbol "<precprecpreceq>")
  (symbol "<succ>")
  (symbol "<succcurlyeq>")
  (symbol "<succeq>")
  (symbol "<succsim>")
  (symbol "<succsucc>")
  (symbol "<succsucceq>")
  (symbol "<succsuccsucc>")
  (symbol "<succsuccsucceq>")

  (symbol "<subset>")
  (symbol "<subseteq>")
  (symbol "<subseteqq>")
  (symbol "<sqsubset>")
  (symbol "<sqsubseteq>")
  (symbol "<Subset>")
  (symbol "<subsetplus>")
  (symbol "<in>")
  (symbol "<supset>")
  (symbol "<supseteq>")
  (symbol "<supseteqq>")
  (symbol "<sqsupset>")
  (symbol "<sqsupseteq>")
  (symbol "<Supset>")
  (symbol "<supsetplus>")
  (symbol "<ni>")

  (symbol "<vartriangleleft>")
  (symbol "<trianglelefteqslant>")
  (symbol "<trianglelefteq>")
  (symbol "<blacktriangleleft>")
  (symbol "<lesssim>")
  (symbol "<lessapprox>")
  (symbol "<precsim>")
  (symbol "<precapprox>")
  (symbol "<vartriangleright>")
  (symbol "<trianglerighteqslant>")
  (symbol "<trianglerighteq>")
  (symbol "<blacktriangleright>")
  (symbol "<gtrsim>")
  (symbol "<gtrapprox>")
  (symbol "<succsim>")
  (symbol "<succapprox>"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Arrows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind horizontal-arrow-menu
  (symbol "<leftarrow>")
  (symbol "<Leftarrow>")
  (symbol "<leftharpoonup>")
  (symbol "<leftharpoondown>")
  (symbol "<leftleftarrows>")
  (symbol "<leftarrowtail>")
  (symbol "<hookleftarrow>")
  (symbol "<looparrowleft>")
  (symbol "<twoheadleftarrow>")

  (symbol "<rightarrow>")
  (symbol "<Rightarrow>")
  (symbol "<rightharpoonup>")
  (symbol "<rightharpoondown>")
  (symbol "<rightrightarrows>")
  (symbol "<rightarrowtail>")
  (symbol "<hookrightarrow>")
  (symbol "<looparrowright>")
  (symbol "<twoheadrightarrow>")

  (symbol "<leftrightarrow>")
  (symbol "<Leftrightarrow>")
  (symbol "<leftrightharpoons>")
  (symbol "<rightleftharpoons>")
  (symbol "<leftrightarrows>")
  (symbol "<rightleftarrows>")
  (symbol "<mapsto>")
  (symbol "<rightsquigarrow>")
  (symbol "<leftrightsquigarrow>"))

(menu-bind vertical-arrow-menu
  (symbol "<uparrow>")
  (symbol "<Uparrow>")
  (symbol "<upuparrows>")
  (symbol "<upharpoonleft>")
  (symbol "<upharpoonright>")
  (symbol "<nwarrow>")
  (symbol "<nearrow>")
  (symbol "<updownarrow>")

  (symbol "<downarrow>")
  (symbol "<Downarrow>")
  (symbol "<downdownarrows>")
  (symbol "<downharpoonleft>")
  (symbol "<downharpoonright>")
  (symbol "<swarrow>")
  (symbol "<searrow>")
  (symbol "<Updownarrow>"))

(menu-bind long-arrow-menu
  (symbol "<longleftarrow>")
  (symbol "<longrightarrow>")
  (symbol "<longleftrightarrow>")
  (symbol "<Longleftarrow>")
  (symbol "<Longrightarrow>")
  (symbol "<Longleftrightarrow>")
  (symbol "<longhookleftarrow>")
  (symbol "<longhookrightarrow>")
  (symbol "<longmapsto>"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Negations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind negation-menu-1
  (symbol "<neq>")
  (symbol "<nequiv>")
  (symbol "<nasymp>")
  (symbol "<nsim>")
  (symbol "<napprox>")
  (symbol "<nsimeq>")
  (symbol "<ncong>")
  (symbol "<nin>")
  (symbol "<nni>"))

(menu-bind negation-menu-2
  (symbol "<nless>")
  (symbol "<nleqslant>")
  (symbol "<nleq>")
  (symbol "<lneq>")
  (symbol "<lneqq>")
  (symbol "<lvertneqq>")
  (symbol "<lnsim>")
  (symbol "<lnapprox>")
  (symbol "<precneqq>")

  (symbol "<ngtr>")
  (symbol "<ngeqslant>")
  (symbol "<ngeq>")
  (symbol "<gneq>")
  (symbol "<gneqq>")
  (symbol "<gvertneqq>")
  (symbol "<gnsim>")
  (symbol "<gnapprox>")
  (symbol "<succneqq>")

  (symbol "<nprec>")
  (symbol "<npreccurlyeq>")
  (symbol "<npreceq>")
  (symbol "<precnsim>")
  (symbol "<precnapprox>")
  (symbol "<subsetneq>")
  (symbol "<subsetneqq>")
  (symbol "<varsubsetneq>")
  (symbol "<varsubsetneqq>")

  (symbol "<nsucc>")
  (symbol "<nsucccurlyeq>")
  (symbol "<nsucceq>")
  (symbol "<succnsim>")
  (symbol "<succnapprox>")
  (symbol "<supsetneq>")
  (symbol "<supsetneqq>")
  (symbol "<varsupsetneq>")
  (symbol "<varsupsetneqq>"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Greek characters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind lower-greek-menu
  (symbol "<alpha>")
  (symbol "<beta>")
  (symbol "<gamma>")
  (symbol "<delta>")
  (symbol "<varepsilon>")
  (symbol "<epsilon>")
  (symbol "<zeta>")
  (symbol "<eta>")
  (symbol "<theta>")
  (symbol "<vartheta>")
  (symbol "<iota>")
  (symbol "<kappa>")
  (symbol "<lambda>")
  (symbol "<mu>")
  (symbol "<nu>")
  (symbol "<xi>")
  (symbol "<omicron>")
  (symbol "<pi>")
  (symbol "<varpi>")
  (symbol "<rho>")
  (symbol "<varrho>")
  (symbol "<sigma>")
  (symbol "<varsigma>")
  (symbol "<tau>")
  (symbol "<upsilon>")
  (symbol "<phi>")
  (symbol "<varphi>")
  (symbol "<chi>")
  (symbol "<psi>")
  (symbol "<omega>"))

(menu-bind upper-greek-menu
  (symbol "<Gamma>")
  (symbol "<Delta>")
  (symbol "<Theta>")
  (symbol "<Lambda>")
  (symbol "<Xi>")
  (symbol "<Pi>")
  (symbol "<Sigma>")
  (symbol "<Upsilon>")
  (symbol "<Phi>")
  (symbol "<Psi>")
  (symbol "<Omega>"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous symbols
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind miscellaneous-symbol-menu
  (symbol "<mathd>")
  (symbol "<mathi>")
  (symbol "<mathe>")
  (symbol "<mathpi>")
  (symbol "<imath>")
  (symbol "<jmath>")
  (symbol "<ell>")
  (symbol "<wp>")
  (symbol "<aleph>")
  (symbol "<beth>")
  (symbol "<gimel>")
  (symbol "<daleth>")
  (symbol "<Re>")
  (symbol "<Im>")
  (symbol "<Mho>")
  (symbol "<emptyset>")
  (symbol "<varnothing>")
  (symbol "<nabla>")
  (symbol "<top>")
  (symbol "<bot>")
  (symbol "<vdash>")
  (symbol "<Vdash>")
  (symbol "<Vvdash>")
  (symbol "<vDash>")
  (symbol "<dashv>")
  (symbol "<angle>")
  (symbol "<forall>")
  (symbol "<exists>")
  (symbol "<neg>")
  (symbol "<flat>")
  (symbol "<natural>")
  (symbol "<sharp>")
  (symbol "<backslash>")
  (symbol "<partial>")
  (symbol "<infty>")
  (symbol "<box>")
  (symbol "<diamond>")
  (symbol "<triangle>")
  (symbol "<clubsuit>")
  (symbol "<diamondsuit>")
  (symbol "<heartsuit>")
  (symbol "<spadesuit>")
  (symbol "<sun>")
  (symbol "<leftmoon>")
  (symbol "<rightmoon>")
  (symbol "<earth>")
  (symbol "<male>")
  (symbol "<female>")
  (symbol "<maltese>")
  (symbol "<kreuz>")
  (symbol "<recorder>")
  (symbol "<phone>")
  (symbol "<checked>")
  (symbol "<pointer>")
  (symbol "<bell>")
  (symbol "<eighthnote>")
  (symbol "<quarternote>")
  (symbol "<halfnote>")
  (symbol "<fullnote>")
  (symbol "<twonotes>"))

(menu-bind dots-menu
  (symbol "<ldots>")
  (symbol "<cdots>")
  (symbol "<hdots>")
  (symbol "<vdots>")
  (symbol "<ddots>")
  (symbol "<udots>"))

(menu-bind bold-num-menu
  (symbol "<b-0>")
  (symbol "<b-1>")
  (symbol "<b-2>")
  (symbol "<b-3>")
  (symbol "<b-4>")
  (symbol "<b-5>")
  (symbol "<b-6>")
  (symbol "<b-7>")
  (symbol "<b-8>")
  (symbol "<b-9>"))

(menu-bind bold-alpha-menu
  (symbol "<b-a>")
  (symbol "<b-b>")
  (symbol "<b-c>")
  (symbol "<b-d>")
  (symbol "<b-e>")
  (symbol "<b-f>")
  (symbol "<b-g>")
  (symbol "<b-h>")
  (symbol "<b-i>")
  (symbol "<b-j>")
  (symbol "<b-k>")
  (symbol "<b-l>")
  (symbol "<b-m>")
  (symbol "<b-n>")
  (symbol "<b-o>")
  (symbol "<b-p>")
  (symbol "<b-q>")
  (symbol "<b-r>")
  (symbol "<b-s>")
  (symbol "<b-t>")
  (symbol "<b-u>")
  (symbol "<b-v>")
  (symbol "<b-w>")
  (symbol "<b-x>")
  (symbol "<b-y>")
  (symbol "<b-z>")
  (symbol "<b-A>")
  (symbol "<b-B>")
  (symbol "<b-C>")
  (symbol "<b-D>")
  (symbol "<b-E>")
  (symbol "<b-F>")
  (symbol "<b-G>")
  (symbol "<b-H>")
  (symbol "<b-I>")
  (symbol "<b-J>")
  (symbol "<b-K>")
  (symbol "<b-L>")
  (symbol "<b-M>")
  (symbol "<b-N>")
  (symbol "<b-O>")
  (symbol "<b-P>")
  (symbol "<b-Q>")
  (symbol "<b-R>")
  (symbol "<b-S>")
  (symbol "<b-T>")
  (symbol "<b-U>")
  (symbol "<b-V>")
  (symbol "<b-W>")
  (symbol "<b-X>")
  (symbol "<b-Y>")
  (symbol "<b-Z>"))

(menu-bind bold-greek-menu
  (symbol "<b-alpha>")
  (symbol "<b-beta>")
  (symbol "<b-gamma>")
  (symbol "<b-delta>")
  (symbol "<b-epsilon>")
  (symbol "<b-varepsilon>")
  (symbol "<b-zeta>")
  (symbol "<b-eta>")
  (symbol "<b-theta>")
  (symbol "<b-vartheta>")
  (symbol "<b-iota>")
  (symbol "<b-kappa>")
  (symbol "<b-lambda>")
  (symbol "<b-mu>")
  (symbol "<b-nu>")
  (symbol "<b-xi>")
  (symbol "<b-omicron>")
  (symbol "<b-pi>")
  (symbol "<b-varpi>")
  (symbol "<b-rho>")
  (symbol "<b-varrho>")
  (symbol "<b-sigma>")
  (symbol "<b-varsigma>")
  (symbol "<b-tau>")
  (symbol "<b-upsilon>")
  (symbol "<b-phi>")
  (symbol "<b-varphi>")
  (symbol "<b-chi>")
  (symbol "<b-psi>")
  (symbol "<b-omega>")
  (symbol "<b-Gamma>")
  (symbol "<b-Delta>")
  (symbol "<b-Theta>")
  (symbol "<b-Lambda>")
  (symbol "<b-Xi>")
  (symbol "<b-Pi>")
  (symbol "<b-Sigma>")
  (symbol "<b-Upsilon>")
  (symbol "<b-Phi>")
  (symbol "<b-Psi>")
  (symbol "<b-Omega>"))

(menu-bind cal-menu
  (symbol "<cal-A>")
  (symbol "<cal-B>")
  (symbol "<cal-C>")
  (symbol "<cal-D>")
  (symbol "<cal-E>")
  (symbol "<cal-F>")
  (symbol "<cal-G>")
  (symbol "<cal-H>")
  (symbol "<cal-I>")
  (symbol "<cal-J>")
  (symbol "<cal-K>")
  (symbol "<cal-L>")
  (symbol "<cal-M>")
  (symbol "<cal-N>")
  (symbol "<cal-O>")
  (symbol "<cal-P>")
  (symbol "<cal-Q>")
  (symbol "<cal-R>")
  (symbol "<cal-S>")
  (symbol "<cal-T>")
  (symbol "<cal-U>")
  (symbol "<cal-V>")
  (symbol "<cal-W>")
  (symbol "<cal-X>")
  (symbol "<cal-Y>")
  (symbol "<cal-Z>"))

(menu-bind frak-menu
  (symbol "<frak-a>")
  (symbol "<frak-b>")
  (symbol "<frak-c>")
  (symbol "<frak-d>")
  (symbol "<frak-e>")
  (symbol "<frak-f>")
  (symbol "<frak-g>")
  (symbol "<frak-h>")
  (symbol "<frak-i>")
  (symbol "<frak-j>")
  (symbol "<frak-k>")
  (symbol "<frak-l>")
  (symbol "<frak-m>")
  (symbol "<frak-n>")
  (symbol "<frak-o>")
  (symbol "<frak-p>")
  (symbol "<frak-q>")
  (symbol "<frak-r>")
  (symbol "<frak-s>")
  (symbol "<frak-t>")
  (symbol "<frak-u>")
  (symbol "<frak-v>")
  (symbol "<frak-w>")
  (symbol "<frak-x>")
  (symbol "<frak-y>")
  (symbol "<frak-z>")
  (symbol "<frak-A>")
  (symbol "<frak-B>")
  (symbol "<frak-C>")
  (symbol "<frak-D>")
  (symbol "<frak-E>")
  (symbol "<frak-F>")
  (symbol "<frak-G>")
  (symbol "<frak-H>")
  (symbol "<frak-I>")
  (symbol "<frak-J>")
  (symbol "<frak-K>")
  (symbol "<frak-L>")
  (symbol "<frak-M>")
  (symbol "<frak-N>")
  (symbol "<frak-O>")
  (symbol "<frak-P>")
  (symbol "<frak-Q>")
  (symbol "<frak-R>")
  (symbol "<frak-S>")
  (symbol "<frak-T>")
  (symbol "<frak-U>")
  (symbol "<frak-V>")
  (symbol "<frak-W>")
  (symbol "<frak-X>")
  (symbol "<frak-Y>")
  (symbol "<frak-Z>"))

(menu-bind bbb-menu
  (symbol "<bbb-a>")
  (symbol "<bbb-b>")
  (symbol "<bbb-c>")
  (symbol "<bbb-d>")
  (symbol "<bbb-e>")
  (symbol "<bbb-f>")
  (symbol "<bbb-g>")
  (symbol "<bbb-h>")
  (symbol "<bbb-i>")
  (symbol "<bbb-j>")
  (symbol "<bbb-k>")
  (symbol "<bbb-l>")
  (symbol "<bbb-m>")
  (symbol "<bbb-n>")
  (symbol "<bbb-o>")
  (symbol "<bbb-p>")
  (symbol "<bbb-q>")
  (symbol "<bbb-r>")
  (symbol "<bbb-s>")
  (symbol "<bbb-t>")
  (symbol "<bbb-u>")
  (symbol "<bbb-v>")
  (symbol "<bbb-w>")
  (symbol "<bbb-x>")
  (symbol "<bbb-y>")
  (symbol "<bbb-z>")
  (symbol "<bbb-A>")
  (symbol "<bbb-B>")
  (symbol "<bbb-C>")
  (symbol "<bbb-D>")
  (symbol "<bbb-E>")
  (symbol "<bbb-F>")
  (symbol "<bbb-G>")
  (symbol "<bbb-H>")
  (symbol "<bbb-I>")
  (symbol "<bbb-J>")
  (symbol "<bbb-K>")
  (symbol "<bbb-L>")
  (symbol "<bbb-M>")
  (symbol "<bbb-N>")
  (symbol "<bbb-O>")
  (symbol "<bbb-P>")
  (symbol "<bbb-Q>")
  (symbol "<bbb-R>")
  (symbol "<bbb-S>")
  (symbol "<bbb-T>")
  (symbol "<bbb-U>")
  (symbol "<bbb-V>")
  (symbol "<bbb-W>")
  (symbol "<bbb-X>")
  (symbol "<bbb-Y>")
  (symbol "<bbb-Z>"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Icons for math mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind texmacs-math-icons
  ((balloon (icon "tm_fraction.xpm") "Insert a fraction#(A-f)")
   (make-fraction))
  ((balloon (icon "tm_sqrt.xpm") "Insert a square root#(A-s)")
   (make-sqrt))
  ((balloon (icon "tm_root.xpm") "Insert an n-th root#(A-S)")
   (make-var-sqrt))
  ((balloon (icon "tm_sub.xpm") "Make a subscript#(_)")
   (make-script #f #t))
  ((balloon (icon "tm_sup.xpm") "Make a superscript#(^)")
   (make-script #t #t))
  (=> (balloon (icon "tm_hat.xpm") "Insert an accent")
      ((icon "tm_hat.xpm") "A-^" (make-wide "^"))
      ((icon "tm_tilda.xpm") "A-~" (make-wide "~"))
      ((icon "tm_bar.xpm") "A-B" (make-wide "<bar>"))
      ((icon "tm_vect.xpm") "A-V" (make-wide "<vect>"))
      ((icon "tm_check.xpm") "A-C" (make-wide "<check>"))
      ((icon "tm_breve.xpm") "A-U" (make-wide "<breve>"))
      ((icon "tm_dot.xpm") "A-." (make-wide "<dot>"))
      ((icon "tm_ddot.xpm") "A-\"" (make-wide "<ddot>"))
      ((icon "tm_acute.xpm") "A-'" (make-wide "<acute>"))
      ((icon "tm_grave.xpm") "A-`" (make-wide "<grave>")))
  |
  (=> (balloon (icon "tm_bigop.xpm") "Insert a big operator")
      (tile 8 (link big-operator-menu)))
  (=> (balloon (icon "tm_bigleft.xpm") "Insert a large left delimiter")
      (tile 8 (link left-delimiter-menu)))
  (=> (balloon (icon "tm_bigsep.xpm") "Insert a large separator")
      (tile 8 (link middle-delimiter-menu)))
  (=> (balloon (icon "tm_bigright.xpm") "Insert a large right delimiter")
      (tile 8 (link right-delimiter-menu)))
  (=> (balloon (icon "tm_binop.xpm") "Insert a binary operation")
      (tile 8 (link binary-operation-menu)))
  (=> (balloon (icon "tm_binrel.xpm") "Insert a binary relation")
      (tile 8 (link binary-relation-menu-1))
      ---
      (tile 8 (link binary-relation-menu-2)))
  (=> (balloon (icon "tm_arrow.xpm") "Insert an arrow")
      (tile 9 (link horizontal-arrow-menu))
      ---
      (tile 8 (link vertical-arrow-menu))
      ---
      (tile 6 (link long-arrow-menu)))
  (=> (balloon (icon "tm_unequal.xpm") "Insert a negation")
      (tile 9 (link negation-menu-1))
      ---
      (tile 9 (link negation-menu-2)))
  (=> (balloon (icon "tm_miscsymb.xpm") "Insert a miscellaneous symbol")
      (tile 8 (link miscellaneous-symbol-menu))
      ---
      (tile 6 (link dots-menu))))
