#define P_DEBUG 1

extern int static_tabular_column_count;

void print_vert_space(int spacing);
void print_hor_space(int spacing);
void  incr_lines_so_far();
void printPageNumber();
void generate_formatted_text(char *s);
void print_line_spacing();
void print_newline(); //in util.c
void debug_print(char *s); //generate.c
void debug_print_block(char*s);//util.c
