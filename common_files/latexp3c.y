/* THIS IS latexp3code.y */
%{ /* A YACC FOR PART 3 OF THE PROJECT WHERE VERBATIM AND NESTING WORKS */
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#define  BUF_SIZE      1024  //40768

int ws_flag = 0;
#define YYDEBUG 1
#include "lex.yy.c"
#include "util.c"
#include "generate.c"
#include "styleroutines.c"

%}
%defines

%union 
   {
      char   trans[BUF_SIZE+1];
      int    val;
   }

%start latexstatement

%token  BACKSL    LBEGIN    LCURLYB    DOCUMENT    RCURLYB    END
%token  WORD      WS        SPECCHAR   CENTER      VERBATIM   SINGLE  
%token  ITEMIZE   ENUMERATE TABULAR    TABLE       LSQRB      RSQRB
%token  H         T         B          COLS
%token  CAPTION   LABEL     DBLBS      ITEM        SECTION    SUBSEC  
%token  TABOCON   RENEW     BASELINES  PAGENUM     INTEGER    ARABIC1 
%token  LROMAN1   CROMAN1   LALPH1     CALPH1      VSPACE     HSPACE
%token  RM        IT        NOINDENT   REF 
%token  ARABIC2   LROMAN2   CROMAN2    LALPH2      CALPH2
%token  NEWLINE

%type <trans> textoption  wsorword
%type <val> style2 ARABIC2 LROMAN2 CROMAN2 LALPH2 CALPH2 

%%
latexstatement   :  startdoc  mainbody  enddoc
                 ;

startdoc         :  LBEGIN  DOCUMENT  
                 ;

enddoc           :  END  DOCUMENT  
                 ;

mainbody         :  mainbody  mainoption
                 |  mainoption
                 ;

mainoption       :  textoption
                    {
                      generate_formatted_text($1);
                      /* if(P_DEBUG){ */
                      /*     fprintf(stdout, "---------------------------------------\n"); */
                      /*     fprintf(stdout, "DEBUG - GENERATE_FORMATTED_TEXT:\n %s\n", $1); */
                      /*     fprintf(stdout, "---------------------------------------\n"); */
                      /* } */
                    }
                 |  commentoption
                 |  latexoptions
                 ;

textoption       :  textoption  wsorword
                    {
                      strcat($$, " ");
                      strcat($$, $2);
                      
                    }
                 |  wsorword
                    {
                      strcpy($$, $1);
                     
                    }
                 ;

wsorword         :  WS 
                    {
                      strcpy($$, yytext);
                    }
                 |  WORD
                    {
                      strcpy($$, yytext);
                       /* if(P_DEBUG) */
                       /*    { */
                       /*        /\* fri_write_text($$); *\/ */
                       /*        fprintf(stdout, "DEBUG: WSORWORD: %s\n", $$); */
                       /*    } */
                    }
                 ;

commentoption    :  SPECCHAR  textoption
                 ;

latexoptions     :  backsoptions
                 |  LCURLYB  curlyboptions  RCURLYB
                 ;

curlyboptions    :  RM  textoption
                        {
                            generate_formatted_text(" <RM>");
                            generate_formatted_text($2);
                            generate_formatted_text("</RM> ");
                        }
                 | IT textoption
                        {
                            generate_formatted_text(" <IT>");
                            generate_formatted_text($2);
                            generate_formatted_text("</IT> ");
                        }
                 ;

backsoptions     :  beginendopts
                 |  sectionoptions
                 |  tableofcont
                 |  linespacing
                 |  pagenumbers
                 |  pagenuminit
                 |  spacing
                 |  fonts
                 |  specialchar
                 |  nonewpara
                 |  reference
                 ;
     
beginendopts     :  LBEGIN  begcmds  beginblock  endbegin  
                 ;

begcmds          :  CENTER  
                 |  VERBATIM  {ws_flag=1;}
                 |  SINGLE    { print_newline(); set_line_spacing(1);}
                 |  ITEMIZE  
                 |  ENUMERATE 
                 |  TABLE  begtableopts
                 |  TABULAR  begtabularopts
                 ;

endbegin         :  END  endcmds
                 |  endtableopts  TABLE  
                 ;

endcmds          :  CENTER  
                 |  VERBATIM  {ws_flag=0;}
                 |  SINGLE  { print_newline();set_line_spacing(2);}
                 |  ITEMIZE  
                 |  ENUMERATE 
                 |  TABULAR
                 ;

beginblock       :  beginendopts
                 |  textoption /* FOR single or verbatim */
                                    {generate_formatted_text($1);}
                 |  entrylist  /* FOR center and tabular */
                                    {printf("center or tabular\n");}
                 |  listblock  /* FOR item and enumerate */
                                    {printf("item or enumerate\n");}
                 ;

listblock        :  listblock  anitem
                                    {printf("listblockA\n");}
                 |  anitem
                                    {printf("listblockB\n");}
                 ;

anitem           :  ITEM  textoption
                 |  beginendopts
                 ;

entrylist        :  entrylist  anentry
                                    {printf("entrylistA\n");}
                 |  anentry
                                    {printf("entrylistB\n");}
                 ;

anentry          :  entry  DBLBS
                                    {printf("anentryA\n");}
                 |  beginendopts
                                    {printf("anentryB\n");}
                 ;

entry            :  entry  SPECCHAR  textoption
                                    {printf("entryA\n");}
                 |  textoption
                                    {printf("entryB\n");}
                 ;

begtableopts     :  LSQRB  position  RSQRB
                 ;
                 
begtabularopts   :  LCURLYB  COLS  RCURLYB
                 ;

position         :  H  
                 |  T  
                 |  B
                 ;

endtableopts     :  END
                 |  CAPTION  LCURLYB  textoption  RCURLYB  captionrest
                 |  labelrest 
                 ;

captionrest      :  END
                 |  labelrest
                 ;

labelrest        :  LABEL  LCURLYB  WORD  RCURLYB  END
                 ;

sectionoptions   :  SECTION  LCURLYB  textoption  RCURLYB
                    {
                      generate_sec_header(get_sec_ctr(), $3);
                      incr_sec_ctr();
                    }
                 |  SUBSEC  LCURLYB  textoption  RCURLYB
                    {
                      generate_subsec_header(get_sec_ctr() -1, get_subsec_ctr(), $3);
                      incr_subsec_ctr();
                    }
                 ;

tableofcont      :  TABOCON
                    {
                      set_gen_toc();
                    }
                 ;

linespacing      :  RENEW  LCURLYB  BASELINES  RCURLYB
                            LCURLYB  WORD  
                        {
                            set_line_spacing(atoi(yytext));   
                        }
                        RCURLYB
                 ;

pagenumbers      :  PAGENUM  style2
                    {
                      /* set_page_style($2); */
                      /* fprintf(stdout, "PAGENUMBER %d\n", $2); */
                    }
                 ;

style2           :  ARABIC2 { set_page_style(ARABIC2); }
                 |  LROMAN2 { set_page_style(LROMAN2); }
                 |  CROMAN2 { set_page_style(CROMAN2); }
                 |  LALPH2  { set_page_style(LALPH2); }
                 |  CALPH2  { set_page_style(CALPH2); }
                 ;

pagenuminit      :  style1  LCURLYB  WORD  
                    {
		      
                      set_page_no(yytext[0]);
                      set_starting_page_no(yytext[0]);
                    }
                    RCURLYB
                 ;

style1           :  ARABIC1
                 |  LROMAN1 
                 |  CROMAN1 
                 |  LALPH1 
                 |  CALPH1
                 ;

spacing          :  VSPACE LCURLYB  WORD 
                    {                      
                        generate_spacing(VSPACE, yytext);
                    }
                    RCURLYB
                 |  HSPACE LCURLYB WORD
                    {
                        generate_spacing(HSPACE, yytext);
                    }
                    RCURLYB
                 ;


fonts            :  RM { set_font(RM); } 
                 |  IT { set_font(IT); }
                 ;

specialchar      :  SPECCHAR  
                 |  LCURLYB  
                 |  RCURLYB
                 ;

nonewpara        :  NOINDENT
                 ;

reference        :  REF  LCURLYB  WORD  RCURLYB
                 ;
%%

yyerror(){}

main()
{
yydebug = 1;
fpout = fopen("test/latexout","w");
fptoc = fopen("test/latextoc","w");
init_lines_so_far();
init_output_page();

 init_DST();

yyparse();

 if(get_font()) set_font(get_font());
}
