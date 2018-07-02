grammar SASLog;

saslog: stmt+ ;

stmt: pageBreak
    | emptyLine
    | note
    | info
    | warning
    | error
    | source
    | source2
    | mprint
    | garbage
    ;

note    : NOTE
        | NOTENUMBERED
        ;
info    : INFO    ;
warning : WARNING
        | WARNINGNUMBERED
        ;
error   : ERROR
        | ERRORNUMBERED
        ;

source: { _input.LT(1).getCharPositionInLine() == 0 }? SOURCE ;

source2: { _input.LT(1).getCharPositionInLine() == 0 }? SOURCE2 ;

mprint: { _input.LT(1).getCharPositionInLine() == 0 }? MPRINT ;

garbage : { _input.LT(1).getCharPositionInLine() == 0 }? TEXT EOL ;

pageBreak: (PageBreakNumbered | PageBreak) emptyLine? ;

emptyLine: { _input.LT(1).getCharPositionInLine() == 0 }? EOL ;

PageBreakNumbered : '\f'? DIGIT+ WS 'The SAS System' WS DATE EOL ;
PageBreak         : '\f'? 'The SAS System' EOL ;

// 117      !+<code>
// 12345678901
SOURCE2: DIGIT+ WS? '!'? '+' TEXT? EOL ;

SOURCE: DIGIT+ WS? '! '? TEXT? EOL ;

MPRINT: 'MPRINT(' ID ('.' ID)* '): ' TEXT (' ' EOL TEXT )* EOL ;

NOTE: 'NOTE: ' TEXT EOL
     ('      ' TEXT EOL)* ;

NOTENUMBERED: 'NOTE' [0-9\- ]+ ': ' TEXT EOL
             ('    ' WS        '  ' TEXT EOL)* ;

INFO: 'INFO: ' TEXT EOL
     ('      ' TEXT EOL)* ;

WARNING: 'WARNING: ' TEXT EOL
        ('         ' TEXT EOL)* ;

WARNINGNUMBERED: 'WARNING' [0-9\- ]+ ': ' TEXT EOL
                ('       '  WS       '  ' TEXT EOL)* ;

ERROR: 'ERROR: ' TEXT EOL
      ('       ' TEXT EOL)* ;

ERRORNUMBERED: 'ERROR' [0-9\- ]+ ': ' TEXT EOL
              ('     ' WS        '  ' TEXT EOL)* ;

DATE: TIME WS WEEKDAY ',' WS MONTH WS DIGIT+ ',' WS DIGIT+ ;

TIME: DIGIT DIGIT ':' DIGIT DIGIT ;

WEEKDAY
	: 'Sunday'
	| 'Monday'
	| 'Tuesday'
	| 'Wednesday'
	| 'Thursday'
	| 'Friday'
	| 'Saturday'
	;

MONTH
	: 'January'
	| 'February'
	| 'March'
	| 'April'
	| 'May'
	| 'June'
	| 'July'
	| 'August'
	| 'September'
	| 'October'
	| 'November'
	| 'December'
	;

ID    : [A-Za-z_][A-Za-z_0-9]* ;
DIGIT : [0-9] ;
WS    : [ \t]+ ;
TEXT  : ~[\n]+ ;
EOL   : '\r'? '\n' ;
