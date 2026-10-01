# Compiler-Lexer-Parser-Flex-Bison-Project-2022
Lexical and Syntactic Analyzer implementation using Flex and Bison for custom BNF grammar specification (CEID, University of Patras).

## Project Overview
The project involves designing and implementing a parser and tokenizer for a specified programming language grammar described in **Backus-Naur Form (BNF)**:
- **Lexical Analysis (Scanner / Tokenizer):** Built with **Flex** to recognize keywords, identifiers, constants, operators, and structural tokens while discarding whitespace and comments.
- **Syntactic Analysis (Parser):** Built with **Bison (LALR parser generator)** to parse token streams according to BNF production rules, validate structural syntax, and handle parsing errors with meaningful diagnostics.
- **Abstract Syntax & Semantics:** Evaluates grammar rules, operator precedence, associativity, and handles syntax errors gracefully.

## Tech Stack
- **Lexer Generator:** Flex (Fast Lexical Analyzer Generator)
- **Parser Generator:** Bison (GNU Project Parser Generator)
- **Grammar Specification:** Backus-Naur Form (BNF)
- **Implementation Language:** C / C++
