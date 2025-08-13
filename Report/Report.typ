#set text(lang: "en", font: "New Computer Modern", size: 11pt) // Set standard text properties
#set par(justify: true) // Set global justification for paragraphs

// Initial page layout (single column for title and table of contents)
#set page(columns: 1, margin: (x: 2.5cm, y: 2.5cm))

// Title and author information (single column on the first page)
#align(center)[
  #text(20pt)[*Comparative Analysis of Classical Machine Learning Algorithms and Artificial Neural Networks for Binary Intrusion Detection Using the NSL-KDD Dataset*]
]
#v(1em)
#align(center)[
  Marcel Ewinge \
  #text(10pt)[Alpen-Adria-Universität Klagenfurt] \
  #text(10pt)[Klagenfurt, Austria]
]

#v(3em) // Space before table of contents

// Table of Contents (single column on the first page)
#align(center)[
  #text(14pt)[*Table of Contents*]
]
#v(0.5em) // Less vertical space after the ToC title for a tighter look
#show outline: set text(size: 10pt, weight: "regular") // Smaller font for ToC entries, not bold
#outline(
  title: none, // Suppress default title as we have our own
  indent: 0.5em, // Reduce indent for sub-sections
  depth: 2       // Adjust how many levels are shown in the table of contents
)



#pagebreak() // Force a new page for the main content

// From this point onwards, the two-column layout begins
#set page(columns: 2, margin: (x: 2.5cm, y: 2.5cm))

// --- HIER WERDEN DIE ABSCHNITTE EINGEFÜGT ---
#include("sections/1_motivation.typ")
#include("sections/2_data.typ")
#include("sections/3_theoretical_part.typ") // Annahme: diese Datei existiert
#include("sections/4_implementation.typ")   // Annahme: diese Datei existiert
#include("sections/5_evaluation.typ")     // Annahme: diese Datei existiert
#include("sections/6_conclusion.typ")     // Annahme: diese Datei existiert
// ---------------------------------------------



#pagebreak() // Optional: Page for references if space is insufficient

#set page(columns: 1) // Switch to single column for lists

// --- List of Figures (at the end of the document) ---
#v(3em) // Space before List of Figures
#heading(level: 1, outlined: true)[List of Figures]
#v(0.5em)
#show outline: set text(size: 10pt) // Smaller font for LoF entries
#outline(
  target: figure, // This targets figures
  title: none,    // Suppress default title
  indent: 0.5em,  // Reduce indent for entries
  depth: 1        // Figures usually have only one level
)
// ---------------------------------------------------

#pagebreak() // Optional: Page break after the List of Figures, if the Bibliography should start on a new page

#bibliography("references.bib")