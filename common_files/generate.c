/* THIS IS THE generate.c FILE */
/* Worked on by Alex Martienz and Frison Alexander
   this holds all the code that formats and prints the output */

#include "prototypes.h"

//These Variables determine if the blocks have started, 
//and how deep the levels of blocks are
int no_indent = 0;
int center_block = 0;
int itemize_block = 0;
int enumerate_block = -1;
int tabular_block = 0;
int verbatium_block = 0;




int nested_enumerate_count[10];

//These block of variables all hold information
//about table.. since we need to store the whole
//table in memory before being printed.
#define TABLE_STRING_SIZE 200
char tabular_data[20][20][TABLE_STRING_SIZE];
int tabular_row_count = -1;
int tabular_column_count = -1;
int static_tabular_column_count = 0;
int longest_entry_column[20];
char column_allignment_info[20];
int nested_table = 0;


init_output_page()
{
	/* fprintf(fpout, "\n\n\n\n\n"); */
	fflush(fpout);
  char_count = 0;
}

//Prof's code
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

//returns the number of words in the given line
int countWords(const char *line){
    const int len = strlen(line);
    char buf1[100];
    int i = 0;
    int count = 0;
    //skip starting whitespaces
    while( isspace(line[i]) ) ++i;

    if(i >= len) return 0; //if input was all whitespace

    //check for words
    while(i < len)
        {
            if(isspace(line[i]) && i+1 < len && !isspace(line[i+1])) {
                ++count;
            }
            ++i;
        }
    return count + (len > 0 ? 1: 0);
}

char * fullJustify(char *line,char *res,const int MAX_WIDTH){
    const int lineLength = strlen(line);
    const int paddingAmount = MAX_WIDTH - lineLength;
    if(paddingAmount > MAX_WIDTH/2){
        strcpy(res,line); return res;
    }
    const int numOfWords = countWords(line);
    int spacesToAddPerWord = numOfWords == 1 ? 0 : paddingAmount/(numOfWords-1);
    int remainingSpaces = numOfWords == 1 ? : paddingAmount % (numOfWords-1);
    const char *delim = " \t";
    char *nextWord = strtok(line,delim);
    while(nextWord != NULL){
        //copy nextWord
        strcat(res,nextWord);
        strcat(res," ");
        int n = spacesToAddPerWord;
        while(n-- > 0){ 
            strcat(res," ");
        }
        if(remainingSpaces > 0){ 
            strcat(res," ");
            --remainingSpaces; 
        }
        nextWord = strtok(NULL,delim);
    }
    return res;
}

//Prof's code
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

//Prof's code
void print_verbatium(char* s)
{
    char_count = 0;
    int i;
    fprintf(stdout, "START PRINT_VERB (%s)\n", s);
    for(i=0; i<strlen(s); i++)
        {
            if(char_count < OUT_WIDTH)
                {
                    fprintf(fpout, "%c", s[i]);
                    char_count++;
                }
            else 
                {
                    char_count = 0;
                    print_newline();
                    fprintf(fpout, "%c", s[i]);
                }
        }
}

/* we did not use the prof code because it was not working
   properly for us. It does the same function */
void generate_formatted_text(char *s)
{
    int slen = strlen(s);
    int i;
    int j;
    int k;
    int p = 0;
    fprintf(stdout, "START GEN_FOR_TEXT (%s)\n", s);
           

    if( verbatium_block) { print_verbatium(s); return;}

    if( center_block == 1)
        { // center the text since were in a center block
            int center = (int) ((OUT_WIDTH - slen)/2);
            for(j=0; j<center; j++)
                {
                    fprintf(fpout, " ");
                    p = char_count++;
                }
        }

    /* char buffer[512];	 */

    for(i=0; i <=slen;)
        {            
            /* fprintf(stdout, "\nDEBUG:: CHAR COUND = %d is [%c]\n", char_count, s[i]); */
            if((char_count-p) < OUT_WIDTH)
                {
                    if(isprint(s[i]))
                        { //print the character 
                            fprintf(fpout, "%c", s[i]);                         
                            char_count++;
                        }
                       i++;
                }
            else //start a new line
                {                    
                    char_count = 0;
                    k = OUT_WIDTH - slen;
                    //print_line_spacing(); 
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
                                    char_count++;
                                }
                        }
                    else if (center_block == 1)
                        {
                            int center = (int)((OUT_WIDTH -k)/2);
                            for(j=0; j<  center; j++)
                                {
                                    fprintf(fpout, " ");
                                    char_count++;
                                }
                        }
                    else 
                        { //not inside any advanced blocks
                            print_line_spacing();
                        }

                    if(isprint(s[i]) && s[i] != ' ') {
                        fprintf(fpout, "%c", s[i]);
                        char_count++;         
                    }
                    i++;

                }

             if(i > 1 && s[i] == '\n' && s[i-1] == '\n' )
                {
                    fprintf(stdout, "\n\nPARA_BREAK! \n\n");
                    print_newline(); print_newline();
                    char_count  =  0 ;                                         
                }
        }
}

//print line spacing
void print_line_spacing()
{
    int i;
    int space = get_line_spacing();
    for(i=0; i < space ; i++)
        {
            fprintf(fpout, "\n");
            incr_lines_so_far();
        }
}


// generate spacing
void generate_spacing(int type, char *amount)
{
    int spacing = atoi(amount);
    switch (type) {
    case HSPACE: print_hor_space(spacing); break;
    case VSPACE: print_vert_space(spacing); break;
    }  
}


//print vertical spacing
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

//print horizontal spacing
void print_hor_space(int spacing)
{
    int i;
    for(i =0; i<spacing; i++)
        {
            generate_formatted_text(" ");            
        }
}

//This function is used for debugging the code
void debug_print(char *s)
{
    fprintf(stdout, "---------DEBUG PRINT START--------\n");
    fprintf(stdout, "%s\n", s);
    fprintf(stdout, "---------DEBUG PRINT END----------\n");
}

//Print a list of items 
void print_list_enumerate(char* s)
{
    if(itemize_block)
        {//inside an itemized block
            fprintf(fpout, "-  "); 
            char_count = 2;
            generate_formatted_text(s);
            print_line_spacing(); 
        }
    else if (enumerate_block >= 0)
        { //inside an enumerate block
            /* fprintf(fpout, "DEBUG %d", nested_enumerate_count[0]); */
            int i;
            char_count = 0;
            for(i = 0; i <= enumerate_block; i++)
                { //print the number 
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

//since we need to get the whole table in memory
//before printing, because we need to compute column
//aligment and all that stuff. Store each element in
//the table in to memory.
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

//print table caption
void print_table_caption(char* s)
{
    generate_formatted_text("CAPTION: ( ");
    generate_formatted_text(s);
    generate_formatted_text(" )");
    print_line_spacing();
    
}

//figure out how to space the columns
void set_row_alignment(char* s)
{
    int i = strlen(s);
    int k;
    for(k = 0; k < i; k++)
        column_allignment_info[k] = s[k];

    for(k=0;k<i;k++)
        if(P_DEBUG) fprintf(stdout, "FOUND ROW ALIGN %c\n", column_allignment_info[k]);
}

//print table
void print_table()
{
    //find the longest column
    int i, j;
    int longest_entry = 0;
    
    if(P_DEBUG) fprintf(stdout, "MAX [row][column] = [%d][%d]\n", tabular_row_count, static_tabular_column_count);
    fflush(stdout);

    //for each column find the longest element
    for(j=0; j<static_tabular_column_count; j++){
        for(i=0; i<tabular_row_count; i++)
            {
                if(P_DEBUG)
                    {
                        fprintf(stdout, "ACCESS [%d][%d] = ", i,j);
                        fflush(stdout);
                        fprintf(stdout, "%s\n",tabular_data[i][j]);
                        fflush(stdout);
                    }
                int length =  strlen(tabular_data[i][j]);
                /* fprintf(fpout, "DATA: (%s)\n", tabular_data[i][j]); */
                fflush(fpout);
                if(length > longest_entry)
                    {
                        if(P_DEBUG) fprintf(stdout, "DEBUG: Found longest_entry (%s)\n", tabular_data[i][j]);
                        longest_entry = length;
                    }
            }

        //put the longest entry for this column here in an array
        longest_entry_column[j] = longest_entry;
        longest_entry = 0;
    }    

    //now print the table
    char filler[10*longest_entry];
    filler[0] = 0;

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
                   
                if(P_DEBUG) fprintf(stdout, "FILLER::(%d) DATA::(%s)\n", filler, tabular_data[i][j]);
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
