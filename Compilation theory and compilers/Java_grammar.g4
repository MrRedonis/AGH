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

program: () EOF;

stringLiteral: (CHAR_LITERAL)+;

boolLiteral: TRUE
	| FALSE;

basicType: BOOLEAN
	| INT
	| FLOAT
	| CHAR
	| STRING;
	
literal: NULL_LITERAL
	| INT_LITERAL
	| FLOAT_LITERAL
	| CHAR_LITERAL
	| boolLiteral
	| stringLiteral;
	
basicTypeVoid: basicType
	| VOID
	;
	
modifier: PRIVATE
	| PUBLIC;
	
methodDeclaration: modifier basicTypeVoid IDENTIFIER LPAREN param? RPAREN block;

param: basicType IDENTIFIER (COMMA basicType IDENTIFIER)*;

block: LBRACE blockStatement* RBRACE;

blockStatement: statement
	| variableDeclaration SEMI;

statement: assignment SEMI
	| IF LPAREN expression RPAREN statement (ELSE statement)?
	| FOR LPAREN forControl RPAREN statement
	| WHILE LPAREN expression RPAREN statement
	| DO statement WHILE LPAREN expression RPAREN
	| RETURN expression?
	| BREAK IDENTIFIER?
	| block
	| SEMI
	
expressionList: expression (COMMA expression)*;

forControl: forInit? SEMI expression? SEMI expressionList?;
	
forInit: variableDeclaration
    | expressionList;
	
variableDeclaration: basicType IDENTIFIER (ASSIGN expression)? SEMI;

expression: methodCall
	| expression postfix=(INC | DEC)
	| prefix=(ADD | SUB| INC | DEC) expression
	| expression bop=(MUL | DIV | MOD) expression
	| expression bop=(ADD | SUB) expression
	| expression bop=(LE | GE | GT | LT) expression
	| expression bop=(EQUAL | NOTEQUAL) expression
    | expression bop=(POW | AND | OR) expression
	| primary;
	
primary: LPAREN expression RPAREN
	| literal
	| IDENTIFIER;
	
assignment: IDENTIFIER ASSIGN expression;