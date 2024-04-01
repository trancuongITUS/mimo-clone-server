-- ADD SECTIONS IN MIMO APP

-- ADD SECTIONS OF HTML COURSE

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (0,
'HTML Basics', 
'Create webpages using HTML tags', 
0, 
9, 
false, 
1);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (1,
'HTML Intermediate', 
'Link multiple HTML files to create a website', 
10, 
16, 
true, 
1);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (2,
'Semantic HTML', 
'Use semantic elements to make your code more readable.', 
17, 
22, 
true, 
1);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (3,
'Accessibility Basics', 
'Learn how to create accessible webpages', 
23, 
27, 
true, 
1);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (4,
'HTML Forms', 
'Gather user input using forms', 
28, 
32, 
true, 
1);

-- ADD SECTIONS OF CSS COURSE

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (0,
'Intro to CSS', 
'Style webpages using CSS', 
0, 
10, 
false, 
2);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (1,
'Intermediate CSS', 
'Dive deeper into CSS to create stunning layouts', 
11, 
31, 
true, 
2);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (2,
'Flexbox', 
'Design complex layouts using Flexbox', 
32, 
52, 
true, 
2);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (3,
'Grid', 
'Create a CSS grid using rows and columns', 
53, 
69, 
true, 
2);

-- ADD SECTIONS OF JAVASCRIPT COURSE

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (0,
'JavaScript Basics', 
'Create variables storing numbers, strings, and booleans', 
0, 
6, 
false, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (1,
'Types and Comparisons', 
'Store the result of comparisons in variables', 
7, 
13, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (2,
'Conditionals', 
'Code conditionals to build programs that make decision', 
14, 
20, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (3,
'Loops', 
'Create loops to repeat lines of code', 
21, 
32, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (4,
'Arrays', 
'Use arrays to store a group of values in a variable', 
33, 
39, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (5,
'Functions', 
'Code functions to make code reusable and easier to read', 
40, 
49, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (6,
'Objects ', 
'Create objects to store related values into a variable', 
50, 
55, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (7,
'Applied Functions', 
'Build functions that change their output based on input', 
56, 
65, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (8,
'ES6', 
'Learn how to use ES6 arrow functions', 
66, 
75, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (9,
'Array Operations', 
'Optimize your workflow with array operations', 
76, 
81, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (10,
'Dynamic Webpages', 
'Use HTML and JavaScript to create interactive elements', 
82, 
92, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (11,
'The Document Object Model', 
'Learn about the DOM tree and position-based access', 
93, 
99, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (12,
'JavaScript Events', 
'Use JavaScript events to make webpages react', 
100, 
106, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (13,
'Synchrony and Asynchrony in JS', 
'Learn how async JavaScript works', 
107, 
112, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (14,
'JavaScript Classes', 
'Create templates for objects using classes', 
113, 
123, 
true, 
3);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (15,
'Modules, Libraries, and Node', 
'Use code from other people and learn the basics of Node', 
124, 
127, 
true, 
3);

-- ADD SECTIONS OF SQL COURSE

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (0,
'SQL Basics', 
'Select and filter a table''s data', 
0, 
9, 
false, 
4);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (1,
'Table Management', 
'Learn how to create and manage tables in SQL', 
10, 
18, 
true, 
4);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (2,
'Filters', 
'Use one or more advanced filters to narrow down results', 
19, 
29, 
true, 
4);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (3,
'Aggregate Functions', 
'Gain data insights using mathematical operations', 
30, 
36, 
true, 
4);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (4,
'Joins', 
'Query data that is spread over multiple tables', 
37, 
46, 
true, 
4);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (5,
'Subqueries', 
'Use the result of a query inside another query', 
47, 
51, 
true, 
4);

-- ADD SECTIONS OF PYTHON COURSE

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (0,
'Python Basics', 
'Create variables storing numbers, strings, and booleans', 
0, 
7, 
false, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (1,
'Types & Comparisons', 
'Store the result of comparisons in variables', 
8, 
13, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (2,
'Conditional Statements', 
'Code conditionals to build programs that make decisions', 
14, 
23, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (3,
'Loops', 
'Create loops to repeat lines of code', 
24, 
33, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (4,
'Lists', 
'Create lists to organize groups of values', 
34, 
43, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (5,
'List Operations', 
'Use methods to gain insight from the values in lists', 
44, 
53, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (6,
'String Operations', 
'Use methods to manipulate strings in useful ways', 
54, 
58, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (7,
'Functions', 
'Code functions to make code reusable and easier to read', 
59, 
70, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (8,
'Tuples, Dictionaries, & Sets', 
'Identify the correct data structures to store data', 
71, 
82, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (9,
'List Comprehensions', 
'Use list comprehensions to make code more compact', 
83, 
90, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (10,
'Classes', 
'Create templates for objects using classes', 
91, 
100, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (11,
'Object-Oriented Programming', 
'Use object-oriented programming for sophisticated apps', 
101, 
106, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (12,
'Modules', 
'Use modules to extend your Python toolkit', 
107, 
110, 
true, 
5);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (13,
'Errors & Exceptions', 
'Interpret errors and exceptions that arise in code  ', 
111, 
114, 
true, 
5);

-- ADD SECTIONS OF SWIFT COURSE

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (0,
'Swift Basics', 
'Create variables storing numbers, strings, and booleans', 
0, 
4, 
false, 
6);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (1,
'Types and Comparisons', 
'Store the result of comparisons in variables', 
5, 
9, 
true, 
6);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (2,
'Conditionals', 
'Code conditionals to build programs that make decision', 
10, 
14, 
true, 
6);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (3,
'Loops', 
'Create loops to repeat lines of code', 
15, 
22, 
true, 
6);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (4,
'Arrays', 
'Use arrays to store a group of values in a variable', 
23, 
28, 
true, 
6);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (5,
'Functions', 
'Code functions to make code reusable and easier to read', 
29, 
35, 
true, 
6);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (6,
'Classes', 
'Create templates for objects using classes', 
36, 
42, 
true, 
6);

-- ADD SECTIONS OF PYTHON DEVELOPER COURSE

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (0,
'Intro to Python', 
'Create variables storing numbers, strings, and booleans', 
0, 
15, 
false, 
7);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (1,
'Flow Control', 
'Code conditionals and loops to build smart programs', 
16, 
36, 
true, 
7);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (2,
'Lists', 
'Create lists to organize groups of values', 
37, 
57, 
true, 
7);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (3,
'Functions', 
'Code functions to make code reusable and easier to read', 
58, 
71, 
true, 
7);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (4,
'Tuples, Dictionaries, & Sets', 
'Identify the correct data structures to store data', 
72, 
85, 
true, 
7);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (5,
'Modules & APIs', 
'Use modules and APIs to extend your Python toolkit', 
86, 
96, 
true, 
7);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (6,
'Strings & Lists Operations', 
'Use methods to manipulate strings & lists', 
97, 
110, 
true, 
7);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (7,
'Object-Oriented Programming', 
'Use object-oriented programming for sophisticated apps', 
111, 
127, 
true, 
7);

-- ADD SECTIONS OF FRONT-END DEVELOPER COURSE

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (0,
'Intro to Web Development', 
'Create webpages using HTML and CSS', 
0, 
27, 
false, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (1,
'Interactive Webpages', 
'Use HTML and JavaScript to create interactive webpages', 
28, 
66, 
true, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (2,
'Intermediate HTML & CSS', 
'Use HTML and JavaScript to create interactive webpages', 
67, 
96, 
true, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (3,
'Comparisons & Loops', 
'Code conditionals to build programs that make decisions', 
97, 
126, 
true, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (4,
'Flexbox', 
'Design beautiful layouts using Flexbox', 
127, 
158, 
true, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (5,
'Grid', 
'Create beautiful layouts using CSS grid ', 
159, 
182, 
true, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (6,
'Arrays & Functions', 
'Use arrays & functions to build sophisticated programs', 
183, 
227, 
true, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (7,
'Objects & ES 6', 
'Learn how to use objects and more advanced JS functions', 
228, 
254, 
true, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (8,
'DOM & Events', 
'Learn about the DOM tree and node relations', 
255, 
277, 
true, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (9,
'Semantic HTML & Accessibility', 
'Learn how to create accessible webpages', 
278, 
301, 
true, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (10,
'Synchrony & Asynchrony in JS', 
'Learn how async JavaScript works', 
302, 
310, 
true, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (11,
'JavaScript Classes', 
'Create templates for objects using classes', 
311, 
327, 
true, 
8);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (12,
'React', 
'Use React to create modern web apps', 
328, 
352, 
true, 
8);

-- ADD SECTIONS OF FULL-STACK DEVELOPER COURSE

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (0,
'Intro to Web Development', 
'Create webpages using HTML and CSS', 
0, 
27, 
false, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (1,
'Interactive Webpages', 
'Use HTML and JavaScript to create interactive webpages', 
28, 
66, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (2,
'Intermediate HTML & CSS', 
'Dive deeper into HTML \u0026 CSS to create stunning web apps', 
67, 
96, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (3,
'Comparisons & Loops', 
'Code conditionals to build programs that make decisions', 
97, 
126, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (4,
'Flexbox', 
'Design beautiful layouts using Flexbox', 
127, 
158, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (5,
'Grid', 
'Create a CSS grid using rows and columns', 
159, 
182, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (6,
'Arrays & Functions', 
'Use arrays & functions to build sophisticated programs', 
183, 
227, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (7,
'Objects & ES 6', 
'Learn how to use objects and more advanced JS functions', 
228, 
254, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (8,
'DOM & Events', 
'Learn about the DOM tree and node relations', 
255, 
277, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (9,
'Semantic HTML & Accessibility', 
'Learn how to create accessible webpages', 
278, 
301, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (10,
'Synchrony & Asynchrony in JS', 
'Learn how async JavaScript works', 
302, 
310, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (11,
'JavaScript Classes', 
'Create templates for objects using classes', 
311, 
327, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (12,
'React', 
'Use React to create modern web apps', 
328, 
352, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (13,
'SQL Basics', 
'Learn how to manage data in SQL', 
353, 
376, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (14,
'Intermediate SQL', 
'Gain data insights using operations and filters', 
377, 
416, 
true, 
9);

INSERT INTO public.sections(index,
name, 
description, 
"startIndex", 
"endIndex", 
"isLocked", 
"courseId")
VALUES (15,
'Express Basics', 
'Use Node to dive into backend development', 
417, 
450, 
true, 
9);



