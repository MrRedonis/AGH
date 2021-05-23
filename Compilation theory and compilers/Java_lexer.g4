grammar Java_grammar;

//Tokeny

LPAREN:             '(';
RPAREN:             ')';
LBRACE:             '{';
RBRACE:             '}';
LBRACK:             '[';
RBRACK:             ']';
SEMI:               ';';
COMMA:              ',';
DOT:                '.';

ASSIGN:             '=';
GT:                 '>';
LT:                 '<';
BANG:               '!';
EQUAL:              '==';
LE:                 '<=';
GE:                 '>=';
NOTEQUAL:           '!=';
AND:                '&&';
OR:                 '||';
INC:                '++';
DEC:                '--';
ADD:                '+';
SUB:                '-';
MUL:                '*';
DIV:                '/';

BOOLEAN:            'boolean';
ELSE:               'else';
FLOAT:              'float';
FOR:                'for';
IF:                 'if';
INT:                'int';
PRIVATE:            'private';
PUBLIC:             'public';
RETURN:             'return';
VOID:               'void';
WHILE:              'while';

BOOL_LITERAL:       'true'
            |       'false'
            ;
			
NULL_LITERAL:       'null';

INT_LITERAL : 		[0-9]+;
FLOAT_LITERAL : 	[0-9]+'.'[0-9]+;

IDENTIFIER:         [a-zA-Z] [a-zA-Z0-9_]*;

//Gramatyka

declaration: methodDeclaration
	| varDeclaration
	| statement
	;

methodType: BOOLEAN
	| INT
	| FLOAT
	| VOID
	;

identifierType: BOOLEAN
	| INT
	| FLOAT
	;

methodDeclaration: methodType IDENTIFIER LPAREN params? RPAREN block;

params: identifierType IDENTIFIER ( COMMA identifierType IDENTIFIER)*;

block: LBRACE declaration* RBRACE;

statement: expression SEMI
	| forStatement
	| ifStatement
	| returnStatement
	| whileStatement
	| block
	;
	
forStatement: FOR LPAREN expression SEMI expression SEMI expression RPAREN block;

ifStatement: IF LPAREN expression RPAREN body (ELSE IF LPAREN expression RPAREN body)* (ELSE body)?;

returnStatement: RETURN expression? SEMI;

whileStatement: WHILE LPAREN expression RPAREN body