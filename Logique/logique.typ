#import "@preview/frame-it:1.2.0": *
#import "@preview/curryst:0.5.1": rule, prooftree

= Logique et programmation Logique

== 1. Rappels

#let (example, feature, variant, syntax) = frames(
  example: ("Exemple",),
  feature: ("Théorème",),
  variant: ("Preuve,"),
  syntax: ("Définition",),
)

#show: frame-style(styles.boxy)

#syntax[Formule][
  Elle est définie inductivement de la manière suivante :
  - Des éléments de base qui sont des variables propositionnelles : ${a, b, dots, A, B}$
  - Des règles
]

=== Interprétation des formules 

#syntax[Interprétation][
  Une interprétation $I$ est une valeur booléenne sur les variables propositionnelles $I(F)$:
  - Si $F$ est une variable, alors sa valeur est donnée, sinon si :
    - $F = not A$, alors $I(F) = 1 - I(A)$
    - $F = A -> B$, alors $I(F)=1$ ssi $I(A)=0$ ou $I(B)=0$
    - $F = A and B$, alors $I(F)=min(I(A), I(B))$
    - $F = A or B$, alors $I(F)=max(I(A),I(B))$
  - F est *satisfiable* si $exists I, I(F) = 1$
  - F est *valide* / une *tautologie* si $forall I, I(F)=1$
  - F est *contradictoire* si $forall I, I(F)=0$
]

#syntax[Conséquence et équivalence logique][
  - Conséquence logique : $A tack.r.double B$ ssi $forall I, I(A)=1$, alors $I(B)=1$
  - Équivalence logique : $A equiv B$ ssi $A tack.r.double B $ et $B tack.r.double A$
]

#feature[][
$A equiv B$ ssi $A arrow.l.r B$ est valide
]

#syntax[Forme Normale Conjonctive][
  Une formule est sous _FNC_ si elle s'écrit comme conjonction de clauses, chaque clause étant une disjonction de littéraux, et un littéral étant une variable ou sa négation.
]

#example[][$(not a or b and not c) and (a or not b)$ est sous _FNC_]

#feature[][
  Pour toute formule $F$, il existe $F'$ sous _FNC_ telle que $F equiv F'$.
]

=== Substitution
#syntax[][
  $F[x arrow.l G]$ la formule $F$ dans laquelle la var $x$ est substituée par $G$ est définie par :
  - Si $F=p$ alors :
    - Si $p=x, F[x arrow.l G] = G$
    - Si $p eq.not x, F[x arrow.l G] = F$
  - Si $F=A -> B$ alors $F[x <- G] = A[x <- G] -> B[x <- G]$ 
  - [$dots$]
]

#feature[][
  Si $F$ est valide, alors $F[x <- G]$ l'est aussi.
]

== 2. Système formel

#syntax[][
  - Un *système formel* est un ensemble d'axiomes $cal(A)$ et de règles inductives $cal(R)$
  - Un *théorème* est une formule construite à partir des axiomes en appliquant les règles de $cal(R)$
  - La preuve d'un théorème est un arbre qui a comme feuilles les axiomes et comme nœuds les règles
]

Consider the following tree:

$prooftree(
    rule(
      phi,
      Pi_1,
      Pi_2,
    )
  )i
$
$Pi$ constitutes a derivation of $phi$.

#example[][
  $
    cal(A) : {(0,0)}$ et $cal(R) : 
    prooftree(
      rule(
        (x+1,y+1),
        (x,y)
      )
    )
  $
]

#syntax[Complétude et correction][
  Un système, muni d'une interprétation :
    - Est *complet* si chaque formule valide est un théorème
    - Est *correct* si chaque théorème est une formule valide
]

#syntax[Théorème et preuve][
  - On note $tack F$ le fait que $F$ est un théorème
  - On note ${P_1, dots, P_n} tack F$ le fait d'avoir une preuve dans laqelle $P_1, dots, P_n$ peuvent être des feuilles
]

#syntax[Observation][
  $tack F quad <-> quad tack.r.double F$ signifie que le système est correct et complet.
]

=== Système de Hilbert
$cal(A) : K = A -> (B -> A)$ et $S = (A -> (B -> C)) -> ((A -> B) -> (A -> C))$

$cal(R) :
  prooftree(
    rule(
      B,
      A,
      A -> B
    )
  )M\P$ (_Modus Ponens_)

#feature[Méta théorème][
  Le système de Hilbert est correct.
]

#variant[Méta preuve][
  Par induction structurelle :

  Axiomes : 
]
