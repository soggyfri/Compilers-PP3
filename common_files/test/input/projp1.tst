\begin{document}

The project for the Spring 1994 Semester will focus on the design and
implementation of a Latex subset for text processing.  Specifically,
this project will be subdivided into three major parts.
\begin{enumerate}
\item Design and develop a contex free grammar (CFG) for a subset of Latex.
\item Design, implement, and test the common CFG (which I will provide to
      you at a later date) using Lex (Flex) and Yacc (Bison).
\item Design, implement, and test a syntax-directed translator based on part 2
      that automatically generates formatted ASCII text from an
      input Latex source file.
\end{enumerate}
The first part of the project is divided into two major  tasks.
\begin{itemize}
\item Design a CFG for the project that allows Latex programs (e.g., text
      to be formatted) to be recognized.  This will provide you with
      important language design experience.
\item Calculate FIRST and FOLLOW for the non-terminals listed below:
\begin{verbatim}
latex statement    main body        main option      text option
latex options      backs options    begin end opts   begin block
begin end cmds     table options    
\end{verbatim}
\end{itemize}
Neither of these tasks require you to develop and or implement code.  
{\it This is a design project!!!}  The first part of the project is
worth 50 points.

To provide a background for the semester project, a detailed overview of the 
Latex subset that youll be implementing has been attached.  An electronic
copy can be found in:
\begin{verbatim}
             demurjs CSE244 SP94
\end{verbatim}

\end{document}
