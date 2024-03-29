/* THIS IS THE generate.c FILE */
init_output_page()
{
fprintf(fpout, "\n\n\n\n\n");
fflush(fpout);
}

void  generate_sec_header(i, s)
int  i;
char *s;
{
fprintf(fpout, "\n\n%d %s\n", i, s);
fflush(fpout);

if (get_gen_toc() == TOC_ON)
   fprintf(fptoc, "\n%d %s ---------- PAGE %d\n", 
                            i, s, get_page_no());
}

void  generate_subsec_header(i, j, s)
int  i,j;
char *s;
{
fprintf(fpout, "\n\n%d.%d %s\n", i, j, s);
fflush(fpout);

if (get_gen_toc() == TOC_ON)
   fprintf(fptoc, "\n%d.%d %s ---------- PAGE %d\n", 
                            i, j, s, get_page_no());
}

void  generate_formatted_text(s)
char *s;
{
int slen = strlen(s);
int i, j, k, r;
int llen;

for (i = 0; i <= slen; )
  {
   for (j = 0; ((j < OUT_WIDTH) && (i <= slen)); i++, j++)
       line[j] = s[i];

   if (i <= slen)
     {
       if ((line[j-1] != ' ') && (s[i] !=' '))
         {
           for (k = j-1; line[k] != ' '; k--)
             ;
           i = i - (j - k - 1);
           j = k;
         }
       for ( ; s[i] == ' '; i++) 
         ;
     }

   line[j] = '\0';

   llen = strlen(line);
   
   if (i <= slen)
     {
       fprintf(fpout, "\n%s", line);
       fflush(fpout);
     }
   else
     {
       for(r = 0; r <= llen; r++)
         s[r] = line[r];  /* includes backslash 0 */
     }
  }
}
