/* THIS IS THE util.c FILE */

FILE *fpout;
FILE *fptoc;

#define  OUT_WIDTH       40
#define  SPACE_LEFT       5
#define  LINES_PER_PAGE  40
#define  TOC_ON           1

char  line[OUT_WIDTH + 1];
int   lines_so_far;
int   total_pages;

char  tempBuf[BUF_SIZE + 1];
int char_count;

int starting_page_number;
int oldLineSpace = 0;


void  init_lines_so_far()
{
  lines_so_far = 0;
}

void  incr_lines_so_far()
{
    /* fprintf(stdout, "DEBUG: INCR LINE NUMBER (%d), Page_no = %d \n", lines_so_far, get_page_no()); */
    lines_so_far++;
    /* int mul_number = (get_page_no() - starting_page_number < 1 ? 1 : get_page_no() - starting_page_number); */
    
    if((lines_so_far) % ( LINES_PER_PAGE) == 0)
        {
            if(get_page_no() > 0) 
                {                    
                    fprintf(stdout, "\n\n\n\nPUT PAGE NUMBER HERE!!!!!!!\n\n");
                    printPageNumber(fpout);                    
                }
            
            int discard = inc_page_no();
        }
}

int   check_done_page()
{
  if (lines_so_far < LINES_PER_PAGE) 
    return 1;
  else
    return 0;
}


struct  doc_symtab 
   {
      int     page_no_counter;
      int     page_style;
      int     line_spacing;
       int     current_font; // RM OR ITS
      int     generate_toc;
      int     section_counter;
      int     subsect_counter;
   };

struct  doc_symtab  DST;

void init_DST()
{
    DST.line_spacing = 1;
    DST.current_font = 0;
    DST.section_counter = 1;
    DST.subsect_counter = 1;
    
}

void  incr_sec_ctr()
{
  DST.section_counter++;
  DST.subsect_counter = 1;
}

void  incr_subsec_ctr()
{
  DST.subsect_counter++;
}

int  get_sec_ctr()
{
  return DST.section_counter;
}

int  get_subsec_ctr()
{
  return DST.subsect_counter;
}

int   get_gen_toc()
{
  return  DST.generate_toc;
}

void  set_gen_toc()
{
    debug_print("GENERATE TOC");
  DST.generate_toc = 1;
}

void  set_page_no(p)
char  p;
{
/* fprintf(stdout, "DEBUG: SET PAGE NUMBER\n"); */
  DST.page_no_counter = p - '0';
}
void set_starting_page_no(p)
     char p;
{
    starting_page_number = p - '0';    
}


int   get_page_no() /* need this p? */
{
/* fprintf(stdout, "DEBUG: GET PAGE NUMBER\n"); */
  return DST.page_no_counter;
}

int   inc_page_no()
{
  /* fprintf(stdout, "DEBUG: INCR PAGE NUMBER\n"); */
  DST.page_no_counter++;
  return (DST.page_no_counter - 1);
}

void  set_page_style(s)
int   s;
{
  DST.page_style = s;
}

void set_font(int f)
{
    switch(get_font())
        {
        case RM: if (f==IT) generate_formatted_text(" </RM> <IT> "); else generate_formatted_text(" </RM> "); break;
        case IT: if(f==RM) generate_formatted_text(" </IT> <RM> "); else generate_formatted_text(" </IT> ");  break;  
        default: if(f==RM) generate_formatted_text(" <RM> ");
            else generate_formatted_text(" <IT> ");                   
        }
    
    DST.current_font = f;
}

int get_font()
{
    return DST.current_font;
}

void set_line_spacing(int space)
{
    if(P_DEBUG) fprintf(stdout, "LINE SPACING = %d\n", space);
    
    DST.line_spacing = space;    
}

void set_single_line_spacing(int space)
{
    if(P_DEBUG) fprintf(stdout, "SINGLE LINE SPACING = %d\n", space);
    oldLineSpace = get_line_spacing();    
    DST.line_spacing = space;    
}

int get_line_spacing()
{
    return DST.line_spacing;
}


void print_newline()
{
    /* if(P_DEBUG) debug_print("DEBUG: Printing New line"); */
    fprintf(fpout, "\n");
    incr_lines_so_far();    
}

int restore_line_spacing()
{
    return oldLineSpace;    
}
