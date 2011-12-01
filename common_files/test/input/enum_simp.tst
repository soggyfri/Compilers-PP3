\begin{document}
\pagenumbering{roman} 
\roman{7} 
\renewcommand{\baselinestretch}{1}
\tableofcontents

A block of a enumerate within a single environment should change the spacing
from it triple default.

\begin{enumerate}
\item Single is for Single spacing
\item Verbatim allows text that matches the what you see is what you get mode
\begin{enumerate}
\item first level nesting
      \begin{enumerate}
      \item second level nesting
            \begin{enumerate}
            \item third level nesting
            \item another item
            \item last third item
                  \begin{enumerate}
                  \item forth level nesting
                  \item forth second item                  
                        \begin{enumerate}
                        \item gawd another nest
                              \begin{enumerate}
                              \item omg wtf.. so many
                                    \begin{enumerate}
                                    \item two more
                                          \begin{enumerate}
                                          \item one more
                                                \begin{enumerate}
                                                \item 9th and last nest
                                                \end{enumerate}
                                          \end{enumerate}
                                   \end{enumerate}
                             \end{enumerate}
                        \end{enumerate}
                  \end{enumerate}
            \end{enumerate}
      \end{enumerate}
\end{enumerate}
\item Itemize uses ticks to indicate items
\item Center allows a block to be centered
\end{enumerate}

\end{document}
