/* THIS IS THE generate.c FILE */

#include "prototypes.h"

int no_indent = 0;
int center_block = 0;
int itemize_block = 0;
int enumerate_block = -1;
int tabular_block = 0;

int nested_enumerate_count[10];

#define TABLE_STRING_SIZE 200
char tabular_data[20][20][TABLE_STRING_SIZE];
int tabular_row_count = -1;
int tabular_column_count = -1;
int static_tabular_column_count = 0;
int longest_entry_column[20];
char column_allignment_info[20];

init_output_page()
{
	/* fprintf(fpout, "\n\n\n\n\n"); */
	fflush(fpout);
  char_count = 0;
}

void  generate_sec_header(int i,char* s)
{
    /* if(P_DEBUG) fprintf(stdout, "DEBUG: generate_sec_header\n"); */
    fprintf(fpout, "\n\n%d %s\n\n", i, s);
    int k;
    for(k=0; k<4; k++)
         incr_lines_so_far();
    fflush(fpout);

	if (get_gen_toc() == TOC_ON){
      /* if(P_DEBUG) fprintf(stdout, "DEBUG: PRINT TOC TO FILE!!\n"); */
   		fprintf(fptoc, "\n%d %s ----------", i, s);
      printPageNumber(fptoc);
      fflush(fptoc);
  }
}

void  generate_subsec_header(int i, int j, char *s)
{
    /* if(P_DEBUG) fprintf(stdout, "DEBUG: generate_subsec_header\n"); */
    fprintf(fpout, "\n\n%d.%d %s\n\n", i, j, s);
    int k;
    for(k=0; k<4; k++)
         incr_lines_so_far();
    fflush(fpout);

    if (get_gen_toc() == TOC_ON){
        fprintf(fptoc, "\n%d.%d %s ----------", i, j,s);
        printPageNumber(fptoc);
        fflush(fptoc);
  }
  
}

void generate_formatted_text(char *s)
{
    int slen = strlen(s);
    int i;
    int j;
    int k;
    int p = 0;
    fprintf(stdout, "START GEN_FOR_TEXT (%s)\n", s);

    if( center_block == 1)
        {
            int center = (int) ((OUT_WIDTH - slen)/2);
            for(j=0; j<center; j++)
                {
                    fprintf(fpout, " ");
                    p = char_count++;
                }
        }

    for(i=0; i <=slen;)
        {            
            /* fprintf(stdout, "\nDEBUG:: CHAR COUND = %d is [%c]\n", char_count, s[i]); */
            if((char_count-p) < OUT_WIDTH)
                {
                    if(isprint(s[i]))
                        {
                            fprintf(fpout, "%c", s[i]);                         
                            char_count++;
                        }
                       i++;
                }
            else
                {
                    char_count = 0;
                    k = OUT_WIDTH - slen;
                    print_line_spacing(); 
                    if(itemize_block) 
                        { //inside item block
                            fprintf(fpout, "\n   "); char_count = 3;                         
                        } 
                    else if (enumerate_block >= 0)
                        {//inside enumerate block
                            int enum_start_space;
                            print_line_spacing();
                            for(enum_start_space = 0; enum_start_space <= enumerate_block; enum_start_space++)
                                {
                                    fprintf(fpout,"  ");
                                }
                        }
                    else if (center_block == 1)
                        {
                            int center = (int)((OUT_WIDTH -k)/2);
                            for(j=0; j<  center; j++)
                                {
                                    fprintf(fpout, " ");
                                }
                        }
                    else 
                        { //not inside any advanced blocks
                            print_line_spacing(); 
                        }
                    if(enumerate_block >= 0) { debug_print("INSIDE ENU in GEN_TEXT");}
                    if(isprint(s[i])) fprintf(fpout, "%c", s[i]);
                    i++;
                    char_count++;
                }

             if(i >= 1 && s[i] == '\n' && s[i-1] == '\n' )
                {
                    fprintf(stdout, "\n\nPARA_BREAK! \n\n");
                    print_newline(); print_newline();
                    char_count = 0;
                                        
                }
        }
    // print_newline(); //Paragraph seperator for next chunk of text

}

void print_line_spacing()
{
    int i;
    int space = get_line_spacing();
    for(i=0; i < space; i++)
        {
            fprintf(fpout, "\n");
            incr_lines_so_far();
        }

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
    fprintf(stdout, "---------DEBUG PRINT START--------\n");
    fprintf(stdout, "%s\n", s); //TODO: printing wrong because int to string convertion?
    fprintf(stdout, "---------DEBUG PRINT END----------\n");
}

void print_list_enumerate(char* s)
{
    if(itemize_block)
        {
            fprintf(fpout, "-  "); 
            char_count = 2;
            generate_formatted_text(s);
            print_line_spacing(); 
        }
    else if (enumerate_block >= 0)
        {
            /* fprintf(fpout, "DEBUG %d", nested_enumerate_count[0]); */
            int i;
            char_count = 0;
            for(i = 0; i <= enumerate_block; i++)
                {
                    fprintf(fpout, "%d.",nested_enumerate_count[i]);
                    char_count += 2;
                }
            fprintf(fpout, " ");
            char_count++;
            debug_print(s);
            generate_formatted_text(s); 
            print_line_spacing();
        }
}


void store_table_column(char* s)
{
    int i;
    for(i=0; i<TABLE_STRING_SIZE && i< (strlen(s) + 1); i++)
        {
            tabular_data[tabular_row_count][tabular_column_count][i] = *(s+i);
        }
    /* tabular_data[tabular_row_count][tabular_column_count][i] = 0;  */
    fprintf(stdout, "SET:: [%d][%d] = (%s) :: org string = (%s)\n", 
            tabular_row_count, tabular_column_count, tabular_data[tabular_row_count][tabular_column_count]
            , s);
    fflush(stdout);
}

void set_row_alignment(char* s)
{
    int i = strlen(s);
    int k;
    for(k = 0; k < i; k++)
        column_allignment_info[k] = s[k];

    for(k=0;k<i;k++)
        fprintf(stdout, "FOUND ROW ALIGN %c\n", column_allignment_info[k]);
}

void print_table()
{
    //find the longest column
    int i, j;
    int longest_entry = 0;
    
    fprintf(stdout, "max row/column = [%d][%d]\n", tabular_row_count, static_tabular_column_count);
    fflush(stdout);
    for(j=0; j<static_tabular_column_count; j++){
        for(i=0; i<tabular_row_count; i++)
            {
                fprintf(stdout, "ACCESS [%d][%d] = ", i,j);
                fflush(stdout);
                fprintf(stdout, "%s\n",tabular_data[i][j]);
                fflush(stdout);
                int length =  strlen(tabular_data[i][j]);
                /* fprintf(fpout, "DATA: (%s)\n", tabular_data[i][j]); */
                fflush(fpout);
                if(length > longest_entry)
                    {
                        fprintf(stdout, "DEBUG: Found longest_entry (%s)\n", tabular_data[i][j]);
                        longest_entry = length;
                    }
            }

        //put the longest entry for this column here in an array
        longest_entry_column[j] = longest_entry;
        longest_entry = 0;
    }
    /* int k; */
    /* for(k = 0; k < static_tabular_column_count; k++) */
    /*     { */
    /*         fprintf(stdout, "DEBUG-ARRAY-index[%d]: Longest=%d\n",k, longest_entry_column[k]); */
    /*     } */

    

    //now print the table
    char filler[10*longest_entry];
    filler[0] = 0;
   
    /* fprintf(fpout, "TE%sST\n", filler); */
    char_count = 0;
    for(i=0; i<tabular_row_count; i++){
        for(j=0; j<static_tabular_column_count; j++)
            {
                int length = strlen(tabular_data[i][j]);
                int filler = longest_entry_column[j] - length;
                

                //align the columns
                if(column_allignment_info[j] == 'r')
                    {
                        int k;
                        for(k=0; k <=filler; k++)
                            generate_formatted_text(" ");
                        
                    }
                else if( column_allignment_info[j] == 'c')
                    {
                        int k;
                        for(k=0; k <=filler/2; k++)
                            generate_formatted_text(" ");

                    }
                   
                fprintf(stdout, "FILLER::(%d) DATA::(%s)\n", filler, tabular_data[i][j]);
                generate_formatted_text(tabular_data[i][j]);
                
                if( column_allignment_info[j] == 'c')
                    {
                        int k;
                        for(k=0; k <=filler/2; k++)
                            generate_formatted_text(" ");

                    }
                else if (column_allignment_info[j] == 'l')
                    {
                        
                        int k;
                        for(k=0; k <=filler; k++)
                            generate_formatted_text(" ");
                    }

                
            }
        print_line_spacing();
        char_count = 0;
    }
    print_line_spacing();
}
