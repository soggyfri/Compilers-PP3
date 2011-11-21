\begin{document}
\pagenumbering{Alph} 
\Alph{3} 
\renewcommand{\baselinestretch}{2}

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

\end{document}
