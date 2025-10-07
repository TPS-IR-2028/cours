#let conf(subject: none, doc) = {
  set heading(numbering: "1.a.")
  set page(
    header: align(right + horizon, subject),
    numbering: "1",
  )
  set document(title: subject)

  align(center, text(17pt)[*#subject*])

  outline(title: "Sommaire")

  doc
}

#