\begin{document}
\begin{verbatim}
\pagenumbering{arabic}
\arabic{5} 
\renewcommand{\baselinestretch}{2}
\tableofcontents     

\section{Introduction}

This is an example of text that would be transformed into a paragraph in
latex.  Blank lines between text in the input cause a new paragraph to be 
generated.  This is an example of text that would be transformed into a 
paragraph in latex.  Blank lines between text in the input cause a new 
paragraph to be generated.  This is an example of text that would be 
transformed into a paragraph in latex.  Blank lines between text in 
the input cause a new paragraph to be generated.  

When the blank line occurs after a section, no indentation of the paragraph
is performed.  However, all other blanks, would result in a five space 
indent of the paragraph.
When the blank line occurs after a section, no indentation of the paragraph
is performed.  However, all other blanks, would result in a five space 
indent of the paragraph.

\begin{single}
Now, its important to make sure that single works correctly, and can
be used to change the formating with respect to the ways lines are 

\begin{enumerate}
\item Single is for Single spacing
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{enumerate}

SOME TEXT GOES HERE

\begin{enumerate}
\item Single is for Single spacing
\begin{itemize}
\item Single is for Single spacing.  A nested itemize
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{itemize}
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\begin{enumerate}
\item Single is for Single spacing. A second level of enums!!!!
\item Center allows a block to be centered
\end{enumerate}
\item Center allows a block to be centered
\end{enumerate}

output.  In this case, we are going from double to single spacing.

\end{single}

\subsection{A Text Processor}

A text processor is a very useful tool, since \hspace{10} it allows us to
develop formatted documents that are easy to read.

A text processor is a very useful tool, since it allows us to
develop formatted documents that are easy to read.

\vspace{10}

A text processor is a very useful tool, since it allows us to
develop formatted documents that are easy to read.

\subsection{Legal Latex Commands}

We have seen that there are many different Latex commands, that can be used
in many different ways.  However, sometimes, we wish to use a character to
mean itself, and override its Latex interpretation.  For example, to use
curly braces, we employ the backslash a set of integers.

\subsection{Again Legal Latex Commands}

We have seen that there are many different Latex commands, that can be used
in many different ways.  However, sometimes, we wish to use a character to
mean itself, and override its Latex interpretation.  For example, to use
curly braces, we employ the backslash a set of integers.

\subsection{Yet Some More Legal Latex Commands}

We have seen that there are many different Latex commands, that can be used

\begin{single}
in many different ways.  However, sometimes, we wish to use a character to
mean itself, and override its Latex interpretation.  For example, to use
\end{single}

curly braces, we employ the backslash a set of integers.

\section{Using Latex}

Finally, there are {\it many other useful} commands that involve begin end blocks,
that establish an environment. These blocks behave in a similar fashion to
begin end blocks in a programming language, since they set a scope.  We
have discussed a number of examples.

\it
It is important to note, even at this early stage, that lists may be created
within lists, allowing the nesting of blocks and environments.
\rm

It is important to note, even at this early stage, that lists may be created

\subsection{Check this Out}

Finally, there are {\it many other useful} commands that involve begin end blocks,
that establish an environment. These blocks behave in a similar fashion to
begin end blocks in a programming language, since they set a scope.  We
have discussed a number of examples.

\subsection{Check this Out Part 2}

Finally, there are {\it many other useful} commands that involve begin end blocks,
that establish an environment. These blocks behave in a similar fashion to
begin end blocks in a programming language, since they set a scope.  We
have discussed a number of examples.

\section{What about this?}

When things are switched back is everything still ok?

\section{What about this?}

When things are switched back is everything still ok?

\section{What about this?}

When things are switched back is everything still ok?

\section{What about this?}

When things are switched back is everything still ok?

\section{What about this?}

When things are switched back is everything still ok?

\section{What about this?}

When things are switched back is everything still ok?

\section{What about this?}

When things are switched back is everything still ok?

\section{Goes to 10! What about this?}

When things are switched back is everything still ok?

\end{verbatim}
\end{document}
