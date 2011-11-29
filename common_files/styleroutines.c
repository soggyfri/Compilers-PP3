/*  changes retruns the numbers to ALPH */
char get_page_no_LALPH2()
{
    char temp = ' ';
    char alpChar[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H','I','J', 'K', 'L', 'M', 'N','O', 'P',
                      'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
        temp = alpChar[get_page_no() - 1];
        return temp;
}
/*  changes retruns the numbers to ALPH */
char get_page_no_CALPH2()
{
    char temp = ' ';
    char alpChar[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h','i','j', 'k', 'l', 'm', 'n','o', 'p',
                      'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
        temp = alpChar[get_page_no() - 1];
        return temp;
}
/*  changes retruns the numbers to Roman */
char* get_page_no_CROMAN2(){
    int num1 = get_page_no();
    char str[80];
    str[0]=0;

    while(num1 >= 1000){
    printf("M"); 
    strcat(str, "M");
    num1 -= 1000;
    }
    if (num1 >= 900)
    {
    printf("CM");
    strcat(str, "CM");
    num1 -= 900;
    }
    if (num1 >= 500)
    {
    printf("D");
    strcat(str, "D");
    num1 -= 500;
    }
    if (num1 >= 400)
    {
    printf("CD");
    strcat(str, "CD");
    num1 -= 400;
    }
    while (num1 >= 100)
    {
    printf("C");
    strcat(str, "C");
    num1 -= 100;
    }
    if (num1 >= 90)
    {
    printf("XC");
    strcat(str, "XC");
    num1 -= 90;
    }
    if (num1 >= 50)
    {
    printf("L");
    strcat(str, "L");
    num1 -= 50;
    }
    if (num1 >= 40)
    {
    printf("XL");
    strcat(str, "XL");
    num1 -= 40;
    }
    while (num1 >= 10)
    {
    printf("X");
    strcat(str, "X");
    num1 -= 10;
    }
    if (num1 >= 9)
    {
    printf("IX");
    strcat(str, "IX");
    num1 -= 9;
    }
    if (num1 >= 5)
    {
    printf("V");
    strcat(str, "V");
    num1 -= 5;
    }
    if (num1 >= 4)
    {
    printf("IV");
    strcat(str, "IV");
    num1 -= 4;
    }
    while (num1 >= 1)
    {
    printf("I");
    strcat(str, "I");
    num1 -= 1;
    }

    return str;
}

/*  changes retruns the numbers to Roman */
char* get_page_no_LROMAN2(){
    int num1 = get_page_no();
    char str[80];
    str[0]=0;

    while(num1 >= 1000){
    printf("m"); 
    strcat(str, "m");
    num1 -= 1000;
    }
    if (num1 >= 900)
    {
    printf("cm");
    strcat(str, "cm");
    num1 -= 900;
    }
    if (num1 >= 500)
    {
    printf("d");
    strcat(str, "d");
    num1 -= 500;
    }
    if (num1 >= 400)
    {
    printf("CD");
    strcat(str, "cd");
    num1 -= 400;
    }
    while (num1 >= 100)
    {
    printf("c");
    strcat(str, "c");
    num1 -= 100;
    }
    if (num1 >= 90)
    {
    printf("xc");
    strcat(str, "xc");
    num1 -= 90;
    }
    if (num1 >= 50)
    {
    printf("l");
    strcat(str, "l");
    num1 -= 50;
    }
    if (num1 >= 40)
    {
    printf("xl");
    strcat(str, "xl");
    num1 -= 40;
    }
    while (num1 >= 10)
    {
    printf("x");
    strcat(str, "x");
    num1 -= 10;
    }
    if (num1 >= 9)
    {
    printf("ix");
    strcat(str, "ix");
    num1 -= 9;
    }
    if (num1 >= 5)
    {
    printf("v");
    strcat(str, "v");
    num1 -= 5;
    }
    if (num1 >= 4)
    {
    printf("iv");
    strcat(str, "iv");
    num1 -= 4;
    }
    while (num1 >= 1)
    {
    printf("i");
    strcat(str, "i");
    num1 -= 1;
    }

    return str;
}

void printPageNumber(FILE* outputFile)
{
    /* fprintf(fpout, "(style %d)PAGE NUMBER: ", DST.page_style); */
    if (DST.page_style == ARABIC2)
        {
            fprintf(outputFile, "PAGE (%d)\n", get_page_no());
        }
    if (DST.page_style == LALPH2)
        {
            fprintf(outputFile, "PAGE (%c)\n", get_page_no_LALPH2()); 
        }
    if (DST.page_style == CALPH2){
        fprintf(outputFile, "PAGE (%c)\n", get_page_no_CALPH2());
    }
    if (DST.page_style == LROMAN2){
        fprintf(outputFile, "PAGE (%s)\n", get_page_no_LROMAN2());
    } 
    if(DST.page_style == CROMAN2){
        fprintf(outputFile, "PAGE (%s)\n", get_page_no_CROMAN2());
    }
}
