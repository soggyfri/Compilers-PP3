\begin{document}
The third and final part of the semester project focuses on the actual
generation of formatted output from Latex input.  There are 5 tasks
for this project, with the divisions given to differentiate between 
required work point totals and bonuses.  Note that you {\it MUST} utilize the
{\it union} command to redefine the parsing stack in yacc bison.
This project is worth 100 points with up to 15 bonus points.   The tasks 
for the project are:
\begin{enumerate}
\item Basic Text Processing Capabilities (35 points total),
      including: Section Subsection Table of Contents (5pts),
      Line Spacing Single-Double-Triple (5pts), Page Numbering Styles (2.5pts),
      Horizontal Vertical Spacing (2.5pts), Italics Roman Fonts (2.5pts),
      Paragraphs Noindent (2.5pts), Right Justification (10pts), and
      Begin End Single Blocks (5pts).
\item Advanced Text Processing capabilities (55 points total),
      including: Itemize Blocks (5pts), Enumerate Blocks (5pts),
      Center Blocks (5pts), Verbatim Blocks (5pts), Tabular Blocks (10pts),
      Table Blocks with Refs Captions (5pts), and
      Relevant Combinations of Blocks (20pts).
\item Documentation, Log, Testing (10 points total).  
\item Bonus A: Nested Blocks within Single Environment
\item Bonus B: Full-Blown Verbatim: All possible Latex commands that are embedded
      in a verbatim block (e.g., backslash, blocks, etc.) are ignored.
\end{enumerate}

The directory {\it  home ug1 demurjs CSE244.SP94 Part3} contains a number of 
important files, including:

\begin{verbatim}
         latex.l       : A common latex lex file.
         latexp3.y     : A yacc specification where verbatim works.
         latexp3code.y : A yacc specification with sample code generation.
         util.c        : A number of C utility routines.
         generate.c    : A number of routines used to generate code.
\end{verbatim}


Portions of these and other files will be discussed in class.  The third part 
of the project is due on Monday, May 2, 1994.  Please hand in the following:
\begin{enumerate}
\item The yacc bison specification for tasks 1, 2, and 3.  DO NOT HAND 
      IN C files!  Also include copies of any relevant C
      files.  Make sure that these are well-commented, clear, and organized.
\item Documentation of your solution that includes: (1) any assumptions that you
      make regarding the output format and style of your document (e.g., margins,
      page number locations, handling underlining, etc.);  (2) a log file that 
      keeps track of all of your major design steps, implementation strategies, 
      problems encountered (with lex yacc) and their solutions, aspects of the 
      project that were easy hard, changes that were made to the grammar, etc.  
      The key word is MAJOR design steps.  NOTE AGAIN THAT
      YOUR DOCUMENTATION MUST BE GENERATED USING YOUR LATEX COMPILER!!!!
\item Test cases and test results for all tasks, clearly marked and organized.
\item The directory location for your files and detailed compilation instructions.
\end{enumerate}

{\it IMPORTANT:} Do not open your directory for access by the world until
7:00 p.m. on May 2.

\end{document}
