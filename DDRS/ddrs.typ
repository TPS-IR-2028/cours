#import "conf.typ": conf
#show: conf.with(subject: "Développement durable et responsabilité sociétale des entreprises")

#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

= Cartographie des processus

#diagram(
  node-stroke: 0.1em,

  node((1, -1), stroke: none)[Direction, Direction des études, Responsable de département],
  node((1, 0), stroke: none)[Réalisation des cours et activités, événements, projets],
  node((1, 1), stroke: none)[Administration, Technologie, Information, Communication],

  node((0, -1))[Processus de pilotage],
  edge("->")[Direction],
  node((0, 0))[Processus de réalisation],
  edge("<-"),
  node((0, 1))[Processus supports],
)

= Schéma d'un processus

#diagram(
  node-stroke: 0.1em,

  node((-1, 0), stroke: none)[Données entrées],
  edge("->"),
  node((0, 0))[Processus],
  edge((-0.5, -0.5), (0.5, -0.5), "->")[Transformation],
  edge("->"),
  node((1, 0), stroke: none)[Données sorties],
  edge("d,l,l,u", "->", label-side: left)[Évaluation, amélioration],

  node((0, 0.4), stroke: none)[Ajout de valeur ajoutée],
)

/ Processus: Ensemble d'activité transformant des données d'entrée en données de sortie, avec apport de valeur ajoutée.

= Exemples

==

#set page(width: auto) // TODO enlever ce quickfix

// FIXME le diagramme est trop large
#diagram(
  node-stroke: 0.1em,

  node((-2, 0), stroke: none, name: <DE>, shape: "rect", inset: 0pt)[
    #set align(right)
    Leçons
    \ Ordinateur
    \ Bureau
    \ Méthode
    \ Établissement
    \ Enseignant
    \ Laboratoire
  ],
  node(enclose: <DE>, shape: fletcher.shapes.brace.with(dir: right)),
  node((-1, 0), stroke: none)[Données entrées],
  edge("->"),
  node((0, 0))[Processus],
  edge((-0.5, -0.5), (0.5, -0.5), "->")[Transformation],
  edge("->"),
  node((1, 0), stroke: none)[Données sorties],
  edge("d,l,l,u", "->"),
  node((2, 0), stroke: none, name: <DS>, shape: "rect", inset: 0pt)[
    #set align(left)
    Compétences acquises et transposées
  ],
  node(enclose: <DS>, shape: fletcher.shapes.brace.with(dir: left)),
  node((0, 0.4), stroke: none)[
    Acquisition de compétences \
    Travail des cours
  ],
)

==

#set page(width: auto) // TODO enlever ce quickfix

// FIXME le diagramme est trop large
#diagram(
  node-stroke: 0.1em,

  node((-2, 0), stroke: none, name: <DE>, shape: "rect", inset: 0pt)[
    #set align(left)
    - Matières premières
      - Origine
      - Écoconception #sym.arrow ACV#footnote[Analyse du Cycle de Vie]
      - Produits chimiques, baisse quantité, baisse dangerosité
        - Fiche de donnée de sécurité/formation
        - Instructions de stockage et d'utilisation
        - Limitation accès
      - Énergies
        - Diversifier,
        - Baisser consommation
      - Consommables
        - Baisser usage unique
    - Transport
      - Approvisionnement
      - Individus
  ],
  node(enclose: <DE>, shape: fletcher.shapes.brace.with(dir: right)),
  node((-1, 0), stroke: none)[Données entrées],
  edge("->"),
  node((0, 0))[Structure \ TRANSFORMATION],
  edge("->"),
  node((1, 0), stroke: none)[Données sorties],
  edge("d,l,l,u", "->"),
  node((2, 0), stroke: none, name: <DS>, shape: "rect", inset: 0pt)[
    #set align(left)
    - Produit / Service
    - Déchets #sym.arrow baisser déchets ultimes (CET#footnote[Centre d'Enfouissement Technique])
    - Transport
      - Expédition
      - Individus
  ],
  node(enclose: <DS>, shape: fletcher.shapes.brace.with(dir: left)),
  node((0, -0.5), stroke: none)[
    #set align(left)
    - Air gaz (CO2, GES, particules)
    - Bruit
    - Odeurs
    - Vibrations
    - Sol/sous-sol via eau
    - Baisse consommation, maîtrise des rejets
  ],
)

= Notions

- Réduction d'impact à la source: "Le meilleur déchet est celui qu'on ne produit pas"
/ ROHS (EU): Restriction of Hazardous Substances
/ REACH (US): Registration, Evaluation, Authorization and Restriction of Chemicals

= Analyse du Cycle de Vie (ACV)

#diagram(
  node-stroke: 0.1em,

  node((0, 0))[Naissance],
  edge("->"),
  node((1, 0))[Vie],
  edge("->"),
  node((2, 0))[Mort],
  edge("u,l,l,d", "->")[Économie circulaire],

  node((0, 1), stroke: none)[
    #set align(left)
    - Matières premières
      - Type
      - Origine
      - Principe d'approvisionnement
      - Condition de stockage
      - Énergie déployée
      - Transport
    - Équipements
    - Énergies
    - Conditionnement
    #sym.arrow Production
  ],


  node((1, 1), stroke: none)[
    #set align(left + top)
    - Principe de mise en oeuvre
    - Mise à disposition (circuit court, long, etc.)
    - Ressources consommées
    - Déchets produits
    - Durée de vie
  ],

  node((2, 1), stroke: none)[
    #set align(left + top)
    - Réutiliser
    - Recycler (recyclerie)
    - Revaloriser
    - Enfouir déchets ultimes
  ],
)
