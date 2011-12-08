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
\n {/*incr_lines_so_far();*/}
"\\\\" 			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{
			return(DBLBS);}}

{special}		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(SPECCHAR);}}

"["			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(LSQRB);}}

"]"			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(RSQRB);}}

"\\alph"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(LALPH1);}}

"{alph}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(LALPH2);}}

"\\Alph"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(CALPH1);}}

"{Alph}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(CALPH2);}}

"\\arabic"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(ARABIC1);}}

"{arabic}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(ARABIC2);}}

"\\baselinestretch"	{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(BASELINES);}}

"\\begin"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(LBEGIN);}}

"\\caption"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(CAPTION);}}
"{center}"		{printf(" %s \n", yytext
);
			if(ws_flag == 1){
			return(WORD);}
			else{return(CENTER );}}

"{document}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(DOCUMENT);}}

"\\end"			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(END);}}

"{enumerate}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(ENUMERATE);}}

"\\hspace"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(HSPACE);}}

"{itemize}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(ITEMIZE);}}

"\\item"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(ITEM);}}

"\\it"			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(IT);}}

"\\label"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(LABEL);}}

"\\noindent"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(NOINDENT);}}

"\\pagenumbering"	{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(PAGENUM);}}

"\\ref"			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(REF);}}

"\\renewcommand"	{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(RENEW);}}

"\\roman"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(LROMAN1);}}

"{roman}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(LROMAN2);}}

"\\Roman"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(CROMAN1);}}
"{Roman}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(CROMAN2);}}

"\\rm"			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(RM);}}

"\\section"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(SECTION);}}

"{single}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(SINGLE);}}

"\\subsection"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(SUBSEC);}}

"\\tableofcontents"	{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(TABOCON);}}
"{table}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(TABLE);}}
"{tabular}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(TABULAR);}}
"{verbatim}"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(VERBATIM);}}

"\\end{verbatim}"       {printf(" %s \n", yytext); return(EXITVERB);}

"\\vspace"		{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(VSPACE);}}

"b"			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(B);}}

"h"			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(H);}}

"t"			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(T);}}

{cols}                  {printf(" %s \n", yytext); static_tabular_column_count = strlen(yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(COLS);}}

"{"			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(LCURLYB);}}
"}"			{printf(" %s \n", yytext);
			if(ws_flag == 1){
			return(WORD);}
			else{return(RCURLYB);}}



{word}			{printf(" %s \n", yytext);return(WORD);}

{ws}			{/*printf("ws--%s--ws\n", yytext); */
                         if ((strcmp(yytext, "\n\n") == 0) && (ws_flag == 0)){
                            incr_lines_so_far();return(WS);}
                         else if (ws_flag == 1){ return(WS);}}

%%

