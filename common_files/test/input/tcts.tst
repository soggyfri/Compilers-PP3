\begin{document}

What happens when there are no page numbers???

\begin{table}[h]
\begin{tabular}{rcl}
No. & XXXX & XX & WW\\
One & XX & YY\\
TwoTwo & ZZ & CC\\
\end{tabular}
\caption{A Table of Latex Commands!!}
\label{latexcmds}
\end{table}

Will this table float to the top of the next page?

\begin{table}[t]
\begin{tabular}{rr}
XXXXXXX & XX\\
XX & \\
\end{tabular}
\caption{A Table of Latex Commands!!}
\end{table}

\begin{table}[h]
\begin{tabular}{ccc}
No  & XXXX & XX\\
OneTwo & XX \\
Very Long Entry & ZZ & CC\\
\end{tabular}
\label{latexcmds}
\end{table}

\begin{table}[h]
\begin{center}
\begin{tabular}{l}
Does\\
A\\
One\\
Column\\ 
Table & ABC\\
Work???????\\
\end{tabular}
\end{center}
\end{table}

\end{document}
