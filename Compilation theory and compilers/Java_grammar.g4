grammar Java_grammar;

/*
 * Parser rules
 */

program: (methodDeclaration | statementList)+ EOF;

methodDeclaration: modifier methodType IDENTIFIER LPAREN parameter? RPAREN block;

modifier: PRIVATE | PUBLIC;

methodType: type | VOID;

parameter: type IDENTIFIER (COMMA type IDENTIFIER)*;

statementList: statement+;

block: LBRACE statement* RBRACE;

statement:
    assignment SEMI
	| IF LPAREN expression RPAREN block (ELSE block)?
	| FOR LPAREN forControl RPAREN block
	| WHILE LPAREN expression RPAREN block
	| RETURN expression? SEMI
	| BREAK IDENTIFIER? SEMI
	| variableDeclaration SEMI
	| expression SEMI
	| methodInvocation SEMI
	| block
	| SEMI;

methodInvocation: IDENTIFIER LPAREN argumentList RPAREN;

argumentList: IDENTIFIER (COMMA IDENTIFIER)*;

variableDeclaration: type IDENTIFIER (ASSIGN expression)?;

assignment: IDENTIFIER ASSIGN expression;

forControl: variableDeclaration SEMI expression SEMI expression;

expression:  expression postfix=(INC | DEC)
	| expression bop=(MUL | DIV | MOD) expression
	| expression bop=(ADD | SUB) expression
	| expression bop=(LE | GE | GT | LT) expression
	| expression bop=(EQUAL | NOTEQUAL) expression
    | expression bop=(POW | AND | OR) expression
	| primary;

primary: LPAREN expression RPAREN
	| literal
	| IDENTIFIER;

type:
    BOOLEAN
	| INT
	| FLOAT
	| CHAR
	| STRING;

literal:
    NULL_LITERAL
	| INT_LITERAL
	| FLOAT_LITERAL
	| CHAR_LITERAL
	| boolLiteral
	| stringLiteral;

stringLiteral: STRING_LITERAL;

boolLiteral: TRUE | FALSE;

/*
 * Lexer rules
 */

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
CHAR:				'char';
STRING:				'String';

ELSE:               'else';
ELSEIF:             'else if';
FOR:                'for';
IF:                 'if';
WHILE:              'while';
BREAK:				'break';
RETURN:             'return';
PRIVATE:            'private';
PUBLIC:             'public';
TRUE:				'true';
FALSE:				'false';
DO:                 'do';

NULL_LITERAL:       'null';
INT_LITERAL : 		[0-9]+;
FLOAT_LITERAL : 	[0-9]+'.'[0-9]+;
WHITESPACE:         (' ' | '\t' | '\n') -> skip ;
CHAR_LITERAL:       '\'' (~['\\\r\n]) '\'';
IDENTIFIER:         [a-zA-Z][a-zA-Z0-9_]*;
STRING_LITERAL:     '"' (~["\\\r\n])* '"';
