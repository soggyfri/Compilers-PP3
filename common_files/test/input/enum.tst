\begin{document}
\pagenumbering{roman} 
\roman{7} 
\renewcommand{\baselinestretch}{3}

A block of a enumerate within a single environment should change the spacing
from its triple default.

\begin{enumerate}
\item Single is for Single spacing
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{enumerate}


Now, make sure that triple spacing is active again!

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
\end{document}
