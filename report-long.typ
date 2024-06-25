/* Generic template for single-author long reports. WIP */

#let appendix(body) = {
  set heading(numbering: "A.1", supplement: [Appendix])
  counter(heading).update(0)
  body
}

#let project(title: "", subtitle: "", author: "", language: "", body) = {
  set document(author: author, title: title)

  set text(lang: language)

  set page(
    paper: "a4",
    margin: (inside: 3cm, outside: 3cm, bottom: 4cm, top: 3cm),
  )
  set heading(numbering: "1.1.1", supplement: [Chapter])

  // Title Page
  block(height: 20%)[
    #grid(
      columns: (1fr, .5fr, 1fr),
      box(width: 2cm, height: 2cm, fill: red),
      "",
      align(right)[#box(width: 2cm, height: 2cm, fill: blue)],
    )
  ]
  block(
    height: 40%,
  )[
    #align(
      center,
    )[
      #line(start: (5%, 0%), end: (95%, 0%), stroke: (thickness: .5mm))
      #v(.4cm)
      #block(text(weight: "bold", size: 28pt, title))
      #v(.2cm)
      #block(text(weight: "light", size: 26pt, subtitle))
      #v(.5cm)
      #line(start: (5%, 0%), end: (95%, 0%), stroke: (thickness: .5mm))
      #v(1.5cm)
      #text(size: 20pt, author)
      #v(1cm)
      #text(
        size: 20pt,
        smallcaps(datetime.today().display("[day] [month repr:long] [year]")),
      )
    ]
  ]
  block(height: 35%)[
    #grid(
      columns: (40%, 20%, 40%),
      rows: (100%),
      gutter: 0pt,
      align(bottom + left)[
        Bottom left titlepage left subtext #lorem(20)
      ],
      "",
      align(bottom + right)[
        Bottom right title page subtext
      ],
    )
  ]

  pagebreak()
  // Header definition
  let header = [#grid(
      columns: (1fr, 5fr, 1fr),
      align(left)[#rect(width: 75%, fill: gradient.linear(green, blue))],
      align(center)[
        #author
        #v(4pt, weak: true)
        #title
      ],
      align(right)[#rect(width: 80%, fill: gradient.linear(..color.map.rainbow))],
    )
    #line(length: 100%)
  ]

  // Main body.
  set page(header: header, number-align: center)
  set page(numbering: "1", number-align: center)
  set par(justify: true)

  // Set outline
  show outline.entry.where(level: 1): it => {
    v(8pt)
    strong(it)
  }

  outline(
    target: heading.where(supplement: [Chapter]),
    depth: 3,
    indent: auto,
    fill: repeat[~~.],
  )
  outline(
    title: none,
    target: heading.where(supplement: [Appendix]),
    depth: 1,
    indent: auto,
    fill: repeat[~~.],
  )
  pagebreak()

  body
}