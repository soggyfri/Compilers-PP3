\begin{document}
\pagenumbering{alph} 
\alph{9} 
\renewcommand{\baselinestretch}{2}

A block of a itemize within a double environment should maintain spacing!

\begin{itemize}
\item Single is for Single spacing
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\end{itemize}

Now try a single nested block of two levels with an enumerate inside!

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
\begin{itemize}
\item Single is for Single spacing
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{itemize}
\item Center allows a block to be centered
\end{itemize}
\end{document}
