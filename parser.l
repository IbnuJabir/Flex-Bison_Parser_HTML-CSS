%{
#include <stdio.h>
#include "parser.tab.h" // Include the Bison-generated header

FILE* input_file; // Global variable to hold the input file

void set_input_file(FILE* file) {
    input_file = file;
}
%}

%%
"<html>" { return HTML_START; }
"<body>" { return BODY_START; }
"<header>" { return HEADER_START; }
"<h1>" { return H1_TAG; }
"<h2>" { return H2_TAG; }
"<h3>" { return H3_TAG; }
"<h4>" { return H4_TAG; }
"<h5>" { return H5_TAG; }
"<h6>" { return H6_TAG; }
"<p>" { return P_TAG; }
"<a>" { return A_TAG; }
"<div>" { return DIV_TAG; }
"<span>" { return SPAN_TAG; }
"<ul>" { return UL_TAG; }
"<li>" { return LI_TAG; }
"<table>" { return TABLE_TAG; }
"<tr>" { return TR_TAG; }
"<td>" { return TD_TAG; }
"<section>" { return SECTION_TAG; }
"<figure>" { return FIGURE_TAG; }
"<figcaption>" { return FIGCAPTION_TAG; }
"<iframe>" { return IFRAME_TAG; }
"</html>" { return HTML_END; }
"</body>" { return BODY_END; }
"</header>" { return HEADER_END; }
"</h1>" { return H1_TAG_END; }
"</h2>" { return H2_TAG_END; }
"</h3>" { return H3_TAG_END; }
"</h4>" { return H4_TAG_END; }
"</h5>" { return H5_TAG_END; }
"</h6>" { return H6_TAG_END; }
"</p>" { return P_TAG_END; }
"</a>" { return A_TAG_END; }
"</div>" { return DIV_TAG_END; }
"</span>" { return SPAN_TAG_END; }
"</ul>" { return UL_TAG_END; }
"</li>" { return LI_TAG_END; }
"</table>" { return TABLE_TAG_END; }
"</tr>" { return TR_TAG_END; }
"</td>" { return TD_TAG_END; }
"</section>" { return SECTION_TAG_END; }
"</figure>" { return FIGURE_TAG_END; }
"</figcaption>" { return FIGCAPTION_TAG_END; }
"</iframe>" { return IFRAME_TAG_END; }
"<.*>" { /* Ignore other HTML tags */ }
. { /* Ignore everything else */ }
%%

int yyinput(char* buf, int max_size) {
    // Implement custom input logic
    // Read characters into 'buf' up to 'max_size'
    // Return the actual number of characters read

    size_t num_read = fread(buf, sizeof(char), max_size, input_file);
    if (num_read < max_size) {
        // End of file or error occurred
        if (feof(input_file)) {
            return 0; // Return 0 to indicate end of input
        }
        if (ferror(input_file)) {
            // Handle error if necessary
        }
    }
    return num_read;
}
/*
int main() {
    yyparse(); // Invoke the Bison parser
    return 0;
}*/
