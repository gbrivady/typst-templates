#import "../report-long.typ": project, appendix

#show: project.with(
  title: "Long Report Title",
  subtitle: "Subtitle",
  author: "NAME Surname",
  language: "en",
)

= First section
#lorem(10)

== First subsection
#lorem(20)

== Second subsection
#lorem(40)

=== Sub-subsection
#lorem(100)

==== Sub-sub-sub section...
This section part is not in the table of content

#pagebreak()
= Second section
#lorem(150)

#pagebreak()

#show: appendix.with()
= First appendix section
#lorem(150)
== First appendix subsection
Appendix subsections are not in the table of content

#pagebreak()
= Second appendix section
#lorem(150)