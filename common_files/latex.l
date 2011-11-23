/* THIS IS latex.l */
%{ /* A LEX FOR PART 3 OF THE PROJECT WHERE VERBATIM WORKS */
#include "latexp3c.tab.h"
#include "prototypes.h"
%}
ws		[ \t\n]+
punc            (\.|\,|\!|\?)
word		({punc}|[a-zA-Z0-9])*
special         (\%|\_|\&|\$|\#)
cols            (r|l|c)*

%%
\n {incr_lines_so_far();}
"\\\\" 			{printf(" %s \n", yytext);return(DBLBS);}
{special}		{printf(" %s \n", yytext);return(SPECCHAR);}
"["			{printf(" %s \n", yytext);return(LSQRB);}
"]"			{printf(" %s \n", yytext);return(RSQRB);}

"\\alph"		{printf(" %s \n", yytext);return(LALPH1);}
"{alph}"		{printf(" %s \n", yytext);return(LALPH2);}
"\\Alph"		{printf(" %s \n", yytext);return(CALPH1);}
"{Alph}"		{printf(" %s \n", yytext);return(CALPH2);}
"\\arabic"		{printf(" %s \n", yytext);return(ARABIC1);}
"{arabic}"		{printf(" %s \n", yytext);return(ARABIC2);}
"\\baselinestretch"	{printf(" %s \n", yytext);return(BASELINES);}
"\\begin"		{printf(" %s \n", yytext);return(LBEGIN);}
"\\caption"		{printf(" %s \n", yytext);return(CAPTION);}
"{center}"		{printf(" %s \n", yytext);return(CENTER );}
"{document}"		{printf(" %s \n", yytext);return(DOCUMENT);}
"\\end"			{printf(" %s \n", yytext);return(END);}
"{enumerate}"		{printf(" %s \n", yytext);return(ENUMERATE);}
"\\hspace"		{printf(" %s \n", yytext);return(HSPACE);}
"{itemize}"		{printf(" %s \n", yytext);return(ITEMIZE);}
"\\item"		{printf(" %s \n", yytext);return(ITEM);}
"\\it"			{printf(" %s \n", yytext);return(IT);}
"\\label"		{printf(" %s \n", yytext);return(LABEL);}
"\\noindent"		{printf(" %s \n", yytext);return(NOINDENT);}
"\\pagenumbering"	{printf(" %s \n", yytext);return(PAGENUM);}
"\\ref"			{printf(" %s \n", yytext);return(REF);}
"\\renewcommand"	{printf(" %s \n", yytext);return(RENEW);}
"\\roman"		{printf(" %s \n", yytext);return(LROMAN1);}
"{roman}"		{printf(" %s \n", yytext);return(LROMAN2);}
"\\Roman"		{printf(" %s \n", yytext);return(CROMAN1);}
"{Roman}"		{printf(" %s \n", yytext);return(CROMAN2);}
"\\rm"			{printf(" %s \n", yytext);return(RM);}
"\\section"		{printf(" %s \n", yytext);return(SECTION);}
"{single}"		{printf(" %s \n", yytext);return(SINGLE);}
"\\subsection"		{printf(" %s \n", yytext);return(SUBSEC);}
"\\tableofcontents"	{printf(" %s \n", yytext);return(TABOCON);}
"{table}"		{printf(" %s \n", yytext);return(TABLE);}
"{tabular}"		{printf(" %s \n", yytext);return(TABULAR);}
"{verbatim}"		{printf(" %s \n", yytext);return(VERBATIM);}
"\\vspace"		{printf(" %s \n", yytext);return(VSPACE);}
"b"			{printf(" %s \n", yytext);return(B);}
"h"			{printf(" %s \n", yytext);return(H);}
"t"			{printf(" %s \n", yytext);return(T);}
{cols}                  {printf(" %s \n", yytext);return(COLS);}
"{"			{printf(" %s \n", yytext);return(LCURLYB);}
"}"			{printf(" %s \n", yytext);return(RCURLYB);}



{word}			{printf(" %s \n", yytext);return(WORD);}

{ws}			{printf("ws--%s--ws\n", yytext);
                         if ((strcmp(yytext, "\n\n") == 0) && (ws_flag == 0)){
                            incr_lines_so_far();return(WS);}
                         else if (ws_flag == 1){ return(WS);}}

%%

