\begin{document}

Single around Itemize/Enumerate/Center
All Combos of Itemize/Enumerate - Up to 3 levels deep
Center around Tabular/Verbatim

These are the legal singles...

\begin{single}
\begin{enumerate}
\item Single is for Single spacing
\item Center allows a block to be centered
\end{enumerate}
\end{single}
\begin{single}
\begin{itemize}
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{itemize}
\end{single}
\begin{single}
\begin{center}
Single is for Single spacing \\
Itemize uses ticks to indicate items \\
\end{center}
\end{single}

These are illegal Singles...

\begin{single}
\begin{verbatim}
Single is    for Single spacing 
Itemize uses    ticks to    indicate items 
\end{verbatim}
\end{single}
\begin{single}
\begin{table}[h]
\begin{tabular}{l}
One\\
Column\\ 
\end{tabular}
\end{table}
\end{single}

Combos of itemize and enumerate - up to 3 levels...

\begin{enumerate}
\item Single is for Single spacing
\begin{enumerate}
\item Single is for Single spacing.  A nested itemize
\item Verbatim allows text that matches the what you see is what you get mode
\begin{enumerate}
\item TRIPLE Nested!
\item Single is for Single spacing. A second level of enums!!!!
\item Center allows a block to be centered
\end{enumerate}
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{enumerate}
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\begin{enumerate}
\item Single is for Single spacing. A second level of enums!!!!
\item Center allows a block to be centered
\end{enumerate}
\item Center allows a block to be centered
\end{enumerate}
\begin{itemize}
\item Single is for Single spacing
\begin{itemize}
\item Single is for Single spacing.  A nested itemize
\item Verbatim allows text that matches the what you see is what you get mode
\begin{itemize}
\item TRIPLE Nested!
\item Single is for Single spacing. A second level of enums!!!!
\item Center allows a block to be centered
\end{itemize}
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{itemize}
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\begin{itemize}
\item Single is for Single spacing. A second level of itemize!!!!
\item Center allows a block to be centered
\end{itemize}
\item Center allows a block to be centered
\end{itemize}
\begin{enumerate}
\item Single is for Single spacing
\begin{itemize}
\item Single is for Single spacing.  A nested itemize
\item Verbatim allows text that matches the what you see is what you get mode
\begin{itemize}
\item TRIPLE Nested!
\item Single is for Single spacing. A second level of enums!!!!
\item Center allows a block to be centered
\end{enumerate}
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{enumerate}
\item Verbatim allows text that matches the what you see is what you get mode
\item Itemize uses ticks to indicate items
\begin{itemize}
\item Single is for Single spacing. A second level of enums!!!!
\item Center allows a block to be centered
\end{itemize}
\item Center allows a block to be centered
\end{enumerate}


Center around verbatim and tabular...

\begin{center}
\begin{verbatim}
Single is for Single spacing
    Verbatim allows       text   that matches the
Itemize   uses ticks to   indicate items
Center   allows a   block to be centered
\end{verbatim}
\end{center}
\begin{table}[h]
\begin{center}
\begin{tabular}{l}
Does\\
A\\
One\\
Column\\ 
Table\\
Work???????\\
\end{tabular}
\end{center}
\end{table}

\end{document}


