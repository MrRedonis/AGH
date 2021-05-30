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
MOD:				'%';
DIV:                '/';
POW:				'^';

BOOLEAN:            'boolean';
INT:                'int';
FLOAT:              'float';
VOID:               'void';
CHAR				'char';
STRING				'string';

ELSE:               'else';
ELSEIF:             'else if';
FOR:                'for';
IF:                 'if';
WHILE:              'while';
BREAK:				'break;
RETURN:             'return';

PRIVATE:            'private';
PUBLIC:             'public';
CLASS:				'class';

TRUE:				'true';
FALSE:				'false';
			
NULL_LITERAL:       'null';

INT_LITERAL : 		[0-9]+;
FLOAT_LITERAL : 	[0-9]+'.'[0-9]+;
CHAR_LITERAL:		[.];

IDENTIFIER:         [a-zA-Z] [a-zA-Z0-9_]*;

//Gramatyka

program: start* EOF;
	
start: classModifier* classDeclaration;

classDeclaration: CLASS IDENTIFIER classBody;

classModifier: PRIVATE
	| PUBLIC;
	
classBody: LBRACE classBodyDeclaration* RBRACE;

classBodyDeclaration: memberDeclaration;

memberDeclaration: methodDeclaration
	| classDeclaration
	| fieldDeclaration
	;
	
methodDeclaration: methodType IDENTIFIER LPAREN param? RPAREN methodBody;

param: basicType IDENTIFIER (COMMA basicType IDENTIFIER)*;

methodType: basicType
	| VOID
	;

basicType: BOOLEAN
	| INT
	| FLOAT
	| CHAR
	| STRING;
	
methodBody: block SEMI;

block: LBRACE statement* RBRACE;

statement: assignment SEMI
	| IF LPAREN expression RPAREN statement (ELSE statement)?
	| FOR LPAREN forControl RPAREN statement
	| WHILE parExpression statement
	| DO statement WHILE parExpression SEMI
	| RETURN expression? SEMI
	| BREAK IDENTIFIER? SEMI
	| SEMI
	
forControl: forInit? SEMI expression? SEMI expression (COMMA expression)*;

methodCall
    : IDENTIFIER '(' expressionList? ')'

expression: IDENTIFIER methodCall


booleanLiteral: TRUE
	| FALSE;

stringLiteral: (CHAR_LITERAL)+;

-------------------------------------

value: INT_LITERAL
	| FLOAT_LITERAL
	| CHAR_LITERAL
	| stringLiteral;



declaration: methodDeclaration
	| varDeclaration
	| statement
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
whileStatement: WHILE LPAREN expression RPAREN body