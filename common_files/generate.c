/* THIS IS THE generate.c FILE */

#include "prototypes.h"

init_output_page()
{
	/* fprintf(fpout, "\n\n\n\n\n"); */
	fflush(fpout);
  char_count = 0;
}

void  generate_sec_header(int i,char* s)
{
    if(P_DEBUG) fprintf(stdout, "DEBUG: generate_sec_header\n");
    fprintf(fpout, "\n\n%d %s\n\n", i, s);
    fflush(fpout);

	if (get_gen_toc() == TOC_ON){
      if(P_DEBUG) fprintf(stdout, "DEBUG: PRINT TOC TO FILE!!\n");
   		fprintf(fptoc, "\n%d %s ---------- PAGE %d\n", 
                            i, s, get_page_no());
      fflush(fptoc);
  }
}

void  generate_subsec_header(int i, int j, char *s)
{
    if(P_DEBUG) fprintf(stdout, "DEBUG: generate_subsec_header\n");
    fprintf(fpout, "\n\n%d.%d %s\n\n", i, j, s);
    fflush(fpout);

    if (get_gen_toc() == TOC_ON){
        fprintf(fptoc, "\n%d.%d %s ---------- PAGE %d\n", 
                            i, j, s, get_page_no());
        fflush(fptoc);
  }
  
}

void generate_formatted_text(char *s)
{
    int slen = strlen(s);
    int i;
    fprintf(stdout, "START GEN_FOR_TEXT (%s)\n", s); 
    /* fprintf(fpout, "\n"); */

    for(i=0; i <=slen;)
        {
            if(char_count < OUT_WIDTH)
                {
                    if(isprint(s[i])) fprintf(fpout, "%c", s[i]);
                    if(P_DEBUG) fprintf(stdout, "Char Cound: %d\n", char_count);
                    i++;
                    char_count++;
                }
            else
                {
                    char_count = 0;
                    fprintf(fpout, "\n");
                    if(isprint(s[i])) fprintf(fpout, "%c", s[i]);
                    i++;
                    char_count++;
                    if(P_DEBUG) fprintf(stdout, "%c", s[i]);
                }
        }
    /* fprintf(fpout, "\n"); */
}



void generate_spacing(int type, char *amount)
{
    int spacing = atoi(amount);
    switch (type) {
    case HSPACE: print_hor_space(spacing); break;
    case VSPACE: print_vert_space(spacing); break;
    }  
}


void print_vert_space(int spacing)
{
    /* if(P_DEBUG) fprintf(fpout, " DEBUG: PRINT VERT SPACE\n"); */
    int i;
    for(i = 0; i < spacing; i++)
        {
            fprintf(fpout, "\n");
            incr_lines_so_far();
        }
}


void print_hor_space(int spacing)
{
    int i;
    for(i =0; i<spacing; i++)
        {
            generate_formatted_text(" ");            
        }
}

void debug_print(char *s)
{
    fprintf(stdout, "---------DEBUG PRINT----------\n");
    fprintf(stdout, "%s\n", s);
    fprintf(stdout, "---------DEBUG PRINT----------\n");
}
