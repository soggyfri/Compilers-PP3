\begin{document}
\pagenumbering{arabic} 
\arabic{5} 
\renewcommand{\baselinestretch}{2}

This checks if all of the nestings work with single in various locations.
A Basic file that checks to see if the centering command works
correctly.  Note that the double backslash should indicate what
should be centered and how it is centered.

\begin{single}
\begin{center}
Single is for Single spacing\\
Verbatim allows text produced as is\\
Itemize uses ticks to indicate items\\
Center allows a block to be centered\\
\end{center}
\end{single}

Now, make sure that double spacing is active again!

\begin{center}
Single is for spacing
Verbatim allows text as is\\
Itemize has ticks for items
Center is for centering\\
\end{center}

A block of a enumerate within a single environment should change the spacing
from its double default.
\begin{single}
\begin{enumerate}
\item Single is for Single spacing
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{enumerate}
\end{single}

Now, make sure that double spacing is active again!

\begin{enumerate}
\item Single is for Single spacing
\item Single is for Single spacing. A second level of enums!!!!
\item Center allows a block to be centered
\end{enumerate}

A block of a itemize within a double environment should maintain spacing!

\begin{itemize}
\item Single is for Single spacing
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\end{itemize}

Now try a single nested block of two levels with an enumerate inside!

\begin{single}
\begin{itemize}
\item Single is for Single spacing
\begin{enumerate}
\item Single is for Single spacing
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{enumerate}
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{itemize}
\end{single}

Checking that a simple switch to single is working.  In this case, upon
encountering the single block, the spacing should be changed.
\begin{single}
Single is for Single spacing
    Verbatim allows       text   that matches the
Itemize uses ticks to   indicate items
Center   allows a   block to be centered
\end{single}
Notice that all of the whitepace should be removed and at this point, we 
should return to whatever the spacing had been originally set to.

Checking that a simple verbatim works correctly!

\begin{center}
\begin{single}
\begin{verbatim}
Single is for Single spacing
    Verbatim allows       text   that matches the
Itemize   uses ticks to   indicate items
Center   allows a   block to be centered
\end{verbatim}
\end{single}
\end{center}

Does this start off correctly with 1 and does it reset after verbatim?
\end{document}
