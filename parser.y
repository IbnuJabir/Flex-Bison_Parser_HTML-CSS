%{
#include <stdio.h>
#include <stdlib.h>

int deepest_depth = 0; // Variable to track the deepest depth
void yyerror(const char* s);
int yylex(void);

%}

%token HTML_START HTML_END BODY_START BODY_END HEADER_START HEADER_END
%token H1_TAG H1_TAG_END H2_TAG H2_TAG_END H3_TAG H3_TAG_END H4_TAG H4_TAG_END H5_TAG H5_TAG_END H6_TAG H6_TAG_END
%token P_TAG P_TAG_END A_TAG A_TAG_END DIV_TAG DIV_TAG_END SPAN_TAG SPAN_TAG_END
%token UL_TAG UL_TAG_END LI_TAG LI_TAG_END TABLE_TAG TABLE_TAG_END TR_TAG TR_TAG_END TD_TAG TD_TAG_END
%token SECTION_TAG SECTION_TAG_END FIGURE_TAG FIGURE_TAG_END FIGCAPTION_TAG FIGCAPTION_TAG_END IFRAME_TAG IFRAME_TAG_END

%%
html_content: HTML_START html_elements HTML_END {
    printf("HTML parsing successful\n");
    printf("Deepest nested element depth: %d\n", deepest_depth);
}
;

html_elements: HTML_START html_elements HTML_END {
    deepest_depth++;
}
| BODY_START html_elements BODY_END {
    deepest_depth++;
}
| HEADER_START html_elements HEADER_END {
    deepest_depth++;
}
| H1_TAG html_elements H1_TAG_END {
    deepest_depth++;
}
| html_elements H2_TAG H2_TAG_END {
    deepest_depth++;
}
| html_elements H3_TAG H3_TAG_END {
    deepest_depth++;
}
| html_elements H4_TAG H4_TAG_END {
    deepest_depth++;
}
| html_elements H5_TAG H5_TAG_END {
    deepest_depth++;
}
| html_elements H6_TAG H6_TAG_END {
    deepest_depth++;
}
| html_elements P_TAG P_TAG_END {
    deepest_depth++;
}
| html_elements A_TAG A_TAG_END {
    deepest_depth++;
}
| html_elements DIV_TAG DIV_TAG_END {
    deepest_depth++;
}
| html_elements SPAN_TAG SPAN_TAG_END {
    deepest_depth++;
}
| html_elements UL_TAG UL_TAG_END {
    deepest_depth++;
}
| html_elements LI_TAG LI_TAG_END {
    deepest_depth++;
}
| html_elements TABLE_TAG TABLE_TAG_END {
    deepest_depth++;
}
| html_elements TR_TAG TR_TAG_END {
    deepest_depth++;
}
| html_elements TD_TAG TD_TAG_END {
    deepest_depth++;
}
| html_elements SECTION_TAG SECTION_TAG_END {
    deepest_depth++;
}
| html_elements FIGURE_TAG FIGURE_TAG_END {
    deepest_depth++;
}
| html_elements FIGCAPTION_TAG FIGCAPTION_TAG_END {
    deepest_depth++;
}
| html_elements IFRAME_TAG IFRAME_TAG_END {
    deepest_depth++;
}
| /* Empty */
;

css_content: {
    printf("CSS parsing successful\n");
}
;

%%

int main() {
    yyparse(); // Start parsing
    return 0;
}

void yyerror(const char* s) {
    printf("Parse error: %s\n", s);
}
