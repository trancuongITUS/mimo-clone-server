CREATE TABLE "users" (
  "user_uid" varchar PRIMARY KEY,
  "role" varchar
);

CREATE TABLE "chapters" (
  "id" varchar PRIMARY KEY,
  "tutorial_id" varchar,
  "type" varchar,
  "title" varchar,
  "index" integer
);

CREATE TABLE "courses" (
  "id" varchar PRIMARY KEY,
  "name" varchar,
  "description" varchar,
  "is_published" bool,
  "icon_url" varchar
);

CREATE TABLE "files" (
  "id" varchar PRIMARY KEY,
  "interaction_module_id" varchar,
  "pre_interaction_module_id" varchar,
  "is_interactive" bool,
  "name" varchar,
  "content" text,
  "code_language" varchar
);

CREATE TABLE "interaction_module" (
  "id" varchar PRIMARY KEY,
  "lesson_id" varchar,
  "type" varchar,
  "output" varchar,
  "wrong_options" text,
  "is_code" bool
);

CREATE TABLE "interaction_option" (
  "id" varchar PRIMARY KEY,
  "interaction_module_id" varchar,
  "start_index" integer,
  "end_index" integer,
  "start_line" integer,
  "start_pos" integer,
  "length" integer,
  "value" varchar,
  "correct" bool
);

CREATE TABLE "items" (
  "id" varchar PRIMARY KEY,
  "interaction_module_id" varchar,
  "correct" bool,
  "value" integer,
  "text" varchar
);

CREATE TABLE "lessons" (
  "id" varchar PRIMARY KEY,
  "chapter_id" varchar,
  "type" varchar,
  "index" integer
);

CREATE TABLE "pre_post_interaction_modules" (
  "id" varchar PRIMARY KEY,
  "lesson_id" varchar,
  "content" text,
  "content_type" varchar,
  "visible_if" varchar,
  "output" varchar,
  "type" varchar
);

CREATE TABLE "sections" (
  "id" varchar PRIMARY KEY,
  "course_id" varchar,
  "name" varchar,
  "is_locked" bool,
  "description" varchar,
  "index" integer
);

CREATE TABLE "tutorials" (
  "id" varchar PRIMARY KEY,
  "section_id" varchar,
  "banner_icon_url" varchar,
  "code_language" varchar,
  "description_content" varchar,
  "index" integer,
  "iscompleted" bool,
  "title" varchar,
  "type" varchar,
  "version" integer
);

CREATE TABLE "user_course_traces" (
  "id" varchar PRIMARY KEY,
  "user_uid" varchar,
  "course_id" varchar,
  "key" varchar,
  "is_favourite" bool
);

ALTER TABLE "chapters" ADD FOREIGN KEY ("tutorial_id") REFERENCES "tutorials" ("id");

ALTER TABLE "files" ADD FOREIGN KEY ("interaction_module_id") REFERENCES "interaction_module" ("id");

ALTER TABLE "files" ADD FOREIGN KEY ("pre_interaction_module_id") REFERENCES "pre_post_interaction_modules" ("id");

ALTER TABLE "interaction_module" ADD FOREIGN KEY ("lesson_id") REFERENCES "lessons" ("id");

ALTER TABLE "interaction_option" ADD FOREIGN KEY ("interaction_module_id") REFERENCES "interaction_module" ("id");

ALTER TABLE "items" ADD FOREIGN KEY ("interaction_module_id") REFERENCES "interaction_module" ("id");

ALTER TABLE "lessons" ADD FOREIGN KEY ("chapter_id") REFERENCES "chapters" ("id");

ALTER TABLE "pre_post_interaction_modules" ADD FOREIGN KEY ("lesson_id") REFERENCES "lessons" ("id");

ALTER TABLE "sections" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "tutorials" ADD FOREIGN KEY ("section_id") REFERENCES "sections" ("id");

ALTER TABLE "user_course_traces" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

INSERT INTO users (user_uid, role)
VALUES 
  ('9u2TuYTEUSdSw9dQEgMOYhSLuR33', 'admin'),
  ('XwMrqnpPE6RMjQEnHHBjoJsjbyY2', 'user'),
  ('oJBa1lIbmUa7DSsmfkVR1QGUhDo1', 'user'),
  ('VwZK7rIMLqXEGJ1LObhhBXhUGRq1', 'user'),
  ('bMpKaAYkuqPSMcEzb1jruhKJJx62', 'user');



INSERT INTO courses (id, name, description, is_published, icon_url)
VALUES 
  ('6602fd05a8fc89e974fa3f2a', 'Python', 'Learn the essentials of the fun, all-purpose language Python', true, ''),
  ('6602fd62666d4ea088040bd2', 'Javascript', '', false, '');



INSERT INTO user_course_traces (id, user_uid, course_id, key, is_favourite)
VALUES 
  ('65eee41bb59f345b435d0fbc', 'XwMrqnpPE6RMjQEnHHBjoJsjbyY2', '6602fd05a8fc89e974fa3f2a', '0-0-0', false),
  ('65eee4e9b59f345b435d0fbd', 'oJBa1lIbmUa7DSsmfkVR1QGUhDo1', '6602fd05a8fc89e974fa3f2a', '0-0-0', false),
  ('65eee537b59f345b435d0fbe', 'VwZK7rIMLqXEGJ1LObhhBXhUGRq1', '6602fd05a8fc89e974fa3f2a', '0-0-0', false),
  ('65eee55ab59f345b435d0fbf', 'bMpKaAYkuqPSMcEzb1jruhKJJx62', '6602fd05a8fc89e974fa3f2a', '0-0-0', false),
  ('65eee56cb59f345b435d0fc0', 'XwMrqnpPE6RMjQEnHHBjoJsjbyY2', '6602fd62666d4ea088040bd2', '0-0-0', false),
  ('65eee57fb59f345b435d0fc1', 'oJBa1lIbmUa7DSsmfkVR1QGUhDo1', '6602fd62666d4ea088040bd2', '0-0-0', false),
  ('65eee583b59f345b435d0fc2', 'VwZK7rIMLqXEGJ1LObhhBXhUGRq1', '6602fd62666d4ea088040bd2', '0-0-0', false),
  ('65eee588b59f345b435d0fc3', 'bMpKaAYkuqPSMcEzb1jruhKJJx62', '6602fd62666d4ea088040bd2', '0-0-0', false);


INSERT INTO sections (id, course_id, name, is_locked, description, index)
VALUES 
	('6602fd05a8fc89e974fa3f2b', '6602fd05a8fc89e974fa3f2a', 'Python Basics', false, 'Create variables storing numbers, strings, and booleans', 0),
	('6602fd06a8fc89e974fa4560', '6602fd05a8fc89e974fa3f2a', 'Types & Comparisons', false, 'Store the result of comparisons in variables', 1),
	('6602fd62666d4ea088040bd3', '6602fd62666d4ea088040bd2', 'JavaScript Basics', false, 'Create variables storing numbers, strings, and booleans', 0),
	('6602fd63666d4ea08804109c', '6602fd62666d4ea088040bd2', 'Types and Comparisons', true, 'Store the result of comparisons in variables', 1);




INSERT INTO tutorials (id, section_id, banner_icon_url, code_language, description_content, index, iscompleted, title, type, version)
VALUES 
	('6602fd05a8fc89e974fa3f2c', '6602fd05a8fc89e974fa3f2b', '/icons/track-icons/tutorial-910-icon-banner.svg', 'python', 'Learn how to create variables in Python.', 0, false, 'Creating Variables', 'course', 1),
	('6602fd05a8fc89e974fa4038', '6602fd05a8fc89e974fa3f2b', '', 'python', 'Learn how to update and reuse variables.', 1, false, 'Using Variables', 'course', 1),
  	('6602fd05a8fc89e974fa4145', '6602fd05a8fc89e974fa3f2b', '', 'python', 'Learn what true and false values are in programming.', 2, false, 'True and False', 'course', 1),
	('6602fd05a8fc89e974fa41ef', '6602fd05a8fc89e974fa3f2b', '', 'python', 'Learn how to look for equality among numbers.', 3, false, 'Checking Number Equality', 'course', 1),
	('6602fd05a8fc89e974fa4299', '6602fd05a8fc89e974fa3f2b', '', 'python', 'Format strings.', 4, false, 'Formatting Strings', 'course', 1),
	('6602fd06a8fc89e974fa4314', '6602fd05a8fc89e974fa3f2b', '', 'python', 'Python Basics', 5, false, 'Python Basics', 'practiceRequired', 1),
	('6602fd06a8fc89e974fa43b8', '6602fd05a8fc89e974fa3f2b', '', 'python', 'Python Basics', 6, false, 'Python Basics', 'practiceOptional', 1),
	('6602fd06a8fc89e974fa4559', '6602fd05a8fc89e974fa3f2b', '', 'python', 'Consolidate your newly acquired knowledge of Python with these challenges', 7, false, 'Python Basics', 'challenges', 1),
	('6602fd06a8fc89e974fa4561', '6602fd06a8fc89e974fa4560', '', 'python', 'Learn how the find the biggest or smallest values.', 0, false, 'Comparing Numbers', 'course', 1),
	('6602fd06a8fc89e974fa460f', '6602fd06a8fc89e974fa4560', '', 'python', 'Learn how to check if two strings are the same.', 1, false, 'Comparing Strings', 'course', 1),
	('6602fd06a8fc89e974fa46b2', '6602fd06a8fc89e974fa4560', '', 'python', 'Learn about the different types of values we can store in variables.', 2,false, 'Discovering Types', 'course', 1),
	('6602fd06a8fc89e974fa4795', '6602fd06a8fc89e974fa4560', '', 'python', 'Types and Comparisons', 3, false, 'Types and Comparisons', 'practiceRequired', 1),  ('6602fd06a8fc89e974fa4819', '6602fd06a8fc89e974fa4560', '', 'python', 'Types and Comparisons', 4, false,' Types and Comparisons', 'practiceOptional', 1),
  ('6602fd06a8fc89e974fa48de', '6602fd06a8fc89e974fa4560', '', 'python', 'Challenge Exercises\nbased on Types and Comparisons', 5, false, 'More Types and Comparisons', 'challenges', 1),
  ('6602fd62666d4ea088040bd4', '6602fd62666d4ea088040bd3', '/icons/track-icons/tutorial-910-icon-banner.svg', 'javascript', 'Learn how to create variables in JavaScript.', 0, false, 'Creating Variables', 'course', 1),
  ('6602fd62666d4ea088040d3b', '6602fd62666d4ea088040bd3', '/icons/track-icons/tutorial-910-icon-banner.svg', 'javascript', 'Learn how to update and reuse variables.', 1, false, 'Using Variables', 'course', 1),
  ('6602fd63666d4ea088040e6f', '6602fd62666d4ea088040bd3', '/icons/track-icons/tutorial-910-icon-banner.svg', 'javascript', 'Learn what true and false values are in programming.', 2, false, 'Using True and False', 'course', 1),
  ('6602fd63666d4ea088040f24', '6602fd62666d4ea088040bd3', '/icons/track-icons/tutorial-910-icon-banner.svg', 'javascript', 'Learn how to look for equality among numbers.', 3, false, 'Checking Number Equality', 'course', 1),
  ('6602fd63666d4ea088040fd2', '6602fd62666d4ea088040bd3', '/icons/track-icons/tutorial-910-icon-banner.svg', 'javascript', 'JavaScript Basics', 4, false, 'JavaScript Basics', 'practiceRequired', 1),
  ('6602fd63666d4ea088041069', '6602fd62666d4ea088040bd3', '/icons/track-icons/tutorial-910-icon-banner.svg', 'javascript', 'JavaScript Basics', 5, false, 'JavaScript Basics', 'practiceOptional', 1),
  ('6602fd63666d4ea088041095', '6602fd62666d4ea088040bd3', '/icons/track-icons/tutorial-910-icon-banner.svg', 'javascript', 'Mimo Challenges are more difficult code-based brain teasers that''ll improve your coding skills and sharpen your problem-solving abilities.', 6, false, 'JavaScript Basics', 'challenges', 1),
  ('6602fd63666d4ea08804109d', '6602fd63666d4ea08804109c', '', 'javascript', 'Learn how the find the biggest or smallest values.', 0, false, 'Comparing Numbers', 'course', 1),
  ('6602fd63666d4ea08804114b', '6602fd63666d4ea08804109c', '', 'javascript', 'Learn how to check if two strings are the same.', 1, false, 'Comparing Strings', 'course', 1),
  ('6602fd63666d4ea0880411ea', '6602fd63666d4ea08804109c', '', 'javascript', 'Learn about the different types of values we can store in variables.', 2, false, 'Discovering Types', 'course', 1),
  ('6602fd63666d4ea0880412c5', '6602fd63666d4ea08804109c', '', 'javascript', 'Learn about logical operators and how we can use them to connect more than one conditions.', 3, false, 'Logical Operator', 'course', 1),
  ('6602fd63666d4ea08804138b', '6602fd63666d4ea08804109c', '', 'javascript', 'Types and Comparisons', 4, false, 'Types and Comparisons', 'course', 1),
  ('6602fd63666d4ea088041424', '6602fd63666d4ea08804109c', '', 'javascript', 'Types and Comparisons', 5, false, 'Types and Comparisons', 'practiceOptional', 1),
  ('6602fd63666d4ea088041443', '6602fd63666d4ea08804109c', '', 'javascript', 'Mimo Challenges are more difficult code-based brain teasers that''ll improve your coding skills and sharpen your problem-solving abilities.', 6, false, 'Types and Comparisons', 'challenges', 1);
    
    
    
    
INSERT INTO chapters (id, tutorial_id, type, title, index) VALUES
    ('6602fd05a8fc89e974fa3f2d', '6602fd05a8fc89e974fa3f2c', 'practiceLevel1', 'Variable Names', 0),
    ('6602fd05a8fc89e974fa3f79', '6602fd05a8fc89e974fa3f2c', 'practiceLevel1', 'Variable Values', 1),
    ('6602fd05a8fc89e974fa3fd9', '6602fd05a8fc89e974fa3f2c', 'practiceLevel1', 'Console', 2),
    ('6602fd05a8fc89e974fa4039', '6602fd05a8fc89e974fa4038', 'practiceLevel1', 'Updating Variables', 0),
    ('6602fd05a8fc89e974fa408c', '6602fd05a8fc89e974fa4038', 'practiceLevel1', 'Expressions', 1),
    ('6602fd05a8fc89e974fa40dd', '6602fd05a8fc89e974fa4038', 'practiceLevel1', 'Numbers', 2),
    ('6602fd05a8fc89e974fa4146', '6602fd05a8fc89e974fa4145', 'practiceLevel1', 'True and False', 0),
    ('6602fd05a8fc89e974fa4194', '6602fd05a8fc89e974fa4145', 'practiceLevel1', 'Negating Values', 1),
    ('6602fd05a8fc89e974fa41f0', '6602fd05a8fc89e974fa41ef', 'practiceLevel1', 'Equality operator', 0),
    ('6602fd05a8fc89e974fa4243', '6602fd05a8fc89e974fa41ef', 'practiceLevel1', 'Inequality operator', 1),
    ('6602fd05a8fc89e974fa429a', '6602fd05a8fc89e974fa4299', 'practiceLevel1', 'Strings', 0),
    ('6602fd06a8fc89e974fa4315', '6602fd06a8fc89e974fa4314', 'practiceLevel2', 'Required Practice', 0),
    ('6602fd06a8fc89e974fa43b9', '6602fd06a8fc89e974fa43b8', 'practiceLevel3', 'Creating Variables ', 0),
    ('6602fd06a8fc89e974fa441e', '6602fd06a8fc89e974fa43b8', 'practiceLevel3', 'Using Variables', 1),
    ('6602fd06a8fc89e974fa4467', '6602fd06a8fc89e974fa43b8', 'practiceLevel3', 'True and False', 2),
    ('6602fd06a8fc89e974fa449c', '6602fd06a8fc89e974fa43b8', 'practiceLevel3', 'Checking Number Equality', 3),
    ('6602fd06a8fc89e974fa44e0', '6602fd06a8fc89e974fa43b8', 'practiceLevel3', 'Formatting Strings', 4),
    ('6602fd06a8fc89e974fa455a', '6602fd06a8fc89e974fa4559', 'challengeLevel0', 'Introduction', 0),
    ('6602fd06a8fc89e974fa455c', '6602fd06a8fc89e974fa4559', 'challengeLevel0', 'Declaring Strings', 1),
    ('6602fd06a8fc89e974fa455e', '6602fd06a8fc89e974fa4559', 'challengeLevel0', 'Declaring Numbers', 2),
    ('6602fd06a8fc89e974fa4562', '6602fd06a8fc89e974fa4561', 'practiceLevel1', 'Comparing numbers', 0),
    ('6602fd06a8fc89e974fa45b7', '6602fd06a8fc89e974fa4561', 'practiceLevel1', 'Checking equality', 1),
    ('6602fd06a8fc89e974fa4610', '6602fd06a8fc89e974fa460f', 'practiceLevel1', 'Equality operator', 0),
    ('6602fd06a8fc89e974fa4664', '6602fd06a8fc89e974fa460f', 'practiceLevel1', 'Inequality operator', 1),
    ('6602fd06a8fc89e974fa46b3', '6602fd06a8fc89e974fa46b2', 'practiceLevel1', 'Types', 0),
    ('6602fd06a8fc89e974fa4726', '6602fd06a8fc89e974fa46b2', 'practiceLevel1', 'Types conversion', 1),
    ('6602fd06a8fc89e974fa4796', '6602fd06a8fc89e974fa4795', 'practiceLevel2', 'Required Practice', 0),
    ('6602fd06a8fc89e974fa481a', '6602fd06a8fc89e974fa4819', 'practiceLevel3', 'Comparing Numbers', 0),
    ('6602fd06a8fc89e974fa485c', '6602fd06a8fc89e974fa4819', 'practiceLevel3', 'Comparing Strings', 1),
    ('6602fd06a8fc89e974fa489b', '6602fd06a8fc89e974fa4819', 'practiceLevel3', 'Discovering Types', 2),
    ('6602fd06a8fc89e974fa48df', '6602fd06a8fc89e974fa48de', 'challengeLevel0', 'Legal Driving Age', 0),
    ('6602fd06a8fc89e974fa48e1', '6602fd06a8fc89e974fa48de', 'challengeLevel0', 'Old Password Check', 1),
    ('6602fd06a8fc89e974fa48e3', '6602fd06a8fc89e974fa48de', 'challengeLevel0', 'Movie Ticket Price', 2),
    ('6602fd62666d4ea088040bd5', '6602fd62666d4ea088040bd4', 'practiceLevel1', 'Variable Names', 0),
    ('6602fd62666d4ea088040c2b', '6602fd62666d4ea088040bd4', 'practiceLevel1', 'Variable Values', 1),
    ('6602fd62666d4ea088040c8b', '6602fd62666d4ea088040bd4', 'practiceLevel1', 'Let and Const Differences', 2),
    ('6602fd62666d4ea088040cdd', '6602fd62666d4ea088040bd4', 'practiceLevel1', 'Console', 3),
    ('6602fd62666d4ea088040d3c', '6602fd62666d4ea088040d3b', 'practiceLevel1', 'Updating Let Variables', 0),
    ('6602fd63666d4ea088040d98', '6602fd62666d4ea088040d3b', 'practiceLevel1', 'String Expressions', 1),
    ('6602fd63666d4ea088040e03', '6602fd62666d4ea088040d3b', 'practiceLevel1', 'Numbers', 2),
    ('6602fd63666d4ea088040e70', '6602fd63666d4ea088040e6f', 'practiceLevel1', 'Booleans', 0),
    ('6602fd63666d4ea088040ec8', '6602fd63666d4ea088040e6f', 'practiceLevel1', 'Negating Values', 1),
    ('6602fd63666d4ea088040f25', '6602fd63666d4ea088040f24', 'practiceLevel1', 'Negating Values', 0),
    ('6602fd63666d4ea088040f7b', '6602fd63666d4ea088040f24', 'practiceLevel1', 'Inequality operator', 1),
    ('6602fd63666d4ea088040fd3', '6602fd63666d4ea088040fd2', 'practiceLevel2', 'Required Practice', 0),
    ('6602fd63666d4ea08804106a', '6602fd63666d4ea088041069', 'practiceLevel3', 'Creating Variables ', 0),
    ('6602fd63666d4ea088041075', '6602fd63666d4ea088041069', 'practiceLevel3', 'Using Variables', 1),
    ('6602fd63666d4ea08804107e', '6602fd63666d4ea088041069', 'practiceLevel3', 'Using True and False', 2),
    ('6602fd63666d4ea088041089', '6602fd63666d4ea088041069', 'practiceLevel3', 'Checking Number Equality', 3),
    ('6602fd63666d4ea088041096', '6602fd63666d4ea088041095', 'challengeLevel0', 'Introduction', 0),
    ('6602fd63666d4ea088041098', '6602fd63666d4ea088041095', 'challengeLevel0', 'Pet Adoption Profiles', 1),
    ('6602fd63666d4ea08804109a', '6602fd63666d4ea088041095', 'challengeLevel0', 'Sibling Ages', 2),
    ('6602fd63666d4ea08804109e', '6602fd63666d4ea08804109d', 'practiceLevel1', 'Number Comparison', 0),
    ('6602fd63666d4ea0880410f3', '6602fd63666d4ea08804109d', 'practiceLevel1', 'Equality Check', 1),
    ('6602fd63666d4ea08804114c', '6602fd63666d4ea08804114b', 'practiceLevel1', 'Equality operator', 0),
    ('6602fd63666d4ea08804119f', '6602fd63666d4ea08804114b', 'practiceLevel1', 'Equality operator', 1),
    ('6602fd63666d4ea0880411eb', '6602fd63666d4ea0880411ea', 'practiceLevel1', 'Types', 0),
    ('6602fd63666d4ea08804124a', '6602fd63666d4ea0880411ea', 'practiceLevel1', 'Working with types', 1),
    ('6602fd63666d4ea0880412c6', '6602fd63666d4ea0880412c5', 'practiceLevel1', 'The AND Operator', 0),
    ('6602fd63666d4ea088041321', '6602fd63666d4ea0880412c5', 'practiceLevel1', 'OR and NOT Operators', 1),
    ('6602fd63666d4ea08804138c', '6602fd63666d4ea08804138b', 'practiceLevel2', 'Required Practice', 0),
    ('6602fd63666d4ea088041425', '6602fd63666d4ea088041424', 'practiceLevel3', 'Comparing Numbers', 0),
    ('6602fd63666d4ea08804142b', '6602fd63666d4ea088041424', 'practiceLevel3', 'Comparing Strings', 1),
    ('6602fd63666d4ea088041430', '6602fd63666d4ea088041424', 'practiceLevel3', 'Discovering Types', 2),
    ('6602fd63666d4ea08804143a', '6602fd63666d4ea088041424', 'practiceLevel3', 'Logical Operators', 3),
    ('6602fd63666d4ea088041444', '6602fd63666d4ea088041443', 'challengeLevel0', 'Password Check', 0),
    ('6602fd63666d4ea088041446', '6602fd63666d4ea088041443', 'challengeLevel0', 'Age Check', 1),
    ('6602fd63666d4ea088041448', '6602fd63666d4ea088041443', 'challengeLevel0', 'Budget Check', 2);
    
INSERT INTO lessons (id, chapter_id, type, index) VALUES
    ('6602fd05a8fc89e974fa3f2e', '6602fd05a8fc89e974fa3f2d', 'Interactive', 0),
    ('6602fd05a8fc89e974fa3f31', '6602fd05a8fc89e974fa3f2d', 'Interactive', 1),
    ('6602fd05a8fc89e974fa3f35', '6602fd05a8fc89e974fa3f2d', 'Interactive', 2),
    ('6602fd05a8fc89e974fa3f39', '6602fd05a8fc89e974fa3f2d', 'Interactive', 3),
    ('6602fd05a8fc89e974fa3f3f', '6602fd05a8fc89e974fa3f2d', 'Interactive', 4),
    ('6602fd05a8fc89e974fa3f46', '6602fd05a8fc89e974fa3f2d', 'Interactive', 5),
    ('6602fd05a8fc89e974fa3f4c', '6602fd05a8fc89e974fa3f2d', 'Interactive', 6),
    ('6602fd05a8fc89e974fa3f54', '6602fd05a8fc89e974fa3f2d', 'Interactive', 7),
    ('6602fd05a8fc89e974fa3f5a', '6602fd05a8fc89e974fa3f2d', 'Interactive', 8),
    ('6602fd05a8fc89e974fa3f60', '6602fd05a8fc89e974fa3f2d', 'Interactive', 9),
    ('6602fd05a8fc89e974fa3f66', '6602fd05a8fc89e974fa3f2d', 'Interactive', 10),
    ('6602fd05a8fc89e974fa3f6c', '6602fd05a8fc89e974fa3f2d', 'Interactive', 11),
    ('6602fd05a8fc89e974fa3f73', '6602fd05a8fc89e974fa3f2d', 'Interactive', 12),
    ('6602fd05a8fc89e974fa3f7a', '6602fd05a8fc89e974fa3f79', 'Interactive', 0),
    ('6602fd05a8fc89e974fa3f80', '6602fd05a8fc89e974fa3f79', 'Interactive', 1),
    ('6602fd05a8fc89e974fa3f87', '6602fd05a8fc89e974fa3f79', 'Interactive', 2),
    ('6602fd05a8fc89e974fa3f8e', '6602fd05a8fc89e974fa3f79', 'Interactive', 3),
    ('6602fd05a8fc89e974fa3f95', '6602fd05a8fc89e974fa3f79', 'Interactive', 4),
    ('6602fd05a8fc89e974fa3f9d', '6602fd05a8fc89e974fa3f79', 'Interactive', 5),
    ('6602fd05a8fc89e974fa3fa5', '6602fd05a8fc89e974fa3f79', 'Interactive', 6),
    ('6602fd05a8fc89e974fa3fab', '6602fd05a8fc89e974fa3f79', 'Interactive', 7),
    ('6602fd05a8fc89e974fa3fb3', '6602fd05a8fc89e974fa3f79', 'Interactive', 8),
    ('6602fd05a8fc89e974fa3fbb', '6602fd05a8fc89e974fa3f79', 'Interactive', 9),
    ('6602fd05a8fc89e974fa3fc3', '6602fd05a8fc89e974fa3f79', 'Interactive', 10),
    ('6602fd05a8fc89e974fa3fca', '6602fd05a8fc89e974fa3f79', 'Interactive', 11),
    ('6602fd05a8fc89e974fa3fd3', '6602fd05a8fc89e974fa3f79', 'Interactive', 12),
    ('6602fd05a8fc89e974fa3fda', '6602fd05a8fc89e974fa3fd9', 'Interactive', 0),
    ('6602fd05a8fc89e974fa3fde', '6602fd05a8fc89e974fa3fd9', 'Interactive', 1),
    ('6602fd05a8fc89e974fa3fe7', '6602fd05a8fc89e974fa3fd9', 'Interactive', 2),
    ('6602fd05a8fc89e974fa3fed', '6602fd05a8fc89e974fa3fd9', 'Interactive', 3),
    ('6602fd05a8fc89e974fa3ff5', '6602fd05a8fc89e974fa3fd9', 'Interactive', 4),
    ('6602fd05a8fc89e974fa3ffb', '6602fd05a8fc89e974fa3fd9', 'Interactive', 5),
    ('6602fd05a8fc89e974fa4001', '6602fd05a8fc89e974fa3fd9', 'Interactive', 6),
    ('6602fd05a8fc89e974fa4007', '6602fd05a8fc89e974fa3fd9', 'Interactive', 7),
    ('6602fd05a8fc89e974fa400d', '6602fd05a8fc89e974fa3fd9', 'Interactive', 8),
    ('6602fd05a8fc89e974fa4013', '6602fd05a8fc89e974fa3fd9', 'Interactive', 9),
    ('6602fd05a8fc89e974fa401b', '6602fd05a8fc89e974fa3fd9', 'Interactive', 10),
    ('6602fd05a8fc89e974fa4022', '6602fd05a8fc89e974fa3fd9', 'Interactive', 11),
    ('6602fd05a8fc89e974fa4029', '6602fd05a8fc89e974fa3fd9', 'Interactive', 12),
    ('6602fd05a8fc89e974fa4032', '6602fd05a8fc89e974fa3fd9', 'Interactive', 13),
    ('6602fd05a8fc89e974fa403a', '6602fd05a8fc89e974fa4039', 'Interactive', 0),
    ('6602fd05a8fc89e974fa4040', '6602fd05a8fc89e974fa4039', 'Interactive', 1),
    ('6602fd05a8fc89e974fa4048', '6602fd05a8fc89e974fa4039', 'Interactive', 2),
    ('6602fd05a8fc89e974fa404e', '6602fd05a8fc89e974fa4039', 'Interactive', 3),
    ('6602fd05a8fc89e974fa4054', '6602fd05a8fc89e974fa4039', 'Interactive', 4),
    ('6602fd05a8fc89e974fa405a', '6602fd05a8fc89e974fa4039', 'Interactive', 5),
    ('6602fd05a8fc89e974fa4062', '6602fd05a8fc89e974fa4039', 'Interactive', 6),
    ('6602fd05a8fc89e974fa406a', '6602fd05a8fc89e974fa4039', 'Interactive', 7),
    ('6602fd05a8fc89e974fa4072', '6602fd05a8fc89e974fa4039', 'Interactive', 8),
    ('6602fd05a8fc89e974fa4078', '6602fd05a8fc89e974fa4039', 'Interactive', 9),
    ('6602fd05a8fc89e974fa4080', '6602fd05a8fc89e974fa4039', 'Interactive', 10),
    ('6602fd05a8fc89e974fa4086', '6602fd05a8fc89e974fa4039', 'Interactive', 11),
    ('6602fd05a8fc89e974fa408d', '6602fd05a8fc89e974fa408c', 'Interactive', 0),
    ('6602fd05a8fc89e974fa4093', '6602fd05a8fc89e974fa408c', 'Interactive', 1),
    ('6602fd05a8fc89e974fa409b', '6602fd05a8fc89e974fa408c', 'Interactive', 2),
    ('6602fd05a8fc89e974fa40a2', '6602fd05a8fc89e974fa408c', 'Interactive', 3),
    ('6602fd05a8fc89e974fa40a9', '6602fd05a8fc89e974fa408c', 'Interactive', 4),
    ('6602fd05a8fc89e974fa40b1', '6602fd05a8fc89e974fa408c', 'Interactive', 5),
    ('6602fd05a8fc89e974fa40b9', '6602fd05a8fc89e974fa408c', 'Interactive', 6),
    ('6602fd05a8fc89e974fa40c1', '6602fd05a8fc89e974fa408c', 'Interactive', 7),
    ('6602fd05a8fc89e974fa40c7', '6602fd05a8fc89e974fa408c', 'Interactive', 8),
    ('6602fd05a8fc89e974fa40cf', '6602fd05a8fc89e974fa408c', 'Interactive', 9),
    ('6602fd05a8fc89e974fa40d7', '6602fd05a8fc89e974fa408c', 'Interactive', 10),
    ('6602fd05a8fc89e974fa40de', '6602fd05a8fc89e974fa40dd', 'Interactive', 0),
    ('6602fd05a8fc89e974fa40e4', '6602fd05a8fc89e974fa40dd', 'Interactive', 1),
    ('6602fd05a8fc89e974fa40ec', '6602fd05a8fc89e974fa40dd', 'Interactive', 2),
    ('6602fd05a8fc89e974fa40f3', '6602fd05a8fc89e974fa40dd', 'Interactive', 3),
    ('6602fd05a8fc89e974fa40f9', '6602fd05a8fc89e974fa40dd', 'Interactive', 4),
    ('6602fd05a8fc89e974fa4100', '6602fd05a8fc89e974fa40dd', 'Interactive', 5),
    ('6602fd05a8fc89e974fa4108', '6602fd05a8fc89e974fa40dd', 'Interactive', 6),
    ('6602fd05a8fc89e974fa4110', '6602fd05a8fc89e974fa40dd', 'Interactive', 7),
    ('6602fd05a8fc89e974fa4118', '6602fd05a8fc89e974fa40dd', 'Interactive', 8),
    ('6602fd05a8fc89e974fa4120', '6602fd05a8fc89e974fa40dd', 'Interactive', 9),
    ('6602fd05a8fc89e974fa4128', '6602fd05a8fc89e974fa40dd', 'Interactive', 10),
    ('6602fd05a8fc89e974fa412f', '6602fd05a8fc89e974fa40dd', 'Interactive', 11),
    ('6602fd05a8fc89e974fa4137', '6602fd05a8fc89e974fa40dd', 'Interactive', 12),
    ('6602fd05a8fc89e974fa413f', '6602fd05a8fc89e974fa40dd', 'Interactive', 13),
    ('6602fd05a8fc89e974fa4147', '6602fd05a8fc89e974fa4146', 'Interactive', 0),
    ('6602fd05a8fc89e974fa414b', '6602fd05a8fc89e974fa4146', 'Interactive', 1),
    ('6602fd05a8fc89e974fa4152', '6602fd05a8fc89e974fa4146', 'Interactive', 2),
    ('6602fd05a8fc89e974fa4158', '6602fd05a8fc89e974fa4146', 'Interactive', 3),
    ('6602fd05a8fc89e974fa415b', '6602fd05a8fc89e974fa4146', 'Interactive', 4),
    ('6602fd05a8fc89e974fa4162', '6602fd05a8fc89e974fa4146', 'Interactive', 5),
    ('6602fd05a8fc89e974fa4168', '6602fd05a8fc89e974fa4146', 'Interactive', 6),
    ('6602fd05a8fc89e974fa4170', '6602fd05a8fc89e974fa4146', 'Interactive', 7),
    ('6602fd05a8fc89e974fa4176', '6602fd05a8fc89e974fa4146', 'Interactive', 8),
    ('6602fd05a8fc89e974fa417c', '6602fd05a8fc89e974fa4146', 'Interactive', 9),
    ('6602fd05a8fc89e974fa4182', '6602fd05a8fc89e974fa4146', 'Interactive', 10),
    ('6602fd05a8fc89e974fa4188', '6602fd05a8fc89e974fa4146', 'Interactive', 11),
    ('6602fd05a8fc89e974fa418e', '6602fd05a8fc89e974fa4146', 'Interactive', 12),
    ('6602fd05a8fc89e974fa4195', '6602fd05a8fc89e974fa4194', 'Interactive', 0),
    ('6602fd05a8fc89e974fa4199', '6602fd05a8fc89e974fa4194', 'Interactive', 1),
    ('6602fd05a8fc89e974fa41a0', '6602fd05a8fc89e974fa4194', 'Interactive', 2),
    ('6602fd05a8fc89e974fa41a7', '6602fd05a8fc89e974fa4194', 'Interactive', 3),
    ('6602fd05a8fc89e974fa41af', '6602fd05a8fc89e974fa4194', 'Interactive', 4),
    ('6602fd05a8fc89e974fa41b8', '6602fd05a8fc89e974fa4194', 'Interactive', 5),
    ('6602fd05a8fc89e974fa41be', '6602fd05a8fc89e974fa4194', 'Interactive', 6),
    ('6602fd05a8fc89e974fa41c6', '6602fd05a8fc89e974fa4194', 'Interactive', 7),
    ('6602fd05a8fc89e974fa41cc', '6602fd05a8fc89e974fa4194', 'Interactive', 8),
    ('6602fd05a8fc89e974fa41d4', '6602fd05a8fc89e974fa4194', 'Interactive', 9),
    ('6602fd05a8fc89e974fa41db', '6602fd05a8fc89e974fa4194', 'Interactive', 10),
    ('6602fd05a8fc89e974fa41e1', '6602fd05a8fc89e974fa4194', 'Interactive', 11),
    ('6602fd05a8fc89e974fa41e9', '6602fd05a8fc89e974fa4194', 'Interactive', 12),
    ('6602fd05a8fc89e974fa41f1', '6602fd05a8fc89e974fa41f0', 'Interactive', 0),
    ('6602fd05a8fc89e974fa41f6', '6602fd05a8fc89e974fa41f0', 'Interactive', 1),
    ('6602fd05a8fc89e974fa41fc', '6602fd05a8fc89e974fa41f0', 'Interactive', 2),
    ('6602fd05a8fc89e974fa41ff', '6602fd05a8fc89e974fa41f0', 'Interactive', 3),
    ('6602fd05a8fc89e974fa4207', '6602fd05a8fc89e974fa41f0', 'Interactive', 4),
    ('6602fd05a8fc89e974fa420d', '6602fd05a8fc89e974fa41f0', 'Interactive', 5),
    ('6602fd05a8fc89e974fa4213', '6602fd05a8fc89e974fa41f0', 'Interactive', 6),
    ('6602fd05a8fc89e974fa421b', '6602fd05a8fc89e974fa41f0', 'Interactive', 7),
    ('6602fd05a8fc89e974fa4221', '6602fd05a8fc89e974fa41f0', 'Interactive', 8),
    ('6602fd05a8fc89e974fa4229', '6602fd05a8fc89e974fa41f0', 'Interactive', 9),
    ('6602fd05a8fc89e974fa4231', '6602fd05a8fc89e974fa41f0', 'Interactive', 10),
    ('6602fd05a8fc89e974fa4237', '6602fd05a8fc89e974fa41f0', 'Interactive', 11),
    ('6602fd05a8fc89e974fa423d', '6602fd05a8fc89e974fa41f0', 'Interactive', 12),
    ('6602fd05a8fc89e974fa4244', '6602fd05a8fc89e974fa4243', 'Interactive', 0),
    ('6602fd05a8fc89e974fa424a', '6602fd05a8fc89e974fa4243', 'Interactive', 1),
    ('6602fd05a8fc89e974fa4251', '6602fd05a8fc89e974fa4243', 'Interactive', 2),
    ('6602fd05a8fc89e974fa4259', '6602fd05a8fc89e974fa4243', 'Interactive', 3),
    ('6602fd05a8fc89e974fa425f', '6602fd05a8fc89e974fa4243', 'Interactive', 4),
    ('6602fd05a8fc89e974fa4267', '6602fd05a8fc89e974fa4243', 'Interactive', 5),
    ('6602fd05a8fc89e974fa426f', '6602fd05a8fc89e974fa4243', 'Interactive', 6),
    ('6602fd05a8fc89e974fa4277', '6602fd05a8fc89e974fa4243', 'Interactive', 7),
    ('6602fd05a8fc89e974fa427f', '6602fd05a8fc89e974fa4243', 'Interactive', 8),
    ('6602fd05a8fc89e974fa4285', '6602fd05a8fc89e974fa4243', 'Interactive', 9),
    ('6602fd05a8fc89e974fa428d', '6602fd05a8fc89e974fa4243', 'Interactive', 10),
    ('6602fd05a8fc89e974fa4293', '6602fd05a8fc89e974fa4243', 'Interactive', 11),
    ('6602fd05a8fc89e974fa429b', '6602fd05a8fc89e974fa429a', 'Interactive', 0),
    ('6602fd05a8fc89e974fa429e', '6602fd05a8fc89e974fa429a', 'Interactive', 1),
    ('6602fd05a8fc89e974fa42a4', '6602fd05a8fc89e974fa429a', 'Interactive', 2),
    ('6602fd05a8fc89e974fa42ab', '6602fd05a8fc89e974fa429a', 'Interactive', 3),
    ('6602fd05a8fc89e974fa42b1', '6602fd05a8fc89e974fa429a', 'Interactive', 4),
    ('6602fd06a8fc89e974fa42b8', '6602fd05a8fc89e974fa429a', 'Interactive', 5),
    ('6602fd06a8fc89e974fa42be', '6602fd05a8fc89e974fa429a', 'Interactive', 6),
    ('6602fd06a8fc89e974fa42c4', '6602fd05a8fc89e974fa429a', 'Interactive', 7),
    ('6602fd06a8fc89e974fa42ca', '6602fd05a8fc89e974fa429a', 'Interactive', 8),
    ('6602fd06a8fc89e974fa42d1', '6602fd05a8fc89e974fa429a', 'Interactive', 9),
    ('6602fd06a8fc89e974fa42d9', '6602fd05a8fc89e974fa429a', 'Interactive', 10),
    ('6602fd06a8fc89e974fa42df', '6602fd05a8fc89e974fa429a', 'Interactive', 11),
    ('6602fd06a8fc89e974fa42e5', '6602fd05a8fc89e974fa429a', 'Interactive', 12),
    ('6602fd06a8fc89e974fa42eb', '6602fd05a8fc89e974fa429a', 'Interactive', 13),
    ('6602fd06a8fc89e974fa42f1', '6602fd05a8fc89e974fa429a', 'Interactive', 14),
    ('6602fd06a8fc89e974fa42f7', '6602fd05a8fc89e974fa429a', 'Interactive', 15),
    ('6602fd06a8fc89e974fa42fd', '6602fd05a8fc89e974fa429a', 'Interactive', 16),
    ('6602fd06a8fc89e974fa4303', '6602fd05a8fc89e974fa429a', 'Interactive', 17),
    ('6602fd06a8fc89e974fa430b', '6602fd05a8fc89e974fa429a', 'Interactive', 18),
    ('6602fd06a8fc89e974fa4316', '6602fd06a8fc89e974fa4315', 'Interactive', 0),
    ('6602fd06a8fc89e974fa431e', '6602fd06a8fc89e974fa4315', 'Interactive', 1),
    ('6602fd06a8fc89e974fa4324', '6602fd06a8fc89e974fa4315', 'Interactive', 2),
    ('6602fd06a8fc89e974fa432a', '6602fd06a8fc89e974fa4315', 'Interactive', 3),
    ('6602fd06a8fc89e974fa4331', '6602fd06a8fc89e974fa4315', 'Interactive', 4),
    ('6602fd06a8fc89e974fa4337', '6602fd06a8fc89e974fa4315', 'Interactive', 5),
    ('6602fd06a8fc89e974fa4340', '6602fd06a8fc89e974fa4315', 'Interactive', 6),
    ('6602fd06a8fc89e974fa4348', '6602fd06a8fc89e974fa4315', 'Interactive', 7),
    ('6602fd06a8fc89e974fa434f', '6602fd06a8fc89e974fa4315', 'Interactive', 8),
    ('6602fd06a8fc89e974fa4356', '6602fd06a8fc89e974fa4315', 'Interactive', 9),
    ('6602fd06a8fc89e974fa435f', '6602fd06a8fc89e974fa4315', 'Interactive', 10),
    ('6602fd06a8fc89e974fa4366', '6602fd06a8fc89e974fa4315', 'Interactive', 11),
    ('6602fd06a8fc89e974fa436e', '6602fd06a8fc89e974fa4315', 'Interactive', 12),
    ('6602fd06a8fc89e974fa4377', '6602fd06a8fc89e974fa4315', 'Interactive', 13),
    ('6602fd06a8fc89e974fa437d', '6602fd06a8fc89e974fa4315', 'Interactive', 14),
    ('6602fd06a8fc89e974fa4384', '6602fd06a8fc89e974fa4315', 'Interactive', 15),
    ('6602fd06a8fc89e974fa438b', '6602fd06a8fc89e974fa4315', 'Interactive', 16),
    ('6602fd06a8fc89e974fa4392', '6602fd06a8fc89e974fa4315', 'Interactive', 17),
    ('6602fd06a8fc89e974fa439b', '6602fd06a8fc89e974fa4315', 'Interactive', 18),
    ('6602fd06a8fc89e974fa43a3', '6602fd06a8fc89e974fa4315', 'Interactive', 19),
    ('6602fd06a8fc89e974fa43a9', '6602fd06a8fc89e974fa4315', 'Interactive', 20),
    ('6602fd06a8fc89e974fa43b2', '6602fd06a8fc89e974fa4315', 'Interactive', 21),
    ('6602fd06a8fc89e974fa43ba', '6602fd06a8fc89e974fa43b9', 'Interactive', 0),
    ('6602fd06a8fc89e974fa43c4', '6602fd06a8fc89e974fa43b9', 'Interactive', 1),
    ('6602fd06a8fc89e974fa43ce', '6602fd06a8fc89e974fa43b9', 'Interactive', 2),
    ('6602fd06a8fc89e974fa43d4', '6602fd06a8fc89e974fa43b9', 'Interactive', 3),
    ('6602fd06a8fc89e974fa43db', '6602fd06a8fc89e974fa43b9', 'Interactive', 4),
    ('6602fd06a8fc89e974fa43e5', '6602fd06a8fc89e974fa43b9', 'Interactive', 5),
    ('6602fd06a8fc89e974fa43eb', '6602fd06a8fc89e974fa43b9', 'Interactive', 6),
    ('6602fd06a8fc89e974fa43f1', '6602fd06a8fc89e974fa43b9', 'Interactive', 7),
    ('6602fd06a8fc89e974fa43fa', '6602fd06a8fc89e974fa43b9', 'Interactive', 8),
    ('6602fd06a8fc89e974fa4404', '6602fd06a8fc89e974fa43b9', 'Interactive', 9),
    ('6602fd06a8fc89e974fa440e', '6602fd06a8fc89e974fa43b9', 'Interactive', 10),
    ('6602fd06a8fc89e974fa4414', '6602fd06a8fc89e974fa43b9', 'Interactive', 11),
    ('6602fd06a8fc89e974fa441f', '6602fd06a8fc89e974fa441e', 'Interactive', 0),
    ('6602fd06a8fc89e974fa4429', '6602fd06a8fc89e974fa441e', 'Interactive', 1),
    ('6602fd06a8fc89e974fa4433', '6602fd06a8fc89e974fa441e', 'Executable', 0),
    ('6602fd06a8fc89e974fa4434', '6602fd06a8fc89e974fa441e', 'Executable', 0),
    ('6602fd06a8fc89e974fa4435', '6602fd06a8fc89e974fa441e', 'Interactive', 4),
    ('6602fd06a8fc89e974fa443b', '6602fd06a8fc89e974fa441e', 'Interactive', 5),
    ('6602fd06a8fc89e974fa4445', '6602fd06a8fc89e974fa441e', 'Interactive', 6),
    ('6602fd06a8fc89e974fa444f', '6602fd06a8fc89e974fa441e', 'Interactive', 7),
    ('6602fd06a8fc89e974fa4455', '6602fd06a8fc89e974fa441e', 'Interactive', 8),
    ('6602fd06a8fc89e974fa445f', '6602fd06a8fc89e974fa441e', 'Executable', 0),
    ('6602fd06a8fc89e974fa4460', '6602fd06a8fc89e974fa441e', 'Interactive', 10),
    ('6602fd06a8fc89e974fa4468', '6602fd06a8fc89e974fa4467', 'Executable', 0),
    ('6602fd06a8fc89e974fa4469', '6602fd06a8fc89e974fa4467', 'Interactive', 1),
    ('6602fd06a8fc89e974fa446f', '6602fd06a8fc89e974fa4467', 'Interactive', 2),
    ('6602fd06a8fc89e974fa4475', '6602fd06a8fc89e974fa4467', 'Interactive', 3),
    ('6602fd06a8fc89e974fa447f', '6602fd06a8fc89e974fa4467', 'Executable', 0),
    ('6602fd06a8fc89e974fa4480', '6602fd06a8fc89e974fa4467', 'Interactive', 5),
    ('6602fd06a8fc89e974fa4489', '6602fd06a8fc89e974fa4467', 'Interactive', 6),
    ('6602fd06a8fc89e974fa4491','6602fd06a8fc89e974fa4467','Executable',0),
  ('6602fd06a8fc89e974fa4492','6602fd06a8fc89e974fa4467','Interactive',8),
  ('6602fd06a8fc89e974fa449d','6602fd06a8fc89e974fa449c','Interactive',0),
  ('6602fd06a8fc89e974fa44a5','6602fd06a8fc89e974fa449c','Interactive',1),
  ('6602fd06a8fc89e974fa44ab','6602fd06a8fc89e974fa449c','Interactive',2),
  ('6602fd06a8fc89e974fa44b1','6602fd06a8fc89e974fa449c','Executable',0),
  ('6602fd06a8fc89e974fa44b2','6602fd06a8fc89e974fa449c','Interactive',4),
  ('6602fd06a8fc89e974fa44ba','6602fd06a8fc89e974fa449c','Interactive',5),
  ('6602fd06a8fc89e974fa44c0','6602fd06a8fc89e974fa449c','Interactive',6),
  ('6602fd06a8fc89e974fa44ca','6602fd06a8fc89e974fa449c','Interactive',7),
  ('6602fd06a8fc89e974fa44d0','6602fd06a8fc89e974fa449c','Interactive',8),
  ('6602fd06a8fc89e974fa44da','6602fd06a8fc89e974fa449c','Interactive',9),
  ('6602fd06a8fc89e974fa44e1','6602fd06a8fc89e974fa44e0','Interactive',0),
  ('6602fd06a8fc89e974fa44eb','6602fd06a8fc89e974fa44e0','Interactive',1),
  ('6602fd06a8fc89e974fa44f6','6602fd06a8fc89e974fa44e0','Interactive',2),
  ('6602fd06a8fc89e974fa4500','6602fd06a8fc89e974fa44e0','Interactive',3),
  ('6602fd06a8fc89e974fa4506','6602fd06a8fc89e974fa44e0','Interactive',4),
  ('6602fd06a8fc89e974fa4510','6602fd06a8fc89e974fa44e0','Interactive',5),
  ('6602fd06a8fc89e974fa4516','6602fd06a8fc89e974fa44e0','Interactive',6),
  ('6602fd06a8fc89e974fa4520','6602fd06a8fc89e974fa44e0','Interactive',7),
  ('6602fd06a8fc89e974fa4528','6602fd06a8fc89e974fa44e0','Interactive',8),
  ('6602fd06a8fc89e974fa4532','6602fd06a8fc89e974fa44e0','Interactive',9),
  ('6602fd06a8fc89e974fa453c','6602fd06a8fc89e974fa44e0','Interactive',10),
  ('6602fd06a8fc89e974fa4542','6602fd06a8fc89e974fa44e0','Interactive',11),
  ('6602fd06a8fc89e974fa454a','6602fd06a8fc89e974fa44e0','Interactive',12),
  ('6602fd06a8fc89e974fa4550','6602fd06a8fc89e974fa44e0','Interactive',13),
  ('6602fd06a8fc89e974fa455b','6602fd06a8fc89e974fa455a','Executable',0),
  ('6602fd06a8fc89e974fa455d','6602fd06a8fc89e974fa455c','Executable',0),
  ('6602fd06a8fc89e974fa455f','6602fd06a8fc89e974fa455e','Executable',0),
  ('6602fd06a8fc89e974fa4563','6602fd06a8fc89e974fa4562','Interactive',0),
  ('6602fd06a8fc89e974fa4566','6602fd06a8fc89e974fa4562','Interactive',1),
  ('6602fd06a8fc89e974fa456c','6602fd06a8fc89e974fa4562','Interactive',2),
  ('6602fd06a8fc89e974fa4574','6602fd06a8fc89e974fa4562','Interactive',3),
  ('6602fd06a8fc89e974fa457b','6602fd06a8fc89e974fa4562','Interactive',4),
  ('6602fd06a8fc89e974fa4581','6602fd06a8fc89e974fa4562','Interactive',5),
  ('6602fd06a8fc89e974fa4587','6602fd06a8fc89e974fa4562','Interactive',6),
  ('6602fd06a8fc89e974fa458d','6602fd06a8fc89e974fa4562','Interactive',7),
  ('6602fd06a8fc89e974fa4595','6602fd06a8fc89e974fa4562','Interactive',8),
  ('6602fd06a8fc89e974fa459d','6602fd06a8fc89e974fa4562','Interactive',9),
  ('6602fd06a8fc89e974fa45a5','6602fd06a8fc89e974fa4562','Interactive',10),
  ('6602fd06a8fc89e974fa45ab','6602fd06a8fc89e974fa4562','Interactive',11),
  ('6602fd06a8fc89e974fa45b1','6602fd06a8fc89e974fa4562','Interactive',12),
  ('6602fd06a8fc89e974fa45b8','6602fd06a8fc89e974fa45b7','Interactive',0),
  ('6602fd06a8fc89e974fa45be','6602fd06a8fc89e974fa45b7','Interactive',1),
  ('6602fd06a8fc89e974fa45c6','6602fd06a8fc89e974fa45b7','Interactive',2),
  ('6602fd06a8fc89e974fa45cc','6602fd06a8fc89e974fa45b7','Interactive',3),
  ('6602fd06a8fc89e974fa45d3','6602fd06a8fc89e974fa45b7','Interactive',4),
  ('6602fd06a8fc89e974fa45db','6602fd06a8fc89e974fa45b7','Interactive',5),
  ('6602fd06a8fc89e974fa45e1','6602fd06a8fc89e974fa45b7','Interactive',6),
  ('6602fd06a8fc89e974fa45e7','6602fd06a8fc89e974fa45b7','Interactive',7),
  ('6602fd06a8fc89e974fa45ed','6602fd06a8fc89e974fa45b7','Interactive',8),
  ('6602fd06a8fc89e974fa45f5','6602fd06a8fc89e974fa45b7','Interactive',9),
  ('6602fd06a8fc89e974fa45fb','6602fd06a8fc89e974fa45b7','Interactive',10),
  ('6602fd06a8fc89e974fa4601','6602fd06a8fc89e974fa45b7','Interactive',11),
  ('6602fd06a8fc89e974fa4609','6602fd06a8fc89e974fa45b7','Interactive',12),
  ('6602fd06a8fc89e974fa4611','6602fd06a8fc89e974fa4610','Interactive',0),
  ('6602fd06a8fc89e974fa4615','6602fd06a8fc89e974fa4610','Interactive',1),
  ('6602fd06a8fc89e974fa461b','6602fd06a8fc89e974fa4610','Interactive',2),
  ('6602fd06a8fc89e974fa4623','6602fd06a8fc89e974fa4610','Interactive',3),
  ('6602fd06a8fc89e974fa462a','6602fd06a8fc89e974fa4610','Interactive',4),
  ('6602fd06a8fc89e974fa4632','6602fd06a8fc89e974fa4610','Interactive',5),
  ('6602fd06a8fc89e974fa4638','6602fd06a8fc89e974fa4610','Interactive',6),
  ('6602fd06a8fc89e974fa463e','6602fd06a8fc89e974fa4610','Interactive',7),
  ('6602fd06a8fc89e974fa4646','6602fd06a8fc89e974fa4610','Interactive',8),
  ('6602fd06a8fc89e974fa464c','6602fd06a8fc89e974fa4610','Interactive',9),
  ('6602fd06a8fc89e974fa4652','6602fd06a8fc89e974fa4610','Interactive',10),
  ('6602fd06a8fc89e974fa4658','6602fd06a8fc89e974fa4610','Interactive',11),
  ('6602fd06a8fc89e974fa465e','6602fd06a8fc89e974fa4610','Interactive',12),
  ('6602fd06a8fc89e974fa4665','6602fd06a8fc89e974fa4664','Interactive',0),
  ('6602fd06a8fc89e974fa466b','6602fd06a8fc89e974fa4664','Interactive',1),
  ('6602fd06a8fc89e974fa4673','6602fd06a8fc89e974fa4664','Interactive',2),
  ('6602fd06a8fc89e974fa467a','6602fd06a8fc89e974fa4664','Interactive',3),
  ('6602fd06a8fc89e974fa4680','6602fd06a8fc89e974fa4664','Interactive',4),
  ('6602fd06a8fc89e974fa4686','6602fd06a8fc89e974fa4664','Interactive',5),
  ('6602fd06a8fc89e974fa468c','6602fd06a8fc89e974fa4664','Interactive',6),
  ('6602fd06a8fc89e974fa4694','6602fd06a8fc89e974fa4664','Interactive',7),
  ('6602fd06a8fc89e974fa469a','6602fd06a8fc89e974fa4664','Interactive',8),
  ('6602fd06a8fc89e974fa46a0','6602fd06a8fc89e974fa4664','Interactive',9),
  ('6602fd06a8fc89e974fa46a6','6602fd06a8fc89e974fa4664','Interactive',10),
  ('6602fd06a8fc89e974fa46ac','6602fd06a8fc89e974fa4664','Interactive',11),
  ('6602fd06a8fc89e974fa46b4','6602fd06a8fc89e974fa46b3','Interactive',0),
  ('6602fd06a8fc89e974fa46b7','6602fd06a8fc89e974fa46b3','Interactive',1),
  ('6602fd06a8fc89e974fa46bd','6602fd06a8fc89e974fa46b3','Interactive',2),
  ('6602fd06a8fc89e974fa46c3','6602fd06a8fc89e974fa46b3','Interactive',3),
  ('6602fd06a8fc89e974fa46cb','6602fd06a8fc89e974fa46b3','Interactive',4),
  ('6602fd06a8fc89e974fa46d1','6602fd06a8fc89e974fa46b3','Interactive',5),
  ('6602fd06a8fc89e974fa46d9','6602fd06a8fc89e974fa46b3','Interactive',6),
  ('6602fd06a8fc89e974fa46df','6602fd06a8fc89e974fa46b3','Interactive',7),
  ('6602fd06a8fc89e974fa46e5','6602fd06a8fc89e974fa46b3','Interactive',8),
  ('6602fd06a8fc89e974fa46eb','6602fd06a8fc89e974fa46b3','Interactive',9),
  ('6602fd06a8fc89e974fa46f3','6602fd06a8fc89e974fa46b3','Interactive',10),
  ('6602fd06a8fc89e974fa46f9','6602fd06a8fc89e974fa46b3','Interactive',11),
  ('6602fd06a8fc89e974fa46ff','6602fd06a8fc89e974fa46b3','Interactive',12),
  ('6602fd06a8fc89e974fa4707','6602fd06a8fc89e974fa46b3','Interactive',13),
  ('6602fd06a8fc89e974fa470d','6602fd06a8fc89e974fa46b3','Interactive',14),
  ('6602fd06a8fc89e974fa4713','6602fd06a8fc89e974fa46b3','Interactive',15),
  ('6602fd06a8fc89e974fa471a','6602fd06a8fc89e974fa46b3','Interactive',16),
  ('6602fd06a8fc89e974fa4720','6602fd06a8fc89e974fa46b3','Interactive',17),
  ('6602fd06a8fc89e974fa4727','6602fd06a8fc89e974fa4726','Interactive',0),
  ('6602fd06a8fc89e974fa472e','6602fd06a8fc89e974fa4726','Interactive',1),
  ('6602fd06a8fc89e974fa4739','6602fd06a8fc89e974fa4726','Interactive',2),
  ('6602fd06a8fc89e974fa4742','6602fd06a8fc89e974fa4726','Interactive',3),
  ('6602fd06a8fc89e974fa4748','6602fd06a8fc89e974fa4726','Interactive',4),
  ('6602fd06a8fc89e974fa4752','6602fd06a8fc89e974fa4726','Interactive',5),
  ('6602fd06a8fc89e974fa4758','6602fd06a8fc89e974fa4726','Interactive',6),
  ('6602fd06a8fc89e974fa4761','6602fd06a8fc89e974fa4726','Interactive',7),
  ('6602fd06a8fc89e974fa4769','6602fd06a8fc89e974fa4726','Interactive',8),
  ('6602fd06a8fc89e974fa4773','6602fd06a8fc89e974fa4726','Interactive',9),
  ('6602fd06a8fc89e974fa477a','6602fd06a8fc89e974fa4726','Interactive',10),
  ('6602fd06a8fc89e974fa4780','6602fd06a8fc89e974fa4726','Interactive',11),
  ('6602fd06a8fc89e974fa4788','6602fd06a8fc89e974fa4726','Interactive',12),
  ('6602fd06a8fc89e974fa478e','6602fd06a8fc89e974fa4726','Interactive',13),
  ('6602fd06a8fc89e974fa4797','6602fd06a8fc89e974fa4796','Interactive',0),
  ('6602fd06a8fc89e974fa47a0','6602fd06a8fc89e974fa4796','Interactive',1),
  ('6602fd06a8fc89e974fa47a6','6602fd06a8fc89e974fa4796','Interactive',2),
  ('6602fd06a8fc89e974fa47af','6602fd06a8fc89e974fa4796','Interactive',3),
  ('6602fd06a8fc89e974fa47b5','6602fd06a8fc89e974fa4796','Interactive',4),
  ('6602fd06a8fc89e974fa47bc','6602fd06a8fc89e974fa4796','Interactive',5),
  ('6602fd06a8fc89e974fa47c2','6602fd06a8fc89e974fa4796','Interactive',6),
  ('6602fd06a8fc89e974fa47cb','6602fd06a8fc89e974fa4796','Interactive',7),
  ('6602fd06a8fc89e974fa47d2','6602fd06a8fc89e974fa4796','Interactive',8),
  ('6602fd06a8fc89e974fa47d9','6602fd06a8fc89e974fa4796','Interactive',9),
  ('6602fd06a8fc89e974fa47e2','6602fd06a8fc89e974fa4796','Interactive',10),
  ('6602fd06a8fc89e974fa47eb','6602fd06a8fc89e974fa4796','Interactive',11),
  ('6602fd06a8fc89e974fa47f3','6602fd06a8fc89e974fa4796','Interactive',12),
  ('6602fd06a8fc89e974fa47fc','6602fd06a8fc89e974fa4796','Interactive',13),
  ('6602fd06a8fc89e974fa4804','6602fd06a8fc89e974fa4796','Interactive',14),
  ('6602fd06a8fc89e974fa480b','6602fd06a8fc89e974fa4796','Interactive',15),
  ('6602fd06a8fc89e974fa4812','6602fd06a8fc89e974fa4796','Interactive',16),
  ('6602fd06a8fc89e974fa481b','6602fd06a8fc89e974fa481a','Interactive',0),
  ('6602fd06a8fc89e974fa4825','6602fd06a8fc89e974fa481a','Interactive',1),
  ('6602fd06a8fc89e974fa482d','6602fd06a8fc89e974fa481a','Interactive',2),
  ('6602fd06a8fc89e974fa4833','6602fd06a8fc89e974fa481a','Interactive',3),
  ('6602fd06a8fc89e974fa4839','6602fd06a8fc89e974fa481a','Executable',0),
  ('6602fd06a8fc89e974fa483a','6602fd06a8fc89e974fa481a','Interactive',5),
  ('6602fd06a8fc89e974fa4844','6602fd06a8fc89e974fa481a','Interactive',6),
  ('6602fd06a8fc89e974fa484a','6602fd06a8fc89e974fa481a','Executable',0),
  ('6602fd06a8fc89e974fa484b','6602fd06a8fc89e974fa481a','Interactive',8),
  ('6602fd06a8fc89e974fa4855','6602fd06a8fc89e974fa481a','Executable',0),
  ('6602fd06a8fc89e974fa4856','6602fd06a8fc89e974fa481a','Interactive',10),
  ('6602fd06a8fc89e974fa485d','6602fd06a8fc89e974fa485c','Executable',0),
  ('6602fd06a8fc89e974fa485e','6602fd06a8fc89e974fa485c','Interactive',1),
  ('6602fd06a8fc89e974fa4868','6602fd06a8fc89e974fa485c','Interactive',2),
  ('6602fd06a8fc89e974fa486e','6602fd06a8fc89e974fa485c','Interactive',3),
  ('6602fd06a8fc89e974fa4876','6602fd06a8fc89e974fa485c','Interactive',4),
  ('6602fd06a8fc89e974fa4880','6602fd06a8fc89e974fa485c','Interactive',5),
  ('6602fd06a8fc89e974fa4886','6602fd06a8fc89e974fa485c','Interactive',6),
  ('6602fd06a8fc89e974fa488c','6602fd06a8fc89e974fa485c','Executable',0),
  ('6602fd06a8fc89e974fa488d','6602fd06a8fc89e974fa485c','Interactive',8),
  ('6602fd06a8fc89e974fa4895','6602fd06a8fc89e974fa485c','Interactive',9),
  ('6602fd06a8fc89e974fa489c','6602fd06a8fc89e974fa489b','Interactive',0),
  ('6602fd06a8fc89e974fa48a6','6602fd06a8fc89e974fa489b','Executable',0),
  ('6602fd06a8fc89e974fa48a7','6602fd06a8fc89e974fa489b','Interactive',2),
  ('6602fd06a8fc89e974fa48b1','6602fd06a8fc89e974fa489b','Interactive',3),
  ('6602fd06a8fc89e974fa48b9','6602fd06a8fc89e974fa489b','Interactive',4),
  ('6602fd06a8fc89e974fa48c3','6602fd06a8fc89e974fa489b','Interactive',5),
  ('6602fd06a8fc89e974fa48c9','6602fd06a8fc89e974fa489b','Interactive',6),
  ('6602fd06a8fc89e974fa48d3','6602fd06a8fc89e974fa489b','Executable',0),
  ('6602fd06a8fc89e974fa48d4','6602fd06a8fc89e974fa489b','Interactive',8),
  ('6602fd06a8fc89e974fa48e0','6602fd06a8fc89e974fa48df','Executable',0),
  ('6602fd06a8fc89e974fa48e2','6602fd06a8fc89e974fa48e1','Executable',0),
  ('6602fd06a8fc89e974fa48e4','6602fd06a8fc89e974fa48e3','Executable',0),
  ('6602fd62666d4ea088040bd6','6602fd62666d4ea088040bd5','Interactive',0),
  ('6602fd62666d4ea088040bda','6602fd62666d4ea088040bd5','Interactive',1),
  ('6602fd62666d4ea088040bde','6602fd62666d4ea088040bd5','Interactive',2),
  ('6602fd62666d4ea088040be4','6602fd62666d4ea088040bd5','Interactive',3),
  ('6602fd62666d4ea088040bea','6602fd62666d4ea088040bd5','Interactive',4),
  ('6602fd62666d4ea088040bf0','6602fd62666d4ea088040bd5','Interactive',5),
  ('6602fd62666d4ea088040bf6','6602fd62666d4ea088040bd5','Interactive',6),
  ('6602fd62666d4ea088040bfe','6602fd62666d4ea088040bd5','Interactive',7),
  ('6602fd62666d4ea088040c04','6602fd62666d4ea088040bd5','Interactive',8),
  ('6602fd62666d4ea088040c0a','6602fd62666d4ea088040bd5','Interactive',9),
  ('6602fd62666d4ea088040c10','6602fd62666d4ea088040bd5','Interactive',10),
  ('6602fd62666d4ea088040c16','6602fd62666d4ea088040bd5','Interactive',11),
  ('6602fd62666d4ea088040c1e','6602fd62666d4ea088040bd5','Interactive',12),
  ('6602fd62666d4ea088040c25','6602fd62666d4ea088040bd5','Interactive',13),
  ('6602fd62666d4ea088040c2c','6602fd62666d4ea088040c2b','Interactive',0),
  ('6602fd62666d4ea088040c32','6602fd62666d4ea088040c2b','Interactive',1),
  ('6602fd62666d4ea088040c39','6602fd62666d4ea088040c2b','Interactive',2),
  ('6602fd62666d4ea088040c3f','6602fd62666d4ea088040c2b','Interactive',3),
  ('6602fd62666d4ea088040c46','6602fd62666d4ea088040c2b','Interactive',4),
  ('6602fd62666d4ea088040c4e','6602fd62666d4ea088040c2b','Interactive',5),
  ('6602fd62666d4ea088040c56','6602fd62666d4ea088040c2b','Interactive',6),
  ('6602fd62666d4ea088040c5c','6602fd62666d4ea088040c2b','Interactive',7),
  ('6602fd62666d4ea088040c64','6602fd62666d4ea088040c2b','Interactive',8),
  ('6602fd62666d4ea088040c6c','6602fd62666d4ea088040c2b','Interactive',9),
  ('6602fd62666d4ea088040c74','6602fd62666d4ea088040c2b','Interactive',10),
  ('6602fd62666d4ea088040c7d','6602fd62666d4ea088040c2b','Interactive',11),
  ('6602fd62666d4ea088040c85','6602fd62666d4ea088040c2b','Interactive',12),
  ('6602fd62666d4ea088040c8c','6602fd62666d4ea088040c8b','Interactive',0),
  ('6602fd62666d4ea088040c8e','6602fd62666d4ea088040c8b','Interactive',1),
  ('6602fd62666d4ea088040c95','6602fd62666d4ea088040c8b','Interactive',2),
  ('6602fd62666d4ea088040c99','6602fd62666d4ea088040c8b','Interactive',3),
  ('6602fd62666d4ea088040c9f','6602fd62666d4ea088040c8b','Interactive',4),
  ('6602fd62666d4ea088040ca6','6602fd62666d4ea088040c8b','Interactive',5),
  ('6602fd62666d4ea088040cad','6602fd62666d4ea088040c8b','Interactive',6),
  ('6602fd62666d4ea088040cb3','6602fd62666d4ea088040c8b','Interactive',7),
  ('6602fd62666d4ea088040cb9','6602fd62666d4ea088040c8b','Interactive',8),
  ('6602fd62666d4ea088040cbf','6602fd62666d4ea088040c8b','Interactive',9),
  ('6602fd62666d4ea088040cc5','6602fd62666d4ea088040c8b','Interactive',10),
  ('6602fd62666d4ea088040ccb','6602fd62666d4ea088040c8b','Interactive',11),
  ('6602fd62666d4ea088040cd1','6602fd62666d4ea088040c8b','Interactive',12),
  ('6602fd62666d4ea088040cd7','6602fd62666d4ea088040c8b','Interactive',13),
  ('6602fd62666d4ea088040cde','6602fd62666d4ea088040cdd','Interactive',0),
  ('6602fd62666d4ea088040ce2','6602fd62666d4ea088040cdd','Interactive',1),
  ('6602fd62666d4ea088040ceb','6602fd62666d4ea088040cdd','Interactive',2),
  ('6602fd62666d4ea088040cf1','6602fd62666d4ea088040cdd','Interactive',3),
  ('6602fd62666d4ea088040cf8','6602fd62666d4ea088040cdd','Interactive',4),
  ('6602fd62666d4ea088040cfe','6602fd62666d4ea088040cdd','Interactive',5),
  ('6602fd62666d4ea088040d04','6602fd62666d4ea088040cdd','Interactive',6),
  ('6602fd62666d4ea088040d0a','6602fd62666d4ea088040cdd','Interactive',7),
  ('6602fd62666d4ea088040d10','6602fd62666d4ea088040cdd','Interactive',8),
  ('6602fd62666d4ea088040d16','6602fd62666d4ea088040cdd','Interactive',9),
  ('6602fd62666d4ea088040d1e','6602fd62666d4ea088040cdd','Interactive',10),
  ('6602fd62666d4ea088040d25','6602fd62666d4ea088040cdd','Interactive',11),
  ('6602fd62666d4ea088040d2f','6602fd62666d4ea088040cdd','Interactive',12),
  ('6602fd62666d4ea088040d35','6602fd62666d4ea088040cdd','Interactive',13),
  ('6602fd62666d4ea088040d3d','6602fd62666d4ea088040d3c','Interactive',0),
  ('6602fd62666d4ea088040d44','6602fd62666d4ea088040d3c','Interactive',1),
  ('6602fd63666d4ea088040d4d','6602fd62666d4ea088040d3c','Interactive',2),
  ('6602fd63666d4ea088040d54','6602fd62666d4ea088040d3c','Interactive',3),
  ('6602fd63666d4ea088040d5c','6602fd62666d4ea088040d3c','Interactive',4),
  ('6602fd63666d4ea088040d62','6602fd62666d4ea088040d3c','Interactive',5),
  ('6602fd63666d4ea088040d6a','6602fd62666d4ea088040d3c','Interactive',6),
  ('6602fd63666d4ea088040d72','6602fd62666d4ea088040d3c','Interactive',7),
  ('6602fd63666d4ea088040d7a','6602fd62666d4ea088040d3c','Interactive',8),
  ('6602fd63666d4ea088040d80','6602fd62666d4ea088040d3c','Interactive',9),
  ('6602fd63666d4ea088040d89','6602fd62666d4ea088040d3c','Interactive',10),
  ('6602fd63666d4ea088040d92','6602fd62666d4ea088040d3c','Interactive',11),
  ('6602fd63666d4ea088040d99','6602fd63666d4ea088040d98','Interactive',0),
  ('6602fd63666d4ea088040da0','6602fd63666d4ea088040d98','Interactive',1),
  ('6602fd63666d4ea088040da9','6602fd63666d4ea088040d98','Interactive',2),
  ('6602fd63666d4ea088040db2','6602fd63666d4ea088040d98','Interactive',3),
  ('6602fd63666d4ea088040dbb','6602fd63666d4ea088040d98','Interactive',4),
  ('6602fd63666d4ea088040dc5','6602fd63666d4ea088040d98','Interactive',5),
  ('6602fd63666d4ea088040dcd','6602fd63666d4ea088040d98','Interactive',6),
  ('6602fd63666d4ea088040dd5','6602fd63666d4ea088040d98','Interactive',7),
  ('6602fd63666d4ea088040ddd','6602fd63666d4ea088040d98','Interactive',8),
  ('6602fd63666d4ea088040de5','6602fd63666d4ea088040d98','Interactive',9),
  ('6602fd63666d4ea088040deb','6602fd63666d4ea088040d98','Interactive',10),
  ('6602fd63666d4ea088040df5','6602fd63666d4ea088040d98','Interactive',11),
  ('6602fd63666d4ea088040dfd','6602fd63666d4ea088040d98','Interactive',12),
  ('6602fd63666d4ea088040e04','6602fd63666d4ea088040e03','Interactive',0),
  ('6602fd63666d4ea088040e0a','6602fd63666d4ea088040e03','Interactive',1),
  ('6602fd63666d4ea088040e14','6602fd63666d4ea088040e03','Interactive',2),
  ('6602fd63666d4ea088040e1c','6602fd63666d4ea088040e03','Interactive',3),
  ('6602fd63666d4ea088040e23','6602fd63666d4ea088040e03','Interactive',4),
  ('6602fd63666d4ea088040e2b','6602fd63666d4ea088040e03','Interactive',5),
  ('6602fd63666d4ea088040e34','6602fd63666d4ea088040e03','Interactive',6),
  ('6602fd63666d4ea088040e3c','6602fd63666d4ea088040e03','Interactive',7),
  ('6602fd63666d4ea088040e44','6602fd63666d4ea088040e03','Interactive',8),
  ('6602fd63666d4ea088040e4c','6602fd63666d4ea088040e03','Interactive',9),
  ('6602fd63666d4ea088040e54','6602fd63666d4ea088040e03','Interactive',10),
  ('6602fd63666d4ea088040e5b','6602fd63666d4ea088040e03','Interactive',11),
  ('6602fd63666d4ea088040e61','6602fd63666d4ea088040e03','Interactive',12),
  ('6602fd63666d4ea088040e69','6602fd63666d4ea088040e03','Interactive',13),
  ('6602fd63666d4ea088040e71','6602fd63666d4ea088040e70','Interactive',0),
  ('6602fd63666d4ea088040e75','6602fd63666d4ea088040e70','Interactive',1),
  ('6602fd63666d4ea088040e7c','6602fd63666d4ea088040e70','Interactive',2),
  ('6602fd63666d4ea088040e84','6602fd63666d4ea088040e70','Interactive',3),
  ('6602fd63666d4ea088040e87','6602fd63666d4ea088040e70','Interactive',4),
  ('6602fd63666d4ea088040e8e','6602fd63666d4ea088040e70','Interactive',5),
  ('6602fd63666d4ea088040e94','6602fd63666d4ea088040e70','Interactive',6),
  ('6602fd63666d4ea088040e9c','6602fd63666d4ea088040e70','Interactive',7),
  ('6602fd63666d4ea088040ea2','6602fd63666d4ea088040e70','Interactive',8),
  ('6602fd63666d4ea088040ea8','6602fd63666d4ea088040e70','Interactive',9),
  ('6602fd63666d4ea088040eb3','6602fd63666d4ea088040e70','Interactive',10),
  ('6602fd63666d4ea088040ebb','6602fd63666d4ea088040e70','Interactive',11),
  ('6602fd63666d4ea088040ec2','6602fd63666d4ea088040e70','Interactive',12),
  ('6602fd63666d4ea088040ec9','6602fd63666d4ea088040ec8','Interactive',0),
  ('6602fd63666d4ea088040ecd','6602fd63666d4ea088040ec8','Interactive',1),
  ('6602fd63666d4ea088040ed5','6602fd63666d4ea088040ec8','Interactive',2),
  ('6602fd63666d4ea088040edc','6602fd63666d4ea088040ec8','Interactive',3),
  ('6602fd63666d4ea088040ee3','6602fd63666d4ea088040ec8','Interactive',4),
  ('6602fd63666d4ea088040eed','6602fd63666d4ea088040ec8','Interactive',5),
  ('6602fd63666d4ea088040ef3','6602fd63666d4ea088040ec8','Interactive',6),
  ('6602fd63666d4ea088040efb','6602fd63666d4ea088040ec8','Interactive',7),
  ('6602fd63666d4ea088040f01','6602fd63666d4ea088040ec8','Interactive',8),
  ('6602fd63666d4ea088040f09','6602fd63666d4ea088040ec8','Interactive',9),
  ('6602fd63666d4ea088040f10','6602fd63666d4ea088040ec8','Interactive',10),
  ('6602fd63666d4ea088040f16','6602fd63666d4ea088040ec8','Interactive',11),
  ('6602fd63666d4ea088040f1e','6602fd63666d4ea088040ec8','Interactive',12),
  ('6602fd63666d4ea088040f26','6602fd63666d4ea088040f25','Interactive',0),
  ('6602fd63666d4ea088040f2b','6602fd63666d4ea088040f25','Interactive',1),
  ('6602fd63666d4ea088040f32','6602fd63666d4ea088040f25','Interactive',2),
  ('6602fd63666d4ea088040f35','6602fd63666d4ea088040f25','Interactive',3),
  ('6602fd63666d4ea088040f3d','6602fd63666d4ea088040f25','Interactive',4),
  ('6602fd63666d4ea088040f44','6602fd63666d4ea088040f25','Interactive',5),
  ('6602fd63666d4ea088040f4a','6602fd63666d4ea088040f25','Interactive',6),
  ('6602fd63666d4ea088040f52','6602fd63666d4ea088040f25','Interactive',7),
  ('6602fd63666d4ea088040f58','6602fd63666d4ea088040f25','Interactive',8),
  ('6602fd63666d4ea088040f60','6602fd63666d4ea088040f25','Interactive',9),
  ('6602fd63666d4ea088040f69','6602fd63666d4ea088040f25','Interactive',10),
  ('6602fd63666d4ea088040f6f','6602fd63666d4ea088040f25','Interactive',11),
  ('6602fd63666d4ea088040f75','6602fd63666d4ea088040f25','Interactive',12),
  ('6602fd63666d4ea088040f7c','6602fd63666d4ea088040f7b','Interactive',0),
  ('6602fd63666d4ea088040f82','6602fd63666d4ea088040f7b','Interactive',1),
  ('6602fd63666d4ea088040f8a','6602fd63666d4ea088040f7b','Interactive',2),
  ('6602fd63666d4ea088040f91','6602fd63666d4ea088040f7b','Interactive',3),
  ('6602fd63666d4ea088040f98','6602fd63666d4ea088040f7b','Interactive',4),
  ('6602fd63666d4ea088040fa0','6602fd63666d4ea088040f7b','Interactive',5),
  ('6602fd63666d4ea088040fa8','6602fd63666d4ea088040f7b','Interactive',6),
  ('6602fd63666d4ea088040fb0','6602fd63666d4ea088040f7b','Interactive',7),
  ('6602fd63666d4ea088040fb8','6602fd63666d4ea088040f7b','Interactive',8),
  ('6602fd63666d4ea088040fbe','6602fd63666d4ea088040f7b','Interactive',9),
  ('6602fd63666d4ea088040fc6','6602fd63666d4ea088040f7b','Interactive',10),
  ('6602fd63666d4ea088040fcc','6602fd63666d4ea088040f7b','Interactive',11),
  ('6602fd63666d4ea088040fd4','6602fd63666d4ea088040fd3','Interactive',0),
  ('6602fd63666d4ea088040fdb','6602fd63666d4ea088040fd3','Interactive',1),
  ('6602fd63666d4ea088040fe4','6602fd63666d4ea088040fd3','Interactive',2),
  ('6602fd63666d4ea088040fea','6602fd63666d4ea088040fd3','Interactive',3),
  ('6602fd63666d4ea088040ff3','6602fd63666d4ea088040fd3','Interactive',4),
  ('6602fd63666d4ea088040ffc','6602fd63666d4ea088040fd3','Interactive',5),
  ('6602fd63666d4ea088041005','6602fd63666d4ea088040fd3','Interactive',6),
  ('6602fd63666d4ea08804100d','6602fd63666d4ea088040fd3','Interactive',7),
  ('6602fd63666d4ea088041013','6602fd63666d4ea088040fd3','Interactive',8),
  ('6602fd63666d4ea08804101b','6602fd63666d4ea088040fd3','Interactive',9),
  ('6602fd63666d4ea088041024','6602fd63666d4ea088040fd3','Interactive',10),
  ('6602fd63666d4ea08804102b','6602fd63666d4ea088040fd3','Interactive',11),
  ('6602fd63666d4ea088041032','6602fd63666d4ea088040fd3','Interactive',12),
  ('6602fd63666d4ea088041038','6602fd63666d4ea088040fd3','Interactive',13),
  ('6602fd63666d4ea08804103e','6602fd63666d4ea088040fd3','Interactive',14),
  ('6602fd63666d4ea088041044','6602fd63666d4ea088040fd3','Interactive',15),
  ('6602fd63666d4ea08804104b','6602fd63666d4ea088040fd3','Interactive',16),
  ('6602fd63666d4ea088041052','6602fd63666d4ea088040fd3','Interactive',17),
  ('6602fd63666d4ea08804105b','6602fd63666d4ea088040fd3','Interactive',18),
  ('6602fd63666d4ea088041061','6602fd63666d4ea088040fd3','Interactive',19),
  ('6602fd63666d4ea08804106b','6602fd63666d4ea08804106a','Executable',0),
  ('6602fd63666d4ea08804106c','6602fd63666d4ea08804106a','Executable',0),
  ('6602fd63666d4ea08804106d','6602fd63666d4ea08804106a','Executable',0),
  ('6602fd63666d4ea08804106e','6602fd63666d4ea08804106a','Executable',0),
  ('6602fd63666d4ea08804106f','6602fd63666d4ea08804106a','Executable',0),
  ('6602fd63666d4ea088041070','6602fd63666d4ea08804106a','Executable',0),
  ('6602fd63666d4ea088041071','6602fd63666d4ea08804106a','Executable',0),
  ('6602fd63666d4ea088041072','6602fd63666d4ea08804106a','Executable',0),
  ('6602fd63666d4ea088041073','6602fd63666d4ea08804106a','Executable',0),
  ('6602fd63666d4ea088041074','6602fd63666d4ea08804106a','Executable',0),
  ('6602fd63666d4ea088041076','6602fd63666d4ea088041075','Executable',0),
  ('6602fd63666d4ea088041077','6602fd63666d4ea088041075','Executable',0),
  ('6602fd63666d4ea088041078','6602fd63666d4ea088041075','Executable',0),
  ('6602fd63666d4ea088041079','6602fd63666d4ea088041075','Executable',0),
  ('6602fd63666d4ea08804107a','6602fd63666d4ea088041075','Executable',0),
  ('6602fd63666d4ea08804107b','6602fd63666d4ea088041075','Executable',0),
  ('6602fd63666d4ea08804107c','6602fd63666d4ea088041075','Executable',0),
  ('6602fd63666d4ea08804107d','6602fd63666d4ea088041075','Executable',0),
  ('6602fd63666d4ea08804107f','6602fd63666d4ea08804107e','Executable',0),
  ('6602fd63666d4ea088041080','6602fd63666d4ea08804107e','Executable',0),
  ('6602fd63666d4ea088041081','6602fd63666d4ea08804107e','Executable',0),
  ('6602fd63666d4ea088041082','6602fd63666d4ea08804107e','Executable',0),
  ('6602fd63666d4ea088041083','6602fd63666d4ea08804107e','Executable',0),
  ('6602fd63666d4ea088041084','6602fd63666d4ea08804107e','Executable',0),
  ('6602fd63666d4ea088041085','6602fd63666d4ea08804107e','Executable',0),
  ('6602fd63666d4ea088041086','6602fd63666d4ea08804107e','Executable',0),
  ('6602fd63666d4ea088041087','6602fd63666d4ea08804107e','Executable',0),
  ('6602fd63666d4ea088041088','6602fd63666d4ea08804107e','Executable',0),
  ('6602fd63666d4ea08804108a','6602fd63666d4ea088041089','Executable',0),
  ('6602fd63666d4ea08804108b','6602fd63666d4ea088041089','Executable',0),
  ('6602fd63666d4ea08804108c','6602fd63666d4ea088041089','Executable',0),
  ('6602fd63666d4ea08804108d','6602fd63666d4ea088041089','Executable',0),
  ('6602fd63666d4ea08804108e','6602fd63666d4ea088041089','Executable',0),
  ('6602fd63666d4ea08804108f','6602fd63666d4ea088041089','Executable',0),
  ('6602fd63666d4ea088041090','6602fd63666d4ea088041089','Executable',0),
  ('6602fd63666d4ea088041091','6602fd63666d4ea088041089','Executable',0),
  ('6602fd63666d4ea088041092','6602fd63666d4ea088041089','Executable',0),
  ('6602fd63666d4ea088041093','6602fd63666d4ea088041089','Executable',0),
  ('6602fd63666d4ea088041094','6602fd63666d4ea088041089','Executable',0),
  ('6602fd63666d4ea088041097','6602fd63666d4ea088041096','Executable',0),
  ('6602fd63666d4ea088041099','6602fd63666d4ea088041098','Executable',0),
  ('6602fd63666d4ea08804109b','6602fd63666d4ea08804109a','Executable',0),
  ('6602fd63666d4ea08804109f','6602fd63666d4ea08804109e','Interactive',0),
  ('6602fd63666d4ea0880410a2','6602fd63666d4ea08804109e','Interactive',1),
  ('6602fd63666d4ea0880410a8','6602fd63666d4ea08804109e','Interactive',2),
  ('6602fd63666d4ea0880410b0','6602fd63666d4ea08804109e','Interactive',3),
  ('6602fd63666d4ea0880410b7','6602fd63666d4ea08804109e','Interactive',4),
  ('6602fd63666d4ea0880410bd','6602fd63666d4ea08804109e','Interactive',5),
  ('6602fd63666d4ea0880410c3','6602fd63666d4ea08804109e','Interactive',6),
  ('6602fd63666d4ea0880410c9','6602fd63666d4ea08804109e','Interactive',7),
  ('6602fd63666d4ea0880410d1','6602fd63666d4ea08804109e','Interactive',8),
  ('6602fd63666d4ea0880410d9','6602fd63666d4ea08804109e','Interactive',9),
  ('6602fd63666d4ea0880410e1','6602fd63666d4ea08804109e','Interactive',10),
  ('6602fd63666d4ea0880410e7','6602fd63666d4ea08804109e','Interactive',11),
  ('6602fd63666d4ea0880410ed','6602fd63666d4ea08804109e','Interactive',12),
  ('6602fd63666d4ea0880410f4','6602fd63666d4ea0880410f3','Interactive',0),
  ('6602fd63666d4ea0880410fa','6602fd63666d4ea0880410f3','Interactive',1),
  ('6602fd63666d4ea088041102','6602fd63666d4ea0880410f3','Interactive',2),
  ('6602fd63666d4ea088041108','6602fd63666d4ea0880410f3','Interactive',3),
  ('6602fd63666d4ea08804110e','6602fd63666d4ea0880410f3','Interactive',4),
  ('6602fd63666d4ea088041116','6602fd63666d4ea0880410f3','Interactive',5),
  ('6602fd63666d4ea08804111c','6602fd63666d4ea0880410f3','Interactive',6),
  ('6602fd63666d4ea088041122','6602fd63666d4ea0880410f3','Interactive',7),
  ('6602fd63666d4ea088041128','6602fd63666d4ea0880410f3','Interactive',8),
  ('6602fd63666d4ea088041130','6602fd63666d4ea0880410f3','Interactive',9),
  ('6602fd63666d4ea088041136','6602fd63666d4ea0880410f3','Interactive',10),
  ('6602fd63666d4ea08804113d','6602fd63666d4ea0880410f3','Interactive',11),
  ('6602fd63666d4ea088041145','6602fd63666d4ea0880410f3','Interactive',12),
  ('6602fd63666d4ea08804114d','6602fd63666d4ea08804114c','Interactive',0),
  ('6602fd63666d4ea088041150','6602fd63666d4ea08804114c','Interactive',1),
  ('6602fd63666d4ea088041156','6602fd63666d4ea08804114c','Interactive',2),
  ('6602fd63666d4ea08804115e','6602fd63666d4ea08804114c','Interactive',3),
  ('6602fd63666d4ea088041165','6602fd63666d4ea08804114c','Interactive',4),
  ('6602fd63666d4ea08804116d','6602fd63666d4ea08804114c','Interactive',5),
  ('6602fd63666d4ea088041173','6602fd63666d4ea08804114c','Interactive',6),
  ('6602fd63666d4ea088041179','6602fd63666d4ea08804114c','Interactive',7),
  ('6602fd63666d4ea088041181','6602fd63666d4ea08804114c','Interactive',8),
  ('6602fd63666d4ea088041187','6602fd63666d4ea08804114c','Interactive',9),
  ('6602fd63666d4ea08804118d','6602fd63666d4ea08804114c','Interactive',10),
  ('6602fd63666d4ea088041193','6602fd63666d4ea08804114c','Interactive',11),
  ('6602fd63666d4ea088041199','6602fd63666d4ea08804114c','Interactive',12),
  ('6602fd63666d4ea0880411a0','6602fd63666d4ea08804119f','Interactive',0),
  ('6602fd63666d4ea0880411a6','6602fd63666d4ea08804119f','Interactive',1),
  ('6602fd63666d4ea0880411ae','6602fd63666d4ea08804119f','Interactive',2),
  ('6602fd63666d4ea0880411b2','6602fd63666d4ea08804119f','Interactive',3),
  ('6602fd63666d4ea0880411b8','6602fd63666d4ea08804119f','Interactive',4),
  ('6602fd63666d4ea0880411be','6602fd63666d4ea08804119f','Interactive',5),
  ('6602fd63666d4ea0880411c4','6602fd63666d4ea08804119f','Interactive',6),
  ('6602fd63666d4ea0880411cc','6602fd63666d4ea08804119f','Interactive',7),
  ('6602fd63666d4ea0880411d2','6602fd63666d4ea08804119f','Interactive',8),
  ('6602fd63666d4ea0880411d8','6602fd63666d4ea08804119f','Interactive',9),
  ('6602fd63666d4ea0880411de','6602fd63666d4ea08804119f','Interactive',10),
  ('6602fd63666d4ea0880411e4','6602fd63666d4ea08804119f','Interactive',11),
  ('6602fd63666d4ea0880411ec','6602fd63666d4ea0880411eb','Interactive',0),
  ('6602fd63666d4ea0880411ef','6602fd63666d4ea0880411eb','Interactive',1),
  ('6602fd63666d4ea0880411f5','6602fd63666d4ea0880411eb','Interactive',2),
  ('6602fd63666d4ea0880411fb','6602fd63666d4ea0880411eb','Interactive',3),
  ('6602fd63666d4ea088041201','6602fd63666d4ea0880411eb','Interactive',4),
  ('6602fd63666d4ea088041208','6602fd63666d4ea0880411eb','Interactive',5),
  ('6602fd63666d4ea08804120e','6602fd63666d4ea0880411eb','Interactive',6),
  ('6602fd63666d4ea088041214','6602fd63666d4ea0880411eb','Interactive',7),
  ('6602fd63666d4ea08804121a','6602fd63666d4ea0880411eb','Interactive',8),
  ('6602fd63666d4ea088041220','6602fd63666d4ea0880411eb','Interactive',9),
  ('6602fd63666d4ea088041226','6602fd63666d4ea0880411eb','Interactive',10),
  ('6602fd63666d4ea08804122e','6602fd63666d4ea0880411eb','Interactive',11),
  ('6602fd63666d4ea088041234','6602fd63666d4ea0880411eb','Interactive',12),
  ('6602fd63666d4ea08804123b','6602fd63666d4ea0880411eb','Interactive',13),
  ('6602fd63666d4ea088041241','6602fd63666d4ea0880411eb','Interactive',14),
  ('6602fd63666d4ea08804124b','6602fd63666d4ea08804124a','Interactive',0),
  ('6602fd63666d4ea088041252','6602fd63666d4ea08804124a','Interactive',1),
  ('6602fd63666d4ea088041259','6602fd63666d4ea08804124a','Interactive',2),
  ('6602fd63666d4ea08804125f','6602fd63666d4ea08804124a','Interactive',3),
  ('6602fd63666d4ea088041265','6602fd63666d4ea08804124a','Interactive',4),
  ('6602fd63666d4ea08804126c','6602fd63666d4ea08804124a','Interactive',5),
  ('6602fd63666d4ea088041272','6602fd63666d4ea08804124a','Interactive',6),
  ('6602fd63666d4ea088041278','6602fd63666d4ea08804124a','Interactive',7),
  ('6602fd63666d4ea08804127e','6602fd63666d4ea08804124a','Interactive',8),
  ('6602fd63666d4ea088041286','6602fd63666d4ea08804124a','Interactive',9),
  ('6602fd63666d4ea08804128e','6602fd63666d4ea08804124a','Interactive',10),
  ('6602fd63666d4ea088041294','6602fd63666d4ea08804124a','Interactive',11),
  ('6602fd63666d4ea08804129c','6602fd63666d4ea08804124a','Interactive',12),
  ('6602fd63666d4ea0880412a2','6602fd63666d4ea08804124a','Interactive',13),
  ('6602fd63666d4ea0880412a9','6602fd63666d4ea08804124a','Interactive',14),
  ('6602fd63666d4ea0880412b0','6602fd63666d4ea08804124a','Interactive',15),
  ('6602fd63666d4ea0880412b8','6602fd63666d4ea08804124a','Interactive',16),
  ('6602fd63666d4ea0880412bf','6602fd63666d4ea08804124a','Interactive',17),
  ('6602fd63666d4ea0880412c7','6602fd63666d4ea0880412c6','Interactive',0),
  ('6602fd63666d4ea0880412cb','6602fd63666d4ea0880412c6','Interactive',1),
  ('6602fd63666d4ea0880412ce','6602fd63666d4ea0880412c6','Interactive',2),
  ('6602fd63666d4ea0880412d4','6602fd63666d4ea0880412c6','Interactive',3),
  ('6602fd63666d4ea0880412da','6602fd63666d4ea0880412c6','Interactive',4),
  ('6602fd63666d4ea0880412e2','6602fd63666d4ea0880412c6','Interactive',5),
  ('6602fd63666d4ea0880412ea','6602fd63666d4ea0880412c6','Interactive',6),
  ('6602fd63666d4ea0880412f0','6602fd63666d4ea0880412c6','Interactive',7),
  ('6602fd63666d4ea0880412f8','6602fd63666d4ea0880412c6','Interactive',8),
  ('6602fd63666d4ea0880412fe','6602fd63666d4ea0880412c6','Interactive',9),
  ('6602fd63666d4ea088041306','6602fd63666d4ea0880412c6','Interactive',10),
  ('6602fd63666d4ea08804130c','6602fd63666d4ea0880412c6','Interactive',11),
  ('6602fd63666d4ea088041313','6602fd63666d4ea0880412c6','Interactive',12),
  ('6602fd63666d4ea08804131b','6602fd63666d4ea0880412c6','Interactive',13),
  ('6602fd63666d4ea088041322','6602fd63666d4ea088041321','Interactive',0),
  ('6602fd63666d4ea088041325','6602fd63666d4ea088041321','Interactive',1),
  ('6602fd63666d4ea088041328','6602fd63666d4ea088041321','Interactive',2),
  ('6602fd63666d4ea08804132e','6602fd63666d4ea088041321','Interactive',3),
  ('6602fd63666d4ea088041334','6602fd63666d4ea088041321','Interactive',4),
  ('6602fd63666d4ea08804133a','6602fd63666d4ea088041321','Interactive',5),
  ('6602fd63666d4ea088041342','6602fd63666d4ea088041321','Interactive',6),
  ('6602fd63666d4ea088041348','6602fd63666d4ea088041321','Interactive',7),
  ('6602fd63666d4ea08804134e','6602fd63666d4ea088041321','Interactive',8),
  ('6602fd63666d4ea088041356','6602fd63666d4ea088041321','Interactive',9),
  ('6602fd63666d4ea08804135c','6602fd63666d4ea088041321','Interactive',10),
  ('6602fd63666d4ea088041362','6602fd63666d4ea088041321','Interactive',11),
  ('6602fd63666d4ea08804136a','6602fd63666d4ea088041321','Interactive',12),
  ('6602fd63666d4ea088041371','6602fd63666d4ea088041321','Interactive',13),
  ('6602fd63666d4ea088041377','6602fd63666d4ea088041321','Interactive',14),
  ('6602fd63666d4ea08804137d','6602fd63666d4ea088041321','Interactive',15),
  ('6602fd63666d4ea088041384','6602fd63666d4ea088041321','Interactive',16),
  ('6602fd63666d4ea08804138d','6602fd63666d4ea08804138c','Interactive',0),
  ('6602fd63666d4ea088041394','6602fd63666d4ea08804138c','Interactive',1),
  ('6602fd63666d4ea08804139b','6602fd63666d4ea08804138c','Interactive',2),
  ('6602fd63666d4ea0880413a4','6602fd63666d4ea08804138c','Interactive',3),
  ('6602fd63666d4ea0880413aa','6602fd63666d4ea08804138c','Interactive',4),
  ('6602fd63666d4ea0880413b0','6602fd63666d4ea08804138c','Interactive',5),
  ('6602fd63666d4ea0880413b9','6602fd63666d4ea08804138c','Interactive',6),
  ('6602fd63666d4ea0880413bf','6602fd63666d4ea08804138c','Interactive',7),
  ('6602fd63666d4ea0880413c6','6602fd63666d4ea08804138c','Interactive',8),
  ('6602fd63666d4ea0880413cc','6602fd63666d4ea08804138c','Interactive',9),
  ('6602fd63666d4ea0880413d5','6602fd63666d4ea08804138c','Interactive',10),
  ('6602fd63666d4ea0880413de','6602fd63666d4ea08804138c','Interactive',11),
  ('6602fd63666d4ea0880413e6','6602fd63666d4ea08804138c','Interactive',12),
  ('6602fd63666d4ea0880413ef','6602fd63666d4ea08804138c','Interactive',13),
  ('6602fd63666d4ea0880413f7','6602fd63666d4ea08804138c','Interactive',14),
  ('6602fd63666d4ea088041400','6602fd63666d4ea08804138c','Interactive',15),
  ('6602fd63666d4ea088041406','6602fd63666d4ea08804138c','Interactive',16),
  ('6602fd63666d4ea08804140d','6602fd63666d4ea08804138c','Interactive',17),
  ('6602fd63666d4ea088041416','6602fd63666d4ea08804138c','Interactive',18),
  ('6602fd63666d4ea08804141e','6602fd63666d4ea08804138c','Interactive',19),
  ('6602fd63666d4ea088041426','6602fd63666d4ea088041425','Executable',0),
  ('6602fd63666d4ea088041427','6602fd63666d4ea088041425','Executable',0),
  ('6602fd63666d4ea088041428','6602fd63666d4ea088041425','Executable',0),
  ('6602fd63666d4ea088041429','6602fd63666d4ea088041425','Executable',0),
  ('6602fd63666d4ea08804142a','6602fd63666d4ea088041425','Executable',0),
  ('6602fd63666d4ea08804142c','6602fd63666d4ea08804142b','Executable',0),
  ('6602fd63666d4ea08804142d','6602fd63666d4ea08804142b','Executable',0),
  ('6602fd63666d4ea08804142e','6602fd63666d4ea08804142b','Executable',0),
  ('6602fd63666d4ea08804142f','6602fd63666d4ea08804142b','Executable',0),
  ('6602fd63666d4ea088041431','6602fd63666d4ea088041430','Executable',0),
  ('6602fd63666d4ea088041432','6602fd63666d4ea088041430','Executable',0),
  ('6602fd63666d4ea088041433','6602fd63666d4ea088041430','Executable',0),
  ('6602fd63666d4ea088041434','6602fd63666d4ea088041430','Executable',0),
  ('6602fd63666d4ea088041435','6602fd63666d4ea088041430','Executable',0),
  ('6602fd63666d4ea088041436','6602fd63666d4ea088041430','Executable',0),
  ('6602fd63666d4ea088041437','6602fd63666d4ea088041430','Executable',0),
  ('6602fd63666d4ea088041438','6602fd63666d4ea088041430','Executable',0),
  ('6602fd63666d4ea088041439','6602fd63666d4ea088041430','Executable',0),
  ('6602fd63666d4ea08804143b','6602fd63666d4ea08804143a','Executable',0),
  ('6602fd63666d4ea08804143c','6602fd63666d4ea08804143a','Executable',0),
  ('6602fd63666d4ea08804143d','6602fd63666d4ea08804143a','Executable',0),
  ('6602fd63666d4ea08804143e','6602fd63666d4ea08804143a','Executable',0),
  ('6602fd63666d4ea08804143f','6602fd63666d4ea08804143a','Executable',0),
  ('6602fd63666d4ea088041440','6602fd63666d4ea08804143a','Executable',0),
  ('6602fd63666d4ea088041441','6602fd63666d4ea08804143a','Executable',0),
  ('6602fd63666d4ea088041442','6602fd63666d4ea08804143a','Executable',0),
  ('6602fd63666d4ea088041445','6602fd63666d4ea088041444','Executable',0),
  ('6602fd63666d4ea088041447','6602fd63666d4ea088041446','Executable',0),
  ('6602fd63666d4ea088041449','6602fd63666d4ea088041448','Executable',0);


INSERT INTO pre_post_interaction_modules ("id","lesson_id","content","content_type","visible_if","output","type")
VALUES
('6602fd05a8fc89e974fa3f2f','6602fd05a8fc89e974fa3f2e','**Python** is a fantastic programming language for beginners and experts alike.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f30','6602fd05a8fc89e974fa3f2e','','image','always','','Pre'),
('6602fd05a8fc89e974fa3f32','6602fd05a8fc89e974fa3f31','It''s the language of choice for many companies and a popular pick for personal projects.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f33','6602fd05a8fc89e974fa3f31','You can use it for automating tasks, getting ahead in work with data analysis, machine learning, and much more!','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f34','6602fd05a8fc89e974fa3f31','','image','always','','Pre'),
('6602fd05a8fc89e974fa3f36','6602fd05a8fc89e974fa3f35','No matter how complex a program is, it begins with a single line of code. This first line is usually a **variable**.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f37','6602fd05a8fc89e974fa3f35','Programs use variables to **remember information**. Like moving boxes, variables have content and names that tell us what''s inside.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f38','6602fd05a8fc89e974fa3f35','','image','always','','Pre'),
('6602fd05a8fc89e974fa3f3a','6602fd05a8fc89e974fa3f39','What do computers use variables for? ','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f3b','6602fd05a8fc89e974fa3f39','To remember information.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f40','6602fd05a8fc89e974fa3f3f','To create a variable, we start by typing its **name**. Variable names need to be single words and, therefore, have no spaces.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f41','6602fd05a8fc89e974fa3f3f','Tap the variable name `city` to get started.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f42','6602fd05a8fc89e974fa3f3f','Make sure to pick `city`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f47','6602fd05a8fc89e974fa3f46','If we want a variable name with multiple words, we use **snake case**. Snake case means using `_` to connect the additional words.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f48','6602fd05a8fc89e974fa3f46','Make sure to pick `_`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f4d','6602fd05a8fc89e974fa3f4c','What''s wrong with this variable name?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f4e','6602fd05a8fc89e974fa3f4c','','codeNone','','','Pre'),
('6602fd05a8fc89e974fa3f50','6602fd05a8fc89e974fa3f4c','There''s a space between the words.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f55','6602fd05a8fc89e974fa3f54','To help us understand what''s inside a variable we pick descriptive names.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f56','6602fd05a8fc89e974fa3f54','Make sure to pick `home_city_province`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f5b','6602fd05a8fc89e974fa3f5a','Pick the most descriptive variable name.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f5c','6602fd05a8fc89e974fa3f5a','Make sure to pick `high_score`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f61','6602fd05a8fc89e974fa3f60','What do we use snake case for?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f62','6602fd05a8fc89e974fa3f60','We use snake case to create variable names with multiple words.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f67','6602fd05a8fc89e974fa3f66','Why do we give variables descriptive names like `city` or `population` instead of `c` or `p`? ','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f68','6602fd05a8fc89e974fa3f66','We give variables descriptive names to help us understand what''s inside them.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f6d','6602fd05a8fc89e974fa3f6c','Add the right symbols to create the snake case variable.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f6e','6602fd05a8fc89e974fa3f6c','Make sure to pick `_`, followed by `_`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f74','6602fd05a8fc89e974fa3f73','Finish naming this variable by typing `request`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f75','6602fd05a8fc89e974fa3f73','Make sure to type `request`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f7b','6602fd05a8fc89e974fa3f7a','Variables can contain all types of values. Let''s take a look at storing text values, like `"Porsche"` here.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f7c','6602fd05a8fc89e974fa3f7a','Make sure to pick `"Porsche"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f81','6602fd05a8fc89e974fa3f80','After creating and naming a variable, we use the `=` sign to store a **value** inside it.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f82','6602fd05a8fc89e974fa3f80','Type `=` to store the value `"Miami"` inside the `city` variable.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f83','6602fd05a8fc89e974fa3f80','Make sure to type `=`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f88','6602fd05a8fc89e974fa3f87','Storing a value in a variable is like putting stuff inside a labeled box. Here, the variable `device_type` stores the value `"apple"`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f89','6602fd05a8fc89e974fa3f87','Make sure to pick `=`, followed by `"apple"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f8f','6602fd05a8fc89e974fa3f8e','The values we''ve been storing, like `"Miami"` are **strings**. String values are text between double quotes.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f90','6602fd05a8fc89e974fa3f8e','Make sure to pick `"`, followed by `"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f96','6602fd05a8fc89e974fa3f95','Strings can contain all sorts of letters and symbols, including spaces, like the value `"Winter is coming."`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f97','6602fd05a8fc89e974fa3f95','Make sure to pick `"`, followed by `Winter is coming.`, and finally `"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3f9e','6602fd05a8fc89e974fa3f9d','What''s the **value** of this variable?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3f9f','6602fd05a8fc89e974fa3f9d','','codeNone','','','Pre'),
('6602fd05a8fc89e974fa3fa1','6602fd05a8fc89e974fa3f9d','Make sure to pick `"Karin"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3fa6','6602fd05a8fc89e974fa3fa5','How do we know a value is a string?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fa7','6602fd05a8fc89e974fa3fa5','It''s a text between double quotes, like `"Amy"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3fac','6602fd05a8fc89e974fa3fab','What''s happening in this code?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fad','6602fd05a8fc89e974fa3fab','','codeNone','','','Pre'),
('6602fd05a8fc89e974fa3faf','6602fd05a8fc89e974fa3fab','The variable `song_name` stores the value `"Hey Ya!"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3fb4','6602fd05a8fc89e974fa3fb3','What''s the name of this variable?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fb5','6602fd05a8fc89e974fa3fb3','','codeNone','','','Pre'),
('6602fd05a8fc89e974fa3fb7','6602fd05a8fc89e974fa3fb3','The variable name is `hobby`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3fbc','6602fd05a8fc89e974fa3fbb','Create a `job` variable and give it the value `"Plumber"`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fbd','6602fd05a8fc89e974fa3fbb','Make sure to pick `job`, followed by `=`, and finally `"Plumber"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3fc4','6602fd05a8fc89e974fa3fc3','Create a `company` variable that stores a string value.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fc5','6602fd05a8fc89e974fa3fc3','Make sure to pick `company`, followed by `=`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3fcb','6602fd05a8fc89e974fa3fca','Give the `job_title` variable a string value. Remember to use double quotes to create strings.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fcc','6602fd05a8fc89e974fa3fca','Make sure to use all options provided in the correct order. `=` followed by `"` , `Analyst` and `"` is the expected order.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3fd4','6602fd05a8fc89e974fa3fd3','Give the `user_agent` variable the string value `"desktop"` by typing `"`, then the text `desktop`, and finally the closing `"`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fd5','6602fd05a8fc89e974fa3fd3','Make sure to type `"desktop"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3fdb','6602fd05a8fc89e974fa3fda','Lines of code are **instructions** for the computer to follow.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fdc','6602fd05a8fc89e974fa3fda','When we run code, we tell the computer to follow the instructions we put together.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fdd','6602fd05a8fc89e974fa3fda','','image','always','','Pre'),
('6602fd05a8fc89e974fa3fdf','6602fd05a8fc89e974fa3fde','The order of the instructions matters because the computer follows the instructions line by line.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fe0','6602fd05a8fc89e974fa3fde','Arrange these lines of code in the correct order, beginning with `step_1`, followed by `step_2`, and finally `step_3`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fe1','6602fd05a8fc89e974fa3fde','Make sure to pick `step_1 = "Collect pants"`, followed by `step_2 = "?"`, and finally `step_3 = "Profit"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3fe8','6602fd05a8fc89e974fa3fe7','With the special instruction `print()`, we tell the computer to display a value in an area called the **console**, also known as the shell.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fe9','6602fd05a8fc89e974fa3fe7','Make sure to pick `"Hello, World!"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3fee','6602fd05a8fc89e974fa3fed','We can use the `print()` instruction as often as we want. The computer displays every value on a new line in the console.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3fef','6602fd05a8fc89e974fa3fed','Make sure to pick `print`, followed by `(`, and finally `)`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3ff6','6602fd05a8fc89e974fa3ff5','We can use `print()` to display variables like `greeting`, too.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3ff7','6602fd05a8fc89e974fa3ff5','Make sure to pick `greeting`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa3ffc','6602fd05a8fc89e974fa3ffb','When we display variables in the console, their values appear instead of their names. If we print `name` here,  it''ll show its value.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa3ffd','6602fd05a8fc89e974fa3ffb','Make sure to pick `name`. We want to display the variable''s value.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4002','6602fd05a8fc89e974fa4001','How do we know `"Hello, World!"` is a string?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4003','6602fd05a8fc89e974fa4001','Strings start and end with double quotes.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4008','6602fd05a8fc89e974fa4007','What''s the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4009','6602fd05a8fc89e974fa4007','The console displays output and is usually underneath the code editor area.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa400e','6602fd05a8fc89e974fa400d','What does the special instruction `print()` do?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa400f','6602fd05a8fc89e974fa400d','The special instruction `print()` displays a value in the console.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4014','6602fd05a8fc89e974fa4013','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4015','6602fd05a8fc89e974fa4013','','codeNone','','B-ball','Pre'),
('6602fd05a8fc89e974fa4017','6602fd05a8fc89e974fa4013','Make sure to pick `B-ball`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa401c','6602fd05a8fc89e974fa401b','Display the value `daily` in the console.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa401d','6602fd05a8fc89e974fa401b','Make sure to pick `print`, followed by `frequency`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4023','6602fd05a8fc89e974fa4022','Add the symbols to display this string value in the console.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4024','6602fd05a8fc89e974fa4022','Make sure to pick `(`, followed by `)`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa402a','6602fd05a8fc89e974fa4029','Display the value of `last_name`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa402b','6602fd05a8fc89e974fa4029','Make sure to pick `print` followed by `(` and then `last_name`, `)`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4033','6602fd05a8fc89e974fa4032','Display the value of the `job` variable.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4034','6602fd05a8fc89e974fa4032','Make sure to type `job`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa403b','6602fd05a8fc89e974fa403a','Variables are called variables because the values they store can change. We can update `status` by using `=` and giving it a new value.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa403c','6602fd05a8fc89e974fa403a','Make sure to pick `=`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4041','6602fd05a8fc89e974fa4040','We can update variables as often as we want. Try it yourself: change the value of `status` to `"New data required"`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4042','6602fd05a8fc89e974fa4040','Make sure to pick `status`, followed by `=`, and finally `"New data required"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4049','6602fd05a8fc89e974fa4048','We can also give variables the values of other variables. Here, we can give the `new_status` variable the value of `default_option`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa404a','6602fd05a8fc89e974fa4048','Make sure to pick `default_option`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa404f','6602fd05a8fc89e974fa404e','When we update a variable, it forgets its previous value. Here, we can display the `status` variable twice and see how its value updates.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4050','6602fd05a8fc89e974fa404e','Make sure to pick `status`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4055','6602fd05a8fc89e974fa4054','Which of these lines of code updates the `status` variable?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4056','6602fd05a8fc89e974fa4054','`status = "Working out"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa405b','6602fd05a8fc89e974fa405a','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa405c','6602fd05a8fc89e974fa405a','','codeNone','','Watching Netflix','Pre'),
('6602fd05a8fc89e974fa405e','6602fd05a8fc89e974fa405a','`Watching Netflix`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4063','6602fd05a8fc89e974fa4062','What''s wrong with this code?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4064','6602fd05a8fc89e974fa4062','','codeNone','','','Pre'),
('6602fd05a8fc89e974fa4066','6602fd05a8fc89e974fa4062','Nothing is wrong with this code.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa406b','6602fd05a8fc89e974fa406a','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa406c','6602fd05a8fc89e974fa406a','','codeNone','','Median','Pre'),
('6602fd05a8fc89e974fa406e','6602fd05a8fc89e974fa406a','Make sure to pick `Median`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4073','6602fd05a8fc89e974fa4072','Change the value in the `temperature` variable to `"100 degrees"`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4074','6602fd05a8fc89e974fa4072','Make sure to pick `temperature`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4079','6602fd05a8fc89e974fa4078','Update the `status` variable to `"Writing code"`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa407a','6602fd05a8fc89e974fa4078','Make sure to pick `status`, followed by `=`, and finally `"Writing code"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4081','6602fd05a8fc89e974fa4080','Update the `currency` variable to `"Dollar"`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4082','6602fd05a8fc89e974fa4080','Make sure to pick `"Dollar"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4087','6602fd05a8fc89e974fa4086','Change the value of the `status` variable to `"Done"`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4088','6602fd05a8fc89e974fa4086','Make sure to type `"Done"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa408e','6602fd05a8fc89e974fa408d','We can add string values together with a `+` sign.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa408f','6602fd05a8fc89e974fa408d','Make sure to pick `+`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4094','6602fd05a8fc89e974fa4093','We call adding string values an **expression** as the output creates a single value.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4095','6602fd05a8fc89e974fa4093','In this example, only one string is the displayed output when we add `"55"` inside `print()`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4096','6602fd05a8fc89e974fa4093','Make sure to pick `+`, followed by `"55"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa409c','6602fd05a8fc89e974fa409b','When expressions contain variables, they use the values in the variables, which we can see when adding `"Followers:"` to `followers`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa409d','6602fd05a8fc89e974fa409b','Make sure to pick `+`, followed by `followers`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40a3','6602fd05a8fc89e974fa40a2','Since expressions become values, we can store them in variables the same way as values.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40a4','6602fd05a8fc89e974fa40a2','See the example here where we''ll code `label` to display the expression.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40a5','6602fd05a8fc89e974fa40a2','Make sure to type `label`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40aa','6602fd05a8fc89e974fa40a9','What''s the value of `label`?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40ab','6602fd05a8fc89e974fa40a9','','codeNone','','','Pre'),
('6602fd05a8fc89e974fa40ad','6602fd05a8fc89e974fa40a9','Make sure to pick `"Name:Joe"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40b2','6602fd05a8fc89e974fa40b1','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40b3','6602fd05a8fc89e974fa40b1','','codeNone','','Jonathan','Pre'),
('6602fd05a8fc89e974fa40b5','6602fd05a8fc89e974fa40b1','Make sure to pick `Jonathan`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40ba','6602fd05a8fc89e974fa40b9','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40bb','6602fd05a8fc89e974fa40b9','','codeNone','','Username:snoopdogg','Pre'),
('6602fd05a8fc89e974fa40bd','6602fd05a8fc89e974fa40b9','Make sure to pick `Username:snoopdogg`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40c2','6602fd05a8fc89e974fa40c1','Add the `temperature` variable to the expression.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40c3','6602fd05a8fc89e974fa40c1','Make sure to pick `temperature`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40c8','6602fd05a8fc89e974fa40c7','Display `Posts:55` in the console.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40c9','6602fd05a8fc89e974fa40c7','Make sure to pick `(` followed by `"Posts:" + "55"` and then `)`, `;`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40d0','6602fd05a8fc89e974fa40cf','Display `Ms. Irene` in the console.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40d1','6602fd05a8fc89e974fa40cf','Make sure to pick `title`, followed by `+`, and finally `name`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40d8','6602fd05a8fc89e974fa40d7','Code the string value `"likes"` so that the code displays `40 likes`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40d9','6602fd05a8fc89e974fa40d7','Make sure to type `"likes"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40df','6602fd05a8fc89e974fa40de','We''ve seen before that variables can also store numbers. Unlike strings, numeric values don''t use quotes `""`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40e0','6602fd05a8fc89e974fa40de','Make sure to pick `5`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40e5','6602fd05a8fc89e974fa40e4','Numbers make it easier to keep track of **numeric data**. Like here, `active_users` stores the number `5`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40e6','6602fd05a8fc89e974fa40e4','Make sure to pick `active_users`, followed by `=`, and finally `5`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40ed','6602fd05a8fc89e974fa40ec','We can create expressions with numbers, too. Here, we can add numbers together with `+ 1`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40ee','6602fd05a8fc89e974fa40ec','Make sure to pick `+`, followed by `1`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40f4','6602fd05a8fc89e974fa40f3','We use the `*` sign to multiply numbers and the `/`  sign to divide numbers. We''ll turn `0.5` into its percent value by multiplying it by `100`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40f5','6602fd05a8fc89e974fa40f3','Make sure to pick `*`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa40fa','6602fd05a8fc89e974fa40f9','We can use variables with numbers for calculations, too. We''ll see it in action by adding `1` to `number_of_steps`. ','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa40fb','6602fd05a8fc89e974fa40f9','Make sure to pick `+`, followed by `1`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4101','6602fd05a8fc89e974fa4100','Since expressions become values, we can store calculation results in variables, like here where `total` contains `private + public`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4102','6602fd05a8fc89e974fa4100','Make sure to pick `total`, followed by `+`, and finally `public`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4109','6602fd05a8fc89e974fa4108','What''s the value of `speed`?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa410a','6602fd05a8fc89e974fa4108','','codeNone','','','Pre'),
('6602fd05a8fc89e974fa410c','6602fd05a8fc89e974fa4108','Make sure to pick `305`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4111','6602fd05a8fc89e974fa4110','Why does this code display `31` instead of `4` in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4112','6602fd05a8fc89e974fa4110','','codeNone','','31','Pre'),
('6602fd05a8fc89e974fa4114','6602fd05a8fc89e974fa4110','Because `"3"` and `"1"` are string values.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4119','6602fd05a8fc89e974fa4118','How do we know that the `score` variable stores a number?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa411a','6602fd05a8fc89e974fa4118','','codeNone','','','Pre'),
('6602fd05a8fc89e974fa411c','6602fd05a8fc89e974fa4118','Because there are no double quotes around `40` and `4`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4121','6602fd05a8fc89e974fa4120','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4122','6602fd05a8fc89e974fa4120','','codeNone','','3 * 5','Pre'),
('6602fd05a8fc89e974fa4124','6602fd05a8fc89e974fa4120','`3 * 5`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4129','6602fd05a8fc89e974fa4128','Multiply the `savings` variable by the `interest` variable.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa412a','6602fd05a8fc89e974fa4128','Make sure to pick `*`, followed by `interest`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4130','6602fd05a8fc89e974fa412f','Divide `sum_of_grades` by `students` to get the average grade of a class.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4131','6602fd05a8fc89e974fa412f','Make sure to pick `sum_of_grades`, followed by `/`, and finally `students`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4138','6602fd05a8fc89e974fa4137','Subtract `discount` from `total` and display the calculation result in the console.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4139','6602fd05a8fc89e974fa4137','Make sure to pick `total`, followed by `-`, and finally `discount`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4140','6602fd05a8fc89e974fa413f','Set `months_per_year` to `12`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4141','6602fd05a8fc89e974fa413f','Make sure to type `12`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4148','6602fd05a8fc89e974fa4147','','image','always','','Pre'),
('6602fd05a8fc89e974fa4149','6602fd05a8fc89e974fa4147','There''s a special value that''s _neither_ a string _nor_ a number: `True`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa414a','6602fd05a8fc89e974fa4147','There are no quotes around it, and it''s not a numeric value.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa414c','6602fd05a8fc89e974fa414b','`True` is great for situations like checking if a feature is on or if data is available. We can see it here when we set `powered_on` to `True`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa414d','6602fd05a8fc89e974fa414b','Make sure to pick `=`, followed by `True`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4153','6602fd05a8fc89e974fa4152','We can store `True` in a variable just like a string or a number. Displaying it also works the same, like when we display `correct` here.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4154','6602fd05a8fc89e974fa4152','Make sure to pick `correct`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4159','6602fd05a8fc89e974fa4158','','image','always','','Pre'),
('6602fd05a8fc89e974fa415a','6602fd05a8fc89e974fa4158','`False` is another special value and the opposite of `True`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa415c','6602fd05a8fc89e974fa415b','We can save `False` in the variable `status` and display `status`  in the console.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa415d','6602fd05a8fc89e974fa415b','Make sure to pick `False`, followed by `status`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4163','6602fd05a8fc89e974fa4162','What''s a good use for the values `True` and `False`? ','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4164','6602fd05a8fc89e974fa4162','A good use for the values `True` and `False` is using them to show if a feature is switched on or off.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4169','6602fd05a8fc89e974fa4168','Why is `False` not a string?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa416a','6602fd05a8fc89e974fa4168','','codeNone','','','Pre'),
('6602fd05a8fc89e974fa416c','6602fd05a8fc89e974fa4168','There are no quotes around it.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4171','6602fd05a8fc89e974fa4170','Pick the one that''s best for showing a user unsubscribed from a service.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4172','6602fd05a8fc89e974fa4170','`subscribed = False`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4177','6602fd05a8fc89e974fa4176','Why is `"False"` not the same as `False`?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4178','6602fd05a8fc89e974fa4176','There are quotes around it, so `"False"` is a string.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa417d','6602fd05a8fc89e974fa417c','Show the status of the auto-update setting by displaying `False` in the console.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa417e','6602fd05a8fc89e974fa417c','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4183','6602fd05a8fc89e974fa4182','Create the variable `auto_save` and store `True` inside it.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4184','6602fd05a8fc89e974fa4182','Make sure to pick `True`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4189','6602fd05a8fc89e974fa4188','Create the variable for preventing logout and store `False` in it.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa418a','6602fd05a8fc89e974fa4188','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa418f','6602fd05a8fc89e974fa418e','Store a variable that''ll be used in calculations by coding `True`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4190','6602fd05a8fc89e974fa418e','Make sure to type `True`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4196','6602fd05a8fc89e974fa4195','','image','always','','Pre'),
('6602fd05a8fc89e974fa4197','6602fd05a8fc89e974fa4195','The code `not` in front of `True` makes the expression result in `False`. If something is not true, it has to be false.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4198','6602fd05a8fc89e974fa4195','`not` is the **negation operator**. It turns values into their **opposite**.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa419a','6602fd05a8fc89e974fa4199','When we change a value to its opposite with `not`, we negate it, like here with `not True`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa419b','6602fd05a8fc89e974fa4199','Make sure to pick `not`, followed by `True`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41a1','6602fd05a8fc89e974fa41a0','The `not` operator before `False` changes its value. If a value is not `False`, it has to be `True`. We can see it here by displaying `not False`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41a2','6602fd05a8fc89e974fa41a0','Make sure to pick `not`, followed by `False`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41a8','6602fd05a8fc89e974fa41a7','We can use the `not` operator with variables to negate their values. By displaying `not available` here, we''ll see its negated value.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41a9','6602fd05a8fc89e974fa41a7','Make sure to pick `print`, followed by `not`, and finally `available`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41b0','6602fd05a8fc89e974fa41af','We can save a whole negation in another variable, too. Like here `is_evening` should store the value of `not morning`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41b1','6602fd05a8fc89e974fa41af','Make sure to pick `is_evening` followed by `=` and then `not`, `morning`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41b9','6602fd05a8fc89e974fa41b8','What does the `not` operator do?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41ba','6602fd05a8fc89e974fa41b8','It turns `True` or `False` values into their opposite.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41bf','6602fd05a8fc89e974fa41be','Why does this code display `False` in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41c0','6602fd05a8fc89e974fa41be','','codeNone','','False','Pre'),
('6602fd05a8fc89e974fa41c2','6602fd05a8fc89e974fa41be','`not` in front of `True` turns it to `False`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41c7','6602fd05a8fc89e974fa41c6','What do we call the `not` sign in front of `True` or `False`? ','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41c8','6602fd05a8fc89e974fa41c6','The `not` sign is the negation operator.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41cd','6602fd05a8fc89e974fa41cc','Which value does `result` store?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41ce','6602fd05a8fc89e974fa41cc','','codeNone','','','Pre'),
('6602fd05a8fc89e974fa41d0','6602fd05a8fc89e974fa41cc','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41d5','6602fd05a8fc89e974fa41d4','Use the negation operator and store a value in the variable.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41d6','6602fd05a8fc89e974fa41d4','Make sure to pick `not`, followed by `True`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41dc','6602fd05a8fc89e974fa41db','Display `False` in the console.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41dd','6602fd05a8fc89e974fa41db','Make sure to pick `not True`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41e2','6602fd05a8fc89e974fa41e1','Create a `not_available` variable and save the negated value of `open_slot` in it.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41e3','6602fd05a8fc89e974fa41e1','Make sure to pick `not_available`, followed by `=`, and finally `open_slot`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41ea','6602fd05a8fc89e974fa41e9','Code `not True` inside the print statement.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41eb','6602fd05a8fc89e974fa41e9','Make sure to type `not True`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa41f2','6602fd05a8fc89e974fa41f1','We learned how to create and store values, but how do we compare them?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41f3','6602fd05a8fc89e974fa41f1','Like checking if a user''s entered PIN matches their saved PIN.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41f7','6602fd05a8fc89e974fa41f6','To compare if two numbers are the same, we use the **equality operator**, `==`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa41fd','6602fd05a8fc89e974fa41fc','','image','always','','Pre'),
('6602fd05a8fc89e974fa41fe','6602fd05a8fc89e974fa41fc','When comparing, there are only two results: `True` or `False`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4200','6602fd05a8fc89e974fa41ff','When we compare the same numbers with the equality operator, the result is `True`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4201','6602fd05a8fc89e974fa41ff','Make sure to pick `10`, followed by `==`, and finally `10`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4208','6602fd05a8fc89e974fa4207','When we compare the different numbers with the equality operator, the result is `False`. Like here with the `9` to `10` comparison.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4209','6602fd05a8fc89e974fa4207','Make sure to pick `9 == 10`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa420e','6602fd05a8fc89e974fa420d','What do we use to check if two numbers are equal? ','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa420f','6602fd05a8fc89e974fa420d','Make sure to pick `==`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4214','6602fd05a8fc89e974fa4213','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4215','6602fd05a8fc89e974fa4213','','codeNone','','False','Pre'),
('6602fd05a8fc89e974fa4217','6602fd05a8fc89e974fa4213','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa421c','6602fd05a8fc89e974fa421b','When might we need to check if two numbers are equal?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa421d','6602fd05a8fc89e974fa421b','When checking if a variable is exactly equal to 10.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4222','6602fd05a8fc89e974fa4221','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4223','6602fd05a8fc89e974fa4221','','codeNone','','18
False','Pre'),
('6602fd05a8fc89e974fa4225','6602fd05a8fc89e974fa4221','`18` and then `False`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa422a','6602fd05a8fc89e974fa4229','Check if the value of `votes` is equal to `11`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa422b','6602fd05a8fc89e974fa4229','Make sure to pick `=`, followed by `=`, and finally `11`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4232','6602fd05a8fc89e974fa4231','Add the equality operator.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4233','6602fd05a8fc89e974fa4231','Make sure to pick `==`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4238','6602fd05a8fc89e974fa4237','Display `False` in the console.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4239','6602fd05a8fc89e974fa4237','Make sure to pick `13`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa423e','6602fd05a8fc89e974fa423d','Check if these numbers are the same by coding `==`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa423f','6602fd05a8fc89e974fa423d','Make sure to type `===`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4245','6602fd05a8fc89e974fa4244','To check if a number isn''t equal to another number, we use the **inequality operator**, `!=`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4246','6602fd05a8fc89e974fa4244','Make sure to pick `!==`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa424b','6602fd05a8fc89e974fa424a','We can store the result of a comparison with the inequality operator in a variable like here where we''ll store the comparison `1 != 2`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa424c','6602fd05a8fc89e974fa424a','Make sure to pick `=`, followed by `!=`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4252','6602fd05a8fc89e974fa4251','Variables can store the result of equality comparisons too, such as `result = 1 == 2`. ','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4253','6602fd05a8fc89e974fa4251','Make sure to pick `result`, followed by `=`, and finally `==`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa425a','6602fd05a8fc89e974fa4259','We can compare values with variables and variables with other variables with `==`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa425b','6602fd05a8fc89e974fa4259','Make sure to type `==`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4260','6602fd05a8fc89e974fa425f','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4261','6602fd05a8fc89e974fa425f','','codeNone','','False','Pre'),
('6602fd05a8fc89e974fa4263','6602fd05a8fc89e974fa425f','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4268','6602fd05a8fc89e974fa4267','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4269','6602fd05a8fc89e974fa4267','','codeNone','','True','Pre'),
('6602fd05a8fc89e974fa426b','6602fd05a8fc89e974fa4267','Make sure to pick `True`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4270','6602fd05a8fc89e974fa426f','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4271','6602fd05a8fc89e974fa426f','','codeNone','','True','Pre'),
('6602fd05a8fc89e974fa4273','6602fd05a8fc89e974fa426f','Make sure to pick `True`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4278','6602fd05a8fc89e974fa4277','What''s wrong with this code?','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4279','6602fd05a8fc89e974fa4277','','codeNone','','','Pre'),
('6602fd05a8fc89e974fa427b','6602fd05a8fc89e974fa4277','Nothing is wrong with this code.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4280','6602fd05a8fc89e974fa427f','Add the operator that makes the comparison `False`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4281','6602fd05a8fc89e974fa427f','Make sure to pick `!=`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4286','6602fd05a8fc89e974fa4285','Check if `answer` equals `13`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4287','6602fd05a8fc89e974fa4285','Make sure to pick `=`, followed by `==`, and finally `13`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa428e','6602fd05a8fc89e974fa428d','Check if the user''s current level equals `highest_level` with `==`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa428f','6602fd05a8fc89e974fa428d','Make sure to type `==`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa4294','6602fd05a8fc89e974fa4293','Check if the answer submitted by the user isn''t zero letters long with `!=`.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa4295','6602fd05a8fc89e974fa4293','Make sure to type `!=`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa429c','6602fd05a8fc89e974fa429b','','image','always','','Pre'),
('6602fd05a8fc89e974fa429d','6602fd05a8fc89e974fa429b','Let''s learn how to display different kinds of values together in the console with a handy feature known as formatted strings.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa429f','6602fd05a8fc89e974fa429e','We''ve learned that we can use `+` to add two strings and display them together.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa42a0','6602fd05a8fc89e974fa429e','Make sure to pick `+`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa42a5','6602fd05a8fc89e974fa42a4','But using `+` to combine numeric data like `2` and `" new messages"` together produces an **error** as they are different kinds of values.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa42a6','6602fd05a8fc89e974fa42a4','Make sure to pick `+`, followed by `" new messages"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa42ac','6602fd05a8fc89e974fa42ab','f-strings, short for formatted strings, allow us to display expressions like adding a string to a number, without any error.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa42ad','6602fd05a8fc89e974fa42ab','Make sure to pick `f"{2} new messages"`.','paragraph','wrong','','Post'),
('6602fd05a8fc89e974fa42b2','6602fd05a8fc89e974fa42b1','Every f-string statement consists of two parts, first the character `f`, then the string that we want to format.','paragraph','always','','Pre'),
('6602fd05a8fc89e974fa42b3','6602fd05a8fc89e974fa42b1','Make sure to pick `f`, followed by `"{2} new messages"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42b9','6602fd06a8fc89e974fa42b8','Next, we add the different kind of value in curly braces so it''ll display as one print statement. Like here, with `{2}`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42ba','6602fd06a8fc89e974fa42b8','Make sure to type `{2}`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42bf','6602fd06a8fc89e974fa42be','Inserting variables like `new_messages` between the curly braces displays their value too.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42c0','6602fd06a8fc89e974fa42be','Make sure to pick `new_messages`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42c5','6602fd06a8fc89e974fa42c4','We can also use expressions like `new - read` between the curly braces to display their value.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42c6','6602fd06a8fc89e974fa42c4','Make sure to type `new - read`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42cb','6602fd06a8fc89e974fa42ca','We can use curly braces to insert values as often as we like inside the f-string. See it here with `5`, and then with `2`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42cc','6602fd06a8fc89e974fa42ca','Make sure to pick `5`, followed by `2`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42d2','6602fd06a8fc89e974fa42d1','To reuse an f-string, we can save it in a variable, like here with `status` and `f"{new} new messages"`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42d3','6602fd06a8fc89e974fa42d1','Make sure to pick `status`, followed by `=`, and finally `f"{new} new messages"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42da','6602fd06a8fc89e974fa42d9','What are f-strings for?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42db','6602fd06a8fc89e974fa42d9','For displaying different kinds of values together in a string.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42e0','6602fd06a8fc89e974fa42df','How do we recognize an f-string?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42e1','6602fd06a8fc89e974fa42df','By the character `f` in front of the string.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42e6','6602fd06a8fc89e974fa42e5','How do we display number values with f-strings?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42e7','6602fd06a8fc89e974fa42e5','We place them between curly braces, `{}`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42ec','6602fd06a8fc89e974fa42eb','How can we reuse an f-string we created?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42ed','6602fd06a8fc89e974fa42eb','We save it in a variable and use the variable.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42f2','6602fd06a8fc89e974fa42f1','Display the f-string.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42f3','6602fd06a8fc89e974fa42f1','Make sure to pick `f"{4} dataset entries"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42f8','6602fd06a8fc89e974fa42f7','Code the character `f` before the formatted string.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42f9','6602fd06a8fc89e974fa42f7','Make sure to type `f`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa42fe','6602fd06a8fc89e974fa42fd','Display `500` inside the string by coding `{500}`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa42ff','6602fd06a8fc89e974fa42fd','Make sure to type `{500}`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4304','6602fd06a8fc89e974fa4303','Display the current temperature by coding `degrees` between curly braces.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4305','6602fd06a8fc89e974fa4303','Make sure to pick `{`, followed by `degrees`, and finally `}`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa430c','6602fd06a8fc89e974fa430b','Save the f-string in the variable `display`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa430d','6602fd06a8fc89e974fa430b','Make sure to pick `display` followed by `=` and then `f`, `"Airing tonight: {movie}"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4317','6602fd06a8fc89e974fa4316','Create the variable `sign_ups` and set it to `"low"`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4318','6602fd06a8fc89e974fa4316','Make sure to pick `sign_ups`, followed by `=`, and finally `"low"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa431f','6602fd06a8fc89e974fa431e','Use snake case for this variable name.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4320','6602fd06a8fc89e974fa431e','Make sure to pick `highest_gdp`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4325','6602fd06a8fc89e974fa4324','Set `account_type` to  value `"Enterprise"`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4326','6602fd06a8fc89e974fa4324','Make sure to type `=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa432b','6602fd06a8fc89e974fa432a','Why is `first name` not a valid variable name?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa432c','6602fd06a8fc89e974fa432a','`first name` is not a valid variable name because variable names can''t contain spaces.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4332','6602fd06a8fc89e974fa4331','Display the string value in the console.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4333','6602fd06a8fc89e974fa4331','Make sure to pick `age_group`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4338','6602fd06a8fc89e974fa4337','What will the console display when we run the code?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4339','6602fd06a8fc89e974fa4337','','codeNone','','A-','Pre'),
('6602fd06a8fc89e974fa433b','6602fd06a8fc89e974fa4337','`A-` because `average_grade` was updated from `B` to `A-`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4341','6602fd06a8fc89e974fa4340','Update the `average_rating` variable.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4342','6602fd06a8fc89e974fa4340','Make sure to pick `average_rating`, followed by `=`, and finally `5`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4349','6602fd06a8fc89e974fa4348','What''s the `=` sign for?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa434a','6602fd06a8fc89e974fa4348','The `=` sign gives a value to a variable.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4350','6602fd06a8fc89e974fa434f','How often can we change the value of a variable?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4351','6602fd06a8fc89e974fa434f','We can update a variable as many times as we want.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4357','6602fd06a8fc89e974fa4356','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4358','6602fd06a8fc89e974fa4356','','codeNone','','Haircut','Pre'),
('6602fd06a8fc89e974fa435a','6602fd06a8fc89e974fa4356','Make sure to pick `Haircut`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4360','6602fd06a8fc89e974fa435f','Which value isn''t a string?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4361','6602fd06a8fc89e974fa435f','Make sure to pick `True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4367','6602fd06a8fc89e974fa4366','Create a `save_file` variable and store `False` in it.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4368','6602fd06a8fc89e974fa4366','Make sure to pick `save_file`, followed by `=`, and finally `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa436f','6602fd06a8fc89e974fa436e','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4370','6602fd06a8fc89e974fa436e','','codeNone','','False','Pre'),
('6602fd06a8fc89e974fa4372','6602fd06a8fc89e974fa436e','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4378','6602fd06a8fc89e974fa4377','Use the operator to negate the value stored in this variable.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4379','6602fd06a8fc89e974fa4377','Make sure to type `not`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa437e','6602fd06a8fc89e974fa437d','Which of these gives `is_monday` the value `False`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa437f','6602fd06a8fc89e974fa437d','`is_monday = not True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4385','6602fd06a8fc89e974fa4384','What sign do we use to check if two values are equal?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4386','6602fd06a8fc89e974fa4384','Make sure to pick `==`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa438c','6602fd06a8fc89e974fa438b','What''s the result of using the `==` operator?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa438d','6602fd06a8fc89e974fa438b','A value of either `True` or `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4393','6602fd06a8fc89e974fa4392','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4394','6602fd06a8fc89e974fa4392','','codeNone','','13% hazelnuts','Pre'),
('6602fd06a8fc89e974fa4396','6602fd06a8fc89e974fa4392','`13% hazelnuts`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa439c','6602fd06a8fc89e974fa439b','Code the variable `description`, that saves an f-string containing the `author` variable.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa439d','6602fd06a8fc89e974fa439b','Make sure to pick `description`, followed by `=`, and finally `f"A book by {author}"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43a4','6602fd06a8fc89e974fa43a3','Add code so that the comparison results is `True`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43a5','6602fd06a8fc89e974fa43a3','Make sure to pick `!=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43aa','6602fd06a8fc89e974fa43a9','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43ab','6602fd06a8fc89e974fa43a9','','codeNone','','False','Pre'),
('6602fd06a8fc89e974fa43ad','6602fd06a8fc89e974fa43a9','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43b3','6602fd06a8fc89e974fa43b2','Pick a value for `downloads` so `False` displays in the console.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43b4','6602fd06a8fc89e974fa43b2','Make sure to pick `999`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43bb','6602fd06a8fc89e974fa43ba','What does this code display?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43bc','6602fd06a8fc89e974fa43ba','','codeNone','','movie','Pre'),
('6602fd06a8fc89e974fa43be','6602fd06a8fc89e974fa43ba','Make sure to pick `movie`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43c5','6602fd06a8fc89e974fa43c4','What value does this variable store?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43c6','6602fd06a8fc89e974fa43c4','','codeNone','','','Pre'),
('6602fd06a8fc89e974fa43c8','6602fd06a8fc89e974fa43c4','Make sure to pick `"interview"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43cf','6602fd06a8fc89e974fa43ce','Code a descriptive, snake case variable name to store this car brand.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43d0','6602fd06a8fc89e974fa43ce','Make sure to pick `car_brand`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43d5','6602fd06a8fc89e974fa43d4','Display `step_1`, and then `step_2`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43d6','6602fd06a8fc89e974fa43d4','Make sure to pick `print(step_1)`, followed by `print(step_2)`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43dc','6602fd06a8fc89e974fa43db','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43dd','6602fd06a8fc89e974fa43db','','codeNone','','connect to power
press the upload button','Pre'),
('6602fd06a8fc89e974fa43df','6602fd06a8fc89e974fa43db','`connect to power`, `press the upload button`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43e6','6602fd06a8fc89e974fa43e5',' Display `"One new message"` in the console.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43e7','6602fd06a8fc89e974fa43e5','Make sure to type `print`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43ec','6602fd06a8fc89e974fa43eb','Store the string value `"blue"` in the `favorite_color` variable.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43ed','6602fd06a8fc89e974fa43eb','Make sure to type `"blue"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43f2','6602fd06a8fc89e974fa43f1','Display the variable `astronaut`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43f3','6602fd06a8fc89e974fa43f1','Make sure to pick `print` followed by `(` and then `astronaut`, `)`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa43fb','6602fd06a8fc89e974fa43fa','How do we know that the variable `answer` stores a string?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa43fc','6602fd06a8fc89e974fa43fa','','codeNone','','','Pre'),
('6602fd06a8fc89e974fa43fe','6602fd06a8fc89e974fa43fa','Because of the quotes around `"47"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4405','6602fd06a8fc89e974fa4404','What''s wrong with this variable name?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4406','6602fd06a8fc89e974fa4404','','codeNone','','','Pre'),
('6602fd06a8fc89e974fa4408','6602fd06a8fc89e974fa4404','Variable names can''t contain spaces.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa440f','6602fd06a8fc89e974fa440e','Give a string value to this variable.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4410','6602fd06a8fc89e974fa440e','Make sure to pick `"morning"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4415','6602fd06a8fc89e974fa4414','What does this code display?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4416','6602fd06a8fc89e974fa4414','','codeNone','','Good morning!','Pre'),
('6602fd06a8fc89e974fa4418','6602fd06a8fc89e974fa4414','`Good morning!`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4420','6602fd06a8fc89e974fa441f','What''s wrong with this code?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4421','6602fd06a8fc89e974fa441f','','codeNone','','NameError: name ''monday'' is not defined
','Pre'),
('6602fd06a8fc89e974fa4423','6602fd06a8fc89e974fa441f','As there are no quotes around `monday`, the code will recognize `monday` as a variable and not a string. The variable `monday` has also not been created yet.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa442a','6602fd06a8fc89e974fa4429','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa442b','6602fd06a8fc89e974fa4429','','codeNone','','15.0','Pre'),
('6602fd06a8fc89e974fa442d','6602fd06a8fc89e974fa4429','Make sure to pick `15.0`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4436','6602fd06a8fc89e974fa4435','Fill the gap to reassign the value of the variable so that Louise covers Brandon''s shift for today.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4437','6602fd06a8fc89e974fa4435','Make sure to pick `"Louise"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa443c','6602fd06a8fc89e974fa443b','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa443d','6602fd06a8fc89e974fa443b','','codeNone','','Saturday: picnic','Pre'),
('6602fd06a8fc89e974fa443f','6602fd06a8fc89e974fa443b','`Saturday: picnic`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4446','6602fd06a8fc89e974fa4445','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4447','6602fd06a8fc89e974fa4445','','codeNone','','4','Pre'),
('6602fd06a8fc89e974fa4449','6602fd06a8fc89e974fa4445','Make sure to pick `4`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4450','6602fd06a8fc89e974fa444f','Use a variable to update the `button_label`, so that the code displays `Go` in the console.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4451','6602fd06a8fc89e974fa444f','Make sure to pick `start_label`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4456','6602fd06a8fc89e974fa4455','What kind of value does the `total` variable store?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4457','6602fd06a8fc89e974fa4455','','codeNone','','Total: 
8','Pre'),
('6602fd06a8fc89e974fa4459','6602fd06a8fc89e974fa4455','A number value.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4461','6602fd06a8fc89e974fa4460','Code a number expression that results in 5.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4462','6602fd06a8fc89e974fa4460','Make sure to pick `value_1`, followed by `+`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa446a','6602fd06a8fc89e974fa4469','Use `not` to display `False` in the console.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa446b','6602fd06a8fc89e974fa4469','Make sure to type `not True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4470','6602fd06a8fc89e974fa446f','Use `not` and `False` to store `True` in `allow_cookies`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4471','6602fd06a8fc89e974fa446f','Make sure to type `not False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4476','6602fd06a8fc89e974fa4475','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4477','6602fd06a8fc89e974fa4475','','codeNone','','False','Pre'),
('6602fd06a8fc89e974fa4479','6602fd06a8fc89e974fa4475','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4481','6602fd06a8fc89e974fa4480','Create an `is_available` variable and set it to a negated variable.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4482','6602fd06a8fc89e974fa4480','Make sure to pick `is_available` followed by `=` and then `not`, `open_slot`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa448a','6602fd06a8fc89e974fa4489','Which of these stores `True` in `is_even`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa448b','6602fd06a8fc89e974fa4489','`is_even = not False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4493','6602fd06a8fc89e974fa4492','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4494','6602fd06a8fc89e974fa4492','','codeNone','','True','Pre'),
('6602fd06a8fc89e974fa4496','6602fd06a8fc89e974fa4492','Make sure to pick `True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa449e','6602fd06a8fc89e974fa449d','Which operator do we use to check that two values are different?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa449f','6602fd06a8fc89e974fa449d','Make sure to pick `!=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa44a6','6602fd06a8fc89e974fa44a5','Check if the variables are different.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa44a7','6602fd06a8fc89e974fa44a5','Make sure to type `!=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa44ac','6602fd06a8fc89e974fa44ab','Code a number to make the comparison result in `True`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa44ad','6602fd06a8fc89e974fa44ab','Make sure to type `5`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa44b3','6602fd06a8fc89e974fa44b2','What decides whether two variables are equal?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa44b4','6602fd06a8fc89e974fa44b2','Their values.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa44bb','6602fd06a8fc89e974fa44ba','Check if the `today` variable is equal to `13`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa44bc','6602fd06a8fc89e974fa44ba','Make sure to type `today == 13`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa44c1','6602fd06a8fc89e974fa44c0','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa44c2','6602fd06a8fc89e974fa44c0','','codeNone','','It''s a tie:
True','Pre'),
('6602fd06a8fc89e974fa44c4','6602fd06a8fc89e974fa44c0','`It''s a tie:` and then `True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa44cb','6602fd06a8fc89e974fa44ca','Code an operator to display `True` in the console.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa44cc','6602fd06a8fc89e974fa44ca','Make sure to type `!=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa44d1','6602fd06a8fc89e974fa44d0','What does this code display on the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa44d2','6602fd06a8fc89e974fa44d0','','codeNone','','Download finished:
False','Pre'),
('6602fd06a8fc89e974fa44d4','6602fd06a8fc89e974fa44d0','`Download finished:` and then `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa44db','6602fd06a8fc89e974fa44da','Code the operator to make `no_points` store `False`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa44dc','6602fd06a8fc89e974fa44da','Make sure to type `==`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa44e2','6602fd06a8fc89e974fa44e1','What values does this f-string display together?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa44e3','6602fd06a8fc89e974fa44e1','','codeNone','','Add 100 grams of sugar','Pre'),
('6602fd06a8fc89e974fa44e5','6602fd06a8fc89e974fa44e1','Strings and numbers.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa44ec','6602fd06a8fc89e974fa44eb','Use the `task` variable in an f-string to display `"todo: dishes"`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa44ed','6602fd06a8fc89e974fa44eb','Make sure to pick `f` followed by `todo` and then `:`, `{`, `task`, `}`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa44f7','6602fd06a8fc89e974fa44f6','What''s wrong with this code?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa44f8','6602fd06a8fc89e974fa44f6','','codeNone','','','Pre'),
('6602fd06a8fc89e974fa44fa','6602fd06a8fc89e974fa44f6','The character `f` is missing.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4501','6602fd06a8fc89e974fa4500','Use an f-string and the variable `name` to display `Hello, John!` again.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4502','6602fd06a8fc89e974fa4500','Make sure to type `f"Hello, {name}!"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4507','6602fd06a8fc89e974fa4506','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4508','6602fd06a8fc89e974fa4506','','codeNone','','88% of social media users are aged between 18 and 28','Pre'),
('6602fd06a8fc89e974fa450a','6602fd06a8fc89e974fa4506','`88% of social media users are aged between 18 and 28`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4511','6602fd06a8fc89e974fa4510','Insert `{2018}` at the end of this f-string.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4512','6602fd06a8fc89e974fa4510','Make sure to type `{2018}`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4517','6602fd06a8fc89e974fa4516','What does this code display?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4518','6602fd06a8fc89e974fa4516','','codeNone','','Most spoken languages: English, Mandarin Chinese, Hindi.','Pre'),
('6602fd06a8fc89e974fa451a','6602fd06a8fc89e974fa4516','`Most spoken languages: English, Mandarin Chinese, Hindi.`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4521','6602fd06a8fc89e974fa4520','Display the destination, the hours, and finally the minutes inside the f-string.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4522','6602fd06a8fc89e974fa4520','Make sure to pick `{destination}`, followed by `{hours}`, and finally `{minutes}`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4529','6602fd06a8fc89e974fa4528','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa452a','6602fd06a8fc89e974fa4528','','codeNone','','It''s a tie between rock and rock','Pre'),
('6602fd06a8fc89e974fa452c','6602fd06a8fc89e974fa4528','`It''s a tie between rock and rock`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4533','6602fd06a8fc89e974fa4532','What''s wrong with this code?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4534','6602fd06a8fc89e974fa4532','','codeNone','','','Pre'),
('6602fd06a8fc89e974fa4536','6602fd06a8fc89e974fa4532','There should be an `f` before the string in `greeting`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa453d','6602fd06a8fc89e974fa453c','Store the f-string into the variable `fact`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa453e','6602fd06a8fc89e974fa453c','Make sure to type `fact`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4543','6602fd06a8fc89e974fa4542','How often can we use `{}` to insert different kinds of values inside f-strings?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4544','6602fd06a8fc89e974fa4542','As often as we''d like.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa454b','6602fd06a8fc89e974fa454a','Use curly braces `{` and `}` to insert the number `200` at the beginning of the f-string.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa454c','6602fd06a8fc89e974fa454a','Make sure to type `{200}`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4551','6602fd06a8fc89e974fa4550','Display an f-string.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4552','6602fd06a8fc89e974fa4550','Make sure to pick `print` followed by `(` and then `f"{cocoa}% cocoa"`, `)`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4564','6602fd06a8fc89e974fa4563','','image','always','','Pre'),
('6602fd06a8fc89e974fa4565','6602fd06a8fc89e974fa4563','We can use comparisons to check if a number is less than or greater than another number.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4567','6602fd06a8fc89e974fa4566','To check if a number is less than another number, we use the **less-than operator**, `<`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4568','6602fd06a8fc89e974fa4566','Make sure to choose `<`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa456d','6602fd06a8fc89e974fa456c','If the number on the left is less than the number on the right, like in `1 < 235`, the result is `True`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa456e','6602fd06a8fc89e974fa456c','Make sure to pick `1`, followed by `<`, and finally `235`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4575','6602fd06a8fc89e974fa4574','If the number on the left isn''t less than the number on the right, like in `235 < 1`, the result is `False`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4576','6602fd06a8fc89e974fa4574','Make sure to pick `<`, followed by `1`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa457c','6602fd06a8fc89e974fa457b','To check if a number is greater than another number, we use the **greater-than operator**, `>`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa457d','6602fd06a8fc89e974fa457b','Make sure to pick `>`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4582','6602fd06a8fc89e974fa4581','What do we use the `>` operator for?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4583','6602fd06a8fc89e974fa4581','To check if a number is greater than another number.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4588','6602fd06a8fc89e974fa4587','What do we call the `>` sign?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4589','6602fd06a8fc89e974fa4587','Make sure to pick the greater-than operator.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa458e','6602fd06a8fc89e974fa458d','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa458f','6602fd06a8fc89e974fa458d','','codeNone','','False','Pre'),
('6602fd06a8fc89e974fa4591','6602fd06a8fc89e974fa458d','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4596','6602fd06a8fc89e974fa4595','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4597','6602fd06a8fc89e974fa4595','','codeNone','','False','Pre'),
('6602fd06a8fc89e974fa4599','6602fd06a8fc89e974fa4595','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa459e','6602fd06a8fc89e974fa459d','Check if `5` is greater than `4`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa459f','6602fd06a8fc89e974fa459d','Make sure to pick `5`, followed by `>`, and finally `4`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45a6','6602fd06a8fc89e974fa45a5','Check if `30` is less than `40` with the less-than operator, `<`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45a7','6602fd06a8fc89e974fa45a5','Make sure to type `<`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45ac','6602fd06a8fc89e974fa45ab','Make this code display `True` in the console.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45ad','6602fd06a8fc89e974fa45ab','Make sure to pick `>`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45b2','6602fd06a8fc89e974fa45b1','Display `False` in the console by coding the `>` operator.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45b3','6602fd06a8fc89e974fa45b1','Make sure to type `>`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45b9','6602fd06a8fc89e974fa45b8','To check if a number is less than or equal to another number, we use the **less-than-or-equal-to operator**, `<=`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45ba','6602fd06a8fc89e974fa45b8','Make sure to pick `<=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45bf','6602fd06a8fc89e974fa45be','If the number on the left is less than or equal to the number on the right, like in `11 <= 11`, the result is `True`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45c0','6602fd06a8fc89e974fa45be','Make sure to pick `11`, followed by `<=`, and finally `11`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45c7','6602fd06a8fc89e974fa45c6','To check if a number is greater than or equal to another number, we use the **greater-than-or-equal-to operator**, `>=`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45c8','6602fd06a8fc89e974fa45c6','Make sure to pick `>=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45cd','6602fd06a8fc89e974fa45cc','To store the result of a comparison in a variable, we use the `=` sign.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45ce','6602fd06a8fc89e974fa45cc','Make sure to pick `=`, followed by `<=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45d4','6602fd06a8fc89e974fa45d3','We can also use a comparison operator to compare a variable with another variable, like in `min <= max`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45d5','6602fd06a8fc89e974fa45d3','Make sure to pick `min`, followed by `<=`, and finally `max`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45dc','6602fd06a8fc89e974fa45db','Which operator checks if a number is less than or equal to another number?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45dd','6602fd06a8fc89e974fa45db','Make sure to choose `<=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45e2','6602fd06a8fc89e974fa45e1','What does the greater-than-or-equal-to operator, `>=`, do?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45e3','6602fd06a8fc89e974fa45e1','>=` checks if a number is greater than or equal to another number.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45e8','6602fd06a8fc89e974fa45e7','Which operator do we need to check if a number is at least `21`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45e9','6602fd06a8fc89e974fa45e7','Make sure to pick `>=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45ee','6602fd06a8fc89e974fa45ed','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45ef','6602fd06a8fc89e974fa45ed','','codeNone','','True','Pre'),
('6602fd06a8fc89e974fa45f1','6602fd06a8fc89e974fa45ed','Make sure to pick `True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45f6','6602fd06a8fc89e974fa45f5','Check if `battery_level` is less than or equal to `20` with the less-than-or-equal-to operator, `<=`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45f7','6602fd06a8fc89e974fa45f5','Make sure to type `<=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa45fc','6602fd06a8fc89e974fa45fb','Store the result of `points >= 10` in the `level_two` variable.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa45fd','6602fd06a8fc89e974fa45fb','Make sure to type `>=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4602','6602fd06a8fc89e974fa4601','Check if `solved` is less than or equal to `minimum`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4603','6602fd06a8fc89e974fa4601','Make sure to pick `solved`, followed by `<=`, and finally `minimum`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa460a','6602fd06a8fc89e974fa4609','Check if `60` is greater than or equal to `50` with the greater-than-or-equal-to operator, `>=`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa460b','6602fd06a8fc89e974fa4609','Make sure to type `>=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4612','6602fd06a8fc89e974fa4611','We can use comparisons to check if a string is equal to or not equal to another string.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4616','6602fd06a8fc89e974fa4615','To check if a string is equal to another string, we also use the **equality operator**, `==`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4617','6602fd06a8fc89e974fa4615','Make sure to pick `==`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa461c','6602fd06a8fc89e974fa461b','If the string on the left is equal to the string on the right, as in `"apple" == "apple"`, the result is `True`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa461d','6602fd06a8fc89e974fa461b','Make sure to pick `"apple"`, followed by `==`, and finally `"apple"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4624','6602fd06a8fc89e974fa4623','If the string on the left isn''t equal to the string on the right, as in `"apple" == "orange"`, the result is `False`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4625','6602fd06a8fc89e974fa4623','Make sure to pick `==`, followed by `"orange"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa462b','6602fd06a8fc89e974fa462a','We can also compare variables that store strings with each other, like in `fruit_1 == fruit_2`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa462c','6602fd06a8fc89e974fa462a','Make sure to pick `fruit_1`, followed by `==`, and finally `fruit2`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4633','6602fd06a8fc89e974fa4632','What does the equality operator, `==`, do?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4634','6602fd06a8fc89e974fa4632','The equality operator checks if a string is equal to another string.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4639','6602fd06a8fc89e974fa4638','Which of these is the equality operator?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa463a','6602fd06a8fc89e974fa4638','Make sure to pick `==`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa463f','6602fd06a8fc89e974fa463e','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4640','6602fd06a8fc89e974fa463e','','codeNone','','False','Pre'),
('6602fd06a8fc89e974fa4642','6602fd06a8fc89e974fa463e','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4647','6602fd06a8fc89e974fa4646','Which of these comparisons results in `True`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4648','6602fd06a8fc89e974fa4646','`"apple" == "apple"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa464d','6602fd06a8fc89e974fa464c','Check if `my_answer` is equal to `solution`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa464e','6602fd06a8fc89e974fa464c','Make sure to pick `==`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4653','6602fd06a8fc89e974fa4652','Store the string `"high"` in `my_answer` make the comparison `False`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4654','6602fd06a8fc89e974fa4652','Make sure to pick `"high"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4659','6602fd06a8fc89e974fa4658','Store a string in `item_2` to make the result of the comparison `False`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa465a','6602fd06a8fc89e974fa4658','Make sure to pick `"pipe"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa465f','6602fd06a8fc89e974fa465e','Check if `"liquid"` is equal to `"solid"` by coding `==`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4660','6602fd06a8fc89e974fa465e','Make sure to type `==`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4666','6602fd06a8fc89e974fa4665','To check if a string isn''t equal to another string, we use the **inequality operator**, `!=`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4667','6602fd06a8fc89e974fa4665','Make sure to pick `!=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa466c','6602fd06a8fc89e974fa466b','If the left string isn''t equal to the right string, as in `"subscribed" != "rejected"`, the result is `True`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa466d','6602fd06a8fc89e974fa466b','Make sure to pick `"subscribed"`, followed by `!=`, and finally `"rejected"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4674','6602fd06a8fc89e974fa4673','If the string on the left is equal to the string on the right, as in `"subscribed" != "subscribed"`, the result is `False`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4675','6602fd06a8fc89e974fa4673','Make sure to pick `!`, followed by `=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa467b','6602fd06a8fc89e974fa467a','To store the result of a comparison in a variable, we use the `=` sign.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa467c','6602fd06a8fc89e974fa467a','Make sure to pick `=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4681','6602fd06a8fc89e974fa4680','Which of these is `True`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4682','6602fd06a8fc89e974fa4680','`"black" != "orange"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4687','6602fd06a8fc89e974fa4686','Which of these is the inequality operator?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4688','6602fd06a8fc89e974fa4686','Make sure to pick `!=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa468d','6602fd06a8fc89e974fa468c','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa468e','6602fd06a8fc89e974fa468c','','codeNone','','True','Pre'),
('6602fd06a8fc89e974fa4690','6602fd06a8fc89e974fa468c','Make sure to pick `True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4695','6602fd06a8fc89e974fa4694','What does the inequality operator, `!=`, do?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4696','6602fd06a8fc89e974fa4694','It checks if a string isn''t equal to another string.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa469b','6602fd06a8fc89e974fa469a','Check if `my_answer` isn''t equal to `solution`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa469c','6602fd06a8fc89e974fa469a','Make sure to pick `!=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46a1','6602fd06a8fc89e974fa46a0','Store a string in `wallpaper` to display `False` in the console.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46a2','6602fd06a8fc89e974fa46a0','Make sure to pick `"bliss.png"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46a7','6602fd06a8fc89e974fa46a6','Store a string in `new_leader` to make the result of the comparison `True`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46a8','6602fd06a8fc89e974fa46a6','Make sure to pick `"Jim"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46ad','6602fd06a8fc89e974fa46ac','Check if `big_city` isn''t equal to `small_city` by coding `!=`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46ae','6602fd06a8fc89e974fa46ac','Make sure to type `!=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46b5','6602fd06a8fc89e974fa46b4','We''ve already seen a few kinds of data like numbers and strings. In programming terms, these values are called **types**.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46b6','6602fd06a8fc89e974fa46b4','','image','always','','Pre'),
('6602fd06a8fc89e974fa46b8','6602fd06a8fc89e974fa46b7','_Strings_ are characters between quotes `" "`, like the value `"High"`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46b9','6602fd06a8fc89e974fa46b7','Make sure to pick `"High"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46be','6602fd06a8fc89e974fa46bd','**Integer** is another type we''ve already used. It represents whole numbers without decimals, like `42`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46bf','6602fd06a8fc89e974fa46bd','Make sure to pick `42`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46c4','6602fd06a8fc89e974fa46c3','**Float** is another number type we use to describe numbers with one or more digits after the decimal point, like `3.14159`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46c5','6602fd06a8fc89e974fa46c3','Make sure to pick `3`, followed by `.`, and finally `14159`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46cc','6602fd06a8fc89e974fa46cb','The type **boolean** represents only two values: the special values `True` and `False`. Store the value `True` inside this variable.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46cd','6602fd06a8fc89e974fa46cb','Make sure to type `True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46d2','6602fd06a8fc89e974fa46d1','When storing `False` in `is_on`, we say that we **assign** a value to a variable.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46d3','6602fd06a8fc89e974fa46d1','Make sure to pick `is_on`, followed by `=`, and finally `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46da','6602fd06a8fc89e974fa46d9','What are values like booleans, strings, and numbers called?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46db','6602fd06a8fc89e974fa46d9','Values like booleans, strings, and numbers are called types.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46e0','6602fd06a8fc89e974fa46df','How do we recognize values of type string?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46e1','6602fd06a8fc89e974fa46df','We recognize string values by the quotes `" "`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46e6','6602fd06a8fc89e974fa46e5','What do we call whole numbers without decimal points? ','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46e7','6602fd06a8fc89e974fa46e5','Make sure to pick Integers.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46ec','6602fd06a8fc89e974fa46eb','Which type is stored inside `result`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46ed','6602fd06a8fc89e974fa46eb','','codeNone','','','Pre'),
('6602fd06a8fc89e974fa46ef','6602fd06a8fc89e974fa46eb','A `float`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46f4','6602fd06a8fc89e974fa46f3','What are the boolean values?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46f5','6602fd06a8fc89e974fa46f3','`True` and `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa46fa','6602fd06a8fc89e974fa46f9','What is a variable assignment?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa46fb','6602fd06a8fc89e974fa46f9','A variable assignment is storing a value inside a variable.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4700','6602fd06a8fc89e974fa46ff','Assign a string to the `name` variable, an integer to `age`, and a boolean to `is_active`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4701','6602fd06a8fc89e974fa46ff','Make sure to pick `"Joey"`, followed by `28`, and finally `True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4708','6602fd06a8fc89e974fa4707','Save a string value in the variable `name`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4709','6602fd06a8fc89e974fa4707','Make sure to pick `"Jill"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa470e','6602fd06a8fc89e974fa470d','Save an integer value in the variable.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa470f','6602fd06a8fc89e974fa470d','Make sure to pick `10`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4714','6602fd06a8fc89e974fa4713','Save a float value into the variable.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4715','6602fd06a8fc89e974fa4713','Make sure to pick `.`, followed by `55`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa471b','6602fd06a8fc89e974fa471a','Give `positive_score` the boolean value `True`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa471c','6602fd06a8fc89e974fa471a','Make sure to type `True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4721','6602fd06a8fc89e974fa4720','Assign the value `11` to the variable `number_of_appearances`,','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4722','6602fd06a8fc89e974fa4720','Make sure to type `11`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4728','6602fd06a8fc89e974fa4727','We''ve seen the basic data types in Python - strings, integers, floats, and booleans.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4729','6602fd06a8fc89e974fa4727','If we are unsure of a value type, we can _check_ it! Here, `type()` checks that `is_ready` is a bool, which is short for boolean.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa472a','6602fd06a8fc89e974fa4727','Make sure to pick `type`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa472f','6602fd06a8fc89e974fa472e','We can check any variable''s type with `type()` and the variable inside the parenthesis.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4730','6602fd06a8fc89e974fa472e','If we combine `type` with the `print` statement,  we''ll see the abbreviated version of a variable type in the console.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4731','6602fd06a8fc89e974fa472e','Make sure to pick `type` followed by `(fuel_deposit)` and then `(`, `)`, `print`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa473a','6602fd06a8fc89e974fa4739','Sometimes we want to change values from one type to another. This is called **type conversion**.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa473b','6602fd06a8fc89e974fa4739','In this example, what type do we need `age` to be to compare it to `18`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa473c','6602fd06a8fc89e974fa4739','','codeNone','','','Pre'),
('6602fd06a8fc89e974fa473e','6602fd06a8fc89e974fa4739','Make sure to pick `Integer`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4743','6602fd06a8fc89e974fa4742','Python has some built-in functions to help us convert data types. For example, `int()` will help us change the `age` string value to an integer.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4744','6602fd06a8fc89e974fa4742','Make sure to pick `int(age)`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4749','6602fd06a8fc89e974fa4748','The `str()` function allows us to take numerical values and convert them to strings.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa474a','6602fd06a8fc89e974fa4748','Convert the `password` variable to a string to compare it to the old password.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa474b','6602fd06a8fc89e974fa4748','Make sure to pick `str` followed by `(` and then `password`, `)`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4753','6602fd06a8fc89e974fa4752','If we use `int()` on a float value, we''ll simply remove the decimal point and subsequent values. There will be no rounding.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4754','6602fd06a8fc89e974fa4752','Make sure to pick `int`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4759','6602fd06a8fc89e974fa4758','Likewise, we can use `float()` on an integer. This will add a decimal point, and the ability to store fractional values.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa475a','6602fd06a8fc89e974fa4758','Make sure to pick `float` followed by `(` and then `weeks`, `)`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4762','6602fd06a8fc89e974fa4761','If we use `int()` on a boolean, the equivalent numerical value will be `1` for `True` and `0` for `False`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4763','6602fd06a8fc89e974fa4761','Convert `member` and `not_member` to integers to check their new boolean values.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4764','6602fd06a8fc89e974fa4761','Make sure to pick `int`, followed by `int`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa476a','6602fd06a8fc89e974fa4769','We can use `bool()` to convert a variable into a Boolean. If the variable has content, it will become `True`. If it''s empty or `0`, it''ll become `False`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa476b','6602fd06a8fc89e974fa4769','Convert these variables into booleans, and check the output.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa476c','6602fd06a8fc89e974fa4769','Make sure to pick `bool(member)` followed by `bool(middle_name)` and then `bool(foot_size)`, `bool(siblings)`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4774','6602fd06a8fc89e974fa4773','Complete the code to show the boolean values that tell us if the person has kids or pets.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4775','6602fd06a8fc89e974fa4773','Make sure to pick `bool(pets)`, followed by `bool(kids)`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa477b','6602fd06a8fc89e974fa477a','How do we convert an integer to a string?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa477c','6602fd06a8fc89e974fa477a','Using the `str()` function.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4781','6602fd06a8fc89e974fa4780','What value will be printed by the code below?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4782','6602fd06a8fc89e974fa4780','','codeNone','','4','Pre'),
('6602fd06a8fc89e974fa4784','6602fd06a8fc89e974fa4780','Remember there''s no rounding with the int() function!','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4789','6602fd06a8fc89e974fa4788','What does `float()` do?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa478a','6602fd06a8fc89e974fa4788','It converts a value into a floating-point number such as `2.3`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa478f','6602fd06a8fc89e974fa478e','Complete the code so that `response` is `True` if the `detail` string is not empty.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4790','6602fd06a8fc89e974fa478e','Make sure to pick `bool`, followed by `detail`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4798','6602fd06a8fc89e974fa4797','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4799','6602fd06a8fc89e974fa4797','','codeNone','','True','Pre'),
('6602fd06a8fc89e974fa479b','6602fd06a8fc89e974fa4797','Make sure to pick `True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47a1','6602fd06a8fc89e974fa47a0','Check if `11` is greater than or equal to `11`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47a2','6602fd06a8fc89e974fa47a0','Make sure to pick `>=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47a7','6602fd06a8fc89e974fa47a6','Store the result of the comparison with `min_score` in the variable `pass`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47a8','6602fd06a8fc89e974fa47a6','Make sure to pick `pass` followed by `=` and then `>=`, `min_score`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47b0','6602fd06a8fc89e974fa47af','Check if `score` is greater than or equal to `min_score` with the greater-than-or-equal-to operator.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47b1','6602fd06a8fc89e974fa47af','Make sure to type `>=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47b6','6602fd06a8fc89e974fa47b5','Which comparison results in `False`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47b7','6602fd06a8fc89e974fa47b5','`5 < 5`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47bd','6602fd06a8fc89e974fa47bc','Compare `copy` to `submission` with the inequality operator.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47be','6602fd06a8fc89e974fa47bc','Make sure to pick `!=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47c3','6602fd06a8fc89e974fa47c2','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47c4','6602fd06a8fc89e974fa47c2','','codeNone','','False','Pre'),
('6602fd06a8fc89e974fa47c6','6602fd06a8fc89e974fa47c2','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47cc','6602fd06a8fc89e974fa47cb','What does `!=` do?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47cd','6602fd06a8fc89e974fa47cb','`!=` checks if a string isn''t equal to another string.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47d3','6602fd06a8fc89e974fa47d2','Which operator checks if a string is equal to another string?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47d4','6602fd06a8fc89e974fa47d2','Make sure to pick `==`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47da','6602fd06a8fc89e974fa47d9','What will display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47db','6602fd06a8fc89e974fa47d9','','codeNone','','<class ''bool''>','Pre'),
('6602fd06a8fc89e974fa47dd','6602fd06a8fc89e974fa47d9','`<class ''bool''>`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47e3','6602fd06a8fc89e974fa47e2','Save the value `101` into the variable `result` and display it.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47e4','6602fd06a8fc89e974fa47e2','Make sure to pick `result` followed by `100` and then `+`, `print`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47ec','6602fd06a8fc89e974fa47eb','Create the variable `last_name` that contains a string.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47ed','6602fd06a8fc89e974fa47eb','Make sure to pick `last_name`, followed by `=`, and finally `"Clooney"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47f4','6602fd06a8fc89e974fa47f3','What type of value does `length` store?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47f5','6602fd06a8fc89e974fa47f3','','codeNone','','','Pre'),
('6602fd06a8fc89e974fa47f7','6602fd06a8fc89e974fa47f3','Make sure to pick `Float`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa47fd','6602fd06a8fc89e974fa47fc','Create a variable that contains an integer.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa47fe','6602fd06a8fc89e974fa47fc','Make sure to pick `score`, followed by `=`, and finally `2`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4805','6602fd06a8fc89e974fa4804','What are types?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4806','6602fd06a8fc89e974fa4804','Specific kinds of values like string, integer, float, and boolean.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa480c','6602fd06a8fc89e974fa480b','What will be the value of `int(5.7)`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa480d','6602fd06a8fc89e974fa480b','Remember there''s no rounding!','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4813','6602fd06a8fc89e974fa4812','What type is `23.4`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4814','6602fd06a8fc89e974fa4812','Make sure to pick `float`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa481c','6602fd06a8fc89e974fa481b','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa481d','6602fd06a8fc89e974fa481b','','codeNone','','True','Pre'),
('6602fd06a8fc89e974fa481f','6602fd06a8fc89e974fa481b','Make sure to pick `True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4826','6602fd06a8fc89e974fa4825','When comparing equal numbers, which comparisons result in `False`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4827','6602fd06a8fc89e974fa4825','Make sure to choose `>` and `<`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa482e','6602fd06a8fc89e974fa482d','Code the correct operator to set `give_change` to `True` if the customer paid more than the price.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa482f','6602fd06a8fc89e974fa482d','Make sure to pick `>`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4834','6602fd06a8fc89e974fa4833','Code a value so that `highly_rated` stores `True`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4835','6602fd06a8fc89e974fa4833','Make sure to pick `4`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa483b','6602fd06a8fc89e974fa483a','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa483c','6602fd06a8fc89e974fa483a','','codeNone','','True
True','Pre'),
('6602fd06a8fc89e974fa483e','6602fd06a8fc89e974fa483a','`True` and then `True`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4845','6602fd06a8fc89e974fa4844','Check that the number of votes is greater than or equal to `200`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4846','6602fd06a8fc89e974fa4844','Make sure to type `>=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa484c','6602fd06a8fc89e974fa484b','Check if `value` is greater than or equal to `minimum` and store the result of the comparison in `give_discount`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa484d','6602fd06a8fc89e974fa484b','Make sure to pick `give_discount` followed by `=` and then `value`, `>=`, `minimum`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4857','6602fd06a8fc89e974fa4856','Check if `age` is greater than or equal to `min_age`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4858','6602fd06a8fc89e974fa4856','Make sure to type `age >= min_age`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa485f','6602fd06a8fc89e974fa485e','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4860','6602fd06a8fc89e974fa485e','','codeNone','','False','Pre'),
('6602fd06a8fc89e974fa4862','6602fd06a8fc89e974fa485e','Make sure to pick `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4869','6602fd06a8fc89e974fa4868','Compare `accountant` to `singer` to display `False`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa486a','6602fd06a8fc89e974fa4868','Make sure to type `==`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa486f','6602fd06a8fc89e974fa486e','Using the equality operator, check if `"Diana"` is equal to `"Charles"`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4870','6602fd06a8fc89e974fa486e','Make sure to pick `"Diana"`, followed by `==`, and finally `"Charles"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4877','6602fd06a8fc89e974fa4876','What does this display in the console?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4878','6602fd06a8fc89e974fa4876','','codeNone','','False
False','Pre'),
('6602fd06a8fc89e974fa487a','6602fd06a8fc89e974fa4876','`False` and then `False`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4881','6602fd06a8fc89e974fa4880','Store a string in `item_1` to make the result of the comparison `True`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4882','6602fd06a8fc89e974fa4880','Make sure to type `"pipe"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4887','6602fd06a8fc89e974fa4886','Compare `"4G"` to `"5G"` to display `True`.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4888','6602fd06a8fc89e974fa4886','Make sure to type `!=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa488e','6602fd06a8fc89e974fa488d','Which of these code snippets results in `True`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa488f','6602fd06a8fc89e974fa488d','`"version 6" != "version 7"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa4896','6602fd06a8fc89e974fa4895','Compare `big_city` to `small_city` to display `True` in the console.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa4897','6602fd06a8fc89e974fa4895','Make sure to type `!=`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa489d','6602fd06a8fc89e974fa489c','What types are the values stored in these variables?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa489e','6602fd06a8fc89e974fa489c','','codeNone','','','Pre'),
('6602fd06a8fc89e974fa48a0','6602fd06a8fc89e974fa489c','string and integer.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa48a8','6602fd06a8fc89e974fa48a7','What''s the type of the value that `product_id` stores?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa48a9','6602fd06a8fc89e974fa48a7','','codeNone','','<class ''str''>','Pre'),
('6602fd06a8fc89e974fa48ab','6602fd06a8fc89e974fa48a7','Make sure to pick String.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa48b2','6602fd06a8fc89e974fa48b1','Create the variable `topic` that contains a string.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa48b3','6602fd06a8fc89e974fa48b1','Make sure to pick `topic`, followed by `=`, and finally `"Biology"`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa48ba','6602fd06a8fc89e974fa48b9','What type of value is inside `locked`?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa48bb','6602fd06a8fc89e974fa48b9','','codeNone','','<class ''bool''>','Pre'),
('6602fd06a8fc89e974fa48bd','6602fd06a8fc89e974fa48b9','Make sure to pick `Boolean`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa48c4','6602fd06a8fc89e974fa48c3','Display the variable that stores a boolean value.','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa48c5','6602fd06a8fc89e974fa48c3','Make sure to type `online`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa48ca','6602fd06a8fc89e974fa48c9','Which variable stores a float value?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa48cb','6602fd06a8fc89e974fa48c9','','codeNone','','','Pre'),
('6602fd06a8fc89e974fa48cd','6602fd06a8fc89e974fa48c9','Make sure to pick `price_1`.','paragraph','wrong','','Post'),
('6602fd06a8fc89e974fa48d5','6602fd06a8fc89e974fa48d4','What does this code do?','paragraph','always','','Pre'),
('6602fd06a8fc89e974fa48d6','6602fd06a8fc89e974fa48d4','','codeNone','','','Pre'),
('6602fd06a8fc89e974fa48d8','6602fd06a8fc89e974fa48d4','It assigns the float value `5.7` to the variable `rating`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040bd7','6602fd62666d4ea088040bd6','Now that we''ve dipped our feet into how to structure and style webpages, let''s take a look at what we need to make them interactive.','paragraph','always','','Pre'),
('6602fd62666d4ea088040bd8','6602fd62666d4ea088040bd6','We''ll take an in depth look into Javascript, a **programming** **language** that powers dynamic websites and apps.','paragraph','always','','Pre'),
('6602fd62666d4ea088040bd9','6602fd62666d4ea088040bd6','','image','always','','Pre'),
('6602fd62666d4ea088040bdb','6602fd62666d4ea088040bda','','image','always','','Pre'),
('6602fd62666d4ea088040bdc','6602fd62666d4ea088040bda','Dynamic websites need to remember information to display or change. For that, JavaScript has **variables**.','paragraph','always','','Pre'),
('6602fd62666d4ea088040bdd','6602fd62666d4ea088040bda','Like moving boxes, variables have content and names that tell us what''s inside.','paragraph','always','','Pre'),
('6602fd62666d4ea088040bdf','6602fd62666d4ea088040bde','We use `let`, and `const` to create variables. We''ll use both for now and cover the difference between them later.','paragraph','always','','Pre'),
('6602fd62666d4ea088040be0','6602fd62666d4ea088040bde','Make sure to pick `const`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040be5','6602fd62666d4ea088040be4','Every variable needs a **name**. Variable names need to be single words and, therefore, have no spaces.','paragraph','always','','Pre'),
('6602fd62666d4ea088040be6','6602fd62666d4ea088040be4','Make sure to pick `city`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040beb','6602fd62666d4ea088040bea','To create variable names with multiple words, we use **camel case**. We start with a lowercase letter and capitalize the additional words.','paragraph','always','','Pre'),
('6602fd62666d4ea088040bec','6602fd62666d4ea088040bea','Make sure to pick `homeCity`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040bf1','6602fd62666d4ea088040bf0','To help us understand what''s inside a variable we pick descriptive names.','paragraph','always','','Pre'),
('6602fd62666d4ea088040bf2','6602fd62666d4ea088040bf0','Make sure to pick `windyCity`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040bf7','6602fd62666d4ea088040bf6','What''s wrong with this variable name?','paragraph','always','','Pre'),
('6602fd62666d4ea088040bf8','6602fd62666d4ea088040bf6','','codeNone','','','Pre'),
('6602fd62666d4ea088040bfa','6602fd62666d4ea088040bf6','It contains a space.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040bff','6602fd62666d4ea088040bfe','Why do we give variables descriptive names like `city` or `country` instead of `x` or `y`?','paragraph','always','','Pre'),
('6602fd62666d4ea088040c00','6602fd62666d4ea088040bfe','We give variables descriptive names to help us understand what''s inside them.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c05','6602fd62666d4ea088040c04','What words can we use to declare variables?','paragraph','always','','Pre'),
('6602fd62666d4ea088040c06','6602fd62666d4ea088040c04','`let` and `const`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c0b','6602fd62666d4ea088040c0a','What do we use camel case for?','paragraph','always','','Pre'),
('6602fd62666d4ea088040c0c','6602fd62666d4ea088040c0a','We use camel case to create variable names with multiple words.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c11','6602fd62666d4ea088040c10','Pick the most descriptive variable name.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c12','6602fd62666d4ea088040c10','Make sure to pick `highScore`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c17','6602fd62666d4ea088040c16','Spell out the word for one of the ways we use to create a variable.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c18','6602fd62666d4ea088040c16','Make sure to pick `l`, followed by `e`, and finally `t`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c1f','6602fd62666d4ea088040c1e','Put the snippets in the right order to create a variable name.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c20','6602fd62666d4ea088040c1e','Make sure to pick `let`, followed by `highScore`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c26','6602fd62666d4ea088040c25','Finish up creating this variable by coding `let`.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c27','6602fd62666d4ea088040c25','Make sure to type `let`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c2d','6602fd62666d4ea088040c2c','Variable names can contain **numbers**, too. Adding numbers is useful with multiple similar variables. Let''s create the variable `car1` here.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c2e','6602fd62666d4ea088040c2c','Make sure to pick `car1`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c33','6602fd62666d4ea088040c32','After creating and naming a variable, we use the `=` sign to store a **value** inside it. Like `const city = "Chicago"`.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c34','6602fd62666d4ea088040c32','Make sure to pick `=`, followed by `"Chicago"`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c3a','6602fd62666d4ea088040c39','To finish creating a variable, we put a semicolon, `;`, at the end of the line.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c3b','6602fd62666d4ea088040c39','Make sure to pick `;`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c40','6602fd62666d4ea088040c3f','The values we''ve been storing like `"Chicago"` are **strings**. Strings are words in double quotes.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c41','6602fd62666d4ea088040c3f','Make sure to pick `"`, followed by `"`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c47','6602fd62666d4ea088040c46','Strings can contain all sorts of letters and symbols, including spaces. For example, `"Winter is coming."`.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c48','6602fd62666d4ea088040c46','Make sure to assemble `"Winter is coming."`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c4f','6602fd62666d4ea088040c4e','What''s the value of this variable?','paragraph','always','','Pre'),
('6602fd62666d4ea088040c50','6602fd62666d4ea088040c4e','','codeNone','','','Pre'),
('6602fd62666d4ea088040c52','6602fd62666d4ea088040c4e','Make sure to pick `"Karin"`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c57','6602fd62666d4ea088040c56','How do we know a value is a string?','paragraph','always','','Pre'),
('6602fd62666d4ea088040c58','6602fd62666d4ea088040c56','It''s a string if it''s a word between double quotes.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c5d','6602fd62666d4ea088040c5c','What''s happening in this code?','paragraph','always','','Pre'),
('6602fd62666d4ea088040c5e','6602fd62666d4ea088040c5c','','codeNone','','','Pre'),
('6602fd62666d4ea088040c60','6602fd62666d4ea088040c5c','The variable `browser` stores the value `"Chrome"`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c65','6602fd62666d4ea088040c64','What''s the name of this variable?','paragraph','always','','Pre'),
('6602fd62666d4ea088040c66','6602fd62666d4ea088040c64','','codeNone','','','Pre'),
('6602fd62666d4ea088040c68','6602fd62666d4ea088040c64','Make sure to pick `hobby`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c6d','6602fd62666d4ea088040c6c','Create a `job` variable and give it the value `"Plumber"`.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c6e','6602fd62666d4ea088040c6c','Make sure to pick `let job`, followed by `=`, and finally `"Plumber"`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c75','6602fd62666d4ea088040c74','Create a `company` variable and give it a string value.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c76','6602fd62666d4ea088040c74','Make sure to pick `let company` followed by `=` and then `"Apple"`, `;`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c7e','6602fd62666d4ea088040c7d','Give the `island` variable a string value.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c7f','6602fd62666d4ea088040c7d','Make sure to pick `"`, followed by `Malta`, and finally `"`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c86','6602fd62666d4ea088040c85','Give the `device` variable the string value `"Desktop"`.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c87','6602fd62666d4ea088040c85','Make sure to type `"Desktop"`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c8d','6602fd62666d4ea088040c8c','We already know we can declare variables with `let` and `const`. Let''s find out the difference between them!','paragraph','always','','Pre'),
('6602fd62666d4ea088040c8f','6602fd62666d4ea088040c8e','We use `const` to declare variables whose values are not supposed to change. `const` is short for "constant".','paragraph','always','','Pre'),
('6602fd62666d4ea088040c90','6602fd62666d4ea088040c8e','Make sure to pick `const`, followed by `norwayCapital`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040c96','6602fd62666d4ea088040c95','If we try to update a value stored in a `const` variable. We will get an error.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c9a','6602fd62666d4ea088040c99','However, we can update `let` variables with the assign `=` operator.','paragraph','always','','Pre'),
('6602fd62666d4ea088040c9b','6602fd62666d4ea088040c99','We cannot reassign a value to a constant.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040ca0','6602fd62666d4ea088040c9f','To make it obvious that a variable is of type `const` and shouldn''t change, we can optionally name it with uppercase letters.','paragraph','always','','Pre'),
('6602fd62666d4ea088040ca1','6602fd62666d4ea088040c9f','Create an uppercase `birthday` constant.','paragraph','always','','Pre'),
('6602fd62666d4ea088040ca2','6602fd62666d4ea088040c9f','Make sure to pick `BIRTHDAY`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040ca7','6602fd62666d4ea088040ca6','We cannot use `camelCase` if we use this uppercase standard, so we use an uppercase `snake_case` to name variables with more than one word.','paragraph','always','','Pre'),
('6602fd62666d4ea088040ca8','6602fd62666d4ea088040ca6','Create an _uppercase_ "speed of light" const using `snake_case`.','paragraph','always','','Pre'),
('6602fd62666d4ea088040ca9','6602fd62666d4ea088040ca6','Make sure to pick `SPEED_OF_LIGHT`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cae','6602fd62666d4ea088040cad','Both `let` and `const` are useful variables and we could use them interchangeably. However, we should try to use `const` as default.','paragraph','always','','Pre'),
('6602fd62666d4ea088040caf','6602fd62666d4ea088040cad','Make sure to pick `const`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cb4','6602fd62666d4ea088040cb3','What does `const` stand for?','paragraph','always','','Pre'),
('6602fd62666d4ea088040cb5','6602fd62666d4ea088040cb3','Make sure to pick constant.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cba','6602fd62666d4ea088040cb9','We can assign a new value to a `let` variable.','paragraph','always','','Pre'),
('6602fd62666d4ea088040cbb','6602fd62666d4ea088040cb9','Make sure to pick true.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cc0','6602fd62666d4ea088040cbf','What''s the optional standard to make sure constants don''t change their values?','paragraph','always','','Pre'),
('6602fd62666d4ea088040cc1','6602fd62666d4ea088040cbf','Make sure to pick uppercase.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cc6','6602fd62666d4ea088040cc5','What should we use as a default?','paragraph','always','','Pre'),
('6602fd62666d4ea088040cc7','6602fd62666d4ea088040cc5','Make sure to pick `const`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040ccc','6602fd62666d4ea088040ccb','Declare the variable correctly.','paragraph','always','','Pre'),
('6602fd62666d4ea088040ccd','6602fd62666d4ea088040ccb','We have to declare the variable with `let` since we''re updating the value.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cd2','6602fd62666d4ea088040cd1','Use the uppercase `snake_case` standard to declare this `const` variable.','paragraph','always','','Pre'),
('6602fd62666d4ea088040cd3','6602fd62666d4ea088040cd1','Make sure to pick `LONGEST_RIVER`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cd8','6602fd62666d4ea088040cd7','Use the default variable to declare the game name.','paragraph','always','','Pre'),
('6602fd62666d4ea088040cd9','6602fd62666d4ea088040cd7','Make sure to type `const`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cdf','6602fd62666d4ea088040cde','','image','always','','Pre'),
('6602fd62666d4ea088040ce0','6602fd62666d4ea088040cde','Lines of code are **instructions** for the computer to follow.','paragraph','always','','Pre'),
('6602fd62666d4ea088040ce1','6602fd62666d4ea088040cde','When we run code, we tell the computer to follow the instructions we put together.','paragraph','always','','Pre'),
('6602fd62666d4ea088040ce3','6602fd62666d4ea088040ce2','The order of the instructions matters because the computer follows the instructions line by line.','paragraph','always','','Pre'),
('6602fd62666d4ea088040ce4','6602fd62666d4ea088040ce2','Create `step1` first, `step2` second, and `step3` third.','paragraph','always','','Pre'),
('6602fd62666d4ea088040ce5','6602fd62666d4ea088040ce2','Make sure to pick `const step1 = "Collect pants";`, followed by `const step2 = "?";`, and finally `const step3 = "Profit";`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cec','6602fd62666d4ea088040ceb','With the special instruction `console.log()`, we tell the computer to display a value in an area called the **console**.','paragraph','always','','Pre'),
('6602fd62666d4ea088040ced','6602fd62666d4ea088040ceb','Make sure to pick `"Hello, World!"`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cf2','6602fd62666d4ea088040cf1','We can use the `console.log()` instruction as often as we want. The computer displays every value on a line in the console.','paragraph','always','','Pre'),
('6602fd62666d4ea088040cf3','6602fd62666d4ea088040cf1','Make sure to pick `(`, followed by `)`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cf9','6602fd62666d4ea088040cf8','We can use `console.log()` to display variables like `greeting`, too.','paragraph','always','','Pre'),
('6602fd62666d4ea088040cfa','6602fd62666d4ea088040cf8','Make sure to pick `greeting`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040cff','6602fd62666d4ea088040cfe','When we display variables in the console, their values appear instead of their names.  If we log `name` here,  it''ll show its value.','paragraph','always','','Pre'),
('6602fd62666d4ea088040d00','6602fd62666d4ea088040cfe','Make sure to pick `name`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040d05','6602fd62666d4ea088040d04','How do we know `"Hello, World!"` is a string?','paragraph','always','','Pre'),
('6602fd62666d4ea088040d06','6602fd62666d4ea088040d04','Strings start and end with double quotes.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040d0b','6602fd62666d4ea088040d0a','What''s the console?','paragraph','always','','Pre'),
('6602fd62666d4ea088040d0c','6602fd62666d4ea088040d0a','The console displays output and is usually underneath the code editor area.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040d11','6602fd62666d4ea088040d10','What does the special instruction `console.log()` do?','paragraph','always','','Pre'),
('6602fd62666d4ea088040d12','6602fd62666d4ea088040d10','The special instruction `console.log()` displays a value in the console.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040d17','6602fd62666d4ea088040d16','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd62666d4ea088040d18','6602fd62666d4ea088040d16','','codeNone','','B-ball','Pre'),
('6602fd62666d4ea088040d1a','6602fd62666d4ea088040d16','Make sure to pick `B-ball`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040d1f','6602fd62666d4ea088040d1e','Put the code in order to display the value `daily` in the console.','paragraph','always','','Pre'),
('6602fd62666d4ea088040d20','6602fd62666d4ea088040d1e','Make sure to pick `const frequency = "daily";`, followed by `console.log(frequency);`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040d26','6602fd62666d4ea088040d25','Add the instruction to display this string value in the console.','paragraph','always','','Pre'),
('6602fd62666d4ea088040d27','6602fd62666d4ea088040d25','Make sure to assemble `console.log()`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040d30','6602fd62666d4ea088040d2f','Display the value of `lastName`.','paragraph','always','','Pre'),
('6602fd62666d4ea088040d31','6602fd62666d4ea088040d2f','Make sure to pick `lastName`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040d36','6602fd62666d4ea088040d35','Display the value of the `job` variable.','paragraph','always','','Pre'),
('6602fd62666d4ea088040d37','6602fd62666d4ea088040d35','Make sure to type `job`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040d3e','6602fd62666d4ea088040d3d','We already saw that `let` variables, as opposed to `const` can change and update the values they store.','paragraph','always','','Pre'),
('6602fd62666d4ea088040d3f','6602fd62666d4ea088040d3d','Use the `=` sign to change the value in `status` from `"Watching Netflix"` to `"Relaxing at the beach"`.','paragraph','always','','Pre'),
('6602fd62666d4ea088040d40','6602fd62666d4ea088040d3d','Make sure to pick `=`.','paragraph','wrong','','Post'),
('6602fd62666d4ea088040d45','6602fd62666d4ea088040d44','We can update `let` variables as often as we want.','paragraph','always','','Pre'),
('6602fd62666d4ea088040d46','6602fd62666d4ea088040d44','Try it yourself: change the value of `currentStatus` to `"Reading"`.','paragraph','always','','Pre'),
('6602fd62666d4ea088040d47','6602fd62666d4ea088040d44','Make sure to pick `currentStatus`, followed by `=`, and finally `"Reading"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040d4e','6602fd63666d4ea088040d4d','We can also give variables the values of other variables by setting one variable to the other.','paragraph','always','','Pre'),
('6602fd63666d4ea088040d4f','6602fd63666d4ea088040d4d','Give the `currentStatus` variable the value of `defaultStatus`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040d50','6602fd63666d4ea088040d4d','Make sure to pick `defaultStatus`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040d55','6602fd63666d4ea088040d54','When we update a variable, it forgets its previous value.','paragraph','always','','Pre'),
('6602fd63666d4ea088040d56','6602fd63666d4ea088040d54','Display the `currentStatus` variable when it''s set to `"Playing football"` and when it''s set to `"Walking the dog"`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040d57','6602fd63666d4ea088040d54','Make sure to pick `currentStatus`, followed by `currentStatus`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040d5d','6602fd63666d4ea088040d5c','Which of these lines of code updates the `currentStatus` variable?','paragraph','always','','Pre'),
('6602fd63666d4ea088040d5e','6602fd63666d4ea088040d5c','`currentStatus = "Working out";`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040d63','6602fd63666d4ea088040d62','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040d64','6602fd63666d4ea088040d62','','codeNone','','Watching Netflix','Pre'),
('6602fd63666d4ea088040d66','6602fd63666d4ea088040d62','`Watching Netflix`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040d6b','6602fd63666d4ea088040d6a','What''s wrong with this code?','paragraph','always','','Pre'),
('6602fd63666d4ea088040d6c','6602fd63666d4ea088040d6a','','codeNone','','','Pre'),
('6602fd63666d4ea088040d6e','6602fd63666d4ea088040d6a','It misses the `let` keyword in the first line.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040d73','6602fd63666d4ea088040d72','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040d74','6602fd63666d4ea088040d72','','codeNone','','Joe','Pre'),
('6602fd63666d4ea088040d76','6602fd63666d4ea088040d72','Make sure to pick `Joe`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040d7b','6602fd63666d4ea088040d7a','Change the value in the `temperature` variable to `"100 degrees"`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040d7c','6602fd63666d4ea088040d7a','Make sure to pick `temperature`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040d81','6602fd63666d4ea088040d80','Update the `currentStatus` variable to `"Writing code"`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040d82','6602fd63666d4ea088040d80','Make sure to pick `currentStatus` followed by `=` and then `"Writing code"`, `;`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040d8a','6602fd63666d4ea088040d89','Update the `buttonText` variable to `"Log in"`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040d8b','6602fd63666d4ea088040d89','Make sure to pick `buttonText` followed by `=` and then `"Log in"`, `;`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040d93','6602fd63666d4ea088040d92','Change the value of the `currentStatus` variable to `"Done"`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040d94','6602fd63666d4ea088040d92','Make sure to type `"Done"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040d9a','6602fd63666d4ea088040d99','We can add string values together with a `+` sign.','paragraph','always','','Pre'),
('6602fd63666d4ea088040d9b','6602fd63666d4ea088040d99','Add the values `"Followers:"` and `"55"` together.','paragraph','always','','Pre'),
('6602fd63666d4ea088040d9c','6602fd63666d4ea088040d99','Make sure to choose `+` to add the two values.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040da1','6602fd63666d4ea088040da0','We call adding together string values an **expression** because it creates a single string value.','paragraph','always','','Pre'),
('6602fd63666d4ea088040da2','6602fd63666d4ea088040da0','Add the expression between the parentheses of `console.log()`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040da3','6602fd63666d4ea088040da0','Make sure to assemble `"Followers:" + "55"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040daa','6602fd63666d4ea088040da9','When expressions contain variables, they use the values in the variables.','paragraph','always','','Pre'),
('6602fd63666d4ea088040dab','6602fd63666d4ea088040da9','Create an expression that adds the value `"Followers:"` and the variable `followers` together.','paragraph','always','','Pre'),
('6602fd63666d4ea088040dac','6602fd63666d4ea088040da9','Make sure to pick `"Followers:"`, followed by `+`, and finally `followers`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040db3','6602fd63666d4ea088040db2','We can use `console.log()` to see the results of expressions.','paragraph','always','','Pre'),
('6602fd63666d4ea088040db4','6602fd63666d4ea088040db2','Add a `console.log()` instruction around the expression.','paragraph','always','','Pre'),
('6602fd63666d4ea088040db5','6602fd63666d4ea088040db2','Make sure to pick `console.log`, followed by `(`, and finally `)`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040dbc','6602fd63666d4ea088040dbb','Since expressions become values, we can give them to variables just like values.','paragraph','always','','Pre'),
('6602fd63666d4ea088040dbd','6602fd63666d4ea088040dbb','Store the expression `"Posts:" + "13"` in the variable `label` and display it in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040dbe','6602fd63666d4ea088040dbb','Make sure to pick `"Posts:"` followed by `+` and then `"13"`, `label`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040dc6','6602fd63666d4ea088040dc5','What''s the value of `label`?','paragraph','always','','Pre'),
('6602fd63666d4ea088040dc7','6602fd63666d4ea088040dc5','','codeNone','','','Pre'),
('6602fd63666d4ea088040dc9','6602fd63666d4ea088040dc5','Make sure to pick `"Name:Joe"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040dce','6602fd63666d4ea088040dcd','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040dcf','6602fd63666d4ea088040dcd','','codeNone','','','Pre'),
('6602fd63666d4ea088040dd1','6602fd63666d4ea088040dcd','We need `console.log()` to display an expression in the console.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040dd6','6602fd63666d4ea088040dd5','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040dd7','6602fd63666d4ea088040dd5','','codeNone','','Username:snoopdogg','Pre'),
('6602fd63666d4ea088040dd9','6602fd63666d4ea088040dd5','Make sure to pick `Username:snoopdogg`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040dde','6602fd63666d4ea088040ddd','Why does this code display `SteveJobs` without a space in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040ddf','6602fd63666d4ea088040ddd','','codeNone','','SteveJobs','Pre'),
('6602fd63666d4ea088040de1','6602fd63666d4ea088040ddd','Since there''s no space in `"Steve"` or `"Jobs"`, `SteveJobs` gets printed to the console instead of `Steve Jobs`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040de6','6602fd63666d4ea088040de5','Add the `temperature` variable to the expression.','paragraph','always','','Pre'),
('6602fd63666d4ea088040de7','6602fd63666d4ea088040de5','Make sure to pick `temperature`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040dec','6602fd63666d4ea088040deb','Display `Posts:55` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ded','6602fd63666d4ea088040deb','Make sure to assemble `console.log("Posts:" + "55");`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040df6','6602fd63666d4ea088040df5','Display `Ms. Irene` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040df7','6602fd63666d4ea088040df5','Make sure to pick `title`, followed by `+`, and finally `name`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040dfe','6602fd63666d4ea088040dfd','Code the string value `"likes"` to see how many likes we have.','paragraph','always','','Pre'),
('6602fd63666d4ea088040dff','6602fd63666d4ea088040dfd','Make sure to type `"likes"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e05','6602fd63666d4ea088040e04','There are other kinds of values, too. Like **numbers**, which have no double quotes around them.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e06','6602fd63666d4ea088040e04','Make sure to pick `5`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e0b','6602fd63666d4ea088040e0a','Numbers make it easier to keep track of **numeric values**. For example, the number of likes on a Facebook post.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e0c','6602fd63666d4ea088040e0a','Create a `numberOfLikes` variable and set it to `5`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e0d','6602fd63666d4ea088040e0a','Make sure to pick `const` followed by `numberOfLikes` and then `=`, `5`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e15','6602fd63666d4ea088040e14','We can create expressions with numbers, too. We add numbers together with the `+` sign and subtract them from each other with the `-` sign.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e16','6602fd63666d4ea088040e14','Display `6` in the console by setting `numberOfLikes` to `5 + 1`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e17','6602fd63666d4ea088040e14','Make sure to pick `+`, followed by `1`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e1d','6602fd63666d4ea088040e1c','We use the `*` sign to multiply numbers and the `/` sign to divide numbers.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e1e','6602fd63666d4ea088040e1c','Turn `0.5` into its percent value by multiplying it by `100`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e1f','6602fd63666d4ea088040e1c','Make sure to pick `*`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e24','6602fd63666d4ea088040e23','When we store numbers in variables, we can use the variables for calculations, too.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e25','6602fd63666d4ea088040e23','Add `1` to the `numberOfSteps` variable before displaying it in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e26','6602fd63666d4ea088040e23','Make sure to pick `+`, followed by `1`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e2c','6602fd63666d4ea088040e2b','Since expressions become values, we can store calculation results in variables.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e2d','6602fd63666d4ea088040e2b','Store the calculation result in the `total` variable.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e2e','6602fd63666d4ea088040e2b','Make sure to pick `total`, followed by `=`, and finally `private + public`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e35','6602fd63666d4ea088040e34','What''s the value of the `speed` variable?','paragraph','always','','Pre'),
('6602fd63666d4ea088040e36','6602fd63666d4ea088040e34','','codeNone','','','Pre'),
('6602fd63666d4ea088040e38','6602fd63666d4ea088040e34','Make sure to pick `305`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e3d','6602fd63666d4ea088040e3c','Why does this code display `31` instead of `4` in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040e3e','6602fd63666d4ea088040e3c','','codeNone','','31','Pre'),
('6602fd63666d4ea088040e40','6602fd63666d4ea088040e3c','Because `"3"` and `"1"` are string values.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e45','6602fd63666d4ea088040e44','How do we know that the `score` variable stores a number?','paragraph','always','','Pre'),
('6602fd63666d4ea088040e46','6602fd63666d4ea088040e44','','codeNone','','','Pre'),
('6602fd63666d4ea088040e48','6602fd63666d4ea088040e44','Because there are no double quotes around `40` and `4`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e4d','6602fd63666d4ea088040e4c','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040e4e','6602fd63666d4ea088040e4c','','codeNone','','3 * 5','Pre'),
('6602fd63666d4ea088040e50','6602fd63666d4ea088040e4c','`3 * 5`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e55','6602fd63666d4ea088040e54','Multiply the `savings` variable by the `interest` variable.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e56','6602fd63666d4ea088040e54','Make sure to pick `*`, followed by `interest`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e5c','6602fd63666d4ea088040e5b','Divide `sumOfGrades` by `numberOfStudents` to get the average grade of a class.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e5d','6602fd63666d4ea088040e5b','Make sure to pick `/`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e62','6602fd63666d4ea088040e61','Subtract `discount` from `total` and display the calculation result in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e63','6602fd63666d4ea088040e61','Make sure to pick `total`, followed by `-`, and finally `discount`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e6a','6602fd63666d4ea088040e69','Set `monthsPerYear` to `12`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e6b','6602fd63666d4ea088040e69','Make sure to type `12`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e72','6602fd63666d4ea088040e71','','image','always','','Pre'),
('6602fd63666d4ea088040e73','6602fd63666d4ea088040e71','There''s a special value that''s _neither_ a string _nor_ a number: `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e74','6602fd63666d4ea088040e71','There are no quotes around it, and it''s not a numeric value.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e76','6602fd63666d4ea088040e75','`true` is great for situations like checking if a switch is on or if a feature is enabled.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e77','6602fd63666d4ea088040e75','Display `true` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e78','6602fd63666d4ea088040e75','Make sure to type `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e7d','6602fd63666d4ea088040e7c','We can store `true` in a variable just like a string or a number.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e7e','6602fd63666d4ea088040e7c','Store `true` in a variable and display it in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e7f','6602fd63666d4ea088040e7c','Make sure to pick `true`, followed by `correct`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e85','6602fd63666d4ea088040e84','','image','always','','Pre'),
('6602fd63666d4ea088040e86','6602fd63666d4ea088040e84','`false` is another special value and the opposite of `true`. We can use it like `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e88','6602fd63666d4ea088040e87','Save the value `false` in the variable `status` and display `status` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e89','6602fd63666d4ea088040e87','Make sure to pick `false`, followed by `status`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e8f','6602fd63666d4ea088040e8e','What''s a good use for the values `true` and `false`? ','paragraph','always','','Pre'),
('6602fd63666d4ea088040e90','6602fd63666d4ea088040e8e','A good use for the values `true` and `false` is using them to show if a feature is switched on or off.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e95','6602fd63666d4ea088040e94','Why is `false` not a string?','paragraph','always','','Pre'),
('6602fd63666d4ea088040e96','6602fd63666d4ea088040e94','','codeNone','','','Pre'),
('6602fd63666d4ea088040e98','6602fd63666d4ea088040e94','There are no quotes around it.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040e9d','6602fd63666d4ea088040e9c','Pick the one that''s best for showing that a user unsubscribed from a service.','paragraph','always','','Pre'),
('6602fd63666d4ea088040e9e','6602fd63666d4ea088040e9c','`const subscribed = false;`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040ea3','6602fd63666d4ea088040ea2','Why is `"false"` not the same as `false`?','paragraph','always','','Pre'),
('6602fd63666d4ea088040ea4','6602fd63666d4ea088040ea2','There are quotes around it, so `"false"` is a string.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040ea9','6602fd63666d4ea088040ea8','Show the status of the auto-update setting by displaying `false` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040eaa','6602fd63666d4ea088040ea8','Make sure to assemble `console.log(false)`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040eb4','6602fd63666d4ea088040eb3','Create the variable `autoSaveImage` and store `true` inside it.','paragraph','always','','Pre'),
('6602fd63666d4ea088040eb5','6602fd63666d4ea088040eb3','Make sure to pick `const`, followed by `autoSaveImage`, and finally `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040ebc','6602fd63666d4ea088040ebb','Prevent cookies by creating the variable and storing `false` in it.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ebd','6602fd63666d4ea088040ebb','Make sure to pick `allowCookies`, followed by `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040ec3','6602fd63666d4ea088040ec2','Adjust the auto-play settings by coding `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ec4','6602fd63666d4ea088040ec2','Make sure to type `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040eca','6602fd63666d4ea088040ec9','','image','always','','Pre'),
('6602fd63666d4ea088040ecb','6602fd63666d4ea088040ec9','A `!` sign in front of `true` makes the expression result in `false`. If something is not true, it has to be false.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ecc','6602fd63666d4ea088040ec9','The `!` sign is the **negation operator**. It turns values into their **opposite**.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ece','6602fd63666d4ea088040ecd','When we change a value to its opposite with `!`, we negate it.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ecf','6602fd63666d4ea088040ecd','Put a `!` sign before `true` to change its value.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ed0','6602fd63666d4ea088040ecd','Make sure to assemble `!true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040ed6','6602fd63666d4ea088040ed5','The `!` operator before `false` changes its value, too. If a value is not `false`, it has to be `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ed7','6602fd63666d4ea088040ed5','Make sure it reads `!false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040edd','6602fd63666d4ea088040edc','We can use the `!` operator with variables to negate the values they store.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ede','6602fd63666d4ea088040edc','Make sure to pick `!`, followed by `isMorning`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040ee4','6602fd63666d4ea088040ee3','We can save a whole negation in another variable, too.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ee5','6602fd63666d4ea088040ee3','Create the variable `isEvening` and use `!` to change `isMorning` to `false`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ee6','6602fd63666d4ea088040ee3','Make sure to pick `isEvening` followed by `=` and then `!`, `isMorning`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040eee','6602fd63666d4ea088040eed','What does the `!` operator do?','paragraph','always','','Pre'),
('6602fd63666d4ea088040eef','6602fd63666d4ea088040eed','The `!` operator turns `true` or `false` values into their opposite.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040ef4','6602fd63666d4ea088040ef3','Why does this code display `false` in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040ef5','6602fd63666d4ea088040ef3','','codeNone','','false','Pre'),
('6602fd63666d4ea088040ef7','6602fd63666d4ea088040ef3','The `!` operator in front of `true` turns its value into false.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040efc','6602fd63666d4ea088040efb','What do we call the `!` sign in front of `true` or `false`? ','paragraph','always','','Pre'),
('6602fd63666d4ea088040efd','6602fd63666d4ea088040efb','The `!` sign is the negation operator.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f02','6602fd63666d4ea088040f01','Which value does `result` store?','paragraph','always','','Pre'),
('6602fd63666d4ea088040f03','6602fd63666d4ea088040f01','','codeNone','','','Pre'),
('6602fd63666d4ea088040f05','6602fd63666d4ea088040f01','Make sure to pick `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f0a','6602fd63666d4ea088040f09','Use the negation operator and store a value in the variable.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f0b','6602fd63666d4ea088040f09','Make sure to pick `!`, followed by `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f11','6602fd63666d4ea088040f10','Display `false` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f12','6602fd63666d4ea088040f10','Make sure to pick `!true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f17','6602fd63666d4ea088040f16','Create the variable and save the negated value in it.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f18','6602fd63666d4ea088040f16','Make sure to pick `const`, followed by `isAvailable`, and finally `!openSlot`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f1f','6602fd63666d4ea088040f1e','Code `!true` inside the display statement.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f20','6602fd63666d4ea088040f1e','Make sure to type `!true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f27','6602fd63666d4ea088040f26','We learned how to create and store values, but how do we compare them?','paragraph','always','','Pre'),
('6602fd63666d4ea088040f28','6602fd63666d4ea088040f26','We need to compare numbers in situations like checking a user''s entered PIN matches their saved PIN.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f2c','6602fd63666d4ea088040f2b','To compare if two numbers are the same, we use the **equality operator**, `===`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f33','6602fd63666d4ea088040f32','When comparing, there are only two results: `true` or `false`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f34','6602fd63666d4ea088040f32','','image','always','','Pre'),
('6602fd63666d4ea088040f36','6602fd63666d4ea088040f35','When we compare the same numbers with the equality operator, the result is `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f37','6602fd63666d4ea088040f35','Make sure you assemble `10 === 10`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f3e','6602fd63666d4ea088040f3d','When we compare two different numbers with the equality operator, the result is `false`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f3f','6602fd63666d4ea088040f3d','Pick the option that compares `9` to `10`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f40','6602fd63666d4ea088040f3d','Make sure to choose `9 === 10`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f45','6602fd63666d4ea088040f44','What do we use to check if two numbers are equal? ','paragraph','always','','Pre'),
('6602fd63666d4ea088040f46','6602fd63666d4ea088040f44','We use `===` to check if two numbers are equal.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f4b','6602fd63666d4ea088040f4a','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040f4c','6602fd63666d4ea088040f4a','','codeNone','','false','Pre'),
('6602fd63666d4ea088040f4e','6602fd63666d4ea088040f4a','Make sure to choose `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f53','6602fd63666d4ea088040f52','In which of these situations would we need to check if two numbers are equal?','paragraph','always','','Pre'),
('6602fd63666d4ea088040f54','6602fd63666d4ea088040f52','When checking if a player''s number of lives remaining is _exactly_ 5.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f59','6602fd63666d4ea088040f58','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040f5a','6602fd63666d4ea088040f58','','codeNone','','18
false','Pre'),
('6602fd63666d4ea088040f5c','6602fd63666d4ea088040f58','`18` and then `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f61','6602fd63666d4ea088040f60','Check if the value of `votes` is equal to `11`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f62','6602fd63666d4ea088040f60','Make sure to pick `=` followed by `=` and then `=`, `11`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f6a','6602fd63666d4ea088040f69','Add the equality comparison operator.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f6b','6602fd63666d4ea088040f69','Make sure to pick `===`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f70','6602fd63666d4ea088040f6f','Display `false` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f71','6602fd63666d4ea088040f6f','Make sure to pick `13`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f76','6602fd63666d4ea088040f75','Check if these numbers are the same by typing `===`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f77','6602fd63666d4ea088040f75','Make sure to type in `===`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f7d','6602fd63666d4ea088040f7c','To check if a number isn''t equal to another number, we use the **inequality operator**, `!==`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f7e','6602fd63666d4ea088040f7c','Make sure to pick `!==`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f83','6602fd63666d4ea088040f82','We can store the result of a comparison with the inequality operator in a variable.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f84','6602fd63666d4ea088040f82','Save the comparison between `1` and `2` into the variable `result`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f85','6602fd63666d4ea088040f82','Make sure to pick `=`, followed by `!==`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f8b','6602fd63666d4ea088040f8a','Variables can store the result of equality comparisons, too.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f8c','6602fd63666d4ea088040f8a','Make sure to pick `=`, followed by `===`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f92','6602fd63666d4ea088040f91','We can compare values with variables and variables with other variables.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f93','6602fd63666d4ea088040f91','Type `===` to compare the contents of the variables.','paragraph','always','','Pre'),
('6602fd63666d4ea088040f94','6602fd63666d4ea088040f91','Make sure to type `===`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040f99','6602fd63666d4ea088040f98','Which value should `batteryLevel` have, so that the comparison in the `charged` variable gives `false`?','paragraph','always','','Pre'),
('6602fd63666d4ea088040f9a','6602fd63666d4ea088040f98','','codeNone','','','Pre'),
('6602fd63666d4ea088040f9c','6602fd63666d4ea088040f98','Make sure to pick `78`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040fa1','6602fd63666d4ea088040fa0','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040fa2','6602fd63666d4ea088040fa0','','codeNone','','true','Pre'),
('6602fd63666d4ea088040fa4','6602fd63666d4ea088040fa0','Make sure to pick `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040fa9','6602fd63666d4ea088040fa8','What value should we give to the variable `emails` to store `true` in `inboxFull`?','paragraph','always','','Pre'),
('6602fd63666d4ea088040faa','6602fd63666d4ea088040fa8','','codeNone','','','Pre'),
('6602fd63666d4ea088040fac','6602fd63666d4ea088040fa8','Make sure to pick `1000`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040fb1','6602fd63666d4ea088040fb0','What should the value of `scoreOne` be if we want `equal` to be `true`?','paragraph','always','','Pre'),
('6602fd63666d4ea088040fb2','6602fd63666d4ea088040fb0','','codeNone','','','Pre'),
('6602fd63666d4ea088040fb4','6602fd63666d4ea088040fb0','Make sure to pick `80`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040fb9','6602fd63666d4ea088040fb8','Add the operator that makes the comparison `false`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040fba','6602fd63666d4ea088040fb8','Make sure to pick `!==`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040fbf','6602fd63666d4ea088040fbe','Check if the `answer` variable equals `13` and store the result in the `correctAnswer` variable.','paragraph','always','','Pre'),
('6602fd63666d4ea088040fc0','6602fd63666d4ea088040fbe','Make sure to pick `=`, followed by `===`, and finally `13`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040fc7','6602fd63666d4ea088040fc6','Check if the user''s current `level` equals `highestLevel` by typing `===`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040fc8','6602fd63666d4ea088040fc6','Make sure to type `===`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040fcd','6602fd63666d4ea088040fcc','Check if the answer submitted by the user isn''t empty by typing `!==`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040fce','6602fd63666d4ea088040fcc','Make sure to type `!==`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040fd5','6602fd63666d4ea088040fd4','When can we use `console.log()` to display the value of a variable?','paragraph','always','','Pre'),
('6602fd63666d4ea088040fd6','6602fd63666d4ea088040fd4','We can only use `console.log()` to display the content of a variable after we create it.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040fdc','6602fd63666d4ea088040fdb','Why is this not a string value?','paragraph','always','','Pre'),
('6602fd63666d4ea088040fdd','6602fd63666d4ea088040fdb','','codeNone','','','Pre'),
('6602fd63666d4ea088040fdf','6602fd63666d4ea088040fdb','`New York` is not a string because there are no double quotes, `"` and ` "`, around it.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040fe5','6602fd63666d4ea088040fe4','Code the `=` sign to give the `spaceship` variable the string value `"Enterprise"`.','paragraph','always','','Pre'),
('6602fd63666d4ea088040fe6','6602fd63666d4ea088040fe4','Make sure to type `=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040feb','6602fd63666d4ea088040fea','Display `Atlanta` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040fec','6602fd63666d4ea088040fea','Make sure to put together `console.log("Atlanta")`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040ff4','6602fd63666d4ea088040ff3','Display the string value in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088040ff5','6602fd63666d4ea088040ff3','Make sure to pick `console.log` followed by `(` and then `ingredients`, `)`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088040ffd','6602fd63666d4ea088040ffc','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088040ffe','6602fd63666d4ea088040ffc','','codeNone','','1000','Pre'),
('6602fd63666d4ea088041000','6602fd63666d4ea088040ffc','Make sure to pick `1000`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041006','6602fd63666d4ea088041005','Display `goal` minus `milesRan` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea088041007','6602fd63666d4ea088041005','Make sure to pick `goal`, followed by `-`, and finally `milesRan`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804100e','6602fd63666d4ea08804100d','Display the value of `total` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea08804100f','6602fd63666d4ea08804100d','Make sure to type `total`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041014','6602fd63666d4ea088041013','Set `total` to the result of `score` minus `penalty`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041015','6602fd63666d4ea088041013','Make sure to pick `score`, followed by `-`, and finally `penalty`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804101c','6602fd63666d4ea08804101b','What''s the value of `number3`?','paragraph','always','','Pre'),
('6602fd63666d4ea08804101d','6602fd63666d4ea08804101b','','codeNone','','','Pre'),
('6602fd63666d4ea08804101f','6602fd63666d4ea08804101b','Make sure to pick `7`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041025','6602fd63666d4ea088041024','Which sign turns `true` into `false`?','paragraph','always','','Pre'),
('6602fd63666d4ea088041026','6602fd63666d4ea088041024','We use `!` to turn `true` to `false` and `false` to `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804102c','6602fd63666d4ea08804102b','Which value isn''t a string?','paragraph','always','','Pre'),
('6602fd63666d4ea08804102d','6602fd63666d4ea08804102b','`true` is not a string.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041033','6602fd63666d4ea088041032','Can you make sure that `true` appears in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088041034','6602fd63666d4ea088041032','Make sure to pick `loggedIn`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041039','6602fd63666d4ea088041038','Use the special sign to negate the value.','paragraph','always','','Pre'),
('6602fd63666d4ea08804103a','6602fd63666d4ea088041038','Make sure to pick `!`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804103f','6602fd63666d4ea08804103e','Can you pick the snippet that displays `true` in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088041040','6602fd63666d4ea08804103e','Make sure to pick `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041045','6602fd63666d4ea088041044','What''s the result of using the `===` operator?','paragraph','always','','Pre'),
('6602fd63666d4ea088041046','6602fd63666d4ea088041044','`true` or `false` are special values that aren''t strings. No need for quotes.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804104c','6602fd63666d4ea08804104b','Check if `uploaded` equals the value `100`.','paragraph','always','','Pre'),
('6602fd63666d4ea08804104d','6602fd63666d4ea08804104b','Make sure to pick `===`, followed by `100`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041053','6602fd63666d4ea088041052','What will this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088041054','6602fd63666d4ea088041052','','codeNone','','false','Pre'),
('6602fd63666d4ea088041056','6602fd63666d4ea088041052','The result is `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804105c','6602fd63666d4ea08804105b','Make the comparison result `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea08804105d','6602fd63666d4ea08804105b','Make sure to pick `!==`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041062','6602fd63666d4ea088041061','Check if the chosen number isn''t equal to `0`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041063','6602fd63666d4ea088041061','Make sure to pick `=`, followed by `!`, and finally `0`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410a0','6602fd63666d4ea08804109f','','image','always','','Pre'),
('6602fd63666d4ea0880410a1','6602fd63666d4ea08804109f','We can use comparisons to check if a number is less than or greater than another number.','paragraph','always','','Pre'),
('6602fd63666d4ea0880410a3','6602fd63666d4ea0880410a2','To check if a number is less than another number, we use the **less-than operator**, `<`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880410a4','6602fd63666d4ea0880410a2','Make sure to pick `<`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410a9','6602fd63666d4ea0880410a8','If the number on the left is less than the number on the right, like in `1 < 235`, the result is `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880410aa','6602fd63666d4ea0880410a8','Make sure to pick `1`, followed by `<`, and finally `235`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410b1','6602fd63666d4ea0880410b0','If the number on the left isn''t less than the number on the right, like in `235 < 1`, the result is `false`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880410b2','6602fd63666d4ea0880410b0','Make sure to pick `<`, followed by `1`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410b8','6602fd63666d4ea0880410b7','To check if a number is greater than another number, we use the **greater-than operator**, `>`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880410b9','6602fd63666d4ea0880410b7','Make sure to choose `>`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410be','6602fd63666d4ea0880410bd','What do we use the `>` operator for?','paragraph','always','','Pre'),
('6602fd63666d4ea0880410bf','6602fd63666d4ea0880410bd','To check if a number is greater than another number.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410c4','6602fd63666d4ea0880410c3','What do we call the `>` sign?','paragraph','always','','Pre'),
('6602fd63666d4ea0880410c5','6602fd63666d4ea0880410c3','Make sure to pick the greater-than operator.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410ca','6602fd63666d4ea0880410c9','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea0880410cb','6602fd63666d4ea0880410c9','','codeNone','','false','Pre'),
('6602fd63666d4ea0880410cd','6602fd63666d4ea0880410c9','Make sure to choose `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410d2','6602fd63666d4ea0880410d1','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea0880410d3','6602fd63666d4ea0880410d1','','codeNone','','false','Pre'),
('6602fd63666d4ea0880410d5','6602fd63666d4ea0880410d1','Make sure to choose `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410da','6602fd63666d4ea0880410d9','Check if `5` is greater than `4`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880410db','6602fd63666d4ea0880410d9','Make sure to pick `5`, followed by `>`, and finally `4`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410e2','6602fd63666d4ea0880410e1','Check if `30` is less than `40` with the less-than operator, `<`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880410e3','6602fd63666d4ea0880410e1','Make sure to type in `<`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410e8','6602fd63666d4ea0880410e7','Make this code display `true` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea0880410e9','6602fd63666d4ea0880410e7','Make sure to select `>`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410ee','6602fd63666d4ea0880410ed','Display `false` in the console by typing the `>` operator.','paragraph','always','','Pre'),
('6602fd63666d4ea0880410ef','6602fd63666d4ea0880410ed','Make sure to type in `>`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410f5','6602fd63666d4ea0880410f4','To check if a number is less than or equal to another number, we use the **less-than-or-equal-to operator**, `<=`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880410f6','6602fd63666d4ea0880410f4','Make sure to pick `<=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880410fb','6602fd63666d4ea0880410fa','If the number on the left is less than or equal to the number on the right, like in `11 <= 11`, the result is `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880410fc','6602fd63666d4ea0880410fa','Make sure to pick `11`, followed by `<=`, and finally `11`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041103','6602fd63666d4ea088041102','To check if a number is greater than or equal to another number, we use the **greater-than-or-equal-to operator**, `>=`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041104','6602fd63666d4ea088041102','Make sure to select `>=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041109','6602fd63666d4ea088041108','To store the result of a comparison in a variable, we use the `=` sign. This is the **assignment operator**.','paragraph','always','','Pre'),
('6602fd63666d4ea08804110a','6602fd63666d4ea088041108','Make sure to pick `=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804110f','6602fd63666d4ea08804110e','We can also use a comparison operator to compare a variable with another variable, like in `min <= max`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041110','6602fd63666d4ea08804110e','Make sure to pick `min`, followed by `<=`, and finally `max`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041117','6602fd63666d4ea088041116','Which operator checks if a number is less than or equal to another number?','paragraph','always','','Pre'),
('6602fd63666d4ea088041118','6602fd63666d4ea088041116','Make sure to choose `<=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804111d','6602fd63666d4ea08804111c','What does the greater-than-or-equal-to operator, `>=`, do?','paragraph','always','','Pre'),
('6602fd63666d4ea08804111e','6602fd63666d4ea08804111c','>=` checks if a number is greater than or equal to another number.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041123','6602fd63666d4ea088041122','Which operator do we use to check if a number on the left side of the statement is equal to or greater than `21`?','paragraph','always','','Pre'),
('6602fd63666d4ea088041124','6602fd63666d4ea088041122','Make sure to pick `>=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041129','6602fd63666d4ea088041128','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea08804112a','6602fd63666d4ea088041128','','codeNone','','true','Pre'),
('6602fd63666d4ea08804112c','6602fd63666d4ea088041128','Make sure to choose `true`, because `10` equals `10`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041131','6602fd63666d4ea088041130','Check if `batteryLevel` is less than or equal to `20` with the less-than-or-equal-to operator, `<=`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041132','6602fd63666d4ea088041130','Make sure to type `<=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041137','6602fd63666d4ea088041136','Store the result of `points >= 10` in the `levelTwo` variable.','paragraph','always','','Pre'),
('6602fd63666d4ea088041138','6602fd63666d4ea088041136','Make sure to pick `=`, followed by `>=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804113e','6602fd63666d4ea08804113d','Check if `solved` is less than or equal to `minimum`.','paragraph','always','','Pre'),
('6602fd63666d4ea08804113f','6602fd63666d4ea08804113d','Make sure to pick `solved`, followed by `<=`, and finally `minimum`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041146','6602fd63666d4ea088041145','Check if `60` is greater than or equal to `50` with the greater-than-or-equal-to operator, `>=`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041147','6602fd63666d4ea088041145','Make sure to type `>=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804114e','6602fd63666d4ea08804114d','We can use comparisons to check if a string is equal to or not equal to another string.','paragraph','always','','Pre'),
('6602fd63666d4ea08804114f','6602fd63666d4ea08804114d','','image','always','','Pre'),
('6602fd63666d4ea088041151','6602fd63666d4ea088041150','To check if a string is equal to another string, we can use the **strict equality operator**, `===`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041152','6602fd63666d4ea088041150','Make sure to pick `===`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041157','6602fd63666d4ea088041156','If the string on the left is equal to the string on the right, as in `"apple" === "apple"`, the result is `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041158','6602fd63666d4ea088041156','Make sure to pick `"apple"`, followed by `===`, and finally `"apple"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804115f','6602fd63666d4ea08804115e','If the string on the left isn''t equal to the string on the right, as in `"apple" === "orange"`, the result is `false`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041160','6602fd63666d4ea08804115e','Make sure to pick `===`, followed by `"orange"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041166','6602fd63666d4ea088041165','We can also compare variables that store strings with each other, like in `fruit1 === fruit2`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041167','6602fd63666d4ea088041165','Make sure to pick `fruit1`, followed by `===`, and finally `fruit2`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804116e','6602fd63666d4ea08804116d','What can the equality operator, `===`, do?','paragraph','always','','Pre'),
('6602fd63666d4ea08804116f','6602fd63666d4ea08804116d','The equality operator checks if a string is equal to another string.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041174','6602fd63666d4ea088041173','Which of these is the strict equality operator?','paragraph','always','','Pre'),
('6602fd63666d4ea088041175','6602fd63666d4ea088041173','`===` is the equality operator.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804117a','6602fd63666d4ea088041179','What does this display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea08804117b','6602fd63666d4ea088041179','','codeNone','','false','Pre'),
('6602fd63666d4ea08804117d','6602fd63666d4ea088041179','This displays `false` in the console.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041182','6602fd63666d4ea088041181','Which of these comparisons results in `true`?','paragraph','always','','Pre'),
('6602fd63666d4ea088041183','6602fd63666d4ea088041181','`"apple" === "apple"` results in `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041188','6602fd63666d4ea088041187','Check if `myAnswer` is equal to `solution`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041189','6602fd63666d4ea088041187','Make sure to pick `===`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804118e','6602fd63666d4ea08804118d','Store a string in `solution` to make the comparison `false`.','paragraph','always','','Pre'),
('6602fd63666d4ea08804118f','6602fd63666d4ea08804118d','Make sure to pick `"low"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041194','6602fd63666d4ea088041193','Store a string in `item2` to make the result of the comparison `false`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041195','6602fd63666d4ea088041193','Make sure to pick `"pipe"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804119a','6602fd63666d4ea088041199','Check if `"liquid"` is equal to `"solid"` by coding `===`.','paragraph','always','','Pre'),
('6602fd63666d4ea08804119b','6602fd63666d4ea088041199','Make sure to code `===`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411a1','6602fd63666d4ea0880411a0','To check if a string isn''t equal to another string, we use the **strict inequality operator**, `!==`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411a2','6602fd63666d4ea0880411a0','Make sure to pick `!==`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411a7','6602fd63666d4ea0880411a6','If the string on the left isn''t equal to the string on the right, as in `"apple" !== "orange"`, the result is `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411a8','6602fd63666d4ea0880411a6','Make sure to pick `"apple"`, followed by `!==`, and finally `"orange"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411af','6602fd63666d4ea0880411ae','If the string on the left is equal to the string on the right, as in `"orange" !== "orange"`, the result is `false`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411b3','6602fd63666d4ea0880411b2','To store the result of a comparison in a variable, we use the `=` sign.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411b4','6602fd63666d4ea0880411b2','Make sure to pick `=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411b9','6602fd63666d4ea0880411b8','Which of these is `true`?','paragraph','always','','Pre'),
('6602fd63666d4ea0880411ba','6602fd63666d4ea0880411b8','`"black" !== "orange"` results in `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411bf','6602fd63666d4ea0880411be','Which of these is the inequality operator?','paragraph','always','','Pre'),
('6602fd63666d4ea0880411c0','6602fd63666d4ea0880411be','`!==` is the inequality operator.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411c5','6602fd63666d4ea0880411c4','What does this display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea0880411c6','6602fd63666d4ea0880411c4','','codeNone','','true','Pre'),
('6602fd63666d4ea0880411c8','6602fd63666d4ea0880411c4','This displays `true` in the console.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411cd','6602fd63666d4ea0880411cc','What does the inequality operator, `!==`, do?','paragraph','always','','Pre'),
('6602fd63666d4ea0880411ce','6602fd63666d4ea0880411cc','The inequality operator checks if a string isn''t equal to another string.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411d3','6602fd63666d4ea0880411d2','Check if `myAnswer` isn''t equal to `solution`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411d4','6602fd63666d4ea0880411d2','Make sure to pick `!==`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411d9','6602fd63666d4ea0880411d8','Store a string in `wallpaper` to display `false` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411da','6602fd63666d4ea0880411d8','Make sure to pick `"bliss.png"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411df','6602fd63666d4ea0880411de','Store a string in `newLeader` to make the result of the comparison `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411e0','6602fd63666d4ea0880411de','Make sure to pick `"Jim"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411e5','6602fd63666d4ea0880411e4','Check if `bigCity` isn''t equal to `smallCity` by coding `!==`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411e6','6602fd63666d4ea0880411e4','Make sure to pick `!==`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411ed','6602fd63666d4ea0880411ec','We''ve already seen and used a lot of different kinds of values. In programming lingo, these different kind of values are called **types**.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411ee','6602fd63666d4ea0880411ec','','image','always','','Pre'),
('6602fd63666d4ea0880411f0','6602fd63666d4ea0880411ef','Strings are characters between quotes `" "`, like the value `"Cookies"`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411f1','6602fd63666d4ea0880411ef','Make sure to pick `"Cookies"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411f6','6602fd63666d4ea0880411f5','**Number** is another type we''ve already used. It represents numerical values like `42`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411f7','6602fd63666d4ea0880411f5','Make sure to pick `42`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880411fc','6602fd63666d4ea0880411fb','The type **boolean** contains only two values: the special values `true` and `false`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880411fd','6602fd63666d4ea0880411fb','Make sure to pick `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041202','6602fd63666d4ea088041201','When storing `false` in `isOn` we say that we **assign** a value to a variable.','paragraph','always','','Pre'),
('6602fd63666d4ea088041203','6602fd63666d4ea088041201','Make sure to pick `isOn`, followed by `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041209','6602fd63666d4ea088041208','What are values like booleans, strings, and numbers called?','paragraph','always','','Pre'),
('6602fd63666d4ea08804120a','6602fd63666d4ea088041208','Make sure to pick Types.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804120f','6602fd63666d4ea08804120e','How do we recognize values of type **string**?','paragraph','always','','Pre'),
('6602fd63666d4ea088041210','6602fd63666d4ea08804120e','By the quotes `" "` surrounding them .','paragraph','wrong','','Post'),
('6602fd63666d4ea088041215','6602fd63666d4ea088041214','Which value is of type **number**?','paragraph','always','','Pre'),
('6602fd63666d4ea088041216','6602fd63666d4ea088041214','Make sure to pick `42`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804121b','6602fd63666d4ea08804121a','What are the **boolean** values?','paragraph','always','','Pre'),
('6602fd63666d4ea08804121c','6602fd63666d4ea08804121a','`true` and `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041221','6602fd63666d4ea088041220','What is a variable assignment?','paragraph','always','','Pre'),
('6602fd63666d4ea088041222','6602fd63666d4ea088041220','Storing a value inside a variable.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041227','6602fd63666d4ea088041226','Assign a **string** to the `userName` variable, a **number** to `age`, and a **boolean** to `isMale`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041228','6602fd63666d4ea088041226','Make sure to pick `"Joey"`, followed by `28`, and finally `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804122f','6602fd63666d4ea08804122e','Save a **string** value into the variable `firstName`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041230','6602fd63666d4ea08804122e','Make sure to pick `"Jill"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041235','6602fd63666d4ea088041234','Save a **number** value into the variable.','paragraph','always','','Pre'),
('6602fd63666d4ea088041236','6602fd63666d4ea088041234','Make sure to pick `minutesLeft`, followed by `10`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804123c','6602fd63666d4ea08804123b','Give `isOnline` the **boolean** value `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea08804123d','6602fd63666d4ea08804123b','Make sure to type `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041242','6602fd63666d4ea088041241','Assign the value `57` to the `const` variable `score`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041243','6602fd63666d4ea088041241','Make sure to pick `const` followed by `score` and then `=`, `57`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804124c','6602fd63666d4ea08804124b','`+` is the joining or adding sign. When joining two variables, we can get different results depending on their types.','paragraph','always','','Pre'),
('6602fd63666d4ea08804124d','6602fd63666d4ea08804124b','Join the values and take a look at the difference between using `+` with strings, and with numbers.','paragraph','always','','Pre'),
('6602fd63666d4ea08804124e','6602fd63666d4ea08804124b','Make sure to type `+`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041253','6602fd63666d4ea088041252','When joining numbers with strings, the number will be automatically transformed into a string.','paragraph','always','','Pre'),
('6602fd63666d4ea088041254','6602fd63666d4ea088041252','Join the values and take a look at the resulting string.','paragraph','always','','Pre'),
('6602fd63666d4ea088041255','6602fd63666d4ea088041252','Make sure to pick `+`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804125a','6602fd63666d4ea088041259','Combine a string and a number to display a player''s score.','paragraph','always','','Pre'),
('6602fd63666d4ea08804125b','6602fd63666d4ea088041259','Make sure to pick `99`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041260','6602fd63666d4ea08804125f','Adding a number to a string also works when we use a variable like `score` that stores a number, instead of a numeric value.','paragraph','always','','Pre'),
('6602fd63666d4ea088041261','6602fd63666d4ea08804125f','Make sure to pick `score`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041266','6602fd63666d4ea088041265','We can also join strings and booleans.','paragraph','always','','Pre'),
('6602fd63666d4ea088041267','6602fd63666d4ea088041265','Combine a string and a boolean to display a student''s result. Did they pass?','paragraph','always','','Pre'),
('6602fd63666d4ea088041268','6602fd63666d4ea088041265','Make sure to pick `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804126d','6602fd63666d4ea08804126c','Again, adding a boolean to a string also works when we use a variable like `pass`, that stores a boolean.','paragraph','always','','Pre'),
('6602fd63666d4ea08804126e','6602fd63666d4ea08804126c','Make sure to pick `pass`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041273','6602fd63666d4ea088041272','Which sign do we use to add or join two values?','paragraph','always','','Pre'),
('6602fd63666d4ea088041274','6602fd63666d4ea088041272','We use `+` to add or join two values.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041279','6602fd63666d4ea088041278','What type is the result of joining a string with a number?','paragraph','always','','Pre'),
('6602fd63666d4ea08804127a','6602fd63666d4ea088041278','Make sure to pick string.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804127f','6602fd63666d4ea08804127e','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088041280','6602fd63666d4ea08804127e','','codeNone','','10 years old','Pre'),
('6602fd63666d4ea088041282','6602fd63666d4ea08804127e','`10 years old`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041287','6602fd63666d4ea088041286','What does this code display in the console?
','paragraph','always','','Pre'),
('6602fd63666d4ea088041288','6602fd63666d4ea088041286','','codeNone','','3$','Pre'),
('6602fd63666d4ea08804128a','6602fd63666d4ea088041286','Make sure to pick `3$`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804128f','6602fd63666d4ea08804128e','What is the result of joining a string and a boolean?','paragraph','always','','Pre'),
('6602fd63666d4ea088041290','6602fd63666d4ea08804128e','A string.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041295','6602fd63666d4ea088041294','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088041296','6602fd63666d4ea088041294','','codeNone','','Inbox full: true','Pre'),
('6602fd63666d4ea088041298','6602fd63666d4ea088041294','`Inbox full: true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804129d','6602fd63666d4ea08804129c','Add the number values to get the final score of the player.','paragraph','always','','Pre'),
('6602fd63666d4ea08804129e','6602fd63666d4ea08804129c','Make sure to type `+`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412a3','6602fd63666d4ea0880412a2','Add a string value to the numerical value and check out the string result.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412a4','6602fd63666d4ea0880412a2','Make sure to pick `+`, followed by `"10"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412aa','6602fd63666d4ea0880412a9','Add a number value to the string.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412ab','6602fd63666d4ea0880412a9','Make sure to pick `+`, followed by `2`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412b1','6602fd63666d4ea0880412b0','Code the string value, then add the number variable.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412b2','6602fd63666d4ea0880412b0','Make sure to pick `"Entry fee: "`, followed by `+`, and finally `fee`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412b9','6602fd63666d4ea0880412b8','Add a boolean value to the string.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412ba','6602fd63666d4ea0880412b8','Make sure to pick `+`, followed by `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412c0','6602fd63666d4ea0880412bf','Add the boolean variable `isWinner` to the string.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412c1','6602fd63666d4ea0880412bf','Make sure to type `isWinner`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412c8','6602fd63666d4ea0880412c7','With logical operators, we can connect two or more conditions to decide a result.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412c9','6602fd63666d4ea0880412c7','Turn on the light bulb by connecting both the switch and battery.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412ca','6602fd63666d4ea0880412c7','<!doctype html> 
<html> 
 <head> 
  <style> 
   @import url(''https://fonts.googleapis.com/css2?family=Montserrat&display=swap''); 
 
   body { 
    font-family: ''Montserrat''; 
   } 
    
   h5 { 
    background-color: orange; 
    padding: 5px; 
    margin-top: -10px; 
   } 
    
   h5, 
   #bulb { 
    text-align: center; 
   } 
    
   img { 
    width: 60px; 
   } 
    
   span { 
    font-weight: bold; 
   } 
    
   button { 
    margin: 5px; 
    padding: 5px; 
   } 
    
   #flex { 
    display: flex; 
    flex-direction: row; 
    justify-content: space-around; 
   } 
    
   #battery, 
   #switch { 
    text-align: center; 
   } 
    
   #battery { 
    margin-top: 30px 
   } 
    
   #bulb { 
    margin-top: -20px; 
   } 
    
   #switchImg { 
    width: 50px; 
   } 
  </style> 
 </head> 
 <body> 
  <div id="container"> 
   <h5>Light the bulb</h5> 
   <div id="bulb"> 
    <img id="bulbImg" src="https://mimo.app/i/light-bulb-off.png" /> 
    <p>Bulb is <span id="bulbState">off</span></p> 
   </div> 
   <div id="flex"> 
    <div id="battery"> 
     <img id="battImg" src="https://mimo.app/i/battery-off.png" /> 
     <br> 
     <button id="battBtn">Connect</button> 
     <p>Is battery connected? <span id="battState">No.</span></p> 
    </div> 
    <div id="switch"> 
     <img id="switchImg" src="https://mimo.app/i/switch-off.png" /> 
     <br> 
     <button id="switchBtn">On</button> 
     <p>Is switch on? <span id="switchState">No.</span></p> 
    </div> 
   </div> 
  </div> 
  <script> 
   const bulbImages = [''https://mimo.app/i/light-bulb-off.png'', 
    ''https://mimo.app/i/light-bulb-on.png'' 
   ]; 
   const battImages = [''https://mimo.app/i/battery-off.png'', 
    ''https://mimo.app/i/battery-on.png'' 
   ]; 
   const switchImages = [''https://mimo.app/i/switch-off.png'', 
    ''https://mimo.app/i/switch-on.png'' 
   ]; 
   let battStatus = 0; 
   let switchStatus = 0; 
   const battBtn = document.querySelector("#battBtn"); 
   const switchBtn = document.querySelector("#switchBtn"); 
   const bulbImg = document.querySelector("#bulbImg"); 
   const battImg = document.querySelector("#battImg"); 
   const switchImg = document.querySelector("#switchImg"); 
   const bulbSpan = document.querySelector("#bulbState"); 
   const battSpan = document.querySelector("#battState"); 
   const switchSpan = document.querySelector("#switchState"); 
   const bulbStates = [''on'', ''off'']; 
   const otherStates = [''Yes.'', ''No.'']; 
   battBtn.onclick = function() { 
    if (battStatus === 0) { 
     battStatus = 1; 
     battBtn.innerHTML = "Disconnect"; 
     battImg.src = battImages[1]; 
     battSpan.innerHTML = otherStates[0]; 
    } else { 
     battStatus = 0; 
     battBtn.innerHTML = "Connect"; 
     battImg.src = battImages[0]; 
     battSpan.innerHTML = otherStates[1]; 
    } 
    bulbWorking(); 
   } 
   switchBtn.onclick = function() { 
    if (switchStatus === 0) { 
     switchStatus = 1; 
     switchBtn.innerHTML = "Off"; 
     switchImg.src = switchImages[1]; 
     switchSpan.innerHTML = otherStates[0]; 
    } else { 
     switchStatus = 0; 
     switchBtn.innerHTML = "On"; 
     switchImg.src = switchImages[0]; 
     switchSpan.innerHTML = otherStates[1]; 
    } 
    bulbWorking(); 
   } 
    
   function bulbWorking() { 
    if (battStatus === 1 && switchStatus === 1) { 
     bulbImg.src = bulbImages[1]; 
     bulbSpan.innerHTML = bulbStates[0]; 
    } else { 
     bulbImg.src = bulbImages[0]; 
     bulbSpan.innerHTML = bulbStates[1]; 
    } 
   } 
  </script> 
 </body> 
</html>','webview','always','','Pre'),
('6602fd63666d4ea0880412cc','6602fd63666d4ea0880412cb','A logical operator connects the two conditions for the battery and switch to decide if the bulb must be turned on or off.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412cd','6602fd63666d4ea0880412cb','<!doctype html> 
<html> 
 <head> 
  <style> 
   @import url(''https://fonts.googleapis.com/css2?family=Montserrat&display=swap''); 
 
   body { 
    font-family: ''Montserrat''; 
   } 
    
   h5 { 
    background-color: orange; 
    padding: 5px; 
    margin-top: -10px; 
   } 
    
   h5, 
   #bulb { 
    text-align: center; 
   } 
    
   img { 
    width: 60px; 
   } 
    
   span { 
    font-weight: bold; 
   } 
    
   button { 
    margin: 5px; 
    padding: 5px; 
   } 
    
   #flex { 
    display: flex; 
    flex-direction: row; 
    justify-content: space-around; 
   } 
    
   #battery, 
   #switch { 
    text-align: center; 
   } 
    
   #battery { 
    margin-top: 30px 
   } 
    
   #bulb { 
    margin-top: -20px; 
   } 
    
   #switchImg { 
    width: 50px; 
   } 
  </style> 
 </head> 
 <body> 
  <div id="container"> 
   <h5>Light the bulb</h5> 
   <div id="bulb"> 
    <img id="bulbImg" src="https://mimo.app/i/light-bulb-off.png" /> 
    <p>Bulb is <span id="bulbState">off</span></p> 
   </div> 
   <div id="flex"> 
    <div id="battery"> 
     <img id="battImg" src="https://mimo.app/i/battery-off.png" /> 
     <br> 
     <button id="battBtn">Connect</button> 
     <p>Is battery connected? <span id="battState">No.</span></p> 
    </div> 
    <div id="switch"> 
     <img id="switchImg" src="https://mimo.app/i/switch-off.png" /> 
     <br> 
     <button id="switchBtn">On</button> 
     <p>Is switch on? <span id="switchState">No.</span></p> 
    </div> 
   </div> 
  </div> 
  <script> 
   const bulbImages = [''https://mimo.app/i/light-bulb-off.png'', 
    ''https://mimo.app/i/light-bulb-on.png'' 
   ]; 
   const battImages = [''https://mimo.app/i/battery-off.png'', 
    ''https://mimo.app/i/battery-on.png'' 
   ]; 
   const switchImages = [''https://mimo.app/i/switch-off.png'', 
    ''https://mimo.app/i/switch-on.png'' 
   ]; 
   let battStatus = 0; 
   let switchStatus = 0; 
   const battBtn = document.querySelector("#battBtn"); 
   const switchBtn = document.querySelector("#switchBtn"); 
   const bulbImg = document.querySelector("#bulbImg"); 
   const battImg = document.querySelector("#battImg"); 
   const switchImg = document.querySelector("#switchImg"); 
   const bulbSpan = document.querySelector("#bulbState"); 
   const battSpan = document.querySelector("#battState"); 
   const switchSpan = document.querySelector("#switchState"); 
   const bulbStates = [''on'', ''off'']; 
   const otherStates = [''Yes.'', ''No.'']; 
   battBtn.onclick = function() { 
    if (battStatus === 0) { 
     battStatus = 1; 
     battBtn.innerHTML = "Disconnect"; 
     battImg.src = battImages[1]; 
     battSpan.innerHTML = otherStates[0]; 
    } else { 
     battStatus = 0; 
     battBtn.innerHTML = "Connect"; 
     battImg.src = battImages[0]; 
     battSpan.innerHTML = otherStates[1]; 
    } 
    bulbWorking(); 
   } 
   switchBtn.onclick = function() { 
    if (switchStatus === 0) { 
     switchStatus = 1; 
     switchBtn.innerHTML = "Off"; 
     switchImg.src = switchImages[1]; 
     switchSpan.innerHTML = otherStates[0]; 
    } else { 
     switchStatus = 0; 
     switchBtn.innerHTML = "On"; 
     switchImg.src = switchImages[0]; 
     switchSpan.innerHTML = otherStates[1]; 
    } 
    bulbWorking(); 
   } 
    
   function bulbWorking() { 
    if (battStatus === 1 && switchStatus === 1) { 
     bulbImg.src = bulbImages[1]; 
     bulbSpan.innerHTML = bulbStates[0]; 
    } else { 
     bulbImg.src = bulbImages[0]; 
     bulbSpan.innerHTML = bulbStates[1]; 
    } 
   } 
  </script> 
 </body> 
</html>','webview','always','','Pre'),
('6602fd63666d4ea0880412cf','6602fd63666d4ea0880412ce','The **AND** operator `&&` returns `true` only if all the conditions are `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412d0','6602fd63666d4ea0880412ce','Make sure to type `&&`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412d5','6602fd63666d4ea0880412d4','The `&&` operator will return `false` if one or more conditions are `false`. In the code, assign `false` to the `isSwitchOn` variable.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412d6','6602fd63666d4ea0880412d4','Make sure to type `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412db','6602fd63666d4ea0880412da','When operands and operators compute a boolean value together, it forms a logical expression, like `isBatteryOn && isSwitchOn`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412dc','6602fd63666d4ea0880412da','Make sure to pick `isBatteryOn`, followed by `&&`, and finally `isSwitchOn`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412e3','6602fd63666d4ea0880412e2','You can also store the result of a logical expression in a variable.','paragraph','always','','Pre'),
('6602fd63666d4ea0880412e4','6602fd63666d4ea0880412e2','Make sure to pick `let`, followed by `result`, and finally `=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412eb','6602fd63666d4ea0880412ea','Which logical operator gives us `true` if all the conditions are `true`?','paragraph','always','','Pre'),
('6602fd63666d4ea0880412ec','6602fd63666d4ea0880412ea','Make sure to pick `&&`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412f1','6602fd63666d4ea0880412f0','What does this code print in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea0880412f2','6602fd63666d4ea0880412f0','','codeNone','','false','Pre'),
('6602fd63666d4ea0880412f4','6602fd63666d4ea0880412f0','Make sure to pick `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412f9','6602fd63666d4ea0880412f8','Which of the following is a logical expression?','paragraph','always','','Pre'),
('6602fd63666d4ea0880412fa','6602fd63666d4ea0880412f8','`condition1 && condition2`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880412ff','6602fd63666d4ea0880412fe','What does this code display in the console for the `result` variable? `true` or `false`? Go through the code step by step to figure it out.','paragraph','always','','Pre'),
('6602fd63666d4ea088041300','6602fd63666d4ea0880412fe','','codeNone','','10
result: true','Pre'),
('6602fd63666d4ea088041302','6602fd63666d4ea0880412fe','Make sure to pick `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041307','6602fd63666d4ea088041306','Check if a driver''s license can be issued to a person. Their age should be 18 or more and they should pass the driving test.','paragraph','always','','Pre'),
('6602fd63666d4ea088041308','6602fd63666d4ea088041306','Make sure to type `&&`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804130d','6602fd63666d4ea08804130c','Check if the user can send an e-mail. For that, the recipient should be valid and the subject should be filled.','paragraph','always','','Pre'),
('6602fd63666d4ea08804130e','6602fd63666d4ea08804130c','Make sure to pick `&&`, followed by `isSubjectFilled`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041314','6602fd63666d4ea088041313','Store the logical expression in a `const` variable.','paragraph','always','','Pre'),
('6602fd63666d4ea088041315','6602fd63666d4ea088041313','Make sure to pick `const`, followed by `result`, and finally `=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804131c','6602fd63666d4ea08804131b','Store a logical expression in the `willSiteLoad` variable that checks if the WiFi is connected and the URL is valid to load a website.','paragraph','always','','Pre'),
('6602fd63666d4ea08804131d','6602fd63666d4ea08804131b','Make sure to type `&&`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041323','6602fd63666d4ea088041322','We''ve seen that the AND operator requires all conditions to be true. But what if it''s enough for only one condition to be true?','paragraph','always','','Pre'),
('6602fd63666d4ea088041324','6602fd63666d4ea088041322','<!doctype html> 
<html> 
 <head> 
  <style> 
   @import url(''https://fonts.googleapis.com/css2?family=Montserrat&display=swap''); 
 
   body { 
    font-family: ''Montserrat''; 
   } 
    
   h5, 
   #bulb { 
    text-align: center; 
   } 
    
   h5 { 
    background-color: orange; 
    padding: 5px; 
    margin-top: -10px; 
   } 
    
   img { 
    width: 60px; 
   } 
    
   span { 
    font-weight: bold; 
   } 
    
   button { 
    margin: 5px; 
    padding: 5px; 
   } 
    
   #flex { 
    display: flex; 
    flex-direction: row; 
    justify-content: space-around; 
   } 
    
   #battery, 
   #switch { 
    text-align: center; 
   } 
 
   #bulb{ 
    margin-top: -10px; 
   } 
 
   #switch{ 
    margin-top: -20px; 
   } 
    
   #battery { 
    margin-top: 20px 
   } 
 
  </style> 
 </head> 
 <body> 
  <h5>Light the bulb</h5> 
  <div id="bulb"> 
   <img id="bulbImg" src="https://mimo.app/i/light-bulb-off.png" /> 
   <p>Bulb is <span id="bulbState">off</span></p> 
  </div> 
  <div id="flex"> 
   <div id="battery"> 
    <img id="battImg" src="https://mimo.app/i/battery-off.png" /> 
    <br> 
    <button id="battBtn">Connect</button> 
    <p>Is battery connected? <span id="battState">No.</span></p> 
   </div> 
   <div id="switch"> 
    <img id="switchImg" 
     src="https://mimo.app/i/electricity-off.png" /> 
    <br> 
    <button id="switchBtn">On</button> 
    <p>Is power connected? <span id="switchState">No.</span></p> 
   </div> 
  </div> 
  <script> 
   const bulbImages = [''https://mimo.app/i/light-bulb-off.png'', 
    ''https://mimo.app/i/light-bulb-on.png'' 
   ]; 
   const battImages = [''https://mimo.app/i/battery-off.png'', 
    ''https://mimo.app/i/battery-on.png'' 
   ]; 
   const switchImages = [''https://mimo.app/i/electricity-off.png'', 
    ''https://mimo.app/i/electricity-on.png'' 
   ]; 
   let battStatus = 0; 
   let switchStatus = 0; 
   const battBtn = document.querySelector("#battBtn"); 
   const switchBtn = document.querySelector("#switchBtn"); 
   const bulbImg = document.querySelector("#bulbImg"); 
   const battImg = document.querySelector("#battImg"); 
   const switchImg = document.querySelector("#switchImg"); 
   const bulbSpan = document.querySelector("#bulbState"); 
   const battSpan = document.querySelector("#battState"); 
   const switchSpan = document.querySelector("#switchState"); 
   const bulbStates = [''on'', ''off'']; 
   const otherStates = [''Yes.'', ''No.'']; 
   battBtn.onclick = function() { 
    if (battStatus === 0) { 
     battStatus = 1; 
     battBtn.innerHTML = "Disconnect"; 
     battImg.src = battImages[1]; 
     battSpan.innerHTML = otherStates[0]; 
    } else { 
     battStatus = 0; 
     battBtn.innerHTML = "Connect"; 
     battImg.src = battImages[0]; 
     battSpan.innerHTML = otherStates[1]; 
    } 
    bulbWorking(); 
   } 
   switchBtn.onclick = function() { 
    if (switchStatus === 0) { 
     switchStatus = 1; 
     switchBtn.innerHTML = "Off"; 
     switchImg.src = switchImages[1]; 
     switchSpan.innerHTML = otherStates[0]; 
    } else { 
     switchStatus = 0; 
     switchBtn.innerHTML = "On"; 
     switchImg.src = switchImages[0]; 
     switchSpan.innerHTML = otherStates[1]; 
    } 
    bulbWorking(); 
   } 
    
   function bulbWorking() { 
    if (battStatus === 1 || switchStatus === 1) { 
     bulbImg.src = bulbImages[1]; 
     bulbSpan.innerHTML = bulbStates[0]; 
    } else { 
     bulbImg.src = bulbImages[0]; 
     bulbSpan.innerHTML = bulbStates[1]; 
    } 
   } 
  </script> 
 </body> 
</html>','webview','always','','Pre'),
('6602fd63666d4ea088041326','6602fd63666d4ea088041325','For example, the light bulb here switches on if the battery is connected _or_ the power is connected.','paragraph','always','','Pre'),
('6602fd63666d4ea088041327','6602fd63666d4ea088041325','<!doctype html> 
<html> 
 <head> 
  <style> 
   @import url(''https://fonts.googleapis.com/css2?family=Montserrat&display=swap''); 
 
   body { 
    font-family: ''Montserrat''; 
   } 
    
   h5, 
   #bulb { 
    text-align: center; 
   } 
    
   h5 { 
    background-color: orange; 
    padding: 5px; 
    margin-top: -10px; 
   } 
    
   img { 
    width: 60px; 
   } 
    
   span { 
    font-weight: bold; 
   } 
    
   button { 
    margin: 5px; 
    padding: 5px; 
   } 
    
   #flex { 
    display: flex; 
    flex-direction: row; 
    justify-content: space-around; 
   } 
    
   #battery, 
   #switch { 
    text-align: center; 
   } 
 
   #bulb{ 
    margin-top: -10px; 
   } 
 
   #switch{ 
    margin-top: -20px; 
   } 
    
   #battery { 
    margin-top: 20px 
   } 
 
  </style> 
 </head> 
 <body> 
  <h5>Light the bulb</h5> 
  <div id="bulb"> 
   <img id="bulbImg" src="https://mimo.app/i/light-bulb-off.png" /> 
   <p>Bulb is <span id="bulbState">off</span></p> 
  </div> 
  <div id="flex"> 
   <div id="battery"> 
    <img id="battImg" src="https://mimo.app/i/battery-off.png" /> 
    <br> 
    <button id="battBtn">Connect</button> 
    <p>Is battery connected? <span id="battState">No.</span></p> 
   </div> 
   <div id="switch"> 
    <img id="switchImg" 
     src="https://mimo.app/i/electricity-off.png" /> 
    <br> 
    <button id="switchBtn">On</button> 
    <p>Is power connected? <span id="switchState">No.</span></p> 
   </div> 
  </div> 
  <script> 
   const bulbImages = [''https://mimo.app/i/light-bulb-off.png'', 
    ''https://mimo.app/i/light-bulb-on.png'' 
   ]; 
   const battImages = [''https://mimo.app/i/battery-off.png'', 
    ''https://mimo.app/i/battery-on.png'' 
   ]; 
   const switchImages = [''https://mimo.app/i/electricity-off.png'', 
    ''https://mimo.app/i/electricity-on.png'' 
   ]; 
   let battStatus = 0; 
   let switchStatus = 0; 
   const battBtn = document.querySelector("#battBtn"); 
   const switchBtn = document.querySelector("#switchBtn"); 
   const bulbImg = document.querySelector("#bulbImg"); 
   const battImg = document.querySelector("#battImg"); 
   const switchImg = document.querySelector("#switchImg"); 
   const bulbSpan = document.querySelector("#bulbState"); 
   const battSpan = document.querySelector("#battState"); 
   const switchSpan = document.querySelector("#switchState"); 
   const bulbStates = [''on'', ''off'']; 
   const otherStates = [''Yes.'', ''No.'']; 
   battBtn.onclick = function() { 
    if (battStatus === 0) { 
     battStatus = 1; 
     battBtn.innerHTML = "Disconnect"; 
     battImg.src = battImages[1]; 
     battSpan.innerHTML = otherStates[0]; 
    } else { 
     battStatus = 0; 
     battBtn.innerHTML = "Connect"; 
     battImg.src = battImages[0]; 
     battSpan.innerHTML = otherStates[1]; 
    } 
    bulbWorking(); 
   } 
   switchBtn.onclick = function() { 
    if (switchStatus === 0) { 
     switchStatus = 1; 
     switchBtn.innerHTML = "Off"; 
     switchImg.src = switchImages[1]; 
     switchSpan.innerHTML = otherStates[0]; 
    } else { 
     switchStatus = 0; 
     switchBtn.innerHTML = "On"; 
     switchImg.src = switchImages[0]; 
     switchSpan.innerHTML = otherStates[1]; 
    } 
    bulbWorking(); 
   } 
    
   function bulbWorking() { 
    if (battStatus === 1 || switchStatus === 1) { 
     bulbImg.src = bulbImages[1]; 
     bulbSpan.innerHTML = bulbStates[0]; 
    } else { 
     bulbImg.src = bulbImages[0]; 
     bulbSpan.innerHTML = bulbStates[1]; 
    } 
   } 
  </script> 
 </body> 
</html>','webview','always','','Pre'),
('6602fd63666d4ea088041329','6602fd63666d4ea088041328','For such conditions, we use the **OR** operator `||`, which returns `true` as long as at least one of the conditions is `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea08804132a','6602fd63666d4ea088041328','Make sure to type `||`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804132f','6602fd63666d4ea08804132e','If all the conditions are `false`, then the `||` operator returns `false`. Set the `isPowerOn` variable to `false`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041330','6602fd63666d4ea08804132e','Make sure to type `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041335','6602fd63666d4ea088041334','We know that the **NOT** operator `!` negates a boolean value. That means that it returns `true` if a condition is `false` and vice versa.','paragraph','always','','Pre'),
('6602fd63666d4ea088041336','6602fd63666d4ea088041334','Make sure to type `!`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804133b','6602fd63666d4ea08804133a','We can use `!` to negate logical expressions as well. To do that, we place the logical expression between parentheses.','paragraph','always','','Pre'),
('6602fd63666d4ea08804133c','6602fd63666d4ea08804133a','Make sure to pick `!`, followed by `(`, and finally `)`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041343','6602fd63666d4ea088041342','The logical expression returns `false` but by negating it, we get `true`.','paragraph','always','','Pre'),
('6602fd63666d4ea088041344','6602fd63666d4ea088041342','Make sure to type `!`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041349','6602fd63666d4ea088041348','Which logical operator returns `true` if at least one of the conditions is `true`?','paragraph','always','','Pre'),
('6602fd63666d4ea08804134a','6602fd63666d4ea088041348','Make sure to pick `||`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804134f','6602fd63666d4ea08804134e','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088041350','6602fd63666d4ea08804134e','','codeNone','','false','Pre'),
('6602fd63666d4ea088041352','6602fd63666d4ea08804134e','Make sure to pick false.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041357','6602fd63666d4ea088041356','Which operator do we use to reverse the outcome of a logical expression?','paragraph','always','','Pre'),
('6602fd63666d4ea088041358','6602fd63666d4ea088041356','Make sure to pick `!`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804135d','6602fd63666d4ea08804135c','Which of the following code snippets negates the logical expression?','paragraph','always','','Pre'),
('6602fd63666d4ea08804135e','6602fd63666d4ea08804135c','`!(condition1 && condition2)`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041363','6602fd63666d4ea088041362','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea088041364','6602fd63666d4ea088041362','','codeNone','','true','Pre'),
('6602fd63666d4ea088041366','6602fd63666d4ea088041362','Make sure to pick `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804136b','6602fd63666d4ea08804136a','Check if a person can buy a car depending on whether their loan is approved _or_ their cash amount is greater than the car cost.','paragraph','always','','Pre'),
('6602fd63666d4ea08804136c','6602fd63666d4ea08804136a','Make sure to pick `||`, followed by `>`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041372','6602fd63666d4ea088041371','Save the opposite of `isLoanRejected` into the variable.','paragraph','always','','Pre'),
('6602fd63666d4ea088041373','6602fd63666d4ea088041371','Make sure to type `!`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041378','6602fd63666d4ea088041377','Check if a person can buy a car or not.','paragraph','always','','Pre'),
('6602fd63666d4ea088041379','6602fd63666d4ea088041377','Make sure to type `=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804137e','6602fd63666d4ea08804137d','Use the `||` and `!` operators to determine if a user can post, by checking if any attachment is added _or_ if the text field is _not_ empty.','paragraph','always','','Pre'),
('6602fd63666d4ea08804137f','6602fd63666d4ea08804137d','Make sure to pick `||`, followed by `!`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041385','6602fd63666d4ea088041384','Save a file if the cloud storage is greater than the file size _or_ the system storage is greater than the file size.','paragraph','always','','Pre'),
('6602fd63666d4ea088041386','6602fd63666d4ea088041384','Make sure to pick `>`, followed by `||`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804138e','6602fd63666d4ea08804138d','Which operator stores the result of a comparison in a variable?','paragraph','always','','Pre'),
('6602fd63666d4ea08804138f','6602fd63666d4ea08804138d','Make sure to choose `=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041395','6602fd63666d4ea088041394','Which operator do we need to check if a number on the left side of the statement is less than or equal to `21`?','paragraph','always','','Pre'),
('6602fd63666d4ea088041396','6602fd63666d4ea088041394','Make sure to choose `<=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804139c','6602fd63666d4ea08804139b','Store the result of the comparison in `pass`.','paragraph','always','','Pre'),
('6602fd63666d4ea08804139d','6602fd63666d4ea08804139b','Make sure to pick `const` followed by `pass` and then `=`, `score >= minScore`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413a5','6602fd63666d4ea0880413a4','Make this code display `true` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea0880413a6','6602fd63666d4ea0880413a4','Make sure to pick `21`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413ab','6602fd63666d4ea0880413aa','Check if `score` is greater than or equal to `minScore` with the greater-than-or-equal-to operator.','paragraph','always','','Pre'),
('6602fd63666d4ea0880413ac','6602fd63666d4ea0880413aa','Make sure to type `>=`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413b1','6602fd63666d4ea0880413b0','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea0880413b2','6602fd63666d4ea0880413b0','','codeNone','','true','Pre'),
('6602fd63666d4ea0880413b4','6602fd63666d4ea0880413b0','Make sure to pick `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413ba','6602fd63666d4ea0880413b9','Use a comparison operator to compare `score` to `expected` that displays `false` in the console.','paragraph','always','','Pre'),
('6602fd63666d4ea0880413bb','6602fd63666d4ea0880413b9','Make sure to pick `===`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413c0','6602fd63666d4ea0880413bf','What does `!==` do?','paragraph','always','','Pre'),
('6602fd63666d4ea0880413c1','6602fd63666d4ea0880413bf','It checks if a string isn''t equal to another string.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413c7','6602fd63666d4ea0880413c6','Check if `"Apple"` isn''t equal to `"Nokia"`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880413c8','6602fd63666d4ea0880413c6','Make sure to type `!==`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413cd','6602fd63666d4ea0880413cc','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea0880413ce','6602fd63666d4ea0880413cc','','codeNone','','false','Pre'),
('6602fd63666d4ea0880413d0','6602fd63666d4ea0880413cc','Make sure to pick `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413d6','6602fd63666d4ea0880413d5','Create a `const` variable that contains a number.','paragraph','always','','Pre'),
('6602fd63666d4ea0880413d7','6602fd63666d4ea0880413d5','Make sure to pick `const` followed by `score` and then `=`, `2`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413df','6602fd63666d4ea0880413de','Save the value `101` into the `const` variable `result`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880413e0','6602fd63666d4ea0880413de','Make sure to pick `const result`, followed by `+`, and finally `1`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413e7','6602fd63666d4ea0880413e6','What type does `message` have?','paragraph','always','','Pre'),
('6602fd63666d4ea0880413e8','6602fd63666d4ea0880413e6','','codeNone','','Ticket booked: true','Pre'),
('6602fd63666d4ea0880413ea','6602fd63666d4ea0880413e6','Make sure to pick String.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413f0','6602fd63666d4ea0880413ef','Save the value `"1001"` into the variable `result`.','paragraph','always','','Pre'),
('6602fd63666d4ea0880413f1','6602fd63666d4ea0880413ef','Make sure to pick `"100"`, followed by `+`, and finally `1`.','paragraph','wrong','','Post'),
('6602fd63666d4ea0880413f8','6602fd63666d4ea0880413f7','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea0880413f9','6602fd63666d4ea0880413f7','','codeNone','','Repeat song: true','Pre'),
('6602fd63666d4ea0880413fb','6602fd63666d4ea0880413f7','The string `"Repeat song: true"`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041401','6602fd63666d4ea088041400','Users can log in if they _don''t_ fail the bot test. Use an operator to check if the user can log in.','paragraph','always','','Pre'),
('6602fd63666d4ea088041402','6602fd63666d4ea088041400','Make sure to pick `!`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041407','6602fd63666d4ea088041406','What is the difference between `&&` and `||`?','paragraph','always','','Pre'),
('6602fd63666d4ea088041408','6602fd63666d4ea088041406','`&&` returns `true` only when all the conditions are `true`, `||` returns `true` when at least one condition is `true`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804140e','6602fd63666d4ea08804140d','What does this code display in the console?','paragraph','always','','Pre'),
('6602fd63666d4ea08804140f','6602fd63666d4ea08804140d','','codeNone','','false','Pre'),
('6602fd63666d4ea088041411','6602fd63666d4ea08804140d','Make sure to pick `false`.','paragraph','wrong','','Post'),
('6602fd63666d4ea088041417','6602fd63666d4ea088041416','Check if the code is working or not. The code works if the tests are running _or_ the output is giving desired result.','paragraph','always','','Pre'),
('6602fd63666d4ea088041418','6602fd63666d4ea088041416','Make sure to pick `testsRun`, followed by `||`, and finally `outputShows`.','paragraph','wrong','','Post'),
('6602fd63666d4ea08804141f','6602fd63666d4ea08804141e','Check if the stock is available or not.','paragraph','always','','Pre'),
('6602fd63666d4ea088041420','6602fd63666d4ea08804141e','Make sure to type `!`.','paragraph','wrong','','Post');






INSERT INTO "interaction_module" ("id","lesson_id","type","output","wrong_options","is_code")
VALUES
('6602fd05a8fc89e974fa3f3c','6602fd05a8fc89e974fa3f39','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa3f43','6602fd05a8fc89e974fa3f3f','codeFillTheGap','','["home city"]',FALSE),
('6602fd05a8fc89e974fa3f49','6602fd05a8fc89e974fa3f46','codeFillTheGap','','["+"]',FALSE),
('6602fd05a8fc89e974fa3f51','6602fd05a8fc89e974fa3f4c','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa3f57','6602fd05a8fc89e974fa3f54','codeFillTheGap','','["hcp"]',FALSE),
('6602fd05a8fc89e974fa3f5d','6602fd05a8fc89e974fa3f5a','codeFillTheGap','','["hs","h_s"]',FALSE),
('6602fd05a8fc89e974fa3f63','6602fd05a8fc89e974fa3f60','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa3f69','6602fd05a8fc89e974fa3f66','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa3f6f','6602fd05a8fc89e974fa3f6c','codeFillTheGap','','["+"]',FALSE),
('6602fd05a8fc89e974fa3f76','6602fd05a8fc89e974fa3f73','codeValidatedInput','',NULL,FALSE),
('6602fd05a8fc89e974fa3f7d','6602fd05a8fc89e974fa3f7a','codeFillTheGap','','["text"]',FALSE),
('6602fd05a8fc89e974fa3f84','6602fd05a8fc89e974fa3f80','codeValidatedInput','',NULL,FALSE),
('6602fd05a8fc89e974fa3f8a','6602fd05a8fc89e974fa3f87','codeFillTheGap','','[]',FALSE),
('6602fd05a8fc89e974fa3f91','6602fd05a8fc89e974fa3f8e','codeFillTheGap','','[".","."]',FALSE),
('6602fd05a8fc89e974fa3f98','6602fd05a8fc89e974fa3f95','codeFillTheGap','','[]',FALSE),
('6602fd05a8fc89e974fa3fa2','6602fd05a8fc89e974fa3f9d','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa3fa8','6602fd05a8fc89e974fa3fa5','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa3fb0','6602fd05a8fc89e974fa3fab','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa3fb8','6602fd05a8fc89e974fa3fb3','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa3fbe','6602fd05a8fc89e974fa3fbb','codeFillTheGap','','[]',FALSE),
('6602fd05a8fc89e974fa3fc6','6602fd05a8fc89e974fa3fc3','codeFillTheGap','','["Apple"]',FALSE),
('6602fd05a8fc89e974fa3fcd','6602fd05a8fc89e974fa3fca','codeFillTheGap','','[]',FALSE),
('6602fd05a8fc89e974fa3fd6','6602fd05a8fc89e974fa3fd3','codeValidatedInput','',NULL,FALSE),
('6602fd05a8fc89e974fa3fe2','6602fd05a8fc89e974fa3fde','codeFillTheGap','','[]',FALSE),
('6602fd05a8fc89e974fa3fea','6602fd05a8fc89e974fa3fe7','codeFillTheGap','Hello, World!','[]',FALSE),
('6602fd05a8fc89e974fa3ff0','6602fd05a8fc89e974fa3fed','codeFillTheGap','3, 2, 1
GO!','[]',FALSE),
('6602fd05a8fc89e974fa3ff8','6602fd05a8fc89e974fa3ff5','codeFillTheGap','Hello, World!','["print","(",")"]',FALSE),
('6602fd05a8fc89e974fa3ffe','6602fd05a8fc89e974fa3ffb','codeFillTheGap','Daenerys','["\"Daenerys\""]',FALSE),
('6602fd05a8fc89e974fa4004','6602fd05a8fc89e974fa4001','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa400a','6602fd05a8fc89e974fa4007','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4010','6602fd05a8fc89e974fa400d','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4018','6602fd05a8fc89e974fa4013','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa401e','6602fd05a8fc89e974fa401b','codeFillTheGap','daily','[]',FALSE),
('6602fd05a8fc89e974fa4025','6602fd05a8fc89e974fa4022','codeFillTheGap','Buzz','[]',FALSE),
('6602fd05a8fc89e974fa402c','6602fd05a8fc89e974fa4029','codeFillTheGap','Lightyear','[]',FALSE),
('6602fd05a8fc89e974fa4035','6602fd05a8fc89e974fa4032','codeValidatedInput','Sheriff',NULL,FALSE),
('6602fd05a8fc89e974fa403d','6602fd05a8fc89e974fa403a','codeFillTheGap','Relaxing at the beach','[":"]',FALSE),
('6602fd05a8fc89e974fa4043','6602fd05a8fc89e974fa4040','codeFillTheGap','Complete
New data required','[]',FALSE),
('6602fd05a8fc89e974fa404b','6602fd05a8fc89e974fa4048','codeFillTheGap','upload','["print","()"]',FALSE),
('6602fd05a8fc89e974fa4051','6602fd05a8fc89e974fa404e','codeFillTheGap','Playing football
Walking the dog','["print"]',FALSE),
('6602fd05a8fc89e974fa4057','6602fd05a8fc89e974fa4054','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa405f','6602fd05a8fc89e974fa405a','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4067','6602fd05a8fc89e974fa4062','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa406f','6602fd05a8fc89e974fa406a','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4075','6602fd05a8fc89e974fa4072','codeFillTheGap','100 degrees','["temp"]',FALSE),
('6602fd05a8fc89e974fa407b','6602fd05a8fc89e974fa4078','codeFillTheGap','Writing code','[]',FALSE),
('6602fd05a8fc89e974fa4083','6602fd05a8fc89e974fa4080','codeFillTheGap','Dollar','["print"]',FALSE),
('6602fd05a8fc89e974fa4089','6602fd05a8fc89e974fa4086','codeValidatedInput','Done',NULL,FALSE),
('6602fd05a8fc89e974fa4090','6602fd05a8fc89e974fa408d','codeFillTheGap','','["-"]',FALSE),
('6602fd05a8fc89e974fa4097','6602fd05a8fc89e974fa4093','codeFillTheGap','Followers:55','[]',FALSE),
('6602fd05a8fc89e974fa409e','6602fd05a8fc89e974fa409b','codeFillTheGap','Followers:55','["-"]',FALSE),
('6602fd05a8fc89e974fa40a6','6602fd05a8fc89e974fa40a2','codeValidatedInput','Posts:13',NULL,FALSE),
('6602fd05a8fc89e974fa40ae','6602fd05a8fc89e974fa40a9','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa40b6','6602fd05a8fc89e974fa40b1','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa40be','6602fd05a8fc89e974fa40b9','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa40c4','6602fd05a8fc89e974fa40c1','codeFillTheGap','14 degrees','["\"temperature\""]',FALSE),
('6602fd05a8fc89e974fa40ca','6602fd05a8fc89e974fa40c7','codeFillTheGap','Posts:55','[]',FALSE),
('6602fd05a8fc89e974fa40d2','6602fd05a8fc89e974fa40cf','codeFillTheGap','Ms. Irene','[]',FALSE),
('6602fd05a8fc89e974fa40da','6602fd05a8fc89e974fa40d7','codeValidatedInput','40 likes',NULL,FALSE),
('6602fd05a8fc89e974fa40e1','6602fd05a8fc89e974fa40de','codeFillTheGap','','["\"5\""]',FALSE),
('6602fd05a8fc89e974fa40e7','6602fd05a8fc89e974fa40e4','codeFillTheGap','','[]',FALSE),
('6602fd05a8fc89e974fa40ef','6602fd05a8fc89e974fa40ec','codeFillTheGap','6','["-"]',FALSE),
('6602fd05a8fc89e974fa40f6','6602fd05a8fc89e974fa40f3','codeFillTheGap','50.0','["-"]',FALSE),
('6602fd05a8fc89e974fa40fc','6602fd05a8fc89e974fa40f9','codeFillTheGap','You''re on step:
71','["-"]',FALSE),
('6602fd05a8fc89e974fa4103','6602fd05a8fc89e974fa4100','codeFillTheGap','Total posts:
13','[]',FALSE),
('6602fd05a8fc89e974fa410d','6602fd05a8fc89e974fa4108','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4115','6602fd05a8fc89e974fa4110','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa411d','6602fd05a8fc89e974fa4118','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4125','6602fd05a8fc89e974fa4120','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa412b','6602fd05a8fc89e974fa4128','codeFillTheGap','4.0','["/"]',FALSE),
('6602fd05a8fc89e974fa4132','6602fd05a8fc89e974fa412f','codeFillTheGap','92.0','[]',FALSE),
('6602fd05a8fc89e974fa413a','6602fd05a8fc89e974fa4137','codeFillTheGap','Discounted price:
80','[]',FALSE),
('6602fd05a8fc89e974fa4142','6602fd05a8fc89e974fa413f','codeValidatedInput','12',NULL,FALSE),
('6602fd05a8fc89e974fa414e','6602fd05a8fc89e974fa414b','codeFillTheGap','','[]',FALSE),
('6602fd05a8fc89e974fa4155','6602fd05a8fc89e974fa4152','codeFillTheGap','True','["True","="]',FALSE),
('6602fd05a8fc89e974fa415e','6602fd05a8fc89e974fa415b','codeFillTheGap','Load data
False','["(",")"]',FALSE),
('6602fd05a8fc89e974fa4165','6602fd05a8fc89e974fa4162','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa416d','6602fd05a8fc89e974fa4168','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4173','6602fd05a8fc89e974fa4170','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4179','6602fd05a8fc89e974fa4176','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa417f','6602fd05a8fc89e974fa417c','codeFillTheGap','Auto update
False','["True"]',FALSE),
('6602fd05a8fc89e974fa4185','6602fd05a8fc89e974fa4182','codeFillTheGap','','["\"False\""]',FALSE),
('6602fd05a8fc89e974fa418b','6602fd05a8fc89e974fa4188','codeFillTheGap','','["True","\"True\""]',FALSE),
('6602fd05a8fc89e974fa4191','6602fd05a8fc89e974fa418e','codeValidatedInput','',NULL,FALSE),
('6602fd05a8fc89e974fa419c','6602fd05a8fc89e974fa4199','codeFillTheGap','False','["\"true\""]',FALSE),
('6602fd05a8fc89e974fa41a3','6602fd05a8fc89e974fa41a0','codeFillTheGap','True','["print"]',FALSE),
('6602fd05a8fc89e974fa41aa','6602fd05a8fc89e974fa41a7','codeFillTheGap','False','[]',FALSE),
('6602fd05a8fc89e974fa41b2','6602fd05a8fc89e974fa41af','codeFillTheGap','False','[]',FALSE),
('6602fd05a8fc89e974fa41bb','6602fd05a8fc89e974fa41b8','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa41c3','6602fd05a8fc89e974fa41be','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa41c9','6602fd05a8fc89e974fa41c6','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa41d1','6602fd05a8fc89e974fa41cc','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa41d7','6602fd05a8fc89e974fa41d4','codeFillTheGap','','[]',FALSE),
('6602fd05a8fc89e974fa41de','6602fd05a8fc89e974fa41db','codeFillTheGap','False','["not False"]',FALSE),
('6602fd05a8fc89e974fa41e4','6602fd05a8fc89e974fa41e1','codeFillTheGap','','[]',FALSE),
('6602fd05a8fc89e974fa41ec','6602fd05a8fc89e974fa41e9','codeValidatedInput','False',NULL,FALSE),
('6602fd05a8fc89e974fa41f4','6602fd05a8fc89e974fa41f1','codeNone','',NULL,FALSE),
('6602fd05a8fc89e974fa41f8','6602fd05a8fc89e974fa41f6','codeFillTheGap','','[]',FALSE),
('6602fd05a8fc89e974fa4202','6602fd05a8fc89e974fa41ff','codeFillTheGap','True','[]',FALSE),
('6602fd05a8fc89e974fa420a','6602fd05a8fc89e974fa4207','codeFillTheGap','False','["9 = 10"]',FALSE),
('6602fd05a8fc89e974fa4210','6602fd05a8fc89e974fa420d','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4218','6602fd05a8fc89e974fa4213','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa421e','6602fd05a8fc89e974fa421b','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4226','6602fd05a8fc89e974fa4221','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa422c','6602fd05a8fc89e974fa4229','codeFillTheGap','False','[]',FALSE),
('6602fd05a8fc89e974fa4234','6602fd05a8fc89e974fa4231','codeFillTheGap','False','["="]',FALSE),
('6602fd05a8fc89e974fa423a','6602fd05a8fc89e974fa4237','codeFillTheGap','False','["10"]',FALSE),
('6602fd05a8fc89e974fa4240','6602fd05a8fc89e974fa423d','codeValidatedInput','True',NULL,FALSE),
('6602fd05a8fc89e974fa4247','6602fd05a8fc89e974fa4244','codeFillTheGap','True','["==="]',FALSE),
('6602fd05a8fc89e974fa424d','6602fd05a8fc89e974fa424a','codeFillTheGap','True','[]',FALSE),
('6602fd05a8fc89e974fa4254','6602fd05a8fc89e974fa4251','codeFillTheGap','False','[]',FALSE),
('6602fd05a8fc89e974fa425c','6602fd05a8fc89e974fa4259','codeValidatedInput','False
True',NULL,FALSE),
('6602fd05a8fc89e974fa4264','6602fd05a8fc89e974fa425f','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa426c','6602fd05a8fc89e974fa4267','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4274','6602fd05a8fc89e974fa426f','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa427c','6602fd05a8fc89e974fa4277','multipleChoice','',NULL,FALSE),
('6602fd05a8fc89e974fa4282','6602fd05a8fc89e974fa427f','codeFillTheGap','False','["=="]',FALSE),
('6602fd05a8fc89e974fa4288','6602fd05a8fc89e974fa4285','codeFillTheGap','','[]',FALSE),
('6602fd05a8fc89e974fa4290','6602fd05a8fc89e974fa428d','codeValidatedInput','False',NULL,FALSE),
('6602fd05a8fc89e974fa4296','6602fd05a8fc89e974fa4293','codeValidatedInput','',NULL,FALSE),
('6602fd05a8fc89e974fa42a1','6602fd05a8fc89e974fa429e','codeFillTheGap','new messages','["="]',FALSE),
('6602fd05a8fc89e974fa42a7','6602fd05a8fc89e974fa42a4','codeFillTheGap','Traceback (most recent call last):
  File "/home/default/code/file.py", line 1, in <module>
    print(2 + " new messages")
TypeError: unsupported operand type(s) for +: ''int'' and ''str''
','[]',FALSE),
('6602fd05a8fc89e974fa42ae','6602fd05a8fc89e974fa42ab','codeFillTheGap','2 new messages','[]',FALSE),
('6602fd06a8fc89e974fa42b4','6602fd05a8fc89e974fa42b1','codeFillTheGap','6 new messages','[]',FALSE),
('6602fd06a8fc89e974fa42bb','6602fd06a8fc89e974fa42b8','codeValidatedInput','2 new messages',NULL,FALSE),
('6602fd06a8fc89e974fa42c1','6602fd06a8fc89e974fa42be','codeFillTheGap','2 new messages','["2"]',FALSE),
('6602fd06a8fc89e974fa42c7','6602fd06a8fc89e974fa42c4','codeValidatedInput','3 unread messages',NULL,FALSE),
('6602fd06a8fc89e974fa42cd','6602fd06a8fc89e974fa42ca','codeFillTheGap','5 new messages and 2 friend requests','[]',FALSE),
('6602fd06a8fc89e974fa42d4','6602fd06a8fc89e974fa42d1','codeFillTheGap','5 new messages','[]',FALSE),
('6602fd06a8fc89e974fa42dc','6602fd06a8fc89e974fa42d9','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa42e2','6602fd06a8fc89e974fa42df','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa42e8','6602fd06a8fc89e974fa42e5','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa42ee','6602fd06a8fc89e974fa42eb','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa42f4','6602fd06a8fc89e974fa42f1','codeFillTheGap','4 dataset entries','["\"4 dataset entries\""]',FALSE),
('6602fd06a8fc89e974fa42fa','6602fd06a8fc89e974fa42f7','codeValidatedInput','popularity increased by 12%',NULL,FALSE),
('6602fd06a8fc89e974fa4300','6602fd06a8fc89e974fa42fd','codeValidatedInput','I would walk 500 miles',NULL,FALSE),
('6602fd06a8fc89e974fa4306','6602fd06a8fc89e974fa4303','codeFillTheGap','Temperature: 70F','["print"]',FALSE),
('6602fd06a8fc89e974fa430e','6602fd06a8fc89e974fa430b','codeFillTheGap','Airing tonight: Vertigo','[]',FALSE),
('6602fd06a8fc89e974fa4319','6602fd06a8fc89e974fa4316','codeFillTheGap','','["print"]',FALSE),
('6602fd06a8fc89e974fa4321','6602fd06a8fc89e974fa431e','codeFillTheGap','','["highest gdp","highest-gdp"]',FALSE),
('6602fd06a8fc89e974fa4327','6602fd06a8fc89e974fa4324','codeValidatedInput','',NULL,FALSE),
('6602fd06a8fc89e974fa432d','6602fd06a8fc89e974fa432a','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4334','6602fd06a8fc89e974fa4331','codeFillTheGap','25-34 years old','["print"]',FALSE),
('6602fd06a8fc89e974fa433c','6602fd06a8fc89e974fa4337','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4343','6602fd06a8fc89e974fa4340','codeFillTheGap','5','["rating"]',FALSE),
('6602fd06a8fc89e974fa434b','6602fd06a8fc89e974fa4348','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4352','6602fd06a8fc89e974fa434f','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa435b','6602fd06a8fc89e974fa4356','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4362','6602fd06a8fc89e974fa435f','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4369','6602fd06a8fc89e974fa4366','codeFillTheGap','','["\"True\""]',FALSE),
('6602fd06a8fc89e974fa4373','6602fd06a8fc89e974fa436e','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa437a','6602fd06a8fc89e974fa4377','codeValidatedInput','',NULL,FALSE),
('6602fd06a8fc89e974fa4380','6602fd06a8fc89e974fa437d','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4387','6602fd06a8fc89e974fa4384','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa438e','6602fd06a8fc89e974fa438b','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4397','6602fd06a8fc89e974fa4392','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa439e','6602fd06a8fc89e974fa439b','codeFillTheGap','A book by Virginia Woolf','["f\"A book by Virginia Woolf\""]',FALSE),
('6602fd06a8fc89e974fa43a6','6602fd06a8fc89e974fa43a3','codeFillTheGap','True','["<","<=","=="]',FALSE),
('6602fd06a8fc89e974fa43ae','6602fd06a8fc89e974fa43a9','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa43b5','6602fd06a8fc89e974fa43b2','codeFillTheGap','False','["1000"]',FALSE),
('6602fd06a8fc89e974fa43bf','6602fd06a8fc89e974fa43ba','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa43c9','6602fd06a8fc89e974fa43c4','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa43d1','6602fd06a8fc89e974fa43ce','codeFillTheGap','','["tesla car","car brand"]',FALSE),
('6602fd06a8fc89e974fa43d7','6602fd06a8fc89e974fa43d4','codeFillTheGap','sift flour
mix in sugar','["print(step 2) ","print(step 1)"]',FALSE),
('6602fd06a8fc89e974fa43e0','6602fd06a8fc89e974fa43db','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa43e8','6602fd06a8fc89e974fa43e5','codeValidatedInput','One new message',NULL,FALSE),
('6602fd06a8fc89e974fa43ee','6602fd06a8fc89e974fa43eb','codeValidatedInput','',NULL,FALSE),
('6602fd06a8fc89e974fa43f4','6602fd06a8fc89e974fa43f1','codeFillTheGap','Kalpana Chawla','["\"Kalpana Chawla\"","\"astronaut\""]',FALSE),
('6602fd06a8fc89e974fa43ff','6602fd06a8fc89e974fa43fa','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4409','6602fd06a8fc89e974fa4404','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4411','6602fd06a8fc89e974fa440e','codeFillTheGap','','["morning","7"]',FALSE),
('6602fd06a8fc89e974fa4419','6602fd06a8fc89e974fa4414','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4424','6602fd06a8fc89e974fa441f','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa442e','6602fd06a8fc89e974fa4429','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4438','6602fd06a8fc89e974fa4435','codeFillTheGap','Today''s shift: Louise','["Brandon","Louise"]',FALSE),
('6602fd06a8fc89e974fa4440','6602fd06a8fc89e974fa443b','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa444a','6602fd06a8fc89e974fa4445','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4452','6602fd06a8fc89e974fa444f','codeFillTheGap','Go','["stop_label","print"]',FALSE),
('6602fd06a8fc89e974fa445a','6602fd06a8fc89e974fa4455','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4463','6602fd06a8fc89e974fa4460','codeFillTheGap','5.0','["11","17"]',FALSE),
('6602fd06a8fc89e974fa446c','6602fd06a8fc89e974fa4469','codeValidatedInput','False',NULL,FALSE),
('6602fd06a8fc89e974fa4472','6602fd06a8fc89e974fa446f','codeValidatedInput','True',NULL,FALSE),
('6602fd06a8fc89e974fa447a','6602fd06a8fc89e974fa4475','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4483','6602fd06a8fc89e974fa4480','codeFillTheGap','False','["print","[","]"]',FALSE),
('6602fd06a8fc89e974fa448c','6602fd06a8fc89e974fa4489','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4497','6602fd06a8fc89e974fa4492','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa44a0','6602fd06a8fc89e974fa449d','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa44a8','6602fd06a8fc89e974fa44a5','codeValidatedInput','True',NULL,FALSE),
('6602fd06a8fc89e974fa44ae','6602fd06a8fc89e974fa44ab','codeValidatedInput','True',NULL,FALSE),
('6602fd06a8fc89e974fa44b5','6602fd06a8fc89e974fa44b2','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa44bd','6602fd06a8fc89e974fa44ba','codeValidatedInput','False',NULL,FALSE),
('6602fd06a8fc89e974fa44c5','6602fd06a8fc89e974fa44c0','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa44cd','6602fd06a8fc89e974fa44ca','codeValidatedInput','True',NULL,FALSE),
('6602fd06a8fc89e974fa44d5','6602fd06a8fc89e974fa44d0','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa44dd','6602fd06a8fc89e974fa44da','codeValidatedInput','',NULL,FALSE),
('6602fd06a8fc89e974fa44e6','6602fd06a8fc89e974fa44e1','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa44ee','6602fd06a8fc89e974fa44eb','codeFillTheGap','todo: dishes','["dishes","(",")"]',FALSE),
('6602fd06a8fc89e974fa44fb','6602fd06a8fc89e974fa44f6','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4503','6602fd06a8fc89e974fa4500','codeValidatedInput','Hello, John!
Hello, John!',NULL,FALSE),
('6602fd06a8fc89e974fa450b','6602fd06a8fc89e974fa4506','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4513','6602fd06a8fc89e974fa4510','codeValidatedInput','Mexico was the leading avocado producer in 2018',NULL,FALSE),
('6602fd06a8fc89e974fa451b','6602fd06a8fc89e974fa4516','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4523','6602fd06a8fc89e974fa4520','codeFillTheGap','Your flight to Paris takes off at 14:45','["destination","hours","minutes"]',FALSE),
('6602fd06a8fc89e974fa452d','6602fd06a8fc89e974fa4528','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4537','6602fd06a8fc89e974fa4532','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa453f','6602fd06a8fc89e974fa453c','codeValidatedInput','water is 11.19% hydrogen',NULL,FALSE),
('6602fd06a8fc89e974fa4545','6602fd06a8fc89e974fa4542','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa454d','6602fd06a8fc89e974fa454a','codeValidatedInput','200 grams of flour',NULL,FALSE),
('6602fd06a8fc89e974fa4553','6602fd06a8fc89e974fa4550','codeFillTheGap','70% cocoa','["\"70% cocoa\"","{","}"]',FALSE),
('6602fd06a8fc89e974fa4569','6602fd06a8fc89e974fa4566','codeFillTheGap','','["=="]',FALSE),
('6602fd06a8fc89e974fa456f','6602fd06a8fc89e974fa456c','codeFillTheGap','True','[]',FALSE),
('6602fd06a8fc89e974fa4577','6602fd06a8fc89e974fa4574','codeFillTheGap','False','[]',FALSE),
('6602fd06a8fc89e974fa457e','6602fd06a8fc89e974fa457b','codeFillTheGap','True','["<"]',FALSE),
('6602fd06a8fc89e974fa4584','6602fd06a8fc89e974fa4581','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa458a','6602fd06a8fc89e974fa4587','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4592','6602fd06a8fc89e974fa458d','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa459a','6602fd06a8fc89e974fa4595','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa45a0','6602fd06a8fc89e974fa459d','codeFillTheGap','True','[]',FALSE),
('6602fd06a8fc89e974fa45a8','6602fd06a8fc89e974fa45a5','codeValidatedInput','True',NULL,FALSE),
('6602fd06a8fc89e974fa45ae','6602fd06a8fc89e974fa45ab','codeFillTheGap','True','["<","="]',FALSE),
('6602fd06a8fc89e974fa45b4','6602fd06a8fc89e974fa45b1','codeValidatedInput','False',NULL,FALSE),
('6602fd06a8fc89e974fa45bb','6602fd06a8fc89e974fa45b8','codeFillTheGap','True','["<"]',FALSE),
('6602fd06a8fc89e974fa45c1','6602fd06a8fc89e974fa45be','codeFillTheGap','True','[]',FALSE),
('6602fd06a8fc89e974fa45c9','6602fd06a8fc89e974fa45c6','codeFillTheGap','True','["<="]',FALSE),
('6602fd06a8fc89e974fa45cf','6602fd06a8fc89e974fa45cc','codeFillTheGap','True','["True"]',FALSE),
('6602fd06a8fc89e974fa45d6','6602fd06a8fc89e974fa45d3','codeFillTheGap','True','[]',FALSE),
('6602fd06a8fc89e974fa45de','6602fd06a8fc89e974fa45db','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa45e4','6602fd06a8fc89e974fa45e1','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa45ea','6602fd06a8fc89e974fa45e7','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa45f2','6602fd06a8fc89e974fa45ed','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa45f8','6602fd06a8fc89e974fa45f5','codeValidatedInput','Low battery:
True',NULL,FALSE),
('6602fd06a8fc89e974fa45fe','6602fd06a8fc89e974fa45fb','codeValidatedInput','Level 2:
True',NULL,FALSE),
('6602fd06a8fc89e974fa4604','6602fd06a8fc89e974fa4601','codeFillTheGap','','[]',FALSE),
('6602fd06a8fc89e974fa460c','6602fd06a8fc89e974fa4609','codeValidatedInput','True',NULL,FALSE),
('6602fd06a8fc89e974fa4613','6602fd06a8fc89e974fa4611','codeNone','True
True',NULL,FALSE),
('6602fd06a8fc89e974fa4618','6602fd06a8fc89e974fa4615','codeFillTheGap','True','["<="]',FALSE),
('6602fd06a8fc89e974fa461e','6602fd06a8fc89e974fa461b','codeFillTheGap','True','[]',FALSE),
('6602fd06a8fc89e974fa4626','6602fd06a8fc89e974fa4623','codeFillTheGap','False','[]',FALSE),
('6602fd06a8fc89e974fa462d','6602fd06a8fc89e974fa462a','codeFillTheGap','False','[]',FALSE),
('6602fd06a8fc89e974fa4635','6602fd06a8fc89e974fa4632','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa463b','6602fd06a8fc89e974fa4638','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4643','6602fd06a8fc89e974fa463e','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4649','6602fd06a8fc89e974fa4646','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa464f','6602fd06a8fc89e974fa464c','codeFillTheGap','False','["="]',FALSE),
('6602fd06a8fc89e974fa4655','6602fd06a8fc89e974fa4652','codeFillTheGap','False','["\"low\""]',FALSE),
('6602fd06a8fc89e974fa465b','6602fd06a8fc89e974fa4658','codeFillTheGap','','["\"deerstalker hat\""]',FALSE),
('6602fd06a8fc89e974fa4661','6602fd06a8fc89e974fa465e','codeValidatedInput','False',NULL,FALSE),
('6602fd06a8fc89e974fa4668','6602fd06a8fc89e974fa4665','codeFillTheGap','True','["=="]',FALSE),
('6602fd06a8fc89e974fa466e','6602fd06a8fc89e974fa466b','codeFillTheGap','True','[]',FALSE),
('6602fd06a8fc89e974fa4676','6602fd06a8fc89e974fa4673','codeFillTheGap','False','[]',FALSE),
('6602fd06a8fc89e974fa467d','6602fd06a8fc89e974fa467a','codeFillTheGap','False','["=="]',FALSE),
('6602fd06a8fc89e974fa4683','6602fd06a8fc89e974fa4680','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4689','6602fd06a8fc89e974fa4686','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4691','6602fd06a8fc89e974fa468c','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4697','6602fd06a8fc89e974fa4694','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa469d','6602fd06a8fc89e974fa469a','codeFillTheGap','True','["=="]',FALSE),
('6602fd06a8fc89e974fa46a3','6602fd06a8fc89e974fa46a0','codeFillTheGap','False','["\"cat.png\""]',FALSE),
('6602fd06a8fc89e974fa46a9','6602fd06a8fc89e974fa46a6','codeFillTheGap','','["\"Anna\""]',FALSE),
('6602fd06a8fc89e974fa46af','6602fd06a8fc89e974fa46ac','codeValidatedInput','True',NULL,FALSE),
('6602fd06a8fc89e974fa46ba','6602fd06a8fc89e974fa46b7','codeFillTheGap','','["42","False"]',FALSE),
('6602fd06a8fc89e974fa46c0','6602fd06a8fc89e974fa46bd','codeFillTheGap','','["\"42\"","True"]',FALSE),
('6602fd06a8fc89e974fa46c6','6602fd06a8fc89e974fa46c3','codeFillTheGap','','["\"3\""]',FALSE),
('6602fd06a8fc89e974fa46ce','6602fd06a8fc89e974fa46cb','codeValidatedInput','',NULL,FALSE),
('6602fd06a8fc89e974fa46d4','6602fd06a8fc89e974fa46d1','codeFillTheGap','','[]',FALSE),
('6602fd06a8fc89e974fa46dc','6602fd06a8fc89e974fa46d9','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa46e2','6602fd06a8fc89e974fa46df','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa46e8','6602fd06a8fc89e974fa46e5','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa46f0','6602fd06a8fc89e974fa46eb','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa46f6','6602fd06a8fc89e974fa46f3','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa46fc','6602fd06a8fc89e974fa46f9','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4702','6602fd06a8fc89e974fa46ff','codeFillTheGap','','["55.543"]',FALSE),
('6602fd06a8fc89e974fa470a','6602fd06a8fc89e974fa4707','codeFillTheGap','','["Jill","false"]',FALSE),
('6602fd06a8fc89e974fa4710','6602fd06a8fc89e974fa470d','codeFillTheGap','','["\"10\""]',FALSE),
('6602fd06a8fc89e974fa4716','6602fd06a8fc89e974fa4713','codeFillTheGap','','["\"65.55\"","\"65\""]',FALSE),
('6602fd06a8fc89e974fa471d','6602fd06a8fc89e974fa471a','codeValidatedInput','',NULL,FALSE),
('6602fd06a8fc89e974fa4723','6602fd06a8fc89e974fa4720','codeValidatedInput','',NULL,FALSE),
('6602fd06a8fc89e974fa472b','6602fd06a8fc89e974fa4727','codeFillTheGap','<class ''bool''>','[]',FALSE),
('6602fd06a8fc89e974fa4732','6602fd06a8fc89e974fa472e','codeFillTheGap','<class ''bool''>
<class ''float''>
<class ''str''>
<class ''int''>','[]',FALSE),
('6602fd06a8fc89e974fa473f','6602fd06a8fc89e974fa4739','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4745','6602fd06a8fc89e974fa4742','codeFillTheGap','<class ''str''>
<class ''int''>
True','[]',FALSE),
('6602fd06a8fc89e974fa474c','6602fd06a8fc89e974fa4748','codeFillTheGap','False
<class ''int''>
<class ''str''>','[]',FALSE),
('6602fd06a8fc89e974fa4755','6602fd06a8fc89e974fa4752','codeFillTheGap','9','[]',FALSE),
('6602fd06a8fc89e974fa475b','6602fd06a8fc89e974fa4758','codeFillTheGap','12.0','[]',FALSE),
('6602fd06a8fc89e974fa4765','6602fd06a8fc89e974fa4761','codeFillTheGap','1
0','[]',FALSE),
('6602fd06a8fc89e974fa476d','6602fd06a8fc89e974fa4769','codeFillTheGap','True
False
True
False','[]',FALSE),
('6602fd06a8fc89e974fa4776','6602fd06a8fc89e974fa4773','codeFillTheGap','True
False','[]',FALSE),
('6602fd06a8fc89e974fa477d','6602fd06a8fc89e974fa477a','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4785','6602fd06a8fc89e974fa4780','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa478b','6602fd06a8fc89e974fa4788','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4791','6602fd06a8fc89e974fa478e','codeFillTheGap','True','["int"]',FALSE),
('6602fd06a8fc89e974fa479c','6602fd06a8fc89e974fa4797','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa47a3','6602fd06a8fc89e974fa47a0','codeFillTheGap','True','["<","="]',FALSE),
('6602fd06a8fc89e974fa47a9','6602fd06a8fc89e974fa47a6','codeFillTheGap','','["60"]',FALSE),
('6602fd06a8fc89e974fa47b2','6602fd06a8fc89e974fa47af','codeValidatedInput','',NULL,FALSE),
('6602fd06a8fc89e974fa47b8','6602fd06a8fc89e974fa47b5','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa47bf','6602fd06a8fc89e974fa47bc','codeFillTheGap','True','["<="]',FALSE),
('6602fd06a8fc89e974fa47c7','6602fd06a8fc89e974fa47c2','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa47ce','6602fd06a8fc89e974fa47cb','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa47d5','6602fd06a8fc89e974fa47d2','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa47de','6602fd06a8fc89e974fa47d9','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa47e5','6602fd06a8fc89e974fa47e2','codeFillTheGap','101','["\"print\""]',FALSE),
('6602fd06a8fc89e974fa47ee','6602fd06a8fc89e974fa47eb','codeFillTheGap','','["Clooney"]',FALSE),
('6602fd06a8fc89e974fa47f8','6602fd06a8fc89e974fa47f3','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa47ff','6602fd06a8fc89e974fa47fc','codeFillTheGap','','["\"2\""]',FALSE),
('6602fd06a8fc89e974fa4807','6602fd06a8fc89e974fa4804','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa480e','6602fd06a8fc89e974fa480b','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4815','6602fd06a8fc89e974fa4812','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4820','6602fd06a8fc89e974fa481b','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4828','6602fd06a8fc89e974fa4825','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4830','6602fd06a8fc89e974fa482d','codeFillTheGap','','["<",">=","<="]',FALSE),
('6602fd06a8fc89e974fa4836','6602fd06a8fc89e974fa4833','codeFillTheGap','Highly rated:
True','["7","10"]',FALSE),
('6602fd06a8fc89e974fa483f','6602fd06a8fc89e974fa483a','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4847','6602fd06a8fc89e974fa4844','codeValidatedInput','',NULL,FALSE),
('6602fd06a8fc89e974fa484e','6602fd06a8fc89e974fa484b','codeFillTheGap','Give discount: 
False','["==",">"]',FALSE),
('6602fd06a8fc89e974fa4859','6602fd06a8fc89e974fa4856','codeValidatedInput','Old enough to drive:
True',NULL,FALSE),
('6602fd06a8fc89e974fa4863','6602fd06a8fc89e974fa485e','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa486b','6602fd06a8fc89e974fa4868','codeValidatedInput','False',NULL,FALSE),
('6602fd06a8fc89e974fa4871','6602fd06a8fc89e974fa486e','codeFillTheGap','False','["!=","not"]',FALSE),
('6602fd06a8fc89e974fa487b','6602fd06a8fc89e974fa4876','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4883','6602fd06a8fc89e974fa4880','codeValidatedInput','',NULL,FALSE),
('6602fd06a8fc89e974fa4889','6602fd06a8fc89e974fa4886','codeValidatedInput','True',NULL,FALSE),
('6602fd06a8fc89e974fa4890','6602fd06a8fc89e974fa488d','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa4898','6602fd06a8fc89e974fa4895','codeValidatedInput','True',NULL,FALSE),
('6602fd06a8fc89e974fa48a1','6602fd06a8fc89e974fa489c','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa48ac','6602fd06a8fc89e974fa48a7','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa48b4','6602fd06a8fc89e974fa48b1','codeFillTheGap','','["Biology","False"]',FALSE),
('6602fd06a8fc89e974fa48be','6602fd06a8fc89e974fa48b9','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa48c6','6602fd06a8fc89e974fa48c3','codeValidatedInput','True',NULL,FALSE),
('6602fd06a8fc89e974fa48ce','6602fd06a8fc89e974fa48c9','multipleChoice','',NULL,FALSE),
('6602fd06a8fc89e974fa48d9','6602fd06a8fc89e974fa48d4','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040be1','6602fd62666d4ea088040bde','codeFillTheGap','let
const','[]',FALSE),
('6602fd62666d4ea088040be7','6602fd62666d4ea088040be4','codeFillTheGap','','["home city"]',FALSE),
('6602fd62666d4ea088040bed','6602fd62666d4ea088040bea','codeFillTheGap','','["home city"]',FALSE),
('6602fd62666d4ea088040bf3','6602fd62666d4ea088040bf0','codeFillTheGap','','["wC"]',FALSE),
('6602fd62666d4ea088040bfb','6602fd62666d4ea088040bf6','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040c01','6602fd62666d4ea088040bfe','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040c07','6602fd62666d4ea088040c04','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040c0d','6602fd62666d4ea088040c0a','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040c13','6602fd62666d4ea088040c10','codeFillTheGap','','["hs"]',FALSE),
('6602fd62666d4ea088040c19','6602fd62666d4ea088040c16','codeFillTheGap','let','[]',FALSE),
('6602fd62666d4ea088040c21','6602fd62666d4ea088040c1e','codeFillTheGap','','[]',FALSE),
('6602fd62666d4ea088040c28','6602fd62666d4ea088040c25','codeValidatedInput','',NULL,FALSE),
('6602fd62666d4ea088040c2f','6602fd62666d4ea088040c2c','codeFillTheGap','','["1 car"]',FALSE),
('6602fd62666d4ea088040c35','6602fd62666d4ea088040c32','codeFillTheGap','','[]',FALSE),
('6602fd62666d4ea088040c3c','6602fd62666d4ea088040c39','codeFillTheGap','','["."]',FALSE),
('6602fd62666d4ea088040c42','6602fd62666d4ea088040c3f','codeFillTheGap','','["''","''"]',FALSE),
('6602fd62666d4ea088040c49','6602fd62666d4ea088040c46','codeFillTheGap','','[]',FALSE),
('6602fd62666d4ea088040c53','6602fd62666d4ea088040c4e','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040c59','6602fd62666d4ea088040c56','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040c61','6602fd62666d4ea088040c5c','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040c69','6602fd62666d4ea088040c64','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040c6f','6602fd62666d4ea088040c6c','codeFillTheGap','','[]',FALSE),
('6602fd62666d4ea088040c77','6602fd62666d4ea088040c74','codeFillTheGap','','["Apple"]',FALSE),
('6602fd62666d4ea088040c80','6602fd62666d4ea088040c7d','codeFillTheGap','','["''","''"]',FALSE),
('6602fd62666d4ea088040c88','6602fd62666d4ea088040c85','codeValidatedInput','',NULL,FALSE),
('6602fd62666d4ea088040c91','6602fd62666d4ea088040c8e','codeFillTheGap','','[]',FALSE),
('6602fd62666d4ea088040c97','6602fd62666d4ea088040c95','codeNone','TypeError: Assignment to constant variable.',NULL,FALSE),
('6602fd62666d4ea088040c9c','6602fd62666d4ea088040c99','codeFillTheGap','','["const"]',FALSE),
('6602fd62666d4ea088040ca3','6602fd62666d4ea088040c9f','codeFillTheGap','','["birthDay","birthday"]',FALSE),
('6602fd62666d4ea088040caa','6602fd62666d4ea088040ca6','codeFillTheGap','','["speed_of_light","speedOfLight"]',FALSE),
('6602fd62666d4ea088040cb0','6602fd62666d4ea088040cad','codeFillTheGap','','["let"]',FALSE),
('6602fd62666d4ea088040cb6','6602fd62666d4ea088040cb3','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040cbc','6602fd62666d4ea088040cb9','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040cc2','6602fd62666d4ea088040cbf','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040cc8','6602fd62666d4ea088040cc5','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040cce','6602fd62666d4ea088040ccb','codeValidatedInput','',NULL,FALSE),
('6602fd62666d4ea088040cd4','6602fd62666d4ea088040cd1','codeFillTheGap','','["longest_RIVER","LONGESTRIVER"]',FALSE),
('6602fd62666d4ea088040cda','6602fd62666d4ea088040cd7','codeValidatedInput','',NULL,FALSE),
('6602fd62666d4ea088040ce6','6602fd62666d4ea088040ce2','codeFillTheGap','','[]',FALSE),
('6602fd62666d4ea088040cee','6602fd62666d4ea088040ceb','codeFillTheGap','Hello, World!','[]',FALSE),
('6602fd62666d4ea088040cf4','6602fd62666d4ea088040cf1','codeFillTheGap','3, 2, 1
GO!','[]',FALSE),
('6602fd62666d4ea088040cfb','6602fd62666d4ea088040cf8','codeFillTheGap','Hello, World!','["console.log","(",")"]',FALSE),
('6602fd62666d4ea088040d01','6602fd62666d4ea088040cfe','codeFillTheGap','Daenerys','["\"Daenerys\""]',FALSE),
('6602fd62666d4ea088040d07','6602fd62666d4ea088040d04','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040d0d','6602fd62666d4ea088040d0a','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040d13','6602fd62666d4ea088040d10','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040d1b','6602fd62666d4ea088040d16','multipleChoice','',NULL,FALSE),
('6602fd62666d4ea088040d21','6602fd62666d4ea088040d1e','codeFillTheGap','daily','[]',FALSE),
('6602fd62666d4ea088040d28','6602fd62666d4ea088040d25','codeFillTheGap','Buzz','[]',FALSE),
('6602fd62666d4ea088040d32','6602fd62666d4ea088040d2f','codeFillTheGap','Lightyear','["\"Lightyear\""]',FALSE),
('6602fd62666d4ea088040d38','6602fd62666d4ea088040d35','codeValidatedInput','Sheriff',NULL,FALSE),
('6602fd62666d4ea088040d41','6602fd62666d4ea088040d3d','codeFillTheGap','','[":"]',FALSE),
('6602fd62666d4ea088040d48','6602fd62666d4ea088040d44','codeFillTheGap','Relaxing at the Beach
Reading','[]',FALSE),
('6602fd63666d4ea088040d51','6602fd63666d4ea088040d4d','codeFillTheGap','Hi there!','["\"Playing football\""]',FALSE),
('6602fd63666d4ea088040d58','6602fd63666d4ea088040d54','codeFillTheGap','Playing football
Walking the dog','["let currentStatus"]',FALSE),
('6602fd63666d4ea088040d5f','6602fd63666d4ea088040d5c','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040d67','6602fd63666d4ea088040d62','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040d6f','6602fd63666d4ea088040d6a','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040d77','6602fd63666d4ea088040d72','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040d7d','6602fd63666d4ea088040d7a','codeFillTheGap','100 degrees','["let temperature"]',FALSE),
('6602fd63666d4ea088040d83','6602fd63666d4ea088040d80','codeFillTheGap','','["let currentStatus"]',FALSE),
('6602fd63666d4ea088040d8c','6602fd63666d4ea088040d89','codeFillTheGap','Log in','["Log in","let buttonText"]',FALSE),
('6602fd63666d4ea088040d95','6602fd63666d4ea088040d92','codeValidatedInput','Done',NULL,FALSE),
('6602fd63666d4ea088040d9d','6602fd63666d4ea088040d99','codeFillTheGap','','["-"]',FALSE),
('6602fd63666d4ea088040da4','6602fd63666d4ea088040da0','codeFillTheGap','Followers:55','[]',FALSE),
('6602fd63666d4ea088040dad','6602fd63666d4ea088040da9','codeFillTheGap','','[]',FALSE),
('6602fd63666d4ea088040db6','6602fd63666d4ea088040db2','codeFillTheGap','Followers:55','[]',FALSE),
('6602fd63666d4ea088040dbf','6602fd63666d4ea088040dbb','codeFillTheGap','Posts:13','[]',FALSE),
('6602fd63666d4ea088040dca','6602fd63666d4ea088040dc5','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040dd2','6602fd63666d4ea088040dcd','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040dda','6602fd63666d4ea088040dd5','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040de2','6602fd63666d4ea088040ddd','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040de8','6602fd63666d4ea088040de5','codeFillTheGap','14 degrees','["\"temperature\""]',FALSE),
('6602fd63666d4ea088040dee','6602fd63666d4ea088040deb','codeFillTheGap','Posts:55','[]',FALSE),
('6602fd63666d4ea088040df8','6602fd63666d4ea088040df5','codeFillTheGap','Ms. Irene','[]',FALSE),
('6602fd63666d4ea088040e00','6602fd63666d4ea088040dfd','codeValidatedInput','40 likes',NULL,FALSE),
('6602fd63666d4ea088040e07','6602fd63666d4ea088040e04','codeFillTheGap','','["\"5\""]',FALSE),
('6602fd63666d4ea088040e0e','6602fd63666d4ea088040e0a','codeFillTheGap','5','[]',FALSE),
('6602fd63666d4ea088040e18','6602fd63666d4ea088040e14','codeFillTheGap','6','["-"]',FALSE),
('6602fd63666d4ea088040e20','6602fd63666d4ea088040e1c','codeFillTheGap','50','["x"]',FALSE),
('6602fd63666d4ea088040e27','6602fd63666d4ea088040e23','codeFillTheGap','You''re on step:
71','["-"]',FALSE),
('6602fd63666d4ea088040e2f','6602fd63666d4ea088040e2b','codeFillTheGap','Total posts: 13','[]',FALSE),
('6602fd63666d4ea088040e39','6602fd63666d4ea088040e34','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040e41','6602fd63666d4ea088040e3c','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040e49','6602fd63666d4ea088040e44','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040e51','6602fd63666d4ea088040e4c','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040e57','6602fd63666d4ea088040e54','codeFillTheGap','4','["/"]',FALSE),
('6602fd63666d4ea088040e5e','6602fd63666d4ea088040e5b','codeFillTheGap','92','["÷"]',FALSE),
('6602fd63666d4ea088040e64','6602fd63666d4ea088040e61','codeFillTheGap','Discounted price:
80','[]',FALSE),
('6602fd63666d4ea088040e6c','6602fd63666d4ea088040e69','codeValidatedInput','12',NULL,FALSE),
('6602fd63666d4ea088040e79','6602fd63666d4ea088040e75','codeValidatedInput','Allow updates
true',NULL,FALSE),
('6602fd63666d4ea088040e80','6602fd63666d4ea088040e7c','codeFillTheGap','true','[]',FALSE),
('6602fd63666d4ea088040e8a','6602fd63666d4ea088040e87','codeFillTheGap','Device charged
false','["var"]',FALSE),
('6602fd63666d4ea088040e91','6602fd63666d4ea088040e8e','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040e99','6602fd63666d4ea088040e94','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040e9f','6602fd63666d4ea088040e9c','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040ea5','6602fd63666d4ea088040ea2','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040eab','6602fd63666d4ea088040ea8','codeFillTheGap','Auto update
false','[]',FALSE),
('6602fd63666d4ea088040eb6','6602fd63666d4ea088040eb3','codeFillTheGap','','[]',FALSE),
('6602fd63666d4ea088040ebe','6602fd63666d4ea088040ebb','codeFillTheGap','','["\"false\""]',FALSE),
('6602fd63666d4ea088040ec5','6602fd63666d4ea088040ec2','codeValidatedInput','',NULL,FALSE),
('6602fd63666d4ea088040ed1','6602fd63666d4ea088040ecd','codeFillTheGap','false','[]',FALSE),
('6602fd63666d4ea088040ed8','6602fd63666d4ea088040ed5','codeFillTheGap','true','[]',FALSE),
('6602fd63666d4ea088040edf','6602fd63666d4ea088040edc','codeFillTheGap','false','[]',FALSE),
('6602fd63666d4ea088040ee7','6602fd63666d4ea088040ee3','codeFillTheGap','false','[]',FALSE),
('6602fd63666d4ea088040ef0','6602fd63666d4ea088040eed','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040ef8','6602fd63666d4ea088040ef3','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040efe','6602fd63666d4ea088040efb','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040f06','6602fd63666d4ea088040f01','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040f0c','6602fd63666d4ea088040f09','codeFillTheGap','','[]',FALSE),
('6602fd63666d4ea088040f13','6602fd63666d4ea088040f10','codeFillTheGap','false','["!false"]',FALSE),
('6602fd63666d4ea088040f19','6602fd63666d4ea088040f16','codeFillTheGap','','[]',FALSE),
('6602fd63666d4ea088040f21','6602fd63666d4ea088040f1e','codeValidatedInput','false',NULL,FALSE),
('6602fd63666d4ea088040f29','6602fd63666d4ea088040f26','codeNone','',NULL,FALSE),
('6602fd63666d4ea088040f2d','6602fd63666d4ea088040f2b','codeFillTheGap','','[]',FALSE),
('6602fd63666d4ea088040f38','6602fd63666d4ea088040f35','codeFillTheGap','true','[]',FALSE),
('6602fd63666d4ea088040f41','6602fd63666d4ea088040f3d','codeFillTheGap','false','["9 = 10"]',FALSE),
('6602fd63666d4ea088040f47','6602fd63666d4ea088040f44','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040f4f','6602fd63666d4ea088040f4a','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040f55','6602fd63666d4ea088040f52','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040f5d','6602fd63666d4ea088040f58','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040f63','6602fd63666d4ea088040f60','codeFillTheGap','false','[]',FALSE),
('6602fd63666d4ea088040f6c','6602fd63666d4ea088040f69','codeFillTheGap','false','["="]',FALSE),
('6602fd63666d4ea088040f72','6602fd63666d4ea088040f6f','codeFillTheGap','false','["10"]',FALSE),
('6602fd63666d4ea088040f78','6602fd63666d4ea088040f75','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea088040f7f','6602fd63666d4ea088040f7c','codeFillTheGap','true','["==="]',FALSE),
('6602fd63666d4ea088040f86','6602fd63666d4ea088040f82','codeFillTheGap','true','[]',FALSE),
('6602fd63666d4ea088040f8d','6602fd63666d4ea088040f8a','codeFillTheGap','false','[]',FALSE),
('6602fd63666d4ea088040f95','6602fd63666d4ea088040f91','codeValidatedInput','false
true',NULL,FALSE),
('6602fd63666d4ea088040f9d','6602fd63666d4ea088040f98','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040fa5','6602fd63666d4ea088040fa0','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040fad','6602fd63666d4ea088040fa8','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040fb5','6602fd63666d4ea088040fb0','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040fbb','6602fd63666d4ea088040fb8','codeFillTheGap','false','["==="]',FALSE),
('6602fd63666d4ea088040fc1','6602fd63666d4ea088040fbe','codeFillTheGap','false','["correctAnswer"]',FALSE),
('6602fd63666d4ea088040fc9','6602fd63666d4ea088040fc6','codeValidatedInput','false',NULL,FALSE),
('6602fd63666d4ea088040fcf','6602fd63666d4ea088040fcc','codeValidatedInput','',NULL,FALSE),
('6602fd63666d4ea088040fd7','6602fd63666d4ea088040fd4','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040fe0','6602fd63666d4ea088040fdb','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088040fe7','6602fd63666d4ea088040fe4','codeValidatedInput','',NULL,FALSE),
('6602fd63666d4ea088040fed','6602fd63666d4ea088040fea','codeFillTheGap','Atlanta','["Atlanta"]',FALSE),
('6602fd63666d4ea088040ff6','6602fd63666d4ea088040ff3','codeFillTheGap','Sugar, spice, and everything nice','["display"]',FALSE),
('6602fd63666d4ea088041001','6602fd63666d4ea088040ffc','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041008','6602fd63666d4ea088041005','codeFillTheGap','Miles left: 
2','["/"]',FALSE),
('6602fd63666d4ea088041010','6602fd63666d4ea08804100d','codeValidatedInput','1584',NULL,FALSE),
('6602fd63666d4ea088041016','6602fd63666d4ea088041013','codeFillTheGap','584','["+"]',FALSE),
('6602fd63666d4ea088041020','6602fd63666d4ea08804101b','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041027','6602fd63666d4ea088041024','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804102e','6602fd63666d4ea08804102b','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041035','6602fd63666d4ea088041032','codeFillTheGap','Logged in:
false
Logged in:
true','["!true","false"]',FALSE),
('6602fd63666d4ea08804103b','6602fd63666d4ea088041038','codeFillTheGap','','["\"",";"]',FALSE),
('6602fd63666d4ea088041041','6602fd63666d4ea08804103e','codeFillTheGap','3
Even split:
true','["false"]',FALSE),
('6602fd63666d4ea088041047','6602fd63666d4ea088041044','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804104e','6602fd63666d4ea08804104b','codeFillTheGap','false','["var"]',FALSE),
('6602fd63666d4ea088041057','6602fd63666d4ea088041052','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804105e','6602fd63666d4ea08804105b','codeFillTheGap','true','["<"]',FALSE),
('6602fd63666d4ea088041064','6602fd63666d4ea088041061','codeFillTheGap','true','["=="]',FALSE),
('6602fd63666d4ea0880410a5','6602fd63666d4ea0880410a2','codeFillTheGap','','["==="]',FALSE),
('6602fd63666d4ea0880410ab','6602fd63666d4ea0880410a8','codeFillTheGap','true','[">"]',FALSE),
('6602fd63666d4ea0880410b3','6602fd63666d4ea0880410b0','codeFillTheGap','false','[">"]',FALSE),
('6602fd63666d4ea0880410ba','6602fd63666d4ea0880410b7','codeFillTheGap','true','["<"]',FALSE),
('6602fd63666d4ea0880410c0','6602fd63666d4ea0880410bd','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880410c6','6602fd63666d4ea0880410c3','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880410ce','6602fd63666d4ea0880410c9','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880410d6','6602fd63666d4ea0880410d1','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880410dc','6602fd63666d4ea0880410d9','codeFillTheGap','true','["==="]',FALSE),
('6602fd63666d4ea0880410e4','6602fd63666d4ea0880410e1','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea0880410ea','6602fd63666d4ea0880410e7','codeFillTheGap','true','["<"]',FALSE),
('6602fd63666d4ea0880410f0','6602fd63666d4ea0880410ed','codeValidatedInput','false',NULL,FALSE),
('6602fd63666d4ea0880410f7','6602fd63666d4ea0880410f4','codeFillTheGap','true','["<"]',FALSE),
('6602fd63666d4ea0880410fd','6602fd63666d4ea0880410fa','codeFillTheGap','true','["<"]',FALSE),
('6602fd63666d4ea088041105','6602fd63666d4ea088041102','codeFillTheGap','true','["==="]',FALSE),
('6602fd63666d4ea08804110b','6602fd63666d4ea088041108','codeFillTheGap','true','["==="]',FALSE),
('6602fd63666d4ea088041111','6602fd63666d4ea08804110e','codeFillTheGap','true','["==="]',FALSE),
('6602fd63666d4ea088041119','6602fd63666d4ea088041116','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804111f','6602fd63666d4ea08804111c','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041125','6602fd63666d4ea088041122','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804112d','6602fd63666d4ea088041128','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041133','6602fd63666d4ea088041130','codeValidatedInput','Low battery: true',NULL,FALSE),
('6602fd63666d4ea088041139','6602fd63666d4ea088041136','codeFillTheGap','Level 2: true','["<="]',FALSE),
('6602fd63666d4ea088041140','6602fd63666d4ea08804113d','codeFillTheGap','false','[">="]',FALSE),
('6602fd63666d4ea088041148','6602fd63666d4ea088041145','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea088041153','6602fd63666d4ea088041150','codeFillTheGap','','["<="]',FALSE),
('6602fd63666d4ea088041159','6602fd63666d4ea088041156','codeFillTheGap','true','["<="]',FALSE),
('6602fd63666d4ea088041161','6602fd63666d4ea08804115e','codeFillTheGap','false','["\"apple\""]',FALSE),
('6602fd63666d4ea088041168','6602fd63666d4ea088041165','codeFillTheGap','false','["fruit3"]',FALSE),
('6602fd63666d4ea088041170','6602fd63666d4ea08804116d','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041176','6602fd63666d4ea088041173','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804117e','6602fd63666d4ea088041179','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041184','6602fd63666d4ea088041181','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804118a','6602fd63666d4ea088041187','codeFillTheGap','false','["="]',FALSE),
('6602fd63666d4ea088041190','6602fd63666d4ea08804118d','codeFillTheGap','false','["\"high\""]',FALSE),
('6602fd63666d4ea088041196','6602fd63666d4ea088041193','codeFillTheGap','false','["\"deerstalker hat\""]',FALSE),
('6602fd63666d4ea08804119c','6602fd63666d4ea088041199','codeValidatedInput','false',NULL,FALSE),
('6602fd63666d4ea0880411a3','6602fd63666d4ea0880411a0','codeFillTheGap','','["==="]',FALSE),
('6602fd63666d4ea0880411a9','6602fd63666d4ea0880411a6','codeFillTheGap','','["==="]',FALSE),
('6602fd63666d4ea0880411b0','6602fd63666d4ea0880411ae','codeNone','false',NULL,FALSE),
('6602fd63666d4ea0880411b5','6602fd63666d4ea0880411b2','codeFillTheGap','true','["==="]',FALSE),
('6602fd63666d4ea0880411bb','6602fd63666d4ea0880411b8','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880411c1','6602fd63666d4ea0880411be','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880411c9','6602fd63666d4ea0880411c4','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880411cf','6602fd63666d4ea0880411cc','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880411d5','6602fd63666d4ea0880411d2','codeFillTheGap','true','["==="]',FALSE),
('6602fd63666d4ea0880411db','6602fd63666d4ea0880411d8','codeFillTheGap','false','["\"misery.png\""]',FALSE),
('6602fd63666d4ea0880411e1','6602fd63666d4ea0880411de','codeFillTheGap','true','["\"Anna\""]',FALSE),
('6602fd63666d4ea0880411e7','6602fd63666d4ea0880411e4','codeFillTheGap','true','["==="]',FALSE),
('6602fd63666d4ea0880411f2','6602fd63666d4ea0880411ef','codeFillTheGap','Cookies','["42"]',FALSE),
('6602fd63666d4ea0880411f8','6602fd63666d4ea0880411f5','codeFillTheGap','42','["true"]',FALSE),
('6602fd63666d4ea0880411fe','6602fd63666d4ea0880411fb','codeFillTheGap','true','["\"true\""]',FALSE),
('6602fd63666d4ea088041204','6602fd63666d4ea088041201','codeFillTheGap','false','["49"]',FALSE),
('6602fd63666d4ea08804120b','6602fd63666d4ea088041208','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041211','6602fd63666d4ea08804120e','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041217','6602fd63666d4ea088041214','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804121d','6602fd63666d4ea08804121a','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041223','6602fd63666d4ea088041220','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041229','6602fd63666d4ea088041226','codeFillTheGap','Joey 28 true','["null"]',FALSE),
('6602fd63666d4ea088041231','6602fd63666d4ea08804122e','codeFillTheGap','Jill','["false"]',FALSE),
('6602fd63666d4ea088041237','6602fd63666d4ea088041234','codeFillTheGap','10','["\"10\""]',FALSE),
('6602fd63666d4ea08804123e','6602fd63666d4ea08804123b','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea088041244','6602fd63666d4ea088041241','codeFillTheGap','57','["\"fifty-seven\""]',FALSE),
('6602fd63666d4ea08804124f','6602fd63666d4ea08804124b','codeValidatedInput','1010
20',NULL,FALSE),
('6602fd63666d4ea088041256','6602fd63666d4ea088041252','codeFillTheGap','1010','["\"+\""]',FALSE),
('6602fd63666d4ea08804125c','6602fd63666d4ea088041259','codeFillTheGap','Your score: 99','["\"99\""]',FALSE),
('6602fd63666d4ea088041262','6602fd63666d4ea08804125f','codeFillTheGap','Your score: 99','["result"]',FALSE),
('6602fd63666d4ea088041269','6602fd63666d4ea088041265','codeFillTheGap','You passed: true','["\"true\""]',FALSE),
('6602fd63666d4ea08804126f','6602fd63666d4ea08804126c','codeFillTheGap','You passed: true','["\"pass\""]',FALSE),
('6602fd63666d4ea088041275','6602fd63666d4ea088041272','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804127b','6602fd63666d4ea088041278','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041283','6602fd63666d4ea08804127e','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804128b','6602fd63666d4ea088041286','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041291','6602fd63666d4ea08804128e','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041299','6602fd63666d4ea088041294','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804129f','6602fd63666d4ea08804129c','codeValidatedInput','50',NULL,FALSE),
('6602fd63666d4ea0880412a5','6602fd63666d4ea0880412a2','codeFillTheGap','1010','["10"]',FALSE),
('6602fd63666d4ea0880412ac','6602fd63666d4ea0880412a9','codeFillTheGap','Version: 2','["\"2\""]',FALSE),
('6602fd63666d4ea0880412b3','6602fd63666d4ea0880412b0','codeFillTheGap','Entry fee: 8','["\"fee\""]',FALSE),
('6602fd63666d4ea0880412bb','6602fd63666d4ea0880412b8','codeFillTheGap','Repeat: true','["\"true\""]',FALSE),
('6602fd63666d4ea0880412c2','6602fd63666d4ea0880412bf','codeValidatedInput','You won: true',NULL,FALSE),
('6602fd63666d4ea0880412d1','6602fd63666d4ea0880412ce','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea0880412d7','6602fd63666d4ea0880412d4','codeValidatedInput','false',NULL,FALSE),
('6602fd63666d4ea0880412dd','6602fd63666d4ea0880412da','codeFillTheGap','false','["isWorking"]',FALSE),
('6602fd63666d4ea0880412e5','6602fd63666d4ea0880412e2','codeFillTheGap','false','["==="]',FALSE),
('6602fd63666d4ea0880412ed','6602fd63666d4ea0880412ea','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880412f5','6602fd63666d4ea0880412f0','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880412fb','6602fd63666d4ea0880412f8','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041303','6602fd63666d4ea0880412fe','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041309','6602fd63666d4ea088041306','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea08804130f','6602fd63666d4ea08804130c','codeFillTheGap','Mail Sending Successful?: false','["!"]',FALSE),
('6602fd63666d4ea088041316','6602fd63666d4ea088041313','codeFillTheGap','false','[">"]',FALSE),
('6602fd63666d4ea08804131e','6602fd63666d4ea08804131b','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea08804132b','6602fd63666d4ea088041328','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea088041331','6602fd63666d4ea08804132e','codeValidatedInput','false',NULL,FALSE),
('6602fd63666d4ea088041337','6602fd63666d4ea088041334','codeValidatedInput','false',NULL,FALSE),
('6602fd63666d4ea08804133d','6602fd63666d4ea08804133a','codeFillTheGap','true','["|"]',FALSE),
('6602fd63666d4ea088041345','6602fd63666d4ea088041342','codeValidatedInput','false
true',NULL,FALSE),
('6602fd63666d4ea08804134b','6602fd63666d4ea088041348','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041353','6602fd63666d4ea08804134e','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041359','6602fd63666d4ea088041356','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804135f','6602fd63666d4ea08804135c','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041367','6602fd63666d4ea088041362','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804136d','6602fd63666d4ea08804136a','codeFillTheGap','true','["&&"]',FALSE),
('6602fd63666d4ea088041374','6602fd63666d4ea088041371','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea08804137a','6602fd63666d4ea088041377','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea088041380','6602fd63666d4ea08804137d','codeFillTheGap','false','["&&"]',FALSE),
('6602fd63666d4ea088041387','6602fd63666d4ea088041384','codeFillTheGap','Saved? : true','["&&"]',FALSE),
('6602fd63666d4ea088041390','6602fd63666d4ea08804138d','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041397','6602fd63666d4ea088041394','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea08804139e','6602fd63666d4ea08804139b','codeFillTheGap','true','["===","<="]',FALSE),
('6602fd63666d4ea0880413a7','6602fd63666d4ea0880413a4','codeFillTheGap','true','["26","27"]',FALSE),
('6602fd63666d4ea0880413ad','6602fd63666d4ea0880413aa','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea0880413b5','6602fd63666d4ea0880413b0','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880413bc','6602fd63666d4ea0880413b9','codeFillTheGap','false','["=","!=="]',FALSE),
('6602fd63666d4ea0880413c2','6602fd63666d4ea0880413bf','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880413c9','6602fd63666d4ea0880413c6','codeValidatedInput','true',NULL,FALSE),
('6602fd63666d4ea0880413d1','6602fd63666d4ea0880413cc','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880413d8','6602fd63666d4ea0880413d5','codeFillTheGap','2','["\"2\"","var"]',FALSE),
('6602fd63666d4ea0880413e1','6602fd63666d4ea0880413de','codeFillTheGap','101','["\"1\"","-"]',FALSE),
('6602fd63666d4ea0880413eb','6602fd63666d4ea0880413e6','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea0880413f2','6602fd63666d4ea0880413ef','codeFillTheGap','1001','["100","200"]',FALSE),
('6602fd63666d4ea0880413fc','6602fd63666d4ea0880413f7','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041403','6602fd63666d4ea088041400','codeFillTheGap','Logged in? : true','["||","&&"]',FALSE),
('6602fd63666d4ea088041409','6602fd63666d4ea088041406','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041412','6602fd63666d4ea08804140d','multipleChoice','',NULL,FALSE),
('6602fd63666d4ea088041419','6602fd63666d4ea088041416','codeFillTheGap','Code working? : true','["&&","!"]',FALSE),
('6602fd63666d4ea088041421','6602fd63666d4ea08804141e','codeValidatedInput','true',NULL,FALSE);




INSERT INTO "files" ("id","interaction_module_id","pre_interaction_module_id","is_interactive","name","content","code_language")
VALUES
('6602fd05a8fc89e974fa3f45','6602fd05a8fc89e974fa3f43',NULL,TRUE,'script.py','city ','python'),
('6602fd05a8fc89e974fa3f4b','6602fd05a8fc89e974fa3f49',NULL,TRUE,'script.py','home_city','python'),
('6602fd05a8fc89e974fa3f4f',NULL,'6602fd05a8fc89e974fa3f4e',FALSE,'script.py','high score','python'),
('6602fd05a8fc89e974fa3f59','6602fd05a8fc89e974fa3f57',NULL,TRUE,'script.py','home_city_province','python'),
('6602fd05a8fc89e974fa3f5f','6602fd05a8fc89e974fa3f5d',NULL,TRUE,'script.py','high_score','python'),
('6602fd05a8fc89e974fa3f72','6602fd05a8fc89e974fa3f6f',NULL,TRUE,'script.py','total_cash_amount','python'),
('6602fd05a8fc89e974fa3f78','6602fd05a8fc89e974fa3f76',NULL,TRUE,'script.py','friend_request','python'),
('6602fd05a8fc89e974fa3f7f','6602fd05a8fc89e974fa3f7d',NULL,TRUE,'script.py','car_1 = "Porsche"','python'),
('6602fd05a8fc89e974fa3f86','6602fd05a8fc89e974fa3f84',NULL,TRUE,'script.py','city = "Miami"','python'),
('6602fd05a8fc89e974fa3f8d','6602fd05a8fc89e974fa3f8a',NULL,TRUE,'script.py','device_type = "apple"','python'),
('6602fd05a8fc89e974fa3f94','6602fd05a8fc89e974fa3f91',NULL,TRUE,'script.py','city = "Miami"','python'),
('6602fd05a8fc89e974fa3f9c','6602fd05a8fc89e974fa3f98',NULL,TRUE,'script.py','movie_quote = "Winter is coming."','python'),
('6602fd05a8fc89e974fa3fa0',NULL,'6602fd05a8fc89e974fa3f9f',FALSE,'script.py','name = "Karin"','python'),
('6602fd05a8fc89e974fa3fae',NULL,'6602fd05a8fc89e974fa3fad',FALSE,'script.py','song_name = "Hey Ya!"','python'),
('6602fd05a8fc89e974fa3fb6',NULL,'6602fd05a8fc89e974fa3fb5',FALSE,'script.py','hobby = "Tree shaping"','python'),
('6602fd05a8fc89e974fa3fc2','6602fd05a8fc89e974fa3fbe',NULL,TRUE,'script.py','name = "Mario"
job = "Plumber"','python'),
('6602fd05a8fc89e974fa3fc9','6602fd05a8fc89e974fa3fc6',NULL,TRUE,'script.py','company = "Microsoft"','python'),
('6602fd05a8fc89e974fa3fd2','6602fd05a8fc89e974fa3fcd',NULL,TRUE,'script.py','job_title = "Analyst"','python'),
('6602fd05a8fc89e974fa3fd8','6602fd05a8fc89e974fa3fd6',NULL,TRUE,'script.py','user_agent = "desktop"','python'),
('6602fd05a8fc89e974fa3fe6','6602fd05a8fc89e974fa3fe2',NULL,TRUE,'script.py','step_1 = "Collect pants"
step_2 = "?"
step_3 = "Profit"','python'),
('6602fd05a8fc89e974fa3fec','6602fd05a8fc89e974fa3fea',NULL,TRUE,'script.py','print("Hello, World!")','python'),
('6602fd05a8fc89e974fa3ff4','6602fd05a8fc89e974fa3ff0',NULL,TRUE,'script.py','print("3, 2, 1")
print("GO!")','python'),
('6602fd05a8fc89e974fa3ffa','6602fd05a8fc89e974fa3ff8',NULL,TRUE,'script.py','greeting = "Hello, World!"
print(greeting)','python'),
('6602fd05a8fc89e974fa4000','6602fd05a8fc89e974fa3ffe',NULL,TRUE,'script.py','name = "Daenerys"
print(name)','python'),
('6602fd05a8fc89e974fa4016',NULL,'6602fd05a8fc89e974fa4015',FALSE,'script.py','sport = "B-ball"
print(sport)','python'),
('6602fd05a8fc89e974fa4021','6602fd05a8fc89e974fa401e',NULL,TRUE,'script.py','frequency = "daily"
print(frequency)','python'),
('6602fd05a8fc89e974fa4028','6602fd05a8fc89e974fa4025',NULL,TRUE,'script.py','print("Buzz")','python'),
('6602fd05a8fc89e974fa4031','6602fd05a8fc89e974fa402c',NULL,TRUE,'script.py','last_name = "Lightyear"
print(last_name)','python'),
('6602fd05a8fc89e974fa4037','6602fd05a8fc89e974fa4035',NULL,TRUE,'script.py','job = "Sheriff"
print(job)','python'),
('6602fd05a8fc89e974fa403f','6602fd05a8fc89e974fa403d',NULL,TRUE,'script.py','status = "Watching Netflix"
status = "Relaxing at the beach"
print(status)','python'),
('6602fd05a8fc89e974fa4047','6602fd05a8fc89e974fa4043',NULL,TRUE,'script.py','status = "Incomplete"
status = "Complete"
print(status)

status = "New data required"
print(status)
','python'),
('6602fd05a8fc89e974fa404d','6602fd05a8fc89e974fa404b',NULL,TRUE,'script.py','default_option = "upload"
new_status = "download"

new_status = default_option
print(new_status)','python'),
('6602fd05a8fc89e974fa4053','6602fd05a8fc89e974fa4051',NULL,TRUE,'script.py','status = "Playing football"
print(status)

status = "Walking the dog"
print(status)','python'),
('6602fd05a8fc89e974fa405d',NULL,'6602fd05a8fc89e974fa405c',FALSE,'script.py','status = "Watching Netflix"
print(status)','python'),
('6602fd05a8fc89e974fa4065',NULL,'6602fd05a8fc89e974fa4064',FALSE,'script.py','name = "Lori"
name = "Joe"','python'),
('6602fd05a8fc89e974fa406d',NULL,'6602fd05a8fc89e974fa406c',FALSE,'script.py','analysis = "Mean"
analysis = "Median"
print(analysis)','python'),
('6602fd05a8fc89e974fa4077','6602fd05a8fc89e974fa4075',NULL,TRUE,'script.py','temperature = "0 degrees"
temperature = "100 degrees"
print(temperature)','python'),
('6602fd05a8fc89e974fa407f','6602fd05a8fc89e974fa407b',NULL,TRUE,'script.py','status = "Completing spreadsheet"
status = "Writing code"
print(status)
','python'),
('6602fd05a8fc89e974fa4085','6602fd05a8fc89e974fa4083',NULL,TRUE,'script.py','currency = "Euro"
currency = "Dollar"
print(currency)
','python'),
('6602fd05a8fc89e974fa408b','6602fd05a8fc89e974fa4089',NULL,TRUE,'script.py','status = "Unfinished"
status = "Done"
print(status)
','python'),
('6602fd05a8fc89e974fa4092','6602fd05a8fc89e974fa4090',NULL,TRUE,'script.py','"Followers:" + "55"','python'),
('6602fd05a8fc89e974fa409a','6602fd05a8fc89e974fa4097',NULL,TRUE,'script.py','print("Followers:" + "55")','python'),
('6602fd05a8fc89e974fa40a1','6602fd05a8fc89e974fa409e',NULL,TRUE,'script.py','followers = "55"
print("Followers:" + followers)','python'),
('6602fd05a8fc89e974fa40a8','6602fd05a8fc89e974fa40a6',NULL,TRUE,'script.py','label = "Posts:" + "13"
print(label)
','python'),
('6602fd05a8fc89e974fa40ac',NULL,'6602fd05a8fc89e974fa40ab',FALSE,'script.py','label = "Name:" + "Joe"','python'),
('6602fd05a8fc89e974fa40b4',NULL,'6602fd05a8fc89e974fa40b3',FALSE,'script.py','print("Jon" + "athan")
','python'),
('6602fd05a8fc89e974fa40bc',NULL,'6602fd05a8fc89e974fa40bb',FALSE,'script.py','user = "snoopdogg"
print("Username:" + user)','python'),
('6602fd05a8fc89e974fa40c6','6602fd05a8fc89e974fa40c4',NULL,TRUE,'script.py','temperature = "14"
print(temperature + " degrees")','python'),
('6602fd05a8fc89e974fa40ce','6602fd05a8fc89e974fa40ca',NULL,TRUE,'script.py','print("Posts:" + "55")
','python'),
('6602fd05a8fc89e974fa40d6','6602fd05a8fc89e974fa40d2',NULL,TRUE,'script.py','title = "Ms. "
name = "Irene"

print(title + name)','python'),
('6602fd05a8fc89e974fa40dc','6602fd05a8fc89e974fa40da',NULL,TRUE,'script.py','number_of_likes = "40 "
print(number_of_likes + "likes")','python'),
('6602fd05a8fc89e974fa40e3','6602fd05a8fc89e974fa40e1',NULL,TRUE,'script.py','active_users = 5','python'),
('6602fd05a8fc89e974fa40eb','6602fd05a8fc89e974fa40e7',NULL,TRUE,'script.py','active_users = 5','python'),
('6602fd05a8fc89e974fa40f2','6602fd05a8fc89e974fa40ef',NULL,TRUE,'script.py','number_of_applications = 5 + 1
print(number_of_applications)','python'),
('6602fd05a8fc89e974fa40f8','6602fd05a8fc89e974fa40f6',NULL,TRUE,'script.py','percent = 0.5 * 100
print(percent)','python'),
('6602fd05a8fc89e974fa40ff','6602fd05a8fc89e974fa40fc',NULL,TRUE,'script.py','number_of_steps = 70
print("You''re on step:")
print(number_of_steps + 1)','python'),
('6602fd05a8fc89e974fa4107','6602fd05a8fc89e974fa4103',NULL,TRUE,'script.py','private = 3
public = 10
total = private + public
print("Total posts:")
print(total)','python'),
('6602fd05a8fc89e974fa410b',NULL,'6602fd05a8fc89e974fa410a',FALSE,'script.py','speed = 300 + 5','python'),
('6602fd05a8fc89e974fa4113',NULL,'6602fd05a8fc89e974fa4112',FALSE,'script.py','temperature = "3" + "1"
print(temperature)','python'),
('6602fd05a8fc89e974fa411b',NULL,'6602fd05a8fc89e974fa411a',FALSE,'script.py','score = 40 + 4','python'),
('6602fd05a8fc89e974fa4123',NULL,'6602fd05a8fc89e974fa4122',FALSE,'script.py','area = "3 * 5"
print(area)','python'),
('6602fd05a8fc89e974fa412e','6602fd05a8fc89e974fa412b',NULL,TRUE,'script.py','savings = 100
interest = 0.04
print(savings * interest)','python'),
('6602fd05a8fc89e974fa4136','6602fd05a8fc89e974fa4132',NULL,TRUE,'script.py','sum_of_grades = 460
students = 5
print(sum_of_grades / students)','python'),
('6602fd05a8fc89e974fa413e','6602fd05a8fc89e974fa413a',NULL,TRUE,'script.py','total = 100
discount = 20
print("Discounted price:")
print(total - discount)','python'),
('6602fd05a8fc89e974fa4144','6602fd05a8fc89e974fa4142',NULL,TRUE,'script.py','months_per_year = 12
print(months_per_year)','python'),
('6602fd05a8fc89e974fa4151','6602fd05a8fc89e974fa414e',NULL,TRUE,'script.py','powered_on = True','python'),
('6602fd05a8fc89e974fa4157','6602fd05a8fc89e974fa4155',NULL,TRUE,'script.py','correct = True
print(correct)','python'),
('6602fd05a8fc89e974fa4161','6602fd05a8fc89e974fa415e',NULL,TRUE,'script.py','print("Load data")
status = False
print(status)','python'),
('6602fd05a8fc89e974fa416b',NULL,'6602fd05a8fc89e974fa416a',FALSE,'script.py','upload = False','python'),
('6602fd05a8fc89e974fa4181','6602fd05a8fc89e974fa417f',NULL,TRUE,'script.py','print("Auto update")
print(False)
','python'),
('6602fd05a8fc89e974fa4187','6602fd05a8fc89e974fa4185',NULL,TRUE,'script.py','auto_save = True','python'),
('6602fd05a8fc89e974fa418d','6602fd05a8fc89e974fa418b',NULL,TRUE,'script.py','prevent_logout = False
','python'),
('6602fd05a8fc89e974fa4193','6602fd05a8fc89e974fa4191',NULL,TRUE,'script.py','calculate_average = True','python'),
('6602fd05a8fc89e974fa419f','6602fd05a8fc89e974fa419c',NULL,TRUE,'script.py','print(not True)','python'),
('6602fd05a8fc89e974fa41a6','6602fd05a8fc89e974fa41a3',NULL,TRUE,'script.py','print(not False)','python'),
('6602fd05a8fc89e974fa41ae','6602fd05a8fc89e974fa41aa',NULL,TRUE,'script.py','available = True
print(not available)','python'),
('6602fd05a8fc89e974fa41b7','6602fd05a8fc89e974fa41b2',NULL,TRUE,'script.py','morning = True
is_evening = not morning
print(is_evening)','python'),
('6602fd05a8fc89e974fa41c1',NULL,'6602fd05a8fc89e974fa41c0',FALSE,'script.py','latest_version = not True
print(latest_version)','python'),
('6602fd05a8fc89e974fa41cf',NULL,'6602fd05a8fc89e974fa41ce',FALSE,'script.py','result = not True','python'),
('6602fd05a8fc89e974fa41da','6602fd05a8fc89e974fa41d7',NULL,TRUE,'script.py','allow_duplicates = not True','python'),
('6602fd05a8fc89e974fa41e0','6602fd05a8fc89e974fa41de',NULL,TRUE,'script.py','print(not True)','python'),
('6602fd05a8fc89e974fa41e8','6602fd05a8fc89e974fa41e4',NULL,TRUE,'script.py','open_slot = True
not_available = not open_slot','python'),
('6602fd05a8fc89e974fa41ee','6602fd05a8fc89e974fa41ec',NULL,TRUE,'script.py','print(not True)','python'),
('6602fd05a8fc89e974fa41f5','6602fd05a8fc89e974fa41f4',NULL,FALSE,'script.py','entered_pin = 5448
expected_pin = 5440','python'),
('6602fd05a8fc89e974fa41fb','6602fd05a8fc89e974fa41f8',NULL,TRUE,'script.py','5 == 5','python'),
('6602fd05a8fc89e974fa4206','6602fd05a8fc89e974fa4202',NULL,TRUE,'script.py','print(10 == 10)','python'),
('6602fd05a8fc89e974fa420c','6602fd05a8fc89e974fa420a',NULL,TRUE,'script.py','print(9 == 10)','python'),
('6602fd05a8fc89e974fa4216',NULL,'6602fd05a8fc89e974fa4215',FALSE,'script.py','print(10 == 11)','python'),
('6602fd05a8fc89e974fa4224',NULL,'6602fd05a8fc89e974fa4223',FALSE,'script.py','print(5 + 13)
print(5 == 13)','python'),
('6602fd05a8fc89e974fa4230','6602fd05a8fc89e974fa422c',NULL,TRUE,'script.py','votes = 10
print(votes == 11)','python'),
('6602fd05a8fc89e974fa4236','6602fd05a8fc89e974fa4234',NULL,TRUE,'script.py','print(99 == 100)','python'),
('6602fd05a8fc89e974fa423c','6602fd05a8fc89e974fa423a',NULL,TRUE,'script.py','print(10 == 13)','python'),
('6602fd05a8fc89e974fa4242','6602fd05a8fc89e974fa4240',NULL,TRUE,'script.py','print(100 == 100)','python'),
('6602fd05a8fc89e974fa4249','6602fd05a8fc89e974fa4247',NULL,TRUE,'script.py','print(1 != 10)','python'),
('6602fd05a8fc89e974fa4250','6602fd05a8fc89e974fa424d',NULL,TRUE,'script.py','result = 1 != 2
print(result)','python'),
('6602fd05a8fc89e974fa4258','6602fd05a8fc89e974fa4254',NULL,TRUE,'script.py','result = 1 == 2
print(result)','python'),
('6602fd05a8fc89e974fa425e','6602fd05a8fc89e974fa425c',NULL,TRUE,'script.py','one = 1
two = 2
print(one == two)
print(one != two)','python'),
('6602fd05a8fc89e974fa4262',NULL,'6602fd05a8fc89e974fa4261',FALSE,'script.py','vote_count = 99
target = vote_count == 100
print(target)','python'),
('6602fd05a8fc89e974fa426a',NULL,'6602fd05a8fc89e974fa4269',FALSE,'script.py','result = 7 != 10
print(result)','python'),
('6602fd05a8fc89e974fa4272',NULL,'6602fd05a8fc89e974fa4271',FALSE,'script.py','orders = 1000 
capacity = orders == 1000
print(capacity)','python'),
('6602fd05a8fc89e974fa427a',NULL,'6602fd05a8fc89e974fa4279',FALSE,'script.py','score_one = 100
score_two = 80
equal = score_one == score_two','python'),
('6602fd05a8fc89e974fa4284','6602fd05a8fc89e974fa4282',NULL,TRUE,'script.py','print(10 != 10)','python'),
('6602fd05a8fc89e974fa428c','6602fd05a8fc89e974fa4288',NULL,TRUE,'script.py','answer = 16
correct_answer = answer == 13','python'),
('6602fd05a8fc89e974fa4292','6602fd05a8fc89e974fa4290',NULL,TRUE,'script.py','level = 5
highest_level = 50
print(level == highest_level)','python'),
('6602fd05a8fc89e974fa4298','6602fd05a8fc89e974fa4296',NULL,TRUE,'script.py','letters = 12
valid_answer = letters != 0','python'),
('6602fd05a8fc89e974fa42a3','6602fd05a8fc89e974fa42a1',NULL,TRUE,'script.py','print("new" + " messages")','python'),
('6602fd05a8fc89e974fa42aa','6602fd05a8fc89e974fa42a7',NULL,TRUE,'script.py','print(2 + " new messages")','python'),
('6602fd05a8fc89e974fa42b0','6602fd05a8fc89e974fa42ae',NULL,TRUE,'script.py','print(f"{2} new messages")','python'),
('6602fd06a8fc89e974fa42b7','6602fd06a8fc89e974fa42b4',NULL,TRUE,'script.py','print(f"{6} new messages")','python'),
('6602fd06a8fc89e974fa42bd','6602fd06a8fc89e974fa42bb',NULL,TRUE,'script.py','print(f"{2} new messages")','python'),
('6602fd06a8fc89e974fa42c3','6602fd06a8fc89e974fa42c1',NULL,TRUE,'script.py','new_messages = 2
print(f"{new_messages} new messages")','python'),
('6602fd06a8fc89e974fa42c9','6602fd06a8fc89e974fa42c7',NULL,TRUE,'script.py','new = 5
read = 2

print(f"{new - read} unread messages")','python'),
('6602fd06a8fc89e974fa42d0','6602fd06a8fc89e974fa42cd',NULL,TRUE,'script.py','print(f"{5} new messages and {2} friend requests")','python'),
('6602fd06a8fc89e974fa42d8','6602fd06a8fc89e974fa42d4',NULL,TRUE,'script.py','new = 5
status = f"{new} new messages"

print(status)','python'),
('6602fd06a8fc89e974fa42f6','6602fd06a8fc89e974fa42f4',NULL,TRUE,'script.py','print(f"{4} dataset entries")','python'),
('6602fd06a8fc89e974fa42fc','6602fd06a8fc89e974fa42fa',NULL,TRUE,'script.py','print(f"popularity increased by {12}%")','python'),
('6602fd06a8fc89e974fa4302','6602fd06a8fc89e974fa4300',NULL,TRUE,'script.py','print(f"I would walk {500} miles")','python'),
('6602fd06a8fc89e974fa430a','6602fd06a8fc89e974fa4306',NULL,TRUE,'script.py','degrees = 70
print(f"Temperature: {degrees}F")','python'),
('6602fd06a8fc89e974fa4313','6602fd06a8fc89e974fa430e',NULL,TRUE,'script.py','movie = "Vertigo"
display = f"Airing tonight: {movie}"

print(display)','python'),
('6602fd06a8fc89e974fa431d','6602fd06a8fc89e974fa4319',NULL,TRUE,'script.py','sign_ups = "low"','python'),
('6602fd06a8fc89e974fa4323','6602fd06a8fc89e974fa4321',NULL,TRUE,'script.py','highest_gdp = "United States"','python'),
('6602fd06a8fc89e974fa4329','6602fd06a8fc89e974fa4327',NULL,TRUE,'script.py','account_type = "Enterprise"','python'),
('6602fd06a8fc89e974fa4336','6602fd06a8fc89e974fa4334',NULL,TRUE,'script.py','age_group = "25-34 years old"
print(age_group)','python'),
('6602fd06a8fc89e974fa433a',NULL,'6602fd06a8fc89e974fa4339',FALSE,'script.py','average_grade = "B"
average_grade = "A-"
subject = "Programming"
print(average_grade)','python'),
('6602fd06a8fc89e974fa4347','6602fd06a8fc89e974fa4343',NULL,TRUE,'script.py','average_rating = 25
average_rating = 5
print(average_rating)','python'),
('6602fd06a8fc89e974fa4359',NULL,'6602fd06a8fc89e974fa4358',FALSE,'script.py','print("Hair" + "cut")','python'),
('6602fd06a8fc89e974fa436d','6602fd06a8fc89e974fa4369',NULL,TRUE,'script.py','save_file = False','python'),
('6602fd06a8fc89e974fa4371',NULL,'6602fd06a8fc89e974fa4370',FALSE,'script.py','is_close = True
is_far = not is_close

print(is_far)','python'),
('6602fd06a8fc89e974fa437c','6602fd06a8fc89e974fa437a',NULL,TRUE,'script.py','is_connected = not False
','python'),
('6602fd06a8fc89e974fa4395',NULL,'6602fd06a8fc89e974fa4394',FALSE,'script.py','hazelnuts = 13
label = f"{hazelnuts}% hazelnuts"

print(label)
','python'),
('6602fd06a8fc89e974fa43a2','6602fd06a8fc89e974fa439e',NULL,TRUE,'script.py','author = "Virginia Woolf"
description = f"A book by {author}"

print(description)','python'),
('6602fd06a8fc89e974fa43a8','6602fd06a8fc89e974fa43a6',NULL,TRUE,'script.py','data_points = 3
print(data_points != 0)','python'),
('6602fd06a8fc89e974fa43ac',NULL,'6602fd06a8fc89e974fa43ab',FALSE,'script.py','print(906 == 9006)','python'),
('6602fd06a8fc89e974fa43b7','6602fd06a8fc89e974fa43b5',NULL,TRUE,'script.py','downloads = 999
print(downloads == 1000)','python'),
('6602fd06a8fc89e974fa43bd',NULL,'6602fd06a8fc89e974fa43bc',FALSE,'script.py','movie = "Mulan"
print("movie")','python'),
('6602fd06a8fc89e974fa43c7',NULL,'6602fd06a8fc89e974fa43c6',FALSE,'script.py','next_appointment = "interview"','python'),
('6602fd06a8fc89e974fa43d3','6602fd06a8fc89e974fa43d1',NULL,TRUE,'script.py','car_brand = "Tesla"','python'),
('6602fd06a8fc89e974fa43da','6602fd06a8fc89e974fa43d7',NULL,TRUE,'script.py','step_1 = "sift flour"
step_2 = "mix in sugar"

print(step_1)
print(step_2)','python'),
('6602fd06a8fc89e974fa43de',NULL,'6602fd06a8fc89e974fa43dd',FALSE,'script.py','print("connect to power")
print("press the upload button")','python'),
('6602fd06a8fc89e974fa43ea','6602fd06a8fc89e974fa43e8',NULL,TRUE,'script.py','print("One new message")','python'),
('6602fd06a8fc89e974fa43f0','6602fd06a8fc89e974fa43ee',NULL,TRUE,'script.py','favorite_color = "blue"','python'),
('6602fd06a8fc89e974fa43f9','6602fd06a8fc89e974fa43f4',NULL,TRUE,'script.py','astronaut = "Kalpana Chawla"
print(astronaut)','python'),
('6602fd06a8fc89e974fa43fd',NULL,'6602fd06a8fc89e974fa43fc',FALSE,'script.py','answer = "47"','python'),
('6602fd06a8fc89e974fa4407',NULL,'6602fd06a8fc89e974fa4406',FALSE,'script.py','new_ entry ','python'),
('6602fd06a8fc89e974fa4413','6602fd06a8fc89e974fa4411',NULL,TRUE,'script.py','time = "morning"','python'),
('6602fd06a8fc89e974fa4417',NULL,'6602fd06a8fc89e974fa4416',FALSE,'script.py','print("Good morning!")','python'),
('6602fd06a8fc89e974fa4422',NULL,'6602fd06a8fc89e974fa4421',FALSE,'script.py','today = "Sunday"
today = monday
print(today)','python'),
('6602fd06a8fc89e974fa442c',NULL,'6602fd06a8fc89e974fa442b',FALSE,'script.py','bill = 30
split_bill = bill/2
print(split_bill)','python'),
('6602fd06a8fc89e974fa443a','6602fd06a8fc89e974fa4438',NULL,TRUE,'script.py','barista = "Brandon"
barista = "Louise"
print("Today''s shift: " + barista)','python'),
('6602fd06a8fc89e974fa443e',NULL,'6602fd06a8fc89e974fa443d',FALSE,'script.py','plans = "cinema"
plans = "picnic"
print("Saturday: " + plans)','python'),
('6602fd06a8fc89e974fa4448',NULL,'6602fd06a8fc89e974fa4447',FALSE,'script.py','tries_left = "four"
tries_left = 4
print(tries_left)','python'),
('6602fd06a8fc89e974fa4454','6602fd06a8fc89e974fa4452',NULL,TRUE,'script.py','start_label = "Go"
stop_label = "Stop"
button_label = start_label
print(button_label)','python'),
('6602fd06a8fc89e974fa4458',NULL,'6602fd06a8fc89e974fa4457',FALSE,'script.py','total = 3 + 5
print("Total: ")
print(total)','python'),
('6602fd06a8fc89e974fa4466','6602fd06a8fc89e974fa4463',NULL,TRUE,'script.py','value_1 = 7
value_2 = 3
average = (value_1 + value_2) / 2
print(average)','python'),
('6602fd06a8fc89e974fa446e','6602fd06a8fc89e974fa446c',NULL,TRUE,'script.py','print(not True)','python'),
('6602fd06a8fc89e974fa4474','6602fd06a8fc89e974fa4472',NULL,TRUE,'script.py','allow_cookies = not False
print(allow_cookies)','python'),
('6602fd06a8fc89e974fa4478',NULL,'6602fd06a8fc89e974fa4477',FALSE,'script.py','logged_in = True
logged_in = not True

print(logged_in)
','python'),
('6602fd06a8fc89e974fa4488','6602fd06a8fc89e974fa4483',NULL,TRUE,'script.py','open_slot = True
is_available = not open_slot

print(is_available)
','python'),
('6602fd06a8fc89e974fa4495',NULL,'6602fd06a8fc89e974fa4494',FALSE,'script.py','flight_mode = True
updating = not flight_mode
use_apps = not updating

print(use_apps)','python'),
('6602fd06a8fc89e974fa44aa','6602fd06a8fc89e974fa44a8',NULL,TRUE,'script.py','num_1 = 17
num_2 = 23

print(num_1 != num_2)','python'),
('6602fd06a8fc89e974fa44b0','6602fd06a8fc89e974fa44ae',NULL,TRUE,'script.py','print(5 == 5)','python'),
('6602fd06a8fc89e974fa44bf','6602fd06a8fc89e974fa44bd',NULL,TRUE,'script.py','today = 12
print(today == 13)','python'),
('6602fd06a8fc89e974fa44c3',NULL,'6602fd06a8fc89e974fa44c2',FALSE,'script.py','player_1 = 0
player_2 = 10
player_1 = 10
same_score = player_1 == player_2


print("It''s a tie:")

print(same_score)','python'),
('6602fd06a8fc89e974fa44cf','6602fd06a8fc89e974fa44cd',NULL,TRUE,'script.py','print(50 != 500)','python'),
('6602fd06a8fc89e974fa44d3',NULL,'6602fd06a8fc89e974fa44d2',FALSE,'script.py','downloaded = 9
downloaded = downloaded + 1

in_progress = downloaded != 10

print("Download finished:")

print(in_progress)','python'),
('6602fd06a8fc89e974fa44df','6602fd06a8fc89e974fa44dd',NULL,TRUE,'script.py','points_gathered = 142;
no_points = points_gathered == 0

print(no_points)','python'),
('6602fd06a8fc89e974fa44e4',NULL,'6602fd06a8fc89e974fa44e3',FALSE,'script.py','ingredient = "sugar"
quantity = 100
print(f"Add {quantity} grams of {ingredient}")','python'),
('6602fd06a8fc89e974fa44f5','6602fd06a8fc89e974fa44ee',NULL,TRUE,'script.py','task = "dishes"
print(f"todo: {task}")','python'),
('6602fd06a8fc89e974fa44f9',NULL,'6602fd06a8fc89e974fa44f8',FALSE,'script.py','requests = 2
print("{requests} new friend requests")','python'),
('6602fd06a8fc89e974fa4505','6602fd06a8fc89e974fa4503',NULL,TRUE,'script.py','name = "John"
print("Hello, " + name + "!")
print(f"Hello, {name}!")','python'),
('6602fd06a8fc89e974fa4509',NULL,'6602fd06a8fc89e974fa4508',FALSE,'script.py','min_age = 18
max_age = 28
print(f"{88}% of social media users are aged between {min_age} and {max_age}")','python'),
('6602fd06a8fc89e974fa4515','6602fd06a8fc89e974fa4513',NULL,TRUE,'script.py','print(f"Mexico was the leading avocado producer in {2018}")','python'),
('6602fd06a8fc89e974fa4519',NULL,'6602fd06a8fc89e974fa4518',FALSE,'script.py','first = "English"
second = "Mandarin Chinese"
third = "Hindi"
print(f"Most spoken languages: {first}, {second}, {third}.")','python'),
('6602fd06a8fc89e974fa4527','6602fd06a8fc89e974fa4523',NULL,TRUE,'script.py','hours = 14
minutes = 45
destination = "Paris"
print(f"Your flight to {destination} takes off at {hours}:{minutes}")','python'),
('6602fd06a8fc89e974fa452b',NULL,'6602fd06a8fc89e974fa452a',FALSE,'script.py','player_1 = "rock"
player_2 = "rock"

print(f"It''s a tie between {player_1} and {player_2}")','python'),
('6602fd06a8fc89e974fa4535',NULL,'6602fd06a8fc89e974fa4534',FALSE,'script.py','name = "Kim"
greeting = "Good morning, {name}"','python'),
('6602fd06a8fc89e974fa4541','6602fd06a8fc89e974fa453f',NULL,TRUE,'script.py','percentage = 11.19
fact = f"water is {percentage}% hydrogen"

print(fact)','python'),
('6602fd06a8fc89e974fa454f','6602fd06a8fc89e974fa454d',NULL,TRUE,'script.py','print(f"{200} grams of flour")','python'),
('6602fd06a8fc89e974fa4558','6602fd06a8fc89e974fa4553',NULL,TRUE,'script.py','cocoa = 70
print(f"{cocoa}% cocoa")','python'),
('6602fd06a8fc89e974fa456b','6602fd06a8fc89e974fa4569',NULL,TRUE,'script.py','1 < 90 ','python'),
('6602fd06a8fc89e974fa4573','6602fd06a8fc89e974fa456f',NULL,TRUE,'script.py','print(1 < 235)','python'),
('6602fd06a8fc89e974fa457a','6602fd06a8fc89e974fa4577',NULL,TRUE,'script.py','print(235 < 1)','python'),
('6602fd06a8fc89e974fa4580','6602fd06a8fc89e974fa457e',NULL,TRUE,'script.py','print(101 > 90)','python'),
('6602fd06a8fc89e974fa4590',NULL,'6602fd06a8fc89e974fa458f',FALSE,'script.py','print(10 < 1)','python'),
('6602fd06a8fc89e974fa4598',NULL,'6602fd06a8fc89e974fa4597',FALSE,'script.py','print(1 > 1)','python'),
('6602fd06a8fc89e974fa45a4','6602fd06a8fc89e974fa45a0',NULL,TRUE,'script.py','print(5 > 4)','python'),
('6602fd06a8fc89e974fa45aa','6602fd06a8fc89e974fa45a8',NULL,TRUE,'script.py','print(30 < 40)','python'),
('6602fd06a8fc89e974fa45b0','6602fd06a8fc89e974fa45ae',NULL,TRUE,'script.py','print(10 > 9)','python'),
('6602fd06a8fc89e974fa45b6','6602fd06a8fc89e974fa45b4',NULL,TRUE,'script.py','print(100 > 200)','python'),
('6602fd06a8fc89e974fa45bd','6602fd06a8fc89e974fa45bb',NULL,TRUE,'script.py','print(1 <= 3)','python'),
('6602fd06a8fc89e974fa45c5','6602fd06a8fc89e974fa45c1',NULL,TRUE,'script.py','print(11 <= 11)','python'),
('6602fd06a8fc89e974fa45cb','6602fd06a8fc89e974fa45c9',NULL,TRUE,'script.py','print(3099 >= 3099)','python'),
('6602fd06a8fc89e974fa45d2','6602fd06a8fc89e974fa45cf',NULL,TRUE,'script.py','result = 1 <= 15
print(result)','python'),
('6602fd06a8fc89e974fa45da','6602fd06a8fc89e974fa45d6',NULL,TRUE,'script.py','min = 5
max = 10
result = min <= max
print(result)','python'),
('6602fd06a8fc89e974fa45f0',NULL,'6602fd06a8fc89e974fa45ef',FALSE,'script.py','print(10 >= 10)','python'),
('6602fd06a8fc89e974fa45fa','6602fd06a8fc89e974fa45f8',NULL,TRUE,'script.py','battery_level = 10
low = battery_level <= 20
print("Low battery:")
print(low)','python'),
('6602fd06a8fc89e974fa4600','6602fd06a8fc89e974fa45fe',NULL,TRUE,'script.py','points = 12
level_two = points >= 10
print("Level 2:")
print(level_two)','python'),
('6602fd06a8fc89e974fa4608','6602fd06a8fc89e974fa4604',NULL,TRUE,'script.py','solved = 20
minimum = 10
lost_streak = solved <= minimum','python'),
('6602fd06a8fc89e974fa460e','6602fd06a8fc89e974fa460c',NULL,TRUE,'script.py','print(60 >= 50)','python'),
('6602fd06a8fc89e974fa4614','6602fd06a8fc89e974fa4613',NULL,FALSE,'script.py','print("online" == "online")
print("online" != "offline")','python'),
('6602fd06a8fc89e974fa461a','6602fd06a8fc89e974fa4618',NULL,TRUE,'script.py','print("apple" == "apple")','python'),
('6602fd06a8fc89e974fa4622','6602fd06a8fc89e974fa461e',NULL,TRUE,'script.py','print("apple" == "apple")','python'),
('6602fd06a8fc89e974fa4629','6602fd06a8fc89e974fa4626',NULL,TRUE,'script.py','print("apple" == "orange")','python'),
('6602fd06a8fc89e974fa4631','6602fd06a8fc89e974fa462d',NULL,TRUE,'script.py','fruit_1 = "apple"
fruit_2 = "orange"
 
print(fruit_1 == fruit_2)','python'),
('6602fd06a8fc89e974fa4641',NULL,'6602fd06a8fc89e974fa4640',FALSE,'script.py','print("LED+" == "LED");','python'),
('6602fd06a8fc89e974fa4651','6602fd06a8fc89e974fa464f',NULL,TRUE,'script.py','my_answer = "act"
solution  = "ace"
 
print(my_answer == solution)','python'),
('6602fd06a8fc89e974fa4657','6602fd06a8fc89e974fa4655',NULL,TRUE,'script.py','my_answer = "high"
solution = "low"
 
print(my_answer == solution)','python'),
('6602fd06a8fc89e974fa465d','6602fd06a8fc89e974fa465b',NULL,TRUE,'script.py','item_1 = "deerstalker hat"
item_2 = "pipe"
 
is_duplicate = item_1 == item_2','python'),
('6602fd06a8fc89e974fa4663','6602fd06a8fc89e974fa4661',NULL,TRUE,'script.py','print("liquid" == "solid")','python'),
('6602fd06a8fc89e974fa466a','6602fd06a8fc89e974fa4668',NULL,TRUE,'script.py','print("subscribed" != "rejected")','python'),
('6602fd06a8fc89e974fa4672','6602fd06a8fc89e974fa466e',NULL,TRUE,'script.py','print("subscribed" != "rejected")','python'),
('6602fd06a8fc89e974fa4679','6602fd06a8fc89e974fa4676',NULL,TRUE,'script.py','print("subscribed" != "subscribed")','python'),
('6602fd06a8fc89e974fa467f','6602fd06a8fc89e974fa467d',NULL,TRUE,'script.py','same = "subscribed" != "subscribed"
print(same)','python'),
('6602fd06a8fc89e974fa468f',NULL,'6602fd06a8fc89e974fa468e',FALSE,'script.py','print("orange" != "yellow")','python'),
('6602fd06a8fc89e974fa469f','6602fd06a8fc89e974fa469d',NULL,TRUE,'script.py','my_answer = "act"
solution  = "ace"
 
print(my_answer != solution)','python'),
('6602fd06a8fc89e974fa46a5','6602fd06a8fc89e974fa46a3',NULL,TRUE,'script.py','wallpaper = "bliss.png"
 
print(wallpaper != "bliss.png")','python'),
('6602fd06a8fc89e974fa46ab','6602fd06a8fc89e974fa46a9',NULL,TRUE,'script.py','previous_leader = "Anna"
new_leader = "Jim"
 
leader_changed = previous_leader != new_leader','python'),
('6602fd06a8fc89e974fa46b1','6602fd06a8fc89e974fa46af',NULL,TRUE,'script.py','big_city = "Tokyo"
small_city = "Zurich"

print(big_city != small_city)','python'),
('6602fd06a8fc89e974fa46bc','6602fd06a8fc89e974fa46ba',NULL,TRUE,'script.py','sugar_content = "High"','python'),
('6602fd06a8fc89e974fa46c2','6602fd06a8fc89e974fa46c0',NULL,TRUE,'script.py','score = 42','python'),
('6602fd06a8fc89e974fa46ca','6602fd06a8fc89e974fa46c6',NULL,TRUE,'script.py','pi = 3.14159','python'),
('6602fd06a8fc89e974fa46d0','6602fd06a8fc89e974fa46ce',NULL,TRUE,'script.py','received_newsletter = True','python'),
('6602fd06a8fc89e974fa46d8','6602fd06a8fc89e974fa46d4',NULL,TRUE,'script.py','is_on = False','python'),
('6602fd06a8fc89e974fa46ee',NULL,'6602fd06a8fc89e974fa46ed',FALSE,'script.py','result = 3.33','python'),
('6602fd06a8fc89e974fa4706','6602fd06a8fc89e974fa4702',NULL,TRUE,'script.py','name = "Joey"
age = 28
is_active = True','python'),
('6602fd06a8fc89e974fa470c','6602fd06a8fc89e974fa470a',NULL,TRUE,'script.py','name = "Jill"','python'),
('6602fd06a8fc89e974fa4712','6602fd06a8fc89e974fa4710',NULL,TRUE,'script.py','minutes_left = 10','python'),
('6602fd06a8fc89e974fa4719','6602fd06a8fc89e974fa4716',NULL,TRUE,'script.py','average_score = 65.55','python'),
('6602fd06a8fc89e974fa471f','6602fd06a8fc89e974fa471d',NULL,TRUE,'script.py','positive_score = True

','python'),
('6602fd06a8fc89e974fa4725','6602fd06a8fc89e974fa4723',NULL,TRUE,'script.py','number_of_appearances = 11','python'),
('6602fd06a8fc89e974fa472d','6602fd06a8fc89e974fa472b',NULL,TRUE,'script.py','is_ready = True
print(type(is_ready))','python'),
('6602fd06a8fc89e974fa4738','6602fd06a8fc89e974fa4732',NULL,TRUE,'script.py','is_ready = True
fuel_deposit = 59.89
best_grade = "A"
number_of_pets = 2
print(type(is_ready))
print(type(fuel_deposit))
print(type(best_grade))
print(type(number_of_pets))','python'),
('6602fd06a8fc89e974fa473d',NULL,'6602fd06a8fc89e974fa473c',FALSE,'script.py','age = "17"
print(age < 18)','python'),
('6602fd06a8fc89e974fa4747','6602fd06a8fc89e974fa4745',NULL,TRUE,'script.py','age = "17"
print(type(age))

converted_age = int(age)
print(type(converted_age))

print(converted_age < 18)','python'),
('6602fd06a8fc89e974fa4751','6602fd06a8fc89e974fa474c',NULL,TRUE,'script.py','password = 980790
old_password = "8lk29"

print(str(password) == old_password)

print(type(password))
print(type(old_password))','python'),
('6602fd06a8fc89e974fa4757','6602fd06a8fc89e974fa4755',NULL,TRUE,'script.py','price = 9.99
print(int(price))
','python'),
('6602fd06a8fc89e974fa4760','6602fd06a8fc89e974fa475b',NULL,TRUE,'script.py','weeks = 12
print(float(weeks))
','python'),
('6602fd06a8fc89e974fa4768','6602fd06a8fc89e974fa4765',NULL,TRUE,'script.py','member = True
not_member = False

value = int(member)
second_value = int(not_member)

print(value)
print(second_value)','python'),
('6602fd06a8fc89e974fa4772','6602fd06a8fc89e974fa476d',NULL,TRUE,'script.py','member = "Sam"
middle_name = ""
foot_size = 8.5
siblings = 0

boolean_member = bool(member)
boolean_middle_name = bool(middle_name)
boolean_foot_size = bool(foot_size)
boolean_siblings = bool(siblings)

print(boolean_member)
print(boolean_middle_name)
print(boolean_foot_size)
print(boolean_siblings)','python'),
('6602fd06a8fc89e974fa4779','6602fd06a8fc89e974fa4776',NULL,TRUE,'script.py','pets = 3
kids = 0
has_pets = bool(pets)
has_kids = bool(kids)

print(has_pets)
print(has_kids)','python'),
('6602fd06a8fc89e974fa4783',NULL,'6602fd06a8fc89e974fa4782',FALSE,'script.py','average_score = 4.7
print(int(average_score))','python'),
('6602fd06a8fc89e974fa4794','6602fd06a8fc89e974fa4791',NULL,TRUE,'script.py','detail = "I like it"
response = bool(detail)
print(response)


','python'),
('6602fd06a8fc89e974fa479a',NULL,'6602fd06a8fc89e974fa4799',FALSE,'script.py','print(100 > 1)','python'),
('6602fd06a8fc89e974fa47a5','6602fd06a8fc89e974fa47a3',NULL,TRUE,'script.py','print(11 >= 11)','python'),
('6602fd06a8fc89e974fa47ae','6602fd06a8fc89e974fa47a9',NULL,TRUE,'script.py','score = 32
min_score = 30
pass = score >= min_score','python'),
('6602fd06a8fc89e974fa47b4','6602fd06a8fc89e974fa47b2',NULL,TRUE,'script.py','score = 11
min_score = 10
pass_grade = score >= min_score','python'),
('6602fd06a8fc89e974fa47c1','6602fd06a8fc89e974fa47bf',NULL,TRUE,'script.py','copy = "results.xls"
submission  = "sales.xls"
 
print(copy != submission)','python'),
('6602fd06a8fc89e974fa47c5',NULL,'6602fd06a8fc89e974fa47c4',FALSE,'script.py','print("Nina" != "Nina")','python'),
('6602fd06a8fc89e974fa47dc',NULL,'6602fd06a8fc89e974fa47db',FALSE,'script.py','print(type(False))','python'),
('6602fd06a8fc89e974fa47ea','6602fd06a8fc89e974fa47e5',NULL,TRUE,'script.py','result = 100 + 1
print(result)','python'),
('6602fd06a8fc89e974fa47f2','6602fd06a8fc89e974fa47ee',NULL,TRUE,'script.py','last_name = "Clooney"','python'),
('6602fd06a8fc89e974fa47f6',NULL,'6602fd06a8fc89e974fa47f5',FALSE,'script.py','length = 44.34','python'),
('6602fd06a8fc89e974fa4803','6602fd06a8fc89e974fa47ff',NULL,TRUE,'script.py','score = 2
','python'),
('6602fd06a8fc89e974fa481e',NULL,'6602fd06a8fc89e974fa481d',FALSE,'script.py','first = 0
second = 0
print(first >= second)','python'),
('6602fd06a8fc89e974fa4832','6602fd06a8fc89e974fa4830',NULL,TRUE,'script.py','paid = 5
price = 2
give_change = paid > price','python'),
('6602fd06a8fc89e974fa4838','6602fd06a8fc89e974fa4836',NULL,TRUE,'script.py','rating = 4
highly_rated = rating >= 4

print("Highly rated:")

print(highly_rated)


','python'),
('6602fd06a8fc89e974fa483d',NULL,'6602fd06a8fc89e974fa483c',FALSE,'script.py','tries_left = 3
print(tries_left >= 0)
print(tries_left > 0)
','python'),
('6602fd06a8fc89e974fa4849','6602fd06a8fc89e974fa4847',NULL,TRUE,'script.py','votes = 200
is_featured = votes >= 200
','python'),
('6602fd06a8fc89e974fa4854','6602fd06a8fc89e974fa484e',NULL,TRUE,'script.py','value = 90
minimum = 100
give_discount = value >= minimum

print("Give discount: ")
print(give_discount)','python'),
('6602fd06a8fc89e974fa485b','6602fd06a8fc89e974fa4859',NULL,TRUE,'script.py','age = 19
min_age = 16

print("Old enough to drive:");

print(age >= min_age)','python'),
('6602fd06a8fc89e974fa4861',NULL,'6602fd06a8fc89e974fa4860',FALSE,'script.py','print("tweet" == "post")','python'),
('6602fd06a8fc89e974fa486d','6602fd06a8fc89e974fa486b',NULL,TRUE,'script.py','accountant = "Lisa"
singer = "Joan"
print(accountant == singer)','python'),
('6602fd06a8fc89e974fa4875','6602fd06a8fc89e974fa4871',NULL,TRUE,'script.py','print("Diana" == "Charles")','python'),
('6602fd06a8fc89e974fa4879',NULL,'6602fd06a8fc89e974fa4878',FALSE,'script.py','print("go" != "go")
print("go" == "stop")','python'),
('6602fd06a8fc89e974fa4885','6602fd06a8fc89e974fa4883',NULL,TRUE,'script.py','item_1 = "pipe"
item_2 = "pipe"
 
is_duplicate = item_1 == item_2','python'),
('6602fd06a8fc89e974fa488b','6602fd06a8fc89e974fa4889',NULL,TRUE,'script.py','print("4G" != "5G")','python'),
('6602fd06a8fc89e974fa489a','6602fd06a8fc89e974fa4898',NULL,TRUE,'script.py','big_city = "Tokyo"
small_city = "Zurich"

print(big_city != small_city)','python'),
('6602fd06a8fc89e974fa489f',NULL,'6602fd06a8fc89e974fa489e',FALSE,'script.py','pet_name = "Charlie"
pet_age = 6','python'),
('6602fd06a8fc89e974fa48aa',NULL,'6602fd06a8fc89e974fa48a9',FALSE,'script.py','product_id = "37"

print(type(product_id))','python'),
('6602fd06a8fc89e974fa48b8','6602fd06a8fc89e974fa48b4',NULL,TRUE,'script.py','topic = "Biology"','python'),
('6602fd06a8fc89e974fa48bc',NULL,'6602fd06a8fc89e974fa48bb',FALSE,'script.py','locked = True
print(type(locked))','python'),
('6602fd06a8fc89e974fa48c8','6602fd06a8fc89e974fa48c6',NULL,TRUE,'script.py','status = "away"
online = True

print(online)','python'),
('6602fd06a8fc89e974fa48cc',NULL,'6602fd06a8fc89e974fa48cb',FALSE,'script.py','price_1 = 15.99
price_2 = 16','python'),
('6602fd06a8fc89e974fa48d7',NULL,'6602fd06a8fc89e974fa48d6',FALSE,'script.py','rating = 5.7','python'),
('6602fd62666d4ea088040be3','6602fd62666d4ea088040be1',NULL,TRUE,'script.js','let
const','javascript'),
('6602fd62666d4ea088040be9','6602fd62666d4ea088040be7',NULL,TRUE,'script.js','let city ','javascript'),
('6602fd62666d4ea088040bef','6602fd62666d4ea088040bed',NULL,TRUE,'script.js','let homeCity ','javascript'),
('6602fd62666d4ea088040bf5','6602fd62666d4ea088040bf3',NULL,TRUE,'script.js','const windyCity','javascript'),
('6602fd62666d4ea088040bf9',NULL,'6602fd62666d4ea088040bf8',FALSE,'script.js','let high Score','javascript'),
('6602fd62666d4ea088040c15','6602fd62666d4ea088040c13',NULL,TRUE,'script.js','const highScore','javascript'),
('6602fd62666d4ea088040c1d','6602fd62666d4ea088040c19',NULL,TRUE,'script.js','let','javascript'),
('6602fd62666d4ea088040c24','6602fd62666d4ea088040c21',NULL,TRUE,'script.js','let highScore ','javascript'),
('6602fd62666d4ea088040c2a','6602fd62666d4ea088040c28',NULL,TRUE,'script.js','let person','javascript'),
('6602fd62666d4ea088040c31','6602fd62666d4ea088040c2f',NULL,TRUE,'script.js','const car1','javascript'),
('6602fd62666d4ea088040c38','6602fd62666d4ea088040c35',NULL,TRUE,'script.js','const city = "Chicago"','javascript'),
('6602fd62666d4ea088040c3e','6602fd62666d4ea088040c3c',NULL,TRUE,'script.js','const city = "Chicago";','javascript'),
('6602fd62666d4ea088040c45','6602fd62666d4ea088040c42',NULL,TRUE,'script.js','"Chicago"','javascript'),
('6602fd62666d4ea088040c4d','6602fd62666d4ea088040c49',NULL,TRUE,'script.js','"Winter is coming."','javascript'),
('6602fd62666d4ea088040c51',NULL,'6602fd62666d4ea088040c50',FALSE,'script.js','let name = "Karin";','javascript'),
('6602fd62666d4ea088040c5f',NULL,'6602fd62666d4ea088040c5e',FALSE,'script.js','const browser = "Chrome";','javascript'),
('6602fd62666d4ea088040c67',NULL,'6602fd62666d4ea088040c66',FALSE,'script.js','let hobby = "Tree shaping";','javascript'),
('6602fd62666d4ea088040c73','6602fd62666d4ea088040c6f',NULL,TRUE,'script.js','let name = "Mario";
let job = "Plumber";','javascript'),
('6602fd62666d4ea088040c7c','6602fd62666d4ea088040c77',NULL,TRUE,'script.js','let company = "Apple";','javascript'),
('6602fd62666d4ea088040c84','6602fd62666d4ea088040c80',NULL,TRUE,'script.js','const island = "Malta";','javascript'),
('6602fd62666d4ea088040c8a','6602fd62666d4ea088040c88',NULL,TRUE,'script.js','const device = "Desktop";','javascript'),
('6602fd62666d4ea088040c94','6602fd62666d4ea088040c91',NULL,TRUE,'script.js','const norwayCapital = "Oslo";','javascript'),
('6602fd62666d4ea088040c98','6602fd62666d4ea088040c97',NULL,FALSE,'script.js','const age = 90;
age = 91;','javascript'),
('6602fd62666d4ea088040c9e','6602fd62666d4ea088040c9c',NULL,TRUE,'script.js','let age = 90;
age = 91;','javascript'),
('6602fd62666d4ea088040ca5','6602fd62666d4ea088040ca3',NULL,TRUE,'script.js','const BIRTHDAY = "25/02/1882";','javascript'),
('6602fd62666d4ea088040cac','6602fd62666d4ea088040caa',NULL,TRUE,'script.js','const SPEED_OF_LIGHT = "3*10⁸ m/s";','javascript'),
('6602fd62666d4ea088040cb2','6602fd62666d4ea088040cb0',NULL,TRUE,'script.js','const MIDDLE_NAME = "Francesca";','javascript'),
('6602fd62666d4ea088040cd0','6602fd62666d4ea088040cce',NULL,TRUE,'script.js','let favoriteSong = "What''s love got to do with it?";
favoriteSong = "What''s love got to do with it? - 2015 Remastered";','javascript'),
('6602fd62666d4ea088040cd6','6602fd62666d4ea088040cd4',NULL,TRUE,'script.js','const LONGEST_RIVER = "Nile";','javascript'),
('6602fd62666d4ea088040cdc','6602fd62666d4ea088040cda',NULL,TRUE,'script.js','const GAME_NAME = "Dixit";','javascript'),
('6602fd62666d4ea088040cea','6602fd62666d4ea088040ce6',NULL,TRUE,'script.js','const step1 = "Collect pants";
const step2 = "?";
const step3 = "Profit";','javascript'),
('6602fd62666d4ea088040cf0','6602fd62666d4ea088040cee',NULL,TRUE,'script.js','console.log("Hello, World!");','javascript'),
('6602fd62666d4ea088040cf7','6602fd62666d4ea088040cf4',NULL,TRUE,'script.js','console.log("3, 2, 1");
console.log("GO!");','javascript'),
('6602fd62666d4ea088040cfd','6602fd62666d4ea088040cfb',NULL,TRUE,'script.js','const greeting = "Hello, World!";
console.log(greeting);','javascript'),
('6602fd62666d4ea088040d03','6602fd62666d4ea088040d01',NULL,TRUE,'script.js','const name = "Daenerys";
console.log(name);','javascript'),
('6602fd62666d4ea088040d19',NULL,'6602fd62666d4ea088040d18',FALSE,'script.js','const sport = "B-ball";
console.log(sport);','javascript'),
('6602fd62666d4ea088040d24','6602fd62666d4ea088040d21',NULL,TRUE,'script.js','const frequency = "daily";
console.log(frequency);','javascript'),
('6602fd62666d4ea088040d2e','6602fd62666d4ea088040d28',NULL,TRUE,'script.js','console.log("Buzz");','javascript'),
('6602fd62666d4ea088040d34','6602fd62666d4ea088040d32',NULL,TRUE,'script.js','const lastName = "Lightyear";
console.log(lastName);','javascript'),
('6602fd62666d4ea088040d3a','6602fd62666d4ea088040d38',NULL,TRUE,'script.js','const job = "Sheriff";
console.log(job);','javascript'),
('6602fd62666d4ea088040d43','6602fd62666d4ea088040d41',NULL,TRUE,'script.js','let currentStatus = "Watching Netflix";
currentStatus = "Relaxing at the beach";
console.log(currentStatus);
','javascript'),
('6602fd63666d4ea088040d4c','6602fd62666d4ea088040d48',NULL,TRUE,'script.js','let currentStatus = "Watching Netflix";
currentStatus = "Relaxing at the Beach";
console.log(currentStatus);

currentStatus = "Reading";
console.log(currentStatus);
','javascript'),
('6602fd63666d4ea088040d53','6602fd63666d4ea088040d51',NULL,TRUE,'script.js','let defaultStatus = "Hi there!";
let currentStatus = "Playing football";

currentStatus = defaultStatus;
console.log(currentStatus);','javascript'),
('6602fd63666d4ea088040d5b','6602fd63666d4ea088040d58',NULL,TRUE,'script.js','let currentStatus = "Playing football";
console.log(currentStatus);

currentStatus = "Walking the dog";
console.log(currentStatus);
','javascript'),
('6602fd63666d4ea088040d65',NULL,'6602fd63666d4ea088040d64',FALSE,'script.js','const currentStatus = "Watching Netflix";
console.log(currentStatus);','javascript'),
('6602fd63666d4ea088040d6d',NULL,'6602fd63666d4ea088040d6c',FALSE,'script.js','firstName = "Lori";
firstName = "Joe";','javascript'),
('6602fd63666d4ea088040d75',NULL,'6602fd63666d4ea088040d74',FALSE,'script.js','let firstName = "Lori";
firstName = "Joe";
console.log(firstName);','javascript'),
('6602fd63666d4ea088040d7f','6602fd63666d4ea088040d7d',NULL,TRUE,'script.js','let temperature = "0 degrees";
temperature = "100 degrees";
console.log(temperature);','javascript'),
('6602fd63666d4ea088040d88','6602fd63666d4ea088040d83',NULL,TRUE,'script.js','let currentStatus = "Dancing";
currentStatus = "Writing code";
console.log(currentStatus);
','javascript'),
('6602fd63666d4ea088040d91','6602fd63666d4ea088040d8c',NULL,TRUE,'script.js','let buttonText = "Sign up";
buttonText = "Log in";
console.log(buttonText);
','javascript'),
('6602fd63666d4ea088040d97','6602fd63666d4ea088040d95',NULL,TRUE,'script.js','let currentStatus = "Working hard";
currentStatus = "Done";
console.log(currentStatus);
','javascript'),
('6602fd63666d4ea088040d9f','6602fd63666d4ea088040d9d',NULL,TRUE,'script.js','"Followers:" + "55";','javascript'),
('6602fd63666d4ea088040da8','6602fd63666d4ea088040da4',NULL,TRUE,'script.js','console.log("Followers:" + "55");','javascript'),
('6602fd63666d4ea088040db1','6602fd63666d4ea088040dad',NULL,TRUE,'script.js','const followers = "55";
"Followers:" + followers;','javascript'),
('6602fd63666d4ea088040dba','6602fd63666d4ea088040db6',NULL,TRUE,'script.js','const numberOfFollowers = "55";
console.log("Followers:" + numberOfFollowers);','javascript'),
('6602fd63666d4ea088040dc4','6602fd63666d4ea088040dbf',NULL,TRUE,'script.js','const label = "Posts:" + "13";
console.log(label);
','javascript'),
('6602fd63666d4ea088040dc8',NULL,'6602fd63666d4ea088040dc7',FALSE,'script.js','const label = "Name:" + "Joe";','javascript'),
('6602fd63666d4ea088040dd0',NULL,'6602fd63666d4ea088040dcf',FALSE,'script.js','"Jon" + "athan";','javascript'),
('6602fd63666d4ea088040dd8',NULL,'6602fd63666d4ea088040dd7',FALSE,'script.js','const username = "snoopdogg";
console.log("Username:" + username);','javascript'),
('6602fd63666d4ea088040de0',NULL,'6602fd63666d4ea088040ddf',FALSE,'script.js','console.log("Steve" + "Jobs");
','javascript'),
('6602fd63666d4ea088040dea','6602fd63666d4ea088040de8',NULL,TRUE,'script.js','const temperature = "14";
console.log(temperature + " degrees");','javascript'),
('6602fd63666d4ea088040df4','6602fd63666d4ea088040dee',NULL,TRUE,'script.js','console.log("Posts:" + "55");
','javascript'),
('6602fd63666d4ea088040dfc','6602fd63666d4ea088040df8',NULL,TRUE,'script.js','const title = "Ms. ";
const name = "Irene";

console.log(title + name);','javascript'),
('6602fd63666d4ea088040e02','6602fd63666d4ea088040e00',NULL,TRUE,'script.js','const numberOfLikes = "40 ";
console.log(numberOfLikes + "likes");','javascript'),
('6602fd63666d4ea088040e09','6602fd63666d4ea088040e07',NULL,TRUE,'script.js','const numberOfLikes = 5;','javascript'),
('6602fd63666d4ea088040e13','6602fd63666d4ea088040e0e',NULL,TRUE,'script.js','const numberOfLikes = 5;
console.log(numberOfLikes);','javascript'),
('6602fd63666d4ea088040e1b','6602fd63666d4ea088040e18',NULL,TRUE,'script.js','const numberOfLikes = 5 + 1;
console.log(numberOfLikes);','javascript'),
('6602fd63666d4ea088040e22','6602fd63666d4ea088040e20',NULL,TRUE,'script.js','const percent = 0.5 * 100;
console.log(percent);','javascript'),
('6602fd63666d4ea088040e2a','6602fd63666d4ea088040e27',NULL,TRUE,'script.js','const numberOfSteps = 70;
console.log("You''re on step:");
console.log(numberOfSteps + 1);','javascript'),
('6602fd63666d4ea088040e33','6602fd63666d4ea088040e2f',NULL,TRUE,'script.js','const private = 3;
const public = 10;
const total = private + public;
console.log("Total posts: " + total);
','javascript'),
('6602fd63666d4ea088040e37',NULL,'6602fd63666d4ea088040e36',FALSE,'script.js','const speed = 300 + 5;','javascript'),
('6602fd63666d4ea088040e3f',NULL,'6602fd63666d4ea088040e3e',FALSE,'script.js','const temperature = "3" + "1";
console.log(temperature);','javascript'),
('6602fd63666d4ea088040e47',NULL,'6602fd63666d4ea088040e46',FALSE,'script.js','const score = 40 + 4;','javascript'),
('6602fd63666d4ea088040e4f',NULL,'6602fd63666d4ea088040e4e',FALSE,'script.js','const area = "3 * 5";
console.log(area);','javascript'),
('6602fd63666d4ea088040e5a','6602fd63666d4ea088040e57',NULL,TRUE,'script.js','const savings = 100;
const interest = 0.04;
console.log(savings * interest);','javascript'),
('6602fd63666d4ea088040e60','6602fd63666d4ea088040e5e',NULL,TRUE,'script.js','const sumOfGrades = 460;
const numberOfStudents = 5;
console.log(sumOfGrades / numberOfStudents);','javascript'),
('6602fd63666d4ea088040e68','6602fd63666d4ea088040e64',NULL,TRUE,'script.js','const total = 100;
const discount = 20;
console.log("Discounted price:")
console.log(total - discount);','javascript'),
('6602fd63666d4ea088040e6e','6602fd63666d4ea088040e6c',NULL,TRUE,'script.js','const monthsPerYear = 12;
console.log(monthsPerYear);','javascript'),
('6602fd63666d4ea088040e7b','6602fd63666d4ea088040e79',NULL,TRUE,'script.js','console.log("Allow updates");
console.log(true);
','javascript'),
('6602fd63666d4ea088040e83','6602fd63666d4ea088040e80',NULL,TRUE,'script.js','const correct = true;
console.log(correct);','javascript'),
('6602fd63666d4ea088040e8d','6602fd63666d4ea088040e8a',NULL,TRUE,'script.js','console.log("Device charged");
const status = false;
console.log(status);','javascript'),
('6602fd63666d4ea088040e97',NULL,'6602fd63666d4ea088040e96',FALSE,'script.js','const autoPlay = false;','javascript'),
('6602fd63666d4ea088040eb2','6602fd63666d4ea088040eab',NULL,TRUE,'script.js','console.log("Auto update");
console.log(false);
','javascript'),
('6602fd63666d4ea088040eba','6602fd63666d4ea088040eb6',NULL,TRUE,'script.js','const autoSaveImage = true;','javascript'),
('6602fd63666d4ea088040ec1','6602fd63666d4ea088040ebe',NULL,TRUE,'script.js','const allowCookies = false;
','javascript'),
('6602fd63666d4ea088040ec7','6602fd63666d4ea088040ec5',NULL,TRUE,'script.js','const autoPlay = true;','javascript'),
('6602fd63666d4ea088040ed4','6602fd63666d4ea088040ed1',NULL,TRUE,'script.js','console.log(!true);','javascript'),
('6602fd63666d4ea088040edb','6602fd63666d4ea088040ed8',NULL,TRUE,'script.js','console.log(!false);','javascript'),
('6602fd63666d4ea088040ee2','6602fd63666d4ea088040edf',NULL,TRUE,'script.js','const isMorning = true;
console.log(!isMorning);','javascript'),
('6602fd63666d4ea088040eec','6602fd63666d4ea088040ee7',NULL,TRUE,'script.js','const isMorning = true;
const isEvening = !isMorning;
console.log(isEvening);','javascript'),
('6602fd63666d4ea088040ef6',NULL,'6602fd63666d4ea088040ef5',FALSE,'script.js','const latestVersion = !true;
console.log(latestVersion);','javascript'),
('6602fd63666d4ea088040f04',NULL,'6602fd63666d4ea088040f03',FALSE,'script.js','const result = !true;','javascript'),
('6602fd63666d4ea088040f0f','6602fd63666d4ea088040f0c',NULL,TRUE,'script.js','const allowPopups = !true;
','javascript'),
('6602fd63666d4ea088040f15','6602fd63666d4ea088040f13',NULL,TRUE,'script.js','console.log(!true);','javascript'),
('6602fd63666d4ea088040f1d','6602fd63666d4ea088040f19',NULL,TRUE,'script.js','const openSlot = true;
const isAvailable = !openSlot;','javascript'),
('6602fd63666d4ea088040f23','6602fd63666d4ea088040f21',NULL,TRUE,'script.js','console.log(!true);','javascript'),
('6602fd63666d4ea088040f2a','6602fd63666d4ea088040f29',NULL,FALSE,'script.js','const enteredPin = 5448;
const expectedPin = 5440;','javascript'),
('6602fd63666d4ea088040f31','6602fd63666d4ea088040f2d',NULL,TRUE,'script.js','5 === 5','javascript'),
('6602fd63666d4ea088040f3c','6602fd63666d4ea088040f38',NULL,TRUE,'script.js','console.log(10 === 10);','javascript'),
('6602fd63666d4ea088040f43','6602fd63666d4ea088040f41',NULL,TRUE,'script.js','console.log(9 === 10);','javascript'),
('6602fd63666d4ea088040f4d',NULL,'6602fd63666d4ea088040f4c',FALSE,'script.js','console.log(10 === 11);','javascript'),
('6602fd63666d4ea088040f5b',NULL,'6602fd63666d4ea088040f5a',FALSE,'script.js','console.log(5 + 13);
console.log(5 === 13);','javascript'),
('6602fd63666d4ea088040f68','6602fd63666d4ea088040f63',NULL,TRUE,'script.js','const votes = 10;
console.log(votes === 11);','javascript'),
('6602fd63666d4ea088040f6e','6602fd63666d4ea088040f6c',NULL,TRUE,'script.js','console.log(99 === 100)','javascript'),
('6602fd63666d4ea088040f74','6602fd63666d4ea088040f72',NULL,TRUE,'script.js','console.log(10 === 13)','javascript'),
('6602fd63666d4ea088040f7a','6602fd63666d4ea088040f78',NULL,TRUE,'script.js','console.log(100 === 100);','javascript'),
('6602fd63666d4ea088040f81','6602fd63666d4ea088040f7f',NULL,TRUE,'script.js','console.log(1 !== 10);','javascript'),
('6602fd63666d4ea088040f89','6602fd63666d4ea088040f86',NULL,TRUE,'script.js','const result = 1 !== 2;
console.log(result);','javascript'),
('6602fd63666d4ea088040f90','6602fd63666d4ea088040f8d',NULL,TRUE,'script.js','const result = 1 === 2;
console.log(result);','javascript'),
('6602fd63666d4ea088040f97','6602fd63666d4ea088040f95',NULL,TRUE,'script.js','const one = 1;
const two = 2;
console.log(one === two);
console.log(one !== two);','javascript'),
('6602fd63666d4ea088040f9b',NULL,'6602fd63666d4ea088040f9a',FALSE,'script.js','const batteryLevel = ? ;
const charged = batteryLevel === 100;','javascript'),
('6602fd63666d4ea088040fa3',NULL,'6602fd63666d4ea088040fa2',FALSE,'script.js','const result = 7 !== 10;
console.log(result);','javascript'),
('6602fd63666d4ea088040fab',NULL,'6602fd63666d4ea088040faa',FALSE,'script.js','const emails = ? ; 
const inboxFull = emails === 1000;','javascript'),
('6602fd63666d4ea088040fb3',NULL,'6602fd63666d4ea088040fb2',FALSE,'script.js','const scoreOne = ? ;
const scoreTwo = 80;
const equal = scoreOne === scoreTwo;','javascript'),
('6602fd63666d4ea088040fbd','6602fd63666d4ea088040fbb',NULL,TRUE,'script.js','console.log(10 !== 10);','javascript'),
('6602fd63666d4ea088040fc5','6602fd63666d4ea088040fc1',NULL,TRUE,'script.js','const answer = 16;
const correctAnswer = answer === 13;
console.log(correctAnswer);','javascript'),
('6602fd63666d4ea088040fcb','6602fd63666d4ea088040fc9',NULL,TRUE,'script.js','const level = 5;
const highestLevel = 50;
console.log(level === highestLevel);','javascript'),
('6602fd63666d4ea088040fd1','6602fd63666d4ea088040fcf',NULL,TRUE,'script.js','const letters = 12;
const validAnswer = letters !== 0;','javascript'),
('6602fd63666d4ea088040fde',NULL,'6602fd63666d4ea088040fdd',FALSE,'script.js','New York','javascript'),
('6602fd63666d4ea088040fe9','6602fd63666d4ea088040fe7',NULL,TRUE,'script.js','const spaceship = "Enterprise";','javascript'),
('6602fd63666d4ea088040ff2','6602fd63666d4ea088040fed',NULL,TRUE,'script.js','console.log("Atlanta");','javascript'),
('6602fd63666d4ea088040ffb','6602fd63666d4ea088040ff6',NULL,TRUE,'script.js','const ingredients = "Sugar, spice, and everything nice";
console.log(ingredients);','javascript'),
('6602fd63666d4ea088040fff',NULL,'6602fd63666d4ea088040ffe',FALSE,'script.js','let income = 1400;
let savings = 900;
savings = 1000;
income = 1500;

console.log(savings);','javascript'),
('6602fd63666d4ea08804100c','6602fd63666d4ea088041008',NULL,TRUE,'script.js','const goal = 5;
const milesRan = 3;

console.log("Miles left: ");
console.log(goal - milesRan);','javascript'),
('6602fd63666d4ea088041012','6602fd63666d4ea088041010',NULL,TRUE,'script.js','const score = 1084;
const bonus = 500;

const total = score + bonus;
console.log(total);','javascript'),
('6602fd63666d4ea08804101a','6602fd63666d4ea088041016',NULL,TRUE,'script.js','const score = 1084;
const penalty = 500;

const total = score - penalty;
console.log(total);','javascript'),
('6602fd63666d4ea08804101e',NULL,'6602fd63666d4ea08804101d',FALSE,'script.js','const number1 = 3;
const number2 = 4;
let number3 = 10;
number3 = number1 + number2;','javascript'),
('6602fd63666d4ea088041037','6602fd63666d4ea088041035',NULL,TRUE,'script.js','let loggedIn = false;

console.log("Logged in:");
console.log(loggedIn);

loggedIn = !false;

console.log("Logged in:");
console.log(loggedIn);','javascript'),
('6602fd63666d4ea08804103d','6602fd63666d4ea08804103b',NULL,TRUE,'script.js','const isConnected = !true;
','javascript'),
('6602fd63666d4ea088041043','6602fd63666d4ea088041041',NULL,TRUE,'script.js','const split = 15 / 5;
console.log(split);

console.log("Even split:");
console.log(true);
','javascript'),
('6602fd63666d4ea088041051','6602fd63666d4ea08804104e',NULL,TRUE,'script.js','const uploaded = 15;
console.log(uploaded === 100);','javascript'),
('6602fd63666d4ea088041055',NULL,'6602fd63666d4ea088041054',FALSE,'script.js','console.log(906 === 9006);','javascript'),
('6602fd63666d4ea088041060','6602fd63666d4ea08804105e',NULL,TRUE,'script.js','const newMessages = 3;
console.log(newMessages !== 0);','javascript'),
('6602fd63666d4ea088041068','6602fd63666d4ea088041064',NULL,TRUE,'script.js','const chosenNumber = 3;
const notZero = chosenNumber !== 0;
console.log(notZero);','javascript'),
('6602fd63666d4ea0880410a7','6602fd63666d4ea0880410a5',NULL,TRUE,'script.js','console.log(1 < 90);','javascript'),
('6602fd63666d4ea0880410af','6602fd63666d4ea0880410ab',NULL,TRUE,'script.js','console.log(1 < 235);','javascript'),
('6602fd63666d4ea0880410b6','6602fd63666d4ea0880410b3',NULL,TRUE,'script.js','console.log(235 < 1);','javascript'),
('6602fd63666d4ea0880410bc','6602fd63666d4ea0880410ba',NULL,TRUE,'script.js','console.log(101 > 90);','javascript'),
('6602fd63666d4ea0880410cc',NULL,'6602fd63666d4ea0880410cb',FALSE,'script.js','console.log(10 < 1);','javascript'),
('6602fd63666d4ea0880410d4',NULL,'6602fd63666d4ea0880410d3',FALSE,'script.js','console.log(1 > 1);','javascript'),
('6602fd63666d4ea0880410e0','6602fd63666d4ea0880410dc',NULL,TRUE,'script.js','console.log(5 > 4);','javascript'),
('6602fd63666d4ea0880410e6','6602fd63666d4ea0880410e4',NULL,TRUE,'script.js','console.log(30 < 40);','javascript'),
('6602fd63666d4ea0880410ec','6602fd63666d4ea0880410ea',NULL,TRUE,'script.js','console.log(10 > 9);','javascript'),
('6602fd63666d4ea0880410f2','6602fd63666d4ea0880410f0',NULL,TRUE,'script.js','console.log(100 > 200);','javascript'),
('6602fd63666d4ea0880410f9','6602fd63666d4ea0880410f7',NULL,TRUE,'script.js','console.log(1 <= 3);','javascript'),
('6602fd63666d4ea088041101','6602fd63666d4ea0880410fd',NULL,TRUE,'script.js','console.log(11 <= 11);','javascript'),
('6602fd63666d4ea088041107','6602fd63666d4ea088041105',NULL,TRUE,'script.js','console.log(3099 >= 3099);','javascript'),
('6602fd63666d4ea08804110d','6602fd63666d4ea08804110b',NULL,TRUE,'script.js','const result = 1 <= 15;
console.log(result);','javascript'),
('6602fd63666d4ea088041115','6602fd63666d4ea088041111',NULL,TRUE,'script.js','const min = 5;
const max = 10;
const result = min <= max;
console.log(result);','javascript'),
('6602fd63666d4ea08804112b',NULL,'6602fd63666d4ea08804112a',FALSE,'script.js','console.log(10 >= 10);','javascript'),
('6602fd63666d4ea088041135','6602fd63666d4ea088041133',NULL,TRUE,'script.js','const batteryLevel = 10;
const low = batteryLevel <= 20;
console.log("Low battery: " + low);','javascript'),
('6602fd63666d4ea08804113c','6602fd63666d4ea088041139',NULL,TRUE,'script.js','const points = 12;
const levelTwo = points >= 10;
console.log("Level 2: " + levelTwo);','javascript'),
('6602fd63666d4ea088041144','6602fd63666d4ea088041140',NULL,TRUE,'script.js','const solved = 20;
const minimum = 10;
const lostStreak = solved <= minimum;
console.log(lostStreak);','javascript'),
('6602fd63666d4ea08804114a','6602fd63666d4ea088041148',NULL,TRUE,'script.js','console.log(60 >= 50);','javascript'),
('6602fd63666d4ea088041155','6602fd63666d4ea088041153',NULL,TRUE,'script.js','console.log("apple" === "apple");','javascript'),
('6602fd63666d4ea08804115d','6602fd63666d4ea088041159',NULL,TRUE,'script.js','console.log("apple" === "apple");','javascript'),
('6602fd63666d4ea088041164','6602fd63666d4ea088041161',NULL,TRUE,'script.js','console.log("apple" === "orange");','javascript'),
('6602fd63666d4ea08804116c','6602fd63666d4ea088041168',NULL,TRUE,'script.js','const fruit1 = "apple";
const fruit2 = "orange";
console.log(fruit1 === fruit2);','javascript'),
('6602fd63666d4ea08804117c',NULL,'6602fd63666d4ea08804117b',FALSE,'script.js','console.log("LED+" === "LED");','javascript'),
('6602fd63666d4ea08804118c','6602fd63666d4ea08804118a',NULL,TRUE,'script.js','const myAnswer = "act";
const solution = "ace";
console.log(myAnswer === solution);','javascript'),
('6602fd63666d4ea088041192','6602fd63666d4ea088041190',NULL,TRUE,'script.js','const myAnswer = "high";
const solution = "low";
console.log(myAnswer === solution);','javascript'),
('6602fd63666d4ea088041198','6602fd63666d4ea088041196',NULL,TRUE,'script.js','const item1 = "deerstalker hat";
const item2 = "pipe";
const isDuplicate = item1 === item2;
console.log(isDuplicate);','javascript'),
('6602fd63666d4ea08804119e','6602fd63666d4ea08804119c',NULL,TRUE,'script.js','console.log("liquid" === "solid");','javascript'),
('6602fd63666d4ea0880411a5','6602fd63666d4ea0880411a3',NULL,TRUE,'script.js','console.log("apple" !== "orange");','javascript'),
('6602fd63666d4ea0880411ad','6602fd63666d4ea0880411a9',NULL,TRUE,'script.js','console.log("apple" !== "orange");','javascript'),
('6602fd63666d4ea0880411b1','6602fd63666d4ea0880411b0',NULL,FALSE,'script.js','console.log("orange" !== "orange");','javascript'),
('6602fd63666d4ea0880411b7','6602fd63666d4ea0880411b5',NULL,TRUE,'script.js','const isNotDuplicate = "apple" !== "orange";','javascript'),
('6602fd63666d4ea0880411c7',NULL,'6602fd63666d4ea0880411c6',FALSE,'script.js','console.log("orange" !== "yellow");','javascript'),
('6602fd63666d4ea0880411d7','6602fd63666d4ea0880411d5',NULL,TRUE,'script.js','const myAnswer = "act";
const solution = "ace";
console.log(myAnswer !== solution);','javascript'),
('6602fd63666d4ea0880411dd','6602fd63666d4ea0880411db',NULL,TRUE,'script.js','const wallpaper = "bliss.png";
console.log(wallpaper !== "bliss.png");','javascript'),
('6602fd63666d4ea0880411e3','6602fd63666d4ea0880411e1',NULL,TRUE,'script.js','const previousLeader = "Anna";
const newLeader = "Jim";
const leaderChanged = previousLeader !== newLeader;
console.log(leaderChanged);','javascript'),
('6602fd63666d4ea0880411e9','6602fd63666d4ea0880411e7',NULL,TRUE,'script.js','const bigCity = "Tokyo";
const smallCity = "Zurich";
console.log(bigCity !== smallCity);','javascript'),
('6602fd63666d4ea0880411f4','6602fd63666d4ea0880411f2',NULL,TRUE,'script.js','const dessert = "Cookies";
console.log(dessert);','javascript'),
('6602fd63666d4ea0880411fa','6602fd63666d4ea0880411f8',NULL,TRUE,'script.js','const score = 42;
console.log(score);','javascript'),
('6602fd63666d4ea088041200','6602fd63666d4ea0880411fe',NULL,TRUE,'script.js','const isOn = true;
console.log(isOn);','javascript'),
('6602fd63666d4ea088041207','6602fd63666d4ea088041204',NULL,TRUE,'script.js','const isOn = false;
console.log(isOn);','javascript'),
('6602fd63666d4ea08804122d','6602fd63666d4ea088041229',NULL,TRUE,'script.js','const userName = "Joey";
const age = 28;
const isMale = true;
console.log(userName, age, isMale);','javascript'),
('6602fd63666d4ea088041233','6602fd63666d4ea088041231',NULL,TRUE,'script.js','const firstName = "Jill";
console.log(firstName);','javascript'),
('6602fd63666d4ea08804123a','6602fd63666d4ea088041237',NULL,TRUE,'script.js','const minutesLeft = 10;
console.log(minutesLeft);','javascript'),
('6602fd63666d4ea088041240','6602fd63666d4ea08804123e',NULL,TRUE,'script.js','const isOnline = true;
console.log(isOnline);','javascript'),
('6602fd63666d4ea088041249','6602fd63666d4ea088041244',NULL,TRUE,'script.js','const score = 57;
console.log(score);','javascript'),
('6602fd63666d4ea088041251','6602fd63666d4ea08804124f',NULL,TRUE,'script.js','console.log("10" + "10");
console.log(10 + 10);','javascript'),
('6602fd63666d4ea088041258','6602fd63666d4ea088041256',NULL,TRUE,'script.js','const result = "10" + 10;
console.log(result);','javascript'),
('6602fd63666d4ea08804125e','6602fd63666d4ea08804125c',NULL,TRUE,'script.js','const result = "Your score: " + 99;
console.log(result);','javascript'),
('6602fd63666d4ea088041264','6602fd63666d4ea088041262',NULL,TRUE,'script.js','const score = 99;
const result = "Your score: " + score;
console.log(result);','javascript'),
('6602fd63666d4ea08804126b','6602fd63666d4ea088041269',NULL,TRUE,'script.js','const result = "You passed: " + true;
console.log(result);','javascript'),
('6602fd63666d4ea088041271','6602fd63666d4ea08804126f',NULL,TRUE,'script.js','const pass = true;
const result = "You passed: " + pass;
console.log(result);','javascript'),
('6602fd63666d4ea088041281',NULL,'6602fd63666d4ea088041280',FALSE,'script.js','console.log(10 + " years old");','javascript'),
('6602fd63666d4ea088041289',NULL,'6602fd63666d4ea088041288',FALSE,'script.js','const price = 3;
const tag = price + "$";
console.log(tag);','javascript'),
('6602fd63666d4ea088041297',NULL,'6602fd63666d4ea088041296',FALSE,'script.js','console.log("Inbox full: " + true);','javascript'),
('6602fd63666d4ea0880412a1','6602fd63666d4ea08804129f',NULL,TRUE,'script.js','const finalScore = 30 + 20;
console.log(finalScore);','javascript'),
('6602fd63666d4ea0880412a8','6602fd63666d4ea0880412a5',NULL,TRUE,'script.js','console.log(10 + "10");','javascript'),
('6602fd63666d4ea0880412af','6602fd63666d4ea0880412ac',NULL,TRUE,'script.js','console.log("Version: " + 2);','javascript'),
('6602fd63666d4ea0880412b7','6602fd63666d4ea0880412b3',NULL,TRUE,'script.js','const fee = 8;
console.log("Entry fee: " + fee);','javascript'),
('6602fd63666d4ea0880412be','6602fd63666d4ea0880412bb',NULL,TRUE,'script.js','console.log("Repeat: " + true);','javascript'),
('6602fd63666d4ea0880412c4','6602fd63666d4ea0880412c2',NULL,TRUE,'script.js','const isWinner = true;
console.log("You won: " + isWinner);','javascript'),
('6602fd63666d4ea0880412d3','6602fd63666d4ea0880412d1',NULL,TRUE,'script.js','let isBatteryOn = true; 
let isSwitchOn = true; 
console.log(isBatteryOn && isSwitchOn);','javascript'),
('6602fd63666d4ea0880412d9','6602fd63666d4ea0880412d7',NULL,TRUE,'script.js','let isBatteryOn = true; 
let isSwitchOn = false; 
console.log(isBatteryOn && isSwitchOn);','javascript'),
('6602fd63666d4ea0880412e1','6602fd63666d4ea0880412dd',NULL,TRUE,'script.js','let isBatteryOn = false; 
let isSwitchOn = false; 
console.log(isBatteryOn && isSwitchOn);','javascript'),
('6602fd63666d4ea0880412e9','6602fd63666d4ea0880412e5',NULL,TRUE,'script.js','let isBatteryOn = false; 
let isSwitchOn = false; 
let result = isBatteryOn && isSwitchOn; 
console.log(result);','javascript'),
('6602fd63666d4ea0880412f3',NULL,'6602fd63666d4ea0880412f2',FALSE,'script.js','let condition1 = false; 
let condition2 = true; 
let result = condition1 && condition2; 
console.log(result);','javascript'),
('6602fd63666d4ea088041301',NULL,'6602fd63666d4ea088041300',FALSE,'script.js','let cost = 50; 
let sellPrice = 60; 
const profit = sellPrice - cost; 
console.log(profit); 
const result = cost < sellPrice && profit > 0; 
console.log("result: " + result); 
','javascript'),
('6602fd63666d4ea08804130b','6602fd63666d4ea088041309',NULL,TRUE,'script.js','let age = 18; 
let isPass = true; 
const isEligible = age >= 18 && isPass; 
console.log(isEligible);','javascript'),
('6602fd63666d4ea088041312','6602fd63666d4ea08804130f',NULL,TRUE,'script.js','let isRecipientValid = true; 
let isSubjectFilled = false; 
const isMailSent = isRecipientValid && isSubjectFilled; 
console.log("Mail Sending Successful?: " + isMailSent);','javascript'),
('6602fd63666d4ea08804131a','6602fd63666d4ea088041316',NULL,TRUE,'script.js','let isRecipientValid = true; 
let isSubjectFilled = false; 
const result = isRecipientValid && isSubjectFilled; 
console.log(result);','javascript'),
('6602fd63666d4ea088041320','6602fd63666d4ea08804131e',NULL,TRUE,'script.js','let isWifiConnected = true; 
let isURLValid = true; 
const willSiteLoad = isWifiConnected && isURLValid; 
console.log(willSiteLoad);','javascript'),
('6602fd63666d4ea08804132d','6602fd63666d4ea08804132b',NULL,TRUE,'script.js','let isBatteryOn = true; 
let isPowerOn = false; 
console.log(isBatteryOn || isPowerOn);','javascript'),
('6602fd63666d4ea088041333','6602fd63666d4ea088041331',NULL,TRUE,'script.js','let isBatteryOn = false; 
let isPowerOn = false; 
console.log(isBatteryOn || isPowerOn);','javascript'),
('6602fd63666d4ea088041339','6602fd63666d4ea088041337',NULL,TRUE,'script.js','let isBulbOn = true; 
console.log(!isBulbOn);','javascript'),
('6602fd63666d4ea088041341','6602fd63666d4ea08804133d',NULL,TRUE,'script.js','let isBatteryOn = true; 
let isPowerOn = false; 
 
console.log(!(isBatteryOn && isPowerOn));','javascript'),
('6602fd63666d4ea088041347','6602fd63666d4ea088041345',NULL,TRUE,'script.js','let isBatteryOn = true; 
let isPowerOn = false; 
console.log(isBatteryOn && isPowerOn); 
console.log(!(isBatteryOn && isPowerOn));','javascript'),
('6602fd63666d4ea088041351',NULL,'6602fd63666d4ea088041350',FALSE,'script.js','const condition1 = 5 >= 6; 
const condition2 = 9 === 10; 
console.log(condition1 || condition2);','javascript'),
('6602fd63666d4ea088041365',NULL,'6602fd63666d4ea088041364',FALSE,'script.js','let condition1 = true; 
let condition2 = false; 
const logicalExpression = condition1 || condition2; 
console.log(!logicalExpression || logicalExpression);','javascript'),
('6602fd63666d4ea088041370','6602fd63666d4ea08804136d',NULL,TRUE,'script.js','let isLoanApproved = true; 
let cash = 30000; 
let cost = 40000; 
const isCarBought = isLoanApproved || (cash > cost); 
console.log(isCarBought);','javascript'),
('6602fd63666d4ea088041376','6602fd63666d4ea088041374',NULL,TRUE,'script.js','let isLoanRejected = false; 
const isLoanGranted = !isLoanRejected; 
console.log(isLoanGranted);','javascript'),
('6602fd63666d4ea08804137c','6602fd63666d4ea08804137a',NULL,TRUE,'script.js','let loanRejected = false; 
let cash = 30000; 
let cost = 40000; 
const insufficientFunds = cash < cost; 
const canBuyCar = !(loanRejected && insufficientFunds); 
console.log(canBuyCar);','javascript'),
('6602fd63666d4ea088041383','6602fd63666d4ea088041380',NULL,TRUE,'script.js','let isTextEmpty = true; 
let isAttachment = false; 
const isPosted = isAttachment || !isTextEmpty; 
console.log(isPosted);','javascript'),
('6602fd63666d4ea08804138a','6602fd63666d4ea088041387',NULL,TRUE,'script.js','let cloudStorage = 4; 
let systemStorage = 8; 
let fileSize = 5; 
const result = (cloudStorage > fileSize) || (systemStorage > 
fileSize); 
console.log("Saved? : " + result);','javascript'),
('6602fd63666d4ea0880413a3','6602fd63666d4ea08804139e',NULL,TRUE,'script.js','const score = 32;
const minScore = 30;
const pass = score >= minScore;
console.log(pass);','javascript'),
('6602fd63666d4ea0880413a9','6602fd63666d4ea0880413a7',NULL,TRUE,'script.js','const age = 21;
console.log(age < 26);','javascript'),
('6602fd63666d4ea0880413af','6602fd63666d4ea0880413ad',NULL,TRUE,'script.js','const score = 11;
const minScore = 10;
const pass = score >= minScore;
console.log(pass);','javascript'),
('6602fd63666d4ea0880413b3',NULL,'6602fd63666d4ea0880413b2',FALSE,'script.js','console.log("Nina" === "Nina");','javascript'),
('6602fd63666d4ea0880413be','6602fd63666d4ea0880413bc',NULL,TRUE,'script.js','const score = "high";
const expected = "low";
console.log(score === expected);','javascript'),
('6602fd63666d4ea0880413cb','6602fd63666d4ea0880413c9',NULL,TRUE,'script.js','console.log("Apple" !== "Nokia");','javascript'),
('6602fd63666d4ea0880413cf',NULL,'6602fd63666d4ea0880413ce',FALSE,'script.js','const result = "moon" !== "moon";
console.log(result);','javascript'),
('6602fd63666d4ea0880413dd','6602fd63666d4ea0880413d8',NULL,TRUE,'script.js','const score = 2;
console.log(score);','javascript'),
('6602fd63666d4ea0880413e5','6602fd63666d4ea0880413e1',NULL,TRUE,'script.js','const result = 100 + 1;
console.log(result);','javascript'),
('6602fd63666d4ea0880413e9',NULL,'6602fd63666d4ea0880413e8',FALSE,'script.js','const isBooked = true;
const message = "Ticket booked: " + isBooked;
console.log(message);','javascript'),
('6602fd63666d4ea0880413f6','6602fd63666d4ea0880413f2',NULL,TRUE,'script.js','const result = "100" + 1;
console.log(result);','javascript'),
('6602fd63666d4ea0880413fa',NULL,'6602fd63666d4ea0880413f9',FALSE,'script.js','console.log("Repeat song: " + true);','javascript'),
('6602fd63666d4ea088041405','6602fd63666d4ea088041403',NULL,TRUE,'script.js','let failedBotTest = false; 
const loggedIn = !failedBotTest; 
console.log("Logged in? : " + loggedIn);','javascript'),
('6602fd63666d4ea088041410',NULL,'6602fd63666d4ea08804140f',FALSE,'script.js','let mainSubject = 43; 
let extraCurricular = 12; 
const result = (mainSubject > 35) && (extraCurricular > 40); 
console.log(result);','javascript'),
('6602fd63666d4ea08804141d','6602fd63666d4ea088041419',NULL,TRUE,'script.js','let testsRun = false; 
let outputShows = true; 
const result = testsRun || outputShows; 
console.log("Code working? : " + result);','javascript'),
('6602fd63666d4ea088041423','6602fd63666d4ea088041421',NULL,TRUE,'script.js','let isStockEmpty = false; 
const isAvailable = !isStockEmpty; 
console.log(isAvailable);','javascript');



INSERT INTO "items" ("id","interaction_module_id","correct","value","text")
VALUES
('6602fd05a8fc89e974fa3f3d','6602fd05a8fc89e974fa3f3c',TRUE,0,'To remember information'),
('6602fd05a8fc89e974fa3f3e','6602fd05a8fc89e974fa3f3c',FALSE,1,'To draw images onscreen'),
('6602fd05a8fc89e974fa3f52','6602fd05a8fc89e974fa3f51',TRUE,0,'There&#039;s a space between the words'),
('6602fd05a8fc89e974fa3f53','6602fd05a8fc89e974fa3f51',FALSE,1,'It contains a lowercase letter'),
('6602fd05a8fc89e974fa3f64','6602fd05a8fc89e974fa3f63',TRUE,0,'To create variable names with multiple words'),
('6602fd05a8fc89e974fa3f65','6602fd05a8fc89e974fa3f63',FALSE,1,'To create variable names with spaces'),
('6602fd05a8fc89e974fa3f6a','6602fd05a8fc89e974fa3f69',TRUE,0,'To help us understand what&#039;s inside them'),
('6602fd05a8fc89e974fa3f6b','6602fd05a8fc89e974fa3f69',FALSE,1,'To make them faster to type'),
('6602fd05a8fc89e974fa3fa3','6602fd05a8fc89e974fa3fa2',TRUE,0,'`"Karin"`'),
('6602fd05a8fc89e974fa3fa4','6602fd05a8fc89e974fa3fa2',FALSE,1,'`name`'),
('6602fd05a8fc89e974fa3fa9','6602fd05a8fc89e974fa3fa8',TRUE,0,'It&#039;s a text between double quotes, like `"Amy"`'),
('6602fd05a8fc89e974fa3faa','6602fd05a8fc89e974fa3fa8',FALSE,1,'It contains the `=` sign'),
('6602fd05a8fc89e974fa3fb1','6602fd05a8fc89e974fa3fb0',TRUE,0,'The variable `song_name` stores the value `"Hey Ya!"`'),
('6602fd05a8fc89e974fa3fb2','6602fd05a8fc89e974fa3fb0',FALSE,1,'The variable `"Hey Ya!"` stores the value `song_name`'),
('6602fd05a8fc89e974fa3fb9','6602fd05a8fc89e974fa3fb8',TRUE,0,'`hobby`'),
('6602fd05a8fc89e974fa3fba','6602fd05a8fc89e974fa3fb8',FALSE,1,'`"Tree shaping"`'),
('6602fd05a8fc89e974fa4005','6602fd05a8fc89e974fa4004',TRUE,0,'It starts and ends with double quotes'),
('6602fd05a8fc89e974fa4006','6602fd05a8fc89e974fa4004',FALSE,1,'It contains letters and symbols'),
('6602fd05a8fc89e974fa400b','6602fd05a8fc89e974fa400a',TRUE,0,'An area that displays output'),
('6602fd05a8fc89e974fa400c','6602fd05a8fc89e974fa400a',FALSE,1,'The area where we write the code'),
('6602fd05a8fc89e974fa4011','6602fd05a8fc89e974fa4010',TRUE,0,'It displays a value in the console'),
('6602fd05a8fc89e974fa4012','6602fd05a8fc89e974fa4010',FALSE,1,'It creates a variable'),
('6602fd05a8fc89e974fa4019','6602fd05a8fc89e974fa4018',TRUE,0,'`B-ball`'),
('6602fd05a8fc89e974fa401a','6602fd05a8fc89e974fa4018',FALSE,1,'`sport`'),
('6602fd05a8fc89e974fa4058','6602fd05a8fc89e974fa4057',TRUE,0,'`status = "Working out"`'),
('6602fd05a8fc89e974fa4059','6602fd05a8fc89e974fa4057',FALSE,1,'`status == "Working out"`'),
('6602fd05a8fc89e974fa4060','6602fd05a8fc89e974fa405f',TRUE,0,'`Watching Netflix`'),
('6602fd05a8fc89e974fa4061','6602fd05a8fc89e974fa405f',FALSE,1,'`status`'),
('6602fd05a8fc89e974fa4068','6602fd05a8fc89e974fa4067',TRUE,0,'Nothing is wrong with this code'),
('6602fd05a8fc89e974fa4069','6602fd05a8fc89e974fa4067',FALSE,1,'The same value is being stored inside the variable'),
('6602fd05a8fc89e974fa4070','6602fd05a8fc89e974fa406f',TRUE,0,'`Median`'),
('6602fd05a8fc89e974fa4071','6602fd05a8fc89e974fa406f',FALSE,1,'`Mean`'),
('6602fd05a8fc89e974fa40af','6602fd05a8fc89e974fa40ae',TRUE,0,'`"Name:Joe"`'),
('6602fd05a8fc89e974fa40b0','6602fd05a8fc89e974fa40ae',FALSE,1,'`"Joe"`'),
('6602fd05a8fc89e974fa40b7','6602fd05a8fc89e974fa40b6',FALSE,0,'Nothing, because there&#039;s no `print()` instruction'),
('6602fd05a8fc89e974fa40b8','6602fd05a8fc89e974fa40b6',TRUE,1,'`Jonathan`'),
('6602fd05a8fc89e974fa40bf','6602fd05a8fc89e974fa40be',TRUE,0,'`Username:snoopdogg`'),
('6602fd05a8fc89e974fa40c0','6602fd05a8fc89e974fa40be',FALSE,1,'`snoopdogg`'),
('6602fd05a8fc89e974fa410e','6602fd05a8fc89e974fa410d',TRUE,0,'`305`'),
('6602fd05a8fc89e974fa410f','6602fd05a8fc89e974fa410d',FALSE,1,'`300`'),
('6602fd05a8fc89e974fa4116','6602fd05a8fc89e974fa4115',TRUE,0,'Because `"3"` and `"1"` are string values'),
('6602fd05a8fc89e974fa4117','6602fd05a8fc89e974fa4115',FALSE,1,'Because the expression subtracts the numbers'),
('6602fd05a8fc89e974fa411e','6602fd05a8fc89e974fa411d',TRUE,0,'Because there are no double quotes around `40` and `4`'),
('6602fd05a8fc89e974fa411f','6602fd05a8fc89e974fa411d',FALSE,1,'Because we can only store strings when we use `=`'),
('6602fd05a8fc89e974fa4126','6602fd05a8fc89e974fa4125',TRUE,0,'`3 * 5`'),
('6602fd05a8fc89e974fa4127','6602fd05a8fc89e974fa4125',FALSE,1,'`15`'),
('6602fd05a8fc89e974fa4166','6602fd05a8fc89e974fa4165',TRUE,0,'Showing if a feature is switched on or off'),
('6602fd05a8fc89e974fa4167','6602fd05a8fc89e974fa4165',FALSE,1,'Storing values from one to five'),
('6602fd05a8fc89e974fa416e','6602fd05a8fc89e974fa416d',TRUE,0,'There are no quotes around it'),
('6602fd05a8fc89e974fa416f','6602fd05a8fc89e974fa416d',FALSE,1,'It&#039;s stored inside a variable'),
('6602fd05a8fc89e974fa4174','6602fd05a8fc89e974fa4173',TRUE,0,'`subscribed = False`'),
('6602fd05a8fc89e974fa4175','6602fd05a8fc89e974fa4173',FALSE,1,'`subscribed = True`'),
('6602fd05a8fc89e974fa417a','6602fd05a8fc89e974fa4179',TRUE,0,'There are quotes around it, so `"False"` is a string'),
('6602fd05a8fc89e974fa417b','6602fd05a8fc89e974fa4179',FALSE,1,'`"False"` and `False` are the same'),
('6602fd05a8fc89e974fa41bc','6602fd05a8fc89e974fa41bb',TRUE,0,'It turns `True` or `False` values into their opposite'),
('6602fd05a8fc89e974fa41bd','6602fd05a8fc89e974fa41bb',FALSE,1,'It checks if values are equal'),
('6602fd05a8fc89e974fa41c4','6602fd05a8fc89e974fa41c3',TRUE,0,'`not` in front of `True` turns it to `False`'),
('6602fd05a8fc89e974fa41c5','6602fd05a8fc89e974fa41c3',FALSE,1,'Variables always display as `False` in the console'),
('6602fd05a8fc89e974fa41ca','6602fd05a8fc89e974fa41c9',TRUE,0,'The `not` sign is the negation operator'),
('6602fd05a8fc89e974fa41cb','6602fd05a8fc89e974fa41c9',FALSE,1,'The `not` sign is the addition operator'),
('6602fd05a8fc89e974fa41d2','6602fd05a8fc89e974fa41d1',TRUE,0,'`False`'),
('6602fd05a8fc89e974fa41d3','6602fd05a8fc89e974fa41d1',FALSE,1,'`True`'),
('6602fd05a8fc89e974fa4211','6602fd05a8fc89e974fa4210',TRUE,0,'`==`'),
('6602fd05a8fc89e974fa4212','6602fd05a8fc89e974fa4210',FALSE,1,'`=`'),
('6602fd05a8fc89e974fa4219','6602fd05a8fc89e974fa4218',TRUE,0,'`False`'),
('6602fd05a8fc89e974fa421a','6602fd05a8fc89e974fa4218',FALSE,1,'`True`'),
('6602fd05a8fc89e974fa421f','6602fd05a8fc89e974fa421e',TRUE,0,'When checking if a variable is exactly equal to 10'),
('6602fd05a8fc89e974fa4220','6602fd05a8fc89e974fa421e',FALSE,1,'When checking if a variable is above 50'),
('6602fd05a8fc89e974fa4227','6602fd05a8fc89e974fa4226',TRUE,0,'`18` and then `False`'),
('6602fd05a8fc89e974fa4228','6602fd05a8fc89e974fa4226',FALSE,1,'`18` and then `513`'),
('6602fd05a8fc89e974fa4265','6602fd05a8fc89e974fa4264',FALSE,0,'&quot;target&quot;'),
('6602fd05a8fc89e974fa4266','6602fd05a8fc89e974fa4264',TRUE,1,'`False`'),
('6602fd05a8fc89e974fa426d','6602fd05a8fc89e974fa426c',TRUE,0,'`True`'),
('6602fd05a8fc89e974fa426e','6602fd05a8fc89e974fa426c',FALSE,1,'`False`'),
('6602fd05a8fc89e974fa4275','6602fd05a8fc89e974fa4274',TRUE,0,'`True`'),
('6602fd05a8fc89e974fa4276','6602fd05a8fc89e974fa4274',FALSE,1,'`orders == 1000`'),
('6602fd05a8fc89e974fa427d','6602fd05a8fc89e974fa427c',TRUE,0,'Nothing is wrong with this code'),
('6602fd05a8fc89e974fa427e','6602fd05a8fc89e974fa427c',FALSE,1,'We can&#039;t compare numbers with `==`'),
('6602fd06a8fc89e974fa42dd','6602fd06a8fc89e974fa42dc',TRUE,0,'For displaying different kinds of values together in a string'),
('6602fd06a8fc89e974fa42de','6602fd06a8fc89e974fa42dc',FALSE,1,'For displaying just string values together'),
('6602fd06a8fc89e974fa42e3','6602fd06a8fc89e974fa42e2',TRUE,0,'By the character `f` in front of the string'),
('6602fd06a8fc89e974fa42e4','6602fd06a8fc89e974fa42e2',FALSE,1,'There&#039;s no difference between strings and f-strings'),
('6602fd06a8fc89e974fa42e9','6602fd06a8fc89e974fa42e8',TRUE,0,'We place them between curly braces, `{}`'),
('6602fd06a8fc89e974fa42ea','6602fd06a8fc89e974fa42e8',FALSE,1,'We can&#039;t display number values with f-strings'),
('6602fd06a8fc89e974fa42ef','6602fd06a8fc89e974fa42ee',TRUE,0,'We save it in a variable and use the variable'),
('6602fd06a8fc89e974fa42f0','6602fd06a8fc89e974fa42ee',FALSE,1,'We can&#039;t reuse f-strings'),
('6602fd06a8fc89e974fa432e','6602fd06a8fc89e974fa432d',TRUE,0,'Because it contains a space between `first` and `name`'),
('6602fd06a8fc89e974fa432f','6602fd06a8fc89e974fa432d',FALSE,1,'Because both words need to be capitalized'),
('6602fd06a8fc89e974fa4330','6602fd06a8fc89e974fa432d',FALSE,2,'Because it&#039;s not descriptive'),
('6602fd06a8fc89e974fa433d','6602fd06a8fc89e974fa433c',TRUE,0,'`A-`'),
('6602fd06a8fc89e974fa433e','6602fd06a8fc89e974fa433c',FALSE,1,'`Programming`'),
('6602fd06a8fc89e974fa433f','6602fd06a8fc89e974fa433c',FALSE,2,'`B`'),
('6602fd06a8fc89e974fa434c','6602fd06a8fc89e974fa434b',TRUE,0,'It gives a value to a variable'),
('6602fd06a8fc89e974fa434d','6602fd06a8fc89e974fa434b',FALSE,1,'It adds string values together'),
('6602fd06a8fc89e974fa434e','6602fd06a8fc89e974fa434b',FALSE,2,'It divides a number by another number'),
('6602fd06a8fc89e974fa4353','6602fd06a8fc89e974fa4352',TRUE,0,'As often as we want'),
('6602fd06a8fc89e974fa4354','6602fd06a8fc89e974fa4352',FALSE,1,'Only once'),
('6602fd06a8fc89e974fa4355','6602fd06a8fc89e974fa4352',FALSE,2,'Never'),
('6602fd06a8fc89e974fa435c','6602fd06a8fc89e974fa435b',TRUE,0,'`Haircut`'),
('6602fd06a8fc89e974fa435d','6602fd06a8fc89e974fa435b',FALSE,1,'`"Hair + cut"`'),
('6602fd06a8fc89e974fa435e','6602fd06a8fc89e974fa435b',FALSE,2,'`Hair + cut`'),
('6602fd06a8fc89e974fa4363','6602fd06a8fc89e974fa4362',TRUE,0,'`True`'),
('6602fd06a8fc89e974fa4364','6602fd06a8fc89e974fa4362',FALSE,1,'`"True"`'),
('6602fd06a8fc89e974fa4365','6602fd06a8fc89e974fa4362',FALSE,2,'`"Wrong"`'),
('6602fd06a8fc89e974fa4374','6602fd06a8fc89e974fa4373',TRUE,0,'`False`'),
('6602fd06a8fc89e974fa4375','6602fd06a8fc89e974fa4373',FALSE,1,'`True`'),
('6602fd06a8fc89e974fa4376','6602fd06a8fc89e974fa4373',FALSE,2,'`"True"`'),
('6602fd06a8fc89e974fa4381','6602fd06a8fc89e974fa4380',TRUE,0,'`is_monday = not True`'),
('6602fd06a8fc89e974fa4382','6602fd06a8fc89e974fa4380',FALSE,1,'`is_monday = "True"`'),
('6602fd06a8fc89e974fa4383','6602fd06a8fc89e974fa4380',FALSE,2,'`is_monday = "not True"`'),
('6602fd06a8fc89e974fa4388','6602fd06a8fc89e974fa4387',TRUE,0,'`==`'),
('6602fd06a8fc89e974fa4389','6602fd06a8fc89e974fa4387',FALSE,1,'`=`'),
('6602fd06a8fc89e974fa438a','6602fd06a8fc89e974fa4387',FALSE,2,'`()`'),
('6602fd06a8fc89e974fa438f','6602fd06a8fc89e974fa438e',TRUE,0,'A value of either `True` or `False`'),
('6602fd06a8fc89e974fa4390','6602fd06a8fc89e974fa438e',FALSE,1,'A value of either `"True"` or `"False"`'),
('6602fd06a8fc89e974fa4391','6602fd06a8fc89e974fa438e',FALSE,2,'A numerical value'),
('6602fd06a8fc89e974fa4398','6602fd06a8fc89e974fa4397',TRUE,0,'`13% hazelnuts`'),
('6602fd06a8fc89e974fa4399','6602fd06a8fc89e974fa4397',FALSE,1,'`label`'),
('6602fd06a8fc89e974fa439a','6602fd06a8fc89e974fa4397',FALSE,2,'`f"{hazelnuts}% hazelnuts"`'),
('6602fd06a8fc89e974fa43af','6602fd06a8fc89e974fa43ae',TRUE,0,'`False`'),
('6602fd06a8fc89e974fa43b0','6602fd06a8fc89e974fa43ae',FALSE,1,'`True`'),
('6602fd06a8fc89e974fa43b1','6602fd06a8fc89e974fa43ae',FALSE,2,'`9069006`'),
('6602fd06a8fc89e974fa43c0','6602fd06a8fc89e974fa43bf',TRUE,0,'`movie`'),
('6602fd06a8fc89e974fa43c1','6602fd06a8fc89e974fa43bf',FALSE,1,'`Mulan`'),
('6602fd06a8fc89e974fa43c2','6602fd06a8fc89e974fa43bf',FALSE,2,'`("movie")`'),
('6602fd06a8fc89e974fa43c3','6602fd06a8fc89e974fa43bf',FALSE,3,'Nothing'),
('6602fd06a8fc89e974fa43ca','6602fd06a8fc89e974fa43c9',TRUE,0,'`"interview"`'),
('6602fd06a8fc89e974fa43cb','6602fd06a8fc89e974fa43c9',FALSE,1,'`interview`'),
('6602fd06a8fc89e974fa43cc','6602fd06a8fc89e974fa43c9',FALSE,2,'`next_appointment`'),
('6602fd06a8fc89e974fa43cd','6602fd06a8fc89e974fa43c9',FALSE,3,'`"next_appointment"`'),
('6602fd06a8fc89e974fa43e1','6602fd06a8fc89e974fa43e0',TRUE,0,'`connect to power`, `press the upload button`'),
('6602fd06a8fc89e974fa43e2','6602fd06a8fc89e974fa43e0',FALSE,1,'`press the upload button`, `connect to power`'),
('6602fd06a8fc89e974fa43e3','6602fd06a8fc89e974fa43e0',FALSE,2,'Only `connect to power`'),
('6602fd06a8fc89e974fa43e4','6602fd06a8fc89e974fa43e0',FALSE,3,'Nothing'),
('6602fd06a8fc89e974fa4400','6602fd06a8fc89e974fa43ff',TRUE,0,'Because of the quotes around `"47"`'),
('6602fd06a8fc89e974fa4401','6602fd06a8fc89e974fa43ff',FALSE,1,'It doesn&#039;t store a string'),
('6602fd06a8fc89e974fa4402','6602fd06a8fc89e974fa43ff',FALSE,2,'Because of the variable name'),
('6602fd06a8fc89e974fa4403','6602fd06a8fc89e974fa43ff',FALSE,3,'We can&#039;t know if it stores a string'),
('6602fd06a8fc89e974fa440a','6602fd06a8fc89e974fa4409',TRUE,0,'Variable names can&#039;t contain spaces'),
('6602fd06a8fc89e974fa440b','6602fd06a8fc89e974fa4409',FALSE,1,'Variable names can&#039;t contain underscores `_`'),
('6602fd06a8fc89e974fa440c','6602fd06a8fc89e974fa4409',FALSE,2,'`new` and `entry` should be capitalised'),
('6602fd06a8fc89e974fa440d','6602fd06a8fc89e974fa4409',FALSE,3,'There&#039;s nothing wrong with the variable name'),
('6602fd06a8fc89e974fa441a','6602fd06a8fc89e974fa4419',TRUE,0,'`Good morning!`'),
('6602fd06a8fc89e974fa441b','6602fd06a8fc89e974fa4419',FALSE,1,'`"Good morning!"`'),
('6602fd06a8fc89e974fa441c','6602fd06a8fc89e974fa4419',FALSE,2,'`Good`'),
('6602fd06a8fc89e974fa441d','6602fd06a8fc89e974fa4419',FALSE,3,'Nothing'),
('6602fd06a8fc89e974fa4425','6602fd06a8fc89e974fa4424',TRUE,0,'The variable `monday` hasn&#039;t been created'),
('6602fd06a8fc89e974fa4426','6602fd06a8fc89e974fa4424',FALSE,1,'We can&#039;t store a variable in a variable'),
('6602fd06a8fc89e974fa4427','6602fd06a8fc89e974fa4424',FALSE,2,'There&#039;s nothing wrong with the code'),
('6602fd06a8fc89e974fa4428','6602fd06a8fc89e974fa4424',FALSE,3,'There&#039;s no variable named `sunday`'),
('6602fd06a8fc89e974fa442f','6602fd06a8fc89e974fa442e',TRUE,0,'`15.0`'),
('6602fd06a8fc89e974fa4430','6602fd06a8fc89e974fa442e',FALSE,1,'`bill`'),
('6602fd06a8fc89e974fa4431','6602fd06a8fc89e974fa442e',FALSE,2,'`bill/2`'),
('6602fd06a8fc89e974fa4432','6602fd06a8fc89e974fa442e',FALSE,3,'`30`'),
('6602fd06a8fc89e974fa4441','6602fd06a8fc89e974fa4440',TRUE,0,'`Saturday: picnic`'),
('6602fd06a8fc89e974fa4442','6602fd06a8fc89e974fa4440',FALSE,1,'`Saturday: cinema`'),
('6602fd06a8fc89e974fa4443','6602fd06a8fc89e974fa4440',FALSE,2,'`"Saturday:" plans`'),
('6602fd06a8fc89e974fa4444','6602fd06a8fc89e974fa4440',FALSE,3,'`Saturday: plans`'),
('6602fd06a8fc89e974fa444b','6602fd06a8fc89e974fa444a',TRUE,0,'`4`'),
('6602fd06a8fc89e974fa444c','6602fd06a8fc89e974fa444a',FALSE,1,'`"four"`'),
('6602fd06a8fc89e974fa444d','6602fd06a8fc89e974fa444a',FALSE,2,'Nothing, we can&#039;t update a string variable to a number'),
('6602fd06a8fc89e974fa444e','6602fd06a8fc89e974fa444a',FALSE,3,'`"four"`,  and then `4`'),
('6602fd06a8fc89e974fa445b','6602fd06a8fc89e974fa445a',TRUE,0,'A number value'),
('6602fd06a8fc89e974fa445c','6602fd06a8fc89e974fa445a',FALSE,1,'A string value'),
('6602fd06a8fc89e974fa445d','6602fd06a8fc89e974fa445a',FALSE,2,'No value'),
('6602fd06a8fc89e974fa445e','6602fd06a8fc89e974fa445a',FALSE,3,'A variable'),
('6602fd06a8fc89e974fa447b','6602fd06a8fc89e974fa447a',TRUE,0,'`False`'),
('6602fd06a8fc89e974fa447c','6602fd06a8fc89e974fa447a',FALSE,1,'`logged_in`'),
('6602fd06a8fc89e974fa447d','6602fd06a8fc89e974fa447a',FALSE,2,'`True`'),
('6602fd06a8fc89e974fa447e','6602fd06a8fc89e974fa447a',FALSE,3,'`not True`'),
('6602fd06a8fc89e974fa448d','6602fd06a8fc89e974fa448c',FALSE,0,'`is_even = not True`'),
('6602fd06a8fc89e974fa448e','6602fd06a8fc89e974fa448c',TRUE,1,'`is_even = not False`'),
('6602fd06a8fc89e974fa448f','6602fd06a8fc89e974fa448c',FALSE,2,'`is_even = False`'),
('6602fd06a8fc89e974fa4490','6602fd06a8fc89e974fa448c',FALSE,3,'`is_even = "not False"`'),
('6602fd06a8fc89e974fa4498','6602fd06a8fc89e974fa4497',TRUE,0,'`True`'),
('6602fd06a8fc89e974fa4499','6602fd06a8fc89e974fa4497',FALSE,1,'`False`'),
('6602fd06a8fc89e974fa449a','6602fd06a8fc89e974fa4497',FALSE,2,'`not updating`'),
('6602fd06a8fc89e974fa449b','6602fd06a8fc89e974fa4497',FALSE,3,'`not flight_mode not updating`'),
('6602fd06a8fc89e974fa44a1','6602fd06a8fc89e974fa44a0',TRUE,0,'`!=`'),
('6602fd06a8fc89e974fa44a2','6602fd06a8fc89e974fa44a0',FALSE,1,'`not`'),
('6602fd06a8fc89e974fa44a3','6602fd06a8fc89e974fa44a0',FALSE,2,'`=!`'),
('6602fd06a8fc89e974fa44a4','6602fd06a8fc89e974fa44a0',FALSE,3,'`==`'),
('6602fd06a8fc89e974fa44b6','6602fd06a8fc89e974fa44b5',TRUE,0,'Their values'),
('6602fd06a8fc89e974fa44b7','6602fd06a8fc89e974fa44b5',FALSE,1,'Their names'),
('6602fd06a8fc89e974fa44b8','6602fd06a8fc89e974fa44b5',FALSE,2,'We can&#039;t compare variables'),
('6602fd06a8fc89e974fa44b9','6602fd06a8fc89e974fa44b5',FALSE,3,'Variables are always equal'),
('6602fd06a8fc89e974fa44c6','6602fd06a8fc89e974fa44c5',TRUE,0,'`It''s a tie:` and then `True`'),
('6602fd06a8fc89e974fa44c7','6602fd06a8fc89e974fa44c5',FALSE,1,'`It''s a tie:` and then `False`'),
('6602fd06a8fc89e974fa44c8','6602fd06a8fc89e974fa44c5',FALSE,2,'`It''s a tie: same_score`'),
('6602fd06a8fc89e974fa44c9','6602fd06a8fc89e974fa44c5',FALSE,3,'`It''s a tie: {same_score}`'),
('6602fd06a8fc89e974fa44d6','6602fd06a8fc89e974fa44d5',TRUE,0,'`Download finished:` and then `False`'),
('6602fd06a8fc89e974fa44d7','6602fd06a8fc89e974fa44d5',FALSE,1,'`Download finished: and then `True`'),
('6602fd06a8fc89e974fa44d8','6602fd06a8fc89e974fa44d5',FALSE,2,'`Download finished: 10`'),
('6602fd06a8fc89e974fa44d9','6602fd06a8fc89e974fa44d5',FALSE,3,'`Download finished: {in_progress}`'),
('6602fd06a8fc89e974fa44e7','6602fd06a8fc89e974fa44e6',TRUE,0,'Strings and numbers'),
('6602fd06a8fc89e974fa44e8','6602fd06a8fc89e974fa44e6',FALSE,1,'Only strings'),
('6602fd06a8fc89e974fa44e9','6602fd06a8fc89e974fa44e6',FALSE,2,'Nothing'),
('6602fd06a8fc89e974fa44ea','6602fd06a8fc89e974fa44e6',FALSE,3,'Only variables'),
('6602fd06a8fc89e974fa44fc','6602fd06a8fc89e974fa44fb',TRUE,0,'The character `f` is missing'),
('6602fd06a8fc89e974fa44fd','6602fd06a8fc89e974fa44fb',FALSE,1,'The string is missing its quotes `" "`'),
('6602fd06a8fc89e974fa44fe','6602fd06a8fc89e974fa44fb',FALSE,2,'The variable `requests` should be between quotes'),
('6602fd06a8fc89e974fa44ff','6602fd06a8fc89e974fa44fb',FALSE,3,'There&#039;s nothing wrong with the code'),
('6602fd06a8fc89e974fa450c','6602fd06a8fc89e974fa450b',TRUE,0,'`88% of social media users are aged between 18 and 28`'),
('6602fd06a8fc89e974fa450d','6602fd06a8fc89e974fa450b',FALSE,1,'`{88}% of social media users are aged between {18} and {28}`'),
('6602fd06a8fc89e974fa450e','6602fd06a8fc89e974fa450b',FALSE,2,'`{88}% of social media users are aged between {min_age} and {max_age}`'),
('6602fd06a8fc89e974fa450f','6602fd06a8fc89e974fa450b',FALSE,3,'Nothing, the code is wrong'),
('6602fd06a8fc89e974fa451c','6602fd06a8fc89e974fa451b',TRUE,0,'`Most spoken languages: English, Mandarin Chinese, Hindi.`'),
('6602fd06a8fc89e974fa451d','6602fd06a8fc89e974fa451b',FALSE,1,'`Most spoken languages: {first}, {second}, {third}.`'),
('6602fd06a8fc89e974fa451e','6602fd06a8fc89e974fa451b',FALSE,2,'`f"Most spoken languages: {first}, {second}, {third}."`'),
('6602fd06a8fc89e974fa451f','6602fd06a8fc89e974fa451b',FALSE,3,'`"Most spoken languages: {first}, {second}, {third}."`'),
('6602fd06a8fc89e974fa452e','6602fd06a8fc89e974fa452d',TRUE,0,'`It''s a tie between rock and rock`'),
('6602fd06a8fc89e974fa452f','6602fd06a8fc89e974fa452d',FALSE,1,'`It''s a tie between {player_1 == player_2}`'),
('6602fd06a8fc89e974fa4530','6602fd06a8fc89e974fa452d',FALSE,2,'`"It''s a tie between {player_1 == player_2}"`'),
('6602fd06a8fc89e974fa4531','6602fd06a8fc89e974fa452d',FALSE,3,'`f"It''s a tie between {player_1 == player_2}"`'),
('6602fd06a8fc89e974fa4538','6602fd06a8fc89e974fa4537',TRUE,0,'There should be an `f` before the string in `greeting`'),
('6602fd06a8fc89e974fa4539','6602fd06a8fc89e974fa4537',FALSE,1,'There&#039;s nothing wrong with the code '),
('6602fd06a8fc89e974fa453a','6602fd06a8fc89e974fa4537',FALSE,2,'We can&#039;t save f-strings in variables'),
('6602fd06a8fc89e974fa453b','6602fd06a8fc89e974fa4537',FALSE,3,'There is no variable called `name`'),
('6602fd06a8fc89e974fa4546','6602fd06a8fc89e974fa4545',TRUE,0,'As often as we&#039;d like'),
('6602fd06a8fc89e974fa4547','6602fd06a8fc89e974fa4545',FALSE,1,'Only once for every string'),
('6602fd06a8fc89e974fa4548','6602fd06a8fc89e974fa4545',FALSE,2,'A maximum of twice'),
('6602fd06a8fc89e974fa4549','6602fd06a8fc89e974fa4545',FALSE,3,'Never'),
('6602fd06a8fc89e974fa4585','6602fd06a8fc89e974fa4584',TRUE,0,'To check if a number is greater than another number'),
('6602fd06a8fc89e974fa4586','6602fd06a8fc89e974fa4584',FALSE,1,'To check if an number is equal to another number'),
('6602fd06a8fc89e974fa458b','6602fd06a8fc89e974fa458a',TRUE,0,'The greater-than operator'),
('6602fd06a8fc89e974fa458c','6602fd06a8fc89e974fa458a',FALSE,1,'The less-than operator'),
('6602fd06a8fc89e974fa4593','6602fd06a8fc89e974fa4592',TRUE,0,'`False`'),
('6602fd06a8fc89e974fa4594','6602fd06a8fc89e974fa4592',FALSE,1,'`True`'),
('6602fd06a8fc89e974fa459b','6602fd06a8fc89e974fa459a',TRUE,0,'`False`'),
('6602fd06a8fc89e974fa459c','6602fd06a8fc89e974fa459a',FALSE,1,'`True`'),
('6602fd06a8fc89e974fa45df','6602fd06a8fc89e974fa45de',TRUE,0,'`<=`'),
('6602fd06a8fc89e974fa45e0','6602fd06a8fc89e974fa45de',FALSE,1,'`>=`'),
('6602fd06a8fc89e974fa45e5','6602fd06a8fc89e974fa45e4',TRUE,0,'It checks if a number is greater than or equal to another number'),
('6602fd06a8fc89e974fa45e6','6602fd06a8fc89e974fa45e4',FALSE,1,'It checks if a number is greater than another number'),
('6602fd06a8fc89e974fa45eb','6602fd06a8fc89e974fa45ea',TRUE,0,'`>=`'),
('6602fd06a8fc89e974fa45ec','6602fd06a8fc89e974fa45ea',FALSE,1,'`==`'),
('6602fd06a8fc89e974fa45f3','6602fd06a8fc89e974fa45f2',TRUE,0,'`True`'),
('6602fd06a8fc89e974fa45f4','6602fd06a8fc89e974fa45f2',FALSE,1,'`False`'),
('6602fd06a8fc89e974fa4636','6602fd06a8fc89e974fa4635',TRUE,0,'It checks if a string is equal to another string'),
('6602fd06a8fc89e974fa4637','6602fd06a8fc89e974fa4635',FALSE,1,'It checks if a string is greater than another string'),
('6602fd06a8fc89e974fa463c','6602fd06a8fc89e974fa463b',TRUE,0,'`==`'),
('6602fd06a8fc89e974fa463d','6602fd06a8fc89e974fa463b',FALSE,1,'`=`'),
('6602fd06a8fc89e974fa4644','6602fd06a8fc89e974fa4643',TRUE,0,'`False`'),
('6602fd06a8fc89e974fa4645','6602fd06a8fc89e974fa4643',FALSE,1,'`True`'),
('6602fd06a8fc89e974fa464a','6602fd06a8fc89e974fa4649',TRUE,0,'`"apple" == "apple"`'),
('6602fd06a8fc89e974fa464b','6602fd06a8fc89e974fa4649',FALSE,1,'`"apple" == "orange"`'),
('6602fd06a8fc89e974fa4684','6602fd06a8fc89e974fa4683',TRUE,0,'`"black" != "orange"`'),
('6602fd06a8fc89e974fa4685','6602fd06a8fc89e974fa4683',FALSE,1,'`"orange" != "orange"`'),
('6602fd06a8fc89e974fa468a','6602fd06a8fc89e974fa4689',TRUE,0,'`!=`'),
('6602fd06a8fc89e974fa468b','6602fd06a8fc89e974fa4689',FALSE,1,'`==`'),
('6602fd06a8fc89e974fa4692','6602fd06a8fc89e974fa4691',TRUE,0,'`True`'),
('6602fd06a8fc89e974fa4693','6602fd06a8fc89e974fa4691',FALSE,1,'`False`'),
('6602fd06a8fc89e974fa4698','6602fd06a8fc89e974fa4697',TRUE,0,'It checks if a string isn&#039;t equal to another string'),
('6602fd06a8fc89e974fa4699','6602fd06a8fc89e974fa4697',FALSE,1,'It checks if a string is equal to another string'),
('6602fd06a8fc89e974fa46dd','6602fd06a8fc89e974fa46dc',TRUE,0,'Types'),
('6602fd06a8fc89e974fa46de','6602fd06a8fc89e974fa46dc',FALSE,1,'Variables'),
('6602fd06a8fc89e974fa46e3','6602fd06a8fc89e974fa46e2',TRUE,0,'By the quotes `" "` surrounding them '),
('6602fd06a8fc89e974fa46e4','6602fd06a8fc89e974fa46e2',FALSE,1,'By the fact that they&#039;re always words or letters'),
('6602fd06a8fc89e974fa46e9','6602fd06a8fc89e974fa46e8',TRUE,0,'Integers'),
('6602fd06a8fc89e974fa46ea','6602fd06a8fc89e974fa46e8',FALSE,1,'Complex numbers'),
('6602fd06a8fc89e974fa46f1','6602fd06a8fc89e974fa46f0',TRUE,0,'A `float`'),
('6602fd06a8fc89e974fa46f2','6602fd06a8fc89e974fa46f0',FALSE,1,'An `integer`'),
('6602fd06a8fc89e974fa46f7','6602fd06a8fc89e974fa46f6',TRUE,0,'`True` and `False`'),
('6602fd06a8fc89e974fa46f8','6602fd06a8fc89e974fa46f6',FALSE,1,'`"true"` and `"false"`'),
('6602fd06a8fc89e974fa46fd','6602fd06a8fc89e974fa46fc',TRUE,0,'Storing a value inside a variable'),
('6602fd06a8fc89e974fa46fe','6602fd06a8fc89e974fa46fc',FALSE,1,'Giving a variable a name'),
('6602fd06a8fc89e974fa4740','6602fd06a8fc89e974fa473f',TRUE,0,'`Integer`'),
('6602fd06a8fc89e974fa4741','6602fd06a8fc89e974fa473f',FALSE,1,'`Boolean`'),
('6602fd06a8fc89e974fa477e','6602fd06a8fc89e974fa477d',TRUE,0,'Using the `str()` function'),
('6602fd06a8fc89e974fa477f','6602fd06a8fc89e974fa477d',FALSE,1,'Python will do this automatically'),
('6602fd06a8fc89e974fa4786','6602fd06a8fc89e974fa4785',TRUE,0,'4'),
('6602fd06a8fc89e974fa4787','6602fd06a8fc89e974fa4785',FALSE,1,'5'),
('6602fd06a8fc89e974fa478c','6602fd06a8fc89e974fa478b',TRUE,0,'It converts a value into a floating-point number such as `2.3`'),
('6602fd06a8fc89e974fa478d','6602fd06a8fc89e974fa478b',FALSE,1,'It rounds up an integer'),
('6602fd06a8fc89e974fa479d','6602fd06a8fc89e974fa479c',TRUE,0,'`True`'),
('6602fd06a8fc89e974fa479e','6602fd06a8fc89e974fa479c',FALSE,1,'`False`'),
('6602fd06a8fc89e974fa479f','6602fd06a8fc89e974fa479c',FALSE,2,'`1001`'),
('6602fd06a8fc89e974fa47b9','6602fd06a8fc89e974fa47b8',TRUE,0,'`5 < 5`'),
('6602fd06a8fc89e974fa47ba','6602fd06a8fc89e974fa47b8',FALSE,1,'`5 <= 5`'),
('6602fd06a8fc89e974fa47bb','6602fd06a8fc89e974fa47b8',FALSE,2,'`5 == 5`'),
('6602fd06a8fc89e974fa47c8','6602fd06a8fc89e974fa47c7',TRUE,0,'`False`'),
('6602fd06a8fc89e974fa47c9','6602fd06a8fc89e974fa47c7',FALSE,1,'`True`'),
('6602fd06a8fc89e974fa47ca','6602fd06a8fc89e974fa47c7',FALSE,2,'`NinaNina`'),
('6602fd06a8fc89e974fa47cf','6602fd06a8fc89e974fa47ce',TRUE,0,'It checks if a string isn&#039;t equal to another string'),
('6602fd06a8fc89e974fa47d0','6602fd06a8fc89e974fa47ce',FALSE,1,'It checks if a string is equal to another string'),
('6602fd06a8fc89e974fa47d1','6602fd06a8fc89e974fa47ce',FALSE,2,'It checks if a string is less than another string'),
('6602fd06a8fc89e974fa47d6','6602fd06a8fc89e974fa47d5',TRUE,0,'`==`'),
('6602fd06a8fc89e974fa47d7','6602fd06a8fc89e974fa47d5',FALSE,1,'`=`'),
('6602fd06a8fc89e974fa47d8','6602fd06a8fc89e974fa47d5',FALSE,2,'`!=`'),
('6602fd06a8fc89e974fa47df','6602fd06a8fc89e974fa47de',TRUE,0,'`<class ''bool''>`'),
('6602fd06a8fc89e974fa47e0','6602fd06a8fc89e974fa47de',FALSE,1,'`<class ''int''>`'),
('6602fd06a8fc89e974fa47e1','6602fd06a8fc89e974fa47de',FALSE,2,'`<class ''str''>`'),
('6602fd06a8fc89e974fa47f9','6602fd06a8fc89e974fa47f8',TRUE,0,'`Float`'),
('6602fd06a8fc89e974fa47fa','6602fd06a8fc89e974fa47f8',FALSE,1,'`String`'),
('6602fd06a8fc89e974fa47fb','6602fd06a8fc89e974fa47f8',FALSE,2,'`Boolean`'),
('6602fd06a8fc89e974fa4808','6602fd06a8fc89e974fa4807',TRUE,0,'Specific kinds of values like string, integer, float, and boolean'),
('6602fd06a8fc89e974fa4809','6602fd06a8fc89e974fa4807',FALSE,1,'Variables'),
('6602fd06a8fc89e974fa480a','6602fd06a8fc89e974fa4807',FALSE,2,'Keywords'),
('6602fd06a8fc89e974fa480f','6602fd06a8fc89e974fa480e',TRUE,0,'5'),
('6602fd06a8fc89e974fa4810','6602fd06a8fc89e974fa480e',FALSE,1,'6'),
('6602fd06a8fc89e974fa4811','6602fd06a8fc89e974fa480e',FALSE,2,'An error will show up'),
('6602fd06a8fc89e974fa4816','6602fd06a8fc89e974fa4815',TRUE,0,'`float`'),
('6602fd06a8fc89e974fa4817','6602fd06a8fc89e974fa4815',FALSE,1,'`int`'),
('6602fd06a8fc89e974fa4818','6602fd06a8fc89e974fa4815',FALSE,2,'`bool`'),
('6602fd06a8fc89e974fa4821','6602fd06a8fc89e974fa4820',TRUE,0,'`True`'),
('6602fd06a8fc89e974fa4822','6602fd06a8fc89e974fa4820',FALSE,1,'`False`'),
('6602fd06a8fc89e974fa4823','6602fd06a8fc89e974fa4820',FALSE,2,'`first >= second`'),
('6602fd06a8fc89e974fa4824','6602fd06a8fc89e974fa4820',FALSE,3,'`==`'),
('6602fd06a8fc89e974fa4829','6602fd06a8fc89e974fa4828',TRUE,0,'`>` and `<`'),
('6602fd06a8fc89e974fa482a','6602fd06a8fc89e974fa4828',FALSE,1,'`>` and `>=`'),
('6602fd06a8fc89e974fa482b','6602fd06a8fc89e974fa4828',FALSE,2,'`<` and `<=`'),
('6602fd06a8fc89e974fa482c','6602fd06a8fc89e974fa4828',FALSE,3,'`<=` and `>=`'),
('6602fd06a8fc89e974fa4840','6602fd06a8fc89e974fa483f',TRUE,0,'`True` and then `True`'),
('6602fd06a8fc89e974fa4841','6602fd06a8fc89e974fa483f',FALSE,1,'`True` and then `False`'),
('6602fd06a8fc89e974fa4842','6602fd06a8fc89e974fa483f',FALSE,2,'`False` and then `True` '),
('6602fd06a8fc89e974fa4843','6602fd06a8fc89e974fa483f',FALSE,3,'`False` and then `False`'),
('6602fd06a8fc89e974fa4864','6602fd06a8fc89e974fa4863',TRUE,0,'`False`'),
('6602fd06a8fc89e974fa4865','6602fd06a8fc89e974fa4863',FALSE,1,'`True`'),
('6602fd06a8fc89e974fa4866','6602fd06a8fc89e974fa4863',FALSE,2,'`"tweet" == "post"`'),
('6602fd06a8fc89e974fa4867','6602fd06a8fc89e974fa4863',FALSE,3,'`tweet == post`'),
('6602fd06a8fc89e974fa487c','6602fd06a8fc89e974fa487b',TRUE,0,'`False` and then `False`'),
('6602fd06a8fc89e974fa487d','6602fd06a8fc89e974fa487b',FALSE,1,'`False` and then `True`'),
('6602fd06a8fc89e974fa487e','6602fd06a8fc89e974fa487b',FALSE,2,'`False`'),
('6602fd06a8fc89e974fa487f','6602fd06a8fc89e974fa487b',FALSE,3,'`True`'),
('6602fd06a8fc89e974fa4891','6602fd06a8fc89e974fa4890',TRUE,0,'`"version 6" != "version 7"`'),
('6602fd06a8fc89e974fa4892','6602fd06a8fc89e974fa4890',FALSE,1,'`"version 6" == "version 7"`'),
('6602fd06a8fc89e974fa4893','6602fd06a8fc89e974fa4890',FALSE,2,'`version_7  = "version 6"`'),
('6602fd06a8fc89e974fa4894','6602fd06a8fc89e974fa4890',FALSE,3,'`version_6 = "version_7"`'),
('6602fd06a8fc89e974fa48a2','6602fd06a8fc89e974fa48a1',TRUE,0,'string and integer'),
('6602fd06a8fc89e974fa48a3','6602fd06a8fc89e974fa48a1',FALSE,1,'string and float'),
('6602fd06a8fc89e974fa48a4','6602fd06a8fc89e974fa48a1',FALSE,2,'boolean and integer'),
('6602fd06a8fc89e974fa48a5','6602fd06a8fc89e974fa48a1',FALSE,3,'string and string'),
('6602fd06a8fc89e974fa48ad','6602fd06a8fc89e974fa48ac',TRUE,0,'String'),
('6602fd06a8fc89e974fa48ae','6602fd06a8fc89e974fa48ac',FALSE,1,'Float'),
('6602fd06a8fc89e974fa48af','6602fd06a8fc89e974fa48ac',FALSE,2,'Integer'),
('6602fd06a8fc89e974fa48b0','6602fd06a8fc89e974fa48ac',FALSE,3,'Boolean'),
('6602fd06a8fc89e974fa48bf','6602fd06a8fc89e974fa48be',TRUE,0,'`Boolean`'),
('6602fd06a8fc89e974fa48c0','6602fd06a8fc89e974fa48be',FALSE,1,'`Integer`'),
('6602fd06a8fc89e974fa48c1','6602fd06a8fc89e974fa48be',FALSE,2,'`Float`'),
('6602fd06a8fc89e974fa48c2','6602fd06a8fc89e974fa48be',FALSE,3,'`String`'),
('6602fd06a8fc89e974fa48cf','6602fd06a8fc89e974fa48ce',TRUE,0,'`price_1`'),
('6602fd06a8fc89e974fa48d0','6602fd06a8fc89e974fa48ce',FALSE,1,'`price_2`'),
('6602fd06a8fc89e974fa48d1','6602fd06a8fc89e974fa48ce',FALSE,2,'Both'),
('6602fd06a8fc89e974fa48d2','6602fd06a8fc89e974fa48ce',FALSE,3,'None'),
('6602fd06a8fc89e974fa48da','6602fd06a8fc89e974fa48d9',TRUE,0,'It assigns the float value `5.7` to the variable `rating`'),
('6602fd06a8fc89e974fa48db','6602fd06a8fc89e974fa48d9',FALSE,1,'It assigns the string value `rating` to the float value `5.7`'),
('6602fd06a8fc89e974fa48dc','6602fd06a8fc89e974fa48d9',FALSE,2,'It assigns the integer value `5.7` to the variable `rating`'),
('6602fd06a8fc89e974fa48dd','6602fd06a8fc89e974fa48d9',FALSE,3,'It compares two values'),
('6602fd62666d4ea088040bfc','6602fd62666d4ea088040bfb',TRUE,0,'It contains a space'),
('6602fd62666d4ea088040bfd','6602fd62666d4ea088040bfb',FALSE,1,'It contains a capital letter'),
('6602fd62666d4ea088040c02','6602fd62666d4ea088040c01',TRUE,0,'To help us understand what&#039;s inside them'),
('6602fd62666d4ea088040c03','6602fd62666d4ea088040c01',FALSE,1,'To make them faster to type'),
('6602fd62666d4ea088040c08','6602fd62666d4ea088040c07',TRUE,0,'`let` and `const`'),
('6602fd62666d4ea088040c09','6602fd62666d4ea088040c07',FALSE,1,'`let` and `variable`'),
('6602fd62666d4ea088040c0e','6602fd62666d4ea088040c0d',TRUE,0,'To create variable names with multiple words'),
('6602fd62666d4ea088040c0f','6602fd62666d4ea088040c0d',FALSE,1,'To create variable names with spaces'),
('6602fd62666d4ea088040c54','6602fd62666d4ea088040c53',TRUE,0,'`"Karin"`'),
('6602fd62666d4ea088040c55','6602fd62666d4ea088040c53',FALSE,1,'`name`'),
('6602fd62666d4ea088040c5a','6602fd62666d4ea088040c59',TRUE,0,'It&#039;s a word between double quotes'),
('6602fd62666d4ea088040c5b','6602fd62666d4ea088040c59',FALSE,1,'It contains an `=` sign'),
('6602fd62666d4ea088040c62','6602fd62666d4ea088040c61',TRUE,0,'The variable `browser` stores the value `"Chrome"`'),
('6602fd62666d4ea088040c63','6602fd62666d4ea088040c61',FALSE,1,'The variable `"Chrome"` stores the value `browser`'),
('6602fd62666d4ea088040c6a','6602fd62666d4ea088040c69',TRUE,0,'`hobby`'),
('6602fd62666d4ea088040c6b','6602fd62666d4ea088040c69',FALSE,1,'`"Tree shaping"`'),
('6602fd62666d4ea088040cb7','6602fd62666d4ea088040cb6',TRUE,0,'constant'),
('6602fd62666d4ea088040cb8','6602fd62666d4ea088040cb6',FALSE,1,'continuous'),
('6602fd62666d4ea088040cbd','6602fd62666d4ea088040cbc',TRUE,0,'true'),
('6602fd62666d4ea088040cbe','6602fd62666d4ea088040cbc',FALSE,1,'false'),
('6602fd62666d4ea088040cc3','6602fd62666d4ea088040cc2',TRUE,0,'uppercase'),
('6602fd62666d4ea088040cc4','6602fd62666d4ea088040cc2',FALSE,1,'lowercase snake case'),
('6602fd62666d4ea088040cc9','6602fd62666d4ea088040cc8',TRUE,0,'`const`'),
('6602fd62666d4ea088040cca','6602fd62666d4ea088040cc8',FALSE,1,'`let`'),
('6602fd62666d4ea088040d08','6602fd62666d4ea088040d07',TRUE,0,'It starts and ends with double quotes'),
('6602fd62666d4ea088040d09','6602fd62666d4ea088040d07',FALSE,1,'It contains letters and symbols'),
('6602fd62666d4ea088040d0e','6602fd62666d4ea088040d0d',TRUE,0,'An area that displays output'),
('6602fd62666d4ea088040d0f','6602fd62666d4ea088040d0d',FALSE,1,'The area where we write the code'),
('6602fd62666d4ea088040d14','6602fd62666d4ea088040d13',TRUE,0,'It displays a value in the console'),
('6602fd62666d4ea088040d15','6602fd62666d4ea088040d13',FALSE,1,'It creates a variable'),
('6602fd62666d4ea088040d1c','6602fd62666d4ea088040d1b',TRUE,0,'`B-ball`'),
('6602fd62666d4ea088040d1d','6602fd62666d4ea088040d1b',FALSE,1,'`sport`'),
('6602fd63666d4ea088040d60','6602fd63666d4ea088040d5f',TRUE,0,'`currentStatus = "Working out";`'),
('6602fd63666d4ea088040d61','6602fd63666d4ea088040d5f',FALSE,1,'`let currentStatus = "Working out";`'),
('6602fd63666d4ea088040d68','6602fd63666d4ea088040d67',TRUE,0,'`Watching Netflix`'),
('6602fd63666d4ea088040d69','6602fd63666d4ea088040d67',FALSE,1,'`currentStatus`'),
('6602fd63666d4ea088040d70','6602fd63666d4ea088040d6f',TRUE,0,'It misses the `let` keyword in the first line'),
('6602fd63666d4ea088040d71','6602fd63666d4ea088040d6f',FALSE,1,'Nothing'),
('6602fd63666d4ea088040d78','6602fd63666d4ea088040d77',TRUE,0,'`Joe`'),
('6602fd63666d4ea088040d79','6602fd63666d4ea088040d77',FALSE,1,'`Lori`'),
('6602fd63666d4ea088040dcb','6602fd63666d4ea088040dca',TRUE,0,'`"Name:Joe"`'),
('6602fd63666d4ea088040dcc','6602fd63666d4ea088040dca',FALSE,1,'`"Joe"`'),
('6602fd63666d4ea088040dd3','6602fd63666d4ea088040dd2',TRUE,0,'Nothing, because there&#039;s no `console.log()` instruction'),
('6602fd63666d4ea088040dd4','6602fd63666d4ea088040dd2',FALSE,1,'`Jonathan`'),
('6602fd63666d4ea088040ddb','6602fd63666d4ea088040dda',TRUE,0,'`Username:snoopdogg`'),
('6602fd63666d4ea088040ddc','6602fd63666d4ea088040dda',FALSE,1,'`snoopdogg`'),
('6602fd63666d4ea088040de3','6602fd63666d4ea088040de2',TRUE,0,'Because `"Steve" + "Jobs"` adds the values together without a space'),
('6602fd63666d4ea088040de4','6602fd63666d4ea088040de2',FALSE,1,'Because `console.log()` never displays spaces'),
('6602fd63666d4ea088040e3a','6602fd63666d4ea088040e39',TRUE,0,'`305`'),
('6602fd63666d4ea088040e3b','6602fd63666d4ea088040e39',FALSE,1,'`300`'),
('6602fd63666d4ea088040e42','6602fd63666d4ea088040e41',TRUE,0,'Because `"3"` and `"1"` are string values'),
('6602fd63666d4ea088040e43','6602fd63666d4ea088040e41',FALSE,1,'Because the expression subtracts the numbers'),
('6602fd63666d4ea088040e4a','6602fd63666d4ea088040e49',TRUE,0,'Because there are no double quotes around `40` and `4`'),
('6602fd63666d4ea088040e4b','6602fd63666d4ea088040e49',FALSE,1,'Because `score` sounds like it stores a number'),
('6602fd63666d4ea088040e52','6602fd63666d4ea088040e51',TRUE,0,'`3 * 5`'),
('6602fd63666d4ea088040e53','6602fd63666d4ea088040e51',FALSE,1,'`15`'),
('6602fd63666d4ea088040e92','6602fd63666d4ea088040e91',TRUE,0,'Showing if a feature is switched on or off'),
('6602fd63666d4ea088040e93','6602fd63666d4ea088040e91',FALSE,1,'Storing values from one to five'),
('6602fd63666d4ea088040e9a','6602fd63666d4ea088040e99',TRUE,0,'There are no quotes around it'),
('6602fd63666d4ea088040e9b','6602fd63666d4ea088040e99',FALSE,1,'It&#039;s stored inside a variable'),
('6602fd63666d4ea088040ea0','6602fd63666d4ea088040e9f',TRUE,0,'`const subscribed = false;`'),
('6602fd63666d4ea088040ea1','6602fd63666d4ea088040e9f',FALSE,1,'`const subscribed = true;`'),
('6602fd63666d4ea088040ea6','6602fd63666d4ea088040ea5',TRUE,0,'There are quotes around it, so `"false"` is a string'),
('6602fd63666d4ea088040ea7','6602fd63666d4ea088040ea5',FALSE,1,'`"false"` and `false` are the same'),
('6602fd63666d4ea088040ef1','6602fd63666d4ea088040ef0',TRUE,0,'It turns `true` or `false` values into their opposite'),
('6602fd63666d4ea088040ef2','6602fd63666d4ea088040ef0',FALSE,1,'It checks if values are equal'),
('6602fd63666d4ea088040ef9','6602fd63666d4ea088040ef8',TRUE,0,'The `!` operator in front of `true` turns its value into false'),
('6602fd63666d4ea088040efa','6602fd63666d4ea088040ef8',FALSE,1,'Variables always display as `false` in the console'),
('6602fd63666d4ea088040eff','6602fd63666d4ea088040efe',TRUE,0,'The `!` sign is the negation operator'),
('6602fd63666d4ea088040f00','6602fd63666d4ea088040efe',FALSE,1,'The `!` sign is the addition operator'),
('6602fd63666d4ea088040f07','6602fd63666d4ea088040f06',TRUE,0,'`false`'),
('6602fd63666d4ea088040f08','6602fd63666d4ea088040f06',FALSE,1,'`true`'),
('6602fd63666d4ea088040f48','6602fd63666d4ea088040f47',TRUE,0,'`===`'),
('6602fd63666d4ea088040f49','6602fd63666d4ea088040f47',FALSE,1,'`=`'),
('6602fd63666d4ea088040f50','6602fd63666d4ea088040f4f',TRUE,0,'`false`'),
('6602fd63666d4ea088040f51','6602fd63666d4ea088040f4f',FALSE,1,'`true`'),
('6602fd63666d4ea088040f56','6602fd63666d4ea088040f55',TRUE,0,'When checking if a player&#039;s number of lives remaining is *exactly* 5'),
('6602fd63666d4ea088040f57','6602fd63666d4ea088040f55',FALSE,1,'When checking if a player&#039;s number of lives remaining is *less than or equal to* 3'),
('6602fd63666d4ea088040f5e','6602fd63666d4ea088040f5d',TRUE,0,'`18` and then `false`'),
('6602fd63666d4ea088040f5f','6602fd63666d4ea088040f5d',FALSE,1,'`18` and then `513`'),
('6602fd63666d4ea088040f9e','6602fd63666d4ea088040f9d',TRUE,0,'`78`'),
('6602fd63666d4ea088040f9f','6602fd63666d4ea088040f9d',FALSE,1,'`100`'),
('6602fd63666d4ea088040fa6','6602fd63666d4ea088040fa5',TRUE,0,'`true`'),
('6602fd63666d4ea088040fa7','6602fd63666d4ea088040fa5',FALSE,1,'`false`'),
('6602fd63666d4ea088040fae','6602fd63666d4ea088040fad',TRUE,0,'`1000`'),
('6602fd63666d4ea088040faf','6602fd63666d4ea088040fad',FALSE,1,'`67`'),
('6602fd63666d4ea088040fb6','6602fd63666d4ea088040fb5',TRUE,0,'`80`'),
('6602fd63666d4ea088040fb7','6602fd63666d4ea088040fb5',FALSE,1,'`true`'),
('6602fd63666d4ea088040fd8','6602fd63666d4ea088040fd7',TRUE,0,'After we create the variable'),
('6602fd63666d4ea088040fd9','6602fd63666d4ea088040fd7',FALSE,1,'Before we create the variable'),
('6602fd63666d4ea088040fda','6602fd63666d4ea088040fd7',FALSE,2,'Before or after we create the variable'),
('6602fd63666d4ea088040fe1','6602fd63666d4ea088040fe0',TRUE,0,'Because there are no double quotes around it'),
('6602fd63666d4ea088040fe2','6602fd63666d4ea088040fe0',FALSE,1,'Because there&#039;s a space between the words'),
('6602fd63666d4ea088040fe3','6602fd63666d4ea088040fe0',FALSE,2,'Because the words are capitalized'),
('6602fd63666d4ea088041002','6602fd63666d4ea088041001',TRUE,0,'`1000`'),
('6602fd63666d4ea088041003','6602fd63666d4ea088041001',FALSE,1,'`1500`'),
('6602fd63666d4ea088041004','6602fd63666d4ea088041001',FALSE,2,'`900`'),
('6602fd63666d4ea088041021','6602fd63666d4ea088041020',TRUE,0,'`7`'),
('6602fd63666d4ea088041022','6602fd63666d4ea088041020',FALSE,1,'`10`'),
('6602fd63666d4ea088041023','6602fd63666d4ea088041020',FALSE,2,'`4`'),
('6602fd63666d4ea088041028','6602fd63666d4ea088041027',TRUE,0,'`!`'),
('6602fd63666d4ea088041029','6602fd63666d4ea088041027',FALSE,1,'`-`'),
('6602fd63666d4ea08804102a','6602fd63666d4ea088041027',FALSE,2,'`?`'),
('6602fd63666d4ea08804102f','6602fd63666d4ea08804102e',TRUE,0,'`true`'),
('6602fd63666d4ea088041030','6602fd63666d4ea08804102e',FALSE,1,'`"true"`'),
('6602fd63666d4ea088041031','6602fd63666d4ea08804102e',FALSE,2,'`"wrong"`'),
('6602fd63666d4ea088041048','6602fd63666d4ea088041047',TRUE,0,'A value of either `true` or `false`'),
('6602fd63666d4ea088041049','6602fd63666d4ea088041047',FALSE,1,'A value of either `"true"` or `"false"`'),
('6602fd63666d4ea08804104a','6602fd63666d4ea088041047',FALSE,2,'A numerical value'),
('6602fd63666d4ea088041058','6602fd63666d4ea088041057',TRUE,0,'`false`'),
('6602fd63666d4ea088041059','6602fd63666d4ea088041057',FALSE,1,'`true`'),
('6602fd63666d4ea08804105a','6602fd63666d4ea088041057',FALSE,2,'`9069006`'),
('6602fd63666d4ea0880410c1','6602fd63666d4ea0880410c0',TRUE,0,'To check if a number is greater than another number'),
('6602fd63666d4ea0880410c2','6602fd63666d4ea0880410c0',FALSE,1,'To check if a number is equal to another number'),
('6602fd63666d4ea0880410c7','6602fd63666d4ea0880410c6',TRUE,0,'The greater-than operator'),
('6602fd63666d4ea0880410c8','6602fd63666d4ea0880410c6',FALSE,1,'The less-than operator'),
('6602fd63666d4ea0880410cf','6602fd63666d4ea0880410ce',TRUE,0,'`false`'),
('6602fd63666d4ea0880410d0','6602fd63666d4ea0880410ce',FALSE,1,'`true`'),
('6602fd63666d4ea0880410d7','6602fd63666d4ea0880410d6',TRUE,0,'`false`'),
('6602fd63666d4ea0880410d8','6602fd63666d4ea0880410d6',FALSE,1,'`true`'),
('6602fd63666d4ea08804111a','6602fd63666d4ea088041119',TRUE,0,'`<=`'),
('6602fd63666d4ea08804111b','6602fd63666d4ea088041119',FALSE,1,'`>=`'),
('6602fd63666d4ea088041120','6602fd63666d4ea08804111f',TRUE,0,'It checks if a number is greater than or equal to another number'),
('6602fd63666d4ea088041121','6602fd63666d4ea08804111f',FALSE,1,'It checks if a number is greater than another number'),
('6602fd63666d4ea088041126','6602fd63666d4ea088041125',TRUE,0,'`>=`'),
('6602fd63666d4ea088041127','6602fd63666d4ea088041125',FALSE,1,'`<=`'),
('6602fd63666d4ea08804112e','6602fd63666d4ea08804112d',TRUE,0,'`true`'),
('6602fd63666d4ea08804112f','6602fd63666d4ea08804112d',FALSE,1,'`false`'),
('6602fd63666d4ea088041171','6602fd63666d4ea088041170',TRUE,0,'It checks if a string is equal to another string'),
('6602fd63666d4ea088041172','6602fd63666d4ea088041170',FALSE,1,'It checks if a string is greater than another string'),
('6602fd63666d4ea088041177','6602fd63666d4ea088041176',TRUE,0,'`===`'),
('6602fd63666d4ea088041178','6602fd63666d4ea088041176',FALSE,1,'`=`'),
('6602fd63666d4ea08804117f','6602fd63666d4ea08804117e',TRUE,0,'`false`'),
('6602fd63666d4ea088041180','6602fd63666d4ea08804117e',FALSE,1,'`true`'),
('6602fd63666d4ea088041185','6602fd63666d4ea088041184',TRUE,0,'`"apple" === "apple"`'),
('6602fd63666d4ea088041186','6602fd63666d4ea088041184',FALSE,1,'`"apple" === "orange"`'),
('6602fd63666d4ea0880411bc','6602fd63666d4ea0880411bb',TRUE,0,'`"black" !== "orange"`'),
('6602fd63666d4ea0880411bd','6602fd63666d4ea0880411bb',FALSE,1,'`"orange" !== "orange"`'),
('6602fd63666d4ea0880411c2','6602fd63666d4ea0880411c1',TRUE,0,'`!==`'),
('6602fd63666d4ea0880411c3','6602fd63666d4ea0880411c1',FALSE,1,'`===`'),
('6602fd63666d4ea0880411ca','6602fd63666d4ea0880411c9',TRUE,0,'`true`'),
('6602fd63666d4ea0880411cb','6602fd63666d4ea0880411c9',FALSE,1,'`false`'),
('6602fd63666d4ea0880411d0','6602fd63666d4ea0880411cf',TRUE,0,'It checks if a string isn&#039;t equal to another string'),
('6602fd63666d4ea0880411d1','6602fd63666d4ea0880411cf',FALSE,1,'It checks if a string is equal to another string'),
('6602fd63666d4ea08804120c','6602fd63666d4ea08804120b',TRUE,0,'Types'),
('6602fd63666d4ea08804120d','6602fd63666d4ea08804120b',FALSE,1,'Variables'),
('6602fd63666d4ea088041212','6602fd63666d4ea088041211',TRUE,0,'By the quotes `" "` surrounding them '),
('6602fd63666d4ea088041213','6602fd63666d4ea088041211',FALSE,1,'By the fact that they&#039;re always words or letters'),
('6602fd63666d4ea088041218','6602fd63666d4ea088041217',TRUE,0,'`42`'),
('6602fd63666d4ea088041219','6602fd63666d4ea088041217',FALSE,1,'`"42"`'),
('6602fd63666d4ea08804121e','6602fd63666d4ea08804121d',TRUE,0,'`true` and `false`'),
('6602fd63666d4ea08804121f','6602fd63666d4ea08804121d',FALSE,1,'`"True"` and `"False"`'),
('6602fd63666d4ea088041224','6602fd63666d4ea088041223',TRUE,0,'Storing a value inside a variable'),
('6602fd63666d4ea088041225','6602fd63666d4ea088041223',FALSE,1,'Giving a variable a name'),
('6602fd63666d4ea088041276','6602fd63666d4ea088041275',TRUE,0,'`+`'),
('6602fd63666d4ea088041277','6602fd63666d4ea088041275',FALSE,1,'`=`'),
('6602fd63666d4ea08804127c','6602fd63666d4ea08804127b',TRUE,0,'string'),
('6602fd63666d4ea08804127d','6602fd63666d4ea08804127b',FALSE,1,'number'),
('6602fd63666d4ea088041284','6602fd63666d4ea088041283',TRUE,0,'`10 years old`'),
('6602fd63666d4ea088041285','6602fd63666d4ea088041283',FALSE,1,'`10 "years" old`'),
('6602fd63666d4ea08804128c','6602fd63666d4ea08804128b',TRUE,0,'`3$`'),
('6602fd63666d4ea08804128d','6602fd63666d4ea08804128b',FALSE,1,'`price$`'),
('6602fd63666d4ea088041292','6602fd63666d4ea088041291',TRUE,0,'A string'),
('6602fd63666d4ea088041293','6602fd63666d4ea088041291',FALSE,1,'A boolean'),
('6602fd63666d4ea08804129a','6602fd63666d4ea088041299',TRUE,0,'`Inbox full: true`'),
('6602fd63666d4ea08804129b','6602fd63666d4ea088041299',FALSE,1,'`true`'),
('6602fd63666d4ea0880412ee','6602fd63666d4ea0880412ed',TRUE,0,'`&&`'),
('6602fd63666d4ea0880412ef','6602fd63666d4ea0880412ed',FALSE,1,'`!`'),
('6602fd63666d4ea0880412f6','6602fd63666d4ea0880412f5',FALSE,0,'`true`'),
('6602fd63666d4ea0880412f7','6602fd63666d4ea0880412f5',TRUE,1,'`false`'),
('6602fd63666d4ea0880412fc','6602fd63666d4ea0880412fb',TRUE,0,'`condition1 && condition2`'),
('6602fd63666d4ea0880412fd','6602fd63666d4ea0880412fb',FALSE,1,'`a + b`'),
('6602fd63666d4ea088041304','6602fd63666d4ea088041303',TRUE,0,'`true`'),
('6602fd63666d4ea088041305','6602fd63666d4ea088041303',FALSE,1,'`false`'),
('6602fd63666d4ea08804134c','6602fd63666d4ea08804134b',FALSE,0,'`&&`'),
('6602fd63666d4ea08804134d','6602fd63666d4ea08804134b',TRUE,1,'`||`'),
('6602fd63666d4ea088041354','6602fd63666d4ea088041353',FALSE,0,'true'),
('6602fd63666d4ea088041355','6602fd63666d4ea088041353',TRUE,1,'false'),
('6602fd63666d4ea08804135a','6602fd63666d4ea088041359',FALSE,0,'`&&`'),
('6602fd63666d4ea08804135b','6602fd63666d4ea088041359',TRUE,1,'`!`'),
('6602fd63666d4ea088041360','6602fd63666d4ea08804135f',TRUE,0,'`!(condition1 && condition2)`'),
('6602fd63666d4ea088041361','6602fd63666d4ea08804135f',FALSE,1,'`!condition1 && condition2`'),
('6602fd63666d4ea088041368','6602fd63666d4ea088041367',TRUE,0,'`true`'),
('6602fd63666d4ea088041369','6602fd63666d4ea088041367',FALSE,1,'`false`'),
('6602fd63666d4ea088041391','6602fd63666d4ea088041390',TRUE,0,'`=`'),
('6602fd63666d4ea088041392','6602fd63666d4ea088041390',FALSE,1,'`===`'),
('6602fd63666d4ea088041393','6602fd63666d4ea088041390',FALSE,2,'`<=`'),
('6602fd63666d4ea088041398','6602fd63666d4ea088041397',TRUE,0,'`<=`'),
('6602fd63666d4ea088041399','6602fd63666d4ea088041397',FALSE,1,'`<`'),
('6602fd63666d4ea08804139a','6602fd63666d4ea088041397',FALSE,2,'`>=`'),
('6602fd63666d4ea0880413b6','6602fd63666d4ea0880413b5',TRUE,0,'`true`'),
('6602fd63666d4ea0880413b7','6602fd63666d4ea0880413b5',FALSE,1,'`false`'),
('6602fd63666d4ea0880413b8','6602fd63666d4ea0880413b5',FALSE,2,'`NinaNina`'),
('6602fd63666d4ea0880413c3','6602fd63666d4ea0880413c2',TRUE,0,'It checks if a string isn&#039;t equal to another string'),
('6602fd63666d4ea0880413c4','6602fd63666d4ea0880413c2',FALSE,1,'It checks if a string is equal to another string'),
('6602fd63666d4ea0880413c5','6602fd63666d4ea0880413c2',FALSE,2,'It checks if a string is less than another string'),
('6602fd63666d4ea0880413d2','6602fd63666d4ea0880413d1',TRUE,0,'`false`'),
('6602fd63666d4ea0880413d3','6602fd63666d4ea0880413d1',FALSE,1,'`result`'),
('6602fd63666d4ea0880413d4','6602fd63666d4ea0880413d1',FALSE,2,'`true`'),
('6602fd63666d4ea0880413ec','6602fd63666d4ea0880413eb',TRUE,0,'String'),
('6602fd63666d4ea0880413ed','6602fd63666d4ea0880413eb',FALSE,1,'Boolean'),
('6602fd63666d4ea0880413ee','6602fd63666d4ea0880413eb',FALSE,2,'Number'),
('6602fd63666d4ea0880413fd','6602fd63666d4ea0880413fc',TRUE,0,'The string `"Repeat song: true"`'),
('6602fd63666d4ea0880413fe','6602fd63666d4ea0880413fc',FALSE,1,'The boolean `true`'),
('6602fd63666d4ea0880413ff','6602fd63666d4ea0880413fc',FALSE,2,'The string `"Repeat song: "`'),
('6602fd63666d4ea08804140a','6602fd63666d4ea088041409',TRUE,0,'`&&` returns `true` only when all the conditions are `true`, `||` returns `true` when at least one condition is `true`'),
('6602fd63666d4ea08804140b','6602fd63666d4ea088041409',FALSE,1,'`&&` never returns `true` while `||` always does'),
('6602fd63666d4ea08804140c','6602fd63666d4ea088041409',FALSE,2,'`&&` never returns `false` while `||` always does'),
('6602fd63666d4ea088041413','6602fd63666d4ea088041412',FALSE,0,'`true`'),
('6602fd63666d4ea088041414','6602fd63666d4ea088041412',TRUE,1,'`false`'),
('6602fd63666d4ea088041415','6602fd63666d4ea088041412',FALSE,2,'Error');





INSERT INTO "interaction_option" ("id","interaction_module_id","start_index","end_index","start_line","start_pos","length","value","correct")
VALUES
('6602fd05a8fc89e974fa3f44','6602fd05a8fc89e974fa3f43',0,4,0,0,4,'city',TRUE),
('6602fd05a8fc89e974fa3f4a','6602fd05a8fc89e974fa3f49',4,5,0,4,1,'_',TRUE),
('6602fd05a8fc89e974fa3f58','6602fd05a8fc89e974fa3f57',0,18,0,0,18,'home_city_province',TRUE),
('6602fd05a8fc89e974fa3f5e','6602fd05a8fc89e974fa3f5d',0,10,0,0,10,'high_score',TRUE),
('6602fd05a8fc89e974fa3f70','6602fd05a8fc89e974fa3f6f',5,6,0,5,1,'_',TRUE),
('6602fd05a8fc89e974fa3f71','6602fd05a8fc89e974fa3f6f',10,11,0,10,1,'_',TRUE),
('6602fd05a8fc89e974fa3f77','6602fd05a8fc89e974fa3f76',7,14,0,7,7,'request',TRUE),
('6602fd05a8fc89e974fa3f7e','6602fd05a8fc89e974fa3f7d',8,17,0,8,9,'"Porsche"',TRUE),
('6602fd05a8fc89e974fa3f85','6602fd05a8fc89e974fa3f84',5,6,0,5,1,'=',TRUE),
('6602fd05a8fc89e974fa3f8b','6602fd05a8fc89e974fa3f8a',12,13,0,12,1,'=',TRUE),
('6602fd05a8fc89e974fa3f8c','6602fd05a8fc89e974fa3f8a',14,21,0,14,7,'"apple"',TRUE),
('6602fd05a8fc89e974fa3f92','6602fd05a8fc89e974fa3f91',7,8,0,7,1,'"',TRUE),
('6602fd05a8fc89e974fa3f93','6602fd05a8fc89e974fa3f91',13,14,0,13,1,'"',TRUE),
('6602fd05a8fc89e974fa3f99','6602fd05a8fc89e974fa3f98',14,15,0,14,1,'"',TRUE),
('6602fd05a8fc89e974fa3f9a','6602fd05a8fc89e974fa3f98',15,32,0,15,17,'Winter is coming.',TRUE),
('6602fd05a8fc89e974fa3f9b','6602fd05a8fc89e974fa3f98',32,33,0,32,1,'"',TRUE),
('6602fd05a8fc89e974fa3fbf','6602fd05a8fc89e974fa3fbe',15,18,1,0,3,'job',TRUE),
('6602fd05a8fc89e974fa3fc0','6602fd05a8fc89e974fa3fbe',19,20,1,4,1,'=',TRUE),
('6602fd05a8fc89e974fa3fc1','6602fd05a8fc89e974fa3fbe',21,30,1,6,9,'"Plumber"',TRUE),
('6602fd05a8fc89e974fa3fc7','6602fd05a8fc89e974fa3fc6',0,7,0,0,7,'company',TRUE),
('6602fd05a8fc89e974fa3fc8','6602fd05a8fc89e974fa3fc6',8,9,0,8,1,'=',TRUE),
('6602fd05a8fc89e974fa3fce','6602fd05a8fc89e974fa3fcd',10,11,0,10,1,'=',TRUE),
('6602fd05a8fc89e974fa3fcf','6602fd05a8fc89e974fa3fcd',12,13,0,12,1,'"',TRUE),
('6602fd05a8fc89e974fa3fd0','6602fd05a8fc89e974fa3fcd',13,20,0,13,7,'Analyst',TRUE),
('6602fd05a8fc89e974fa3fd1','6602fd05a8fc89e974fa3fcd',20,21,0,20,1,'"',TRUE),
('6602fd05a8fc89e974fa3fd7','6602fd05a8fc89e974fa3fd6',13,22,0,13,9,'"desktop"',TRUE),
('6602fd05a8fc89e974fa3fe3','6602fd05a8fc89e974fa3fe2',0,24,0,0,24,'step_1 = "Collect pants"',TRUE),
('6602fd05a8fc89e974fa3fe4','6602fd05a8fc89e974fa3fe2',25,37,1,0,12,'step_2 = "?"',TRUE),
('6602fd05a8fc89e974fa3fe5','6602fd05a8fc89e974fa3fe2',38,55,2,0,17,'step_3 = "Profit"',TRUE),
('6602fd05a8fc89e974fa3feb','6602fd05a8fc89e974fa3fea',6,21,0,6,15,'"Hello, World!"',TRUE),
('6602fd05a8fc89e974fa3ff1','6602fd05a8fc89e974fa3ff0',17,22,1,0,5,'print',TRUE),
('6602fd05a8fc89e974fa3ff2','6602fd05a8fc89e974fa3ff0',22,23,1,5,1,'(',TRUE),
('6602fd05a8fc89e974fa3ff3','6602fd05a8fc89e974fa3ff0',28,29,1,11,1,')',TRUE),
('6602fd05a8fc89e974fa3ff9','6602fd05a8fc89e974fa3ff8',33,41,1,6,8,'greeting',TRUE),
('6602fd05a8fc89e974fa3fff','6602fd05a8fc89e974fa3ffe',24,28,1,6,4,'name',TRUE),
('6602fd05a8fc89e974fa401f','6602fd05a8fc89e974fa401e',20,25,1,0,5,'print',TRUE),
('6602fd05a8fc89e974fa4020','6602fd05a8fc89e974fa401e',26,35,1,6,9,'frequency',TRUE),
('6602fd05a8fc89e974fa4026','6602fd05a8fc89e974fa4025',5,6,0,5,1,'(',TRUE),
('6602fd05a8fc89e974fa4027','6602fd05a8fc89e974fa4025',12,13,0,12,1,')',TRUE),
('6602fd05a8fc89e974fa402d','6602fd05a8fc89e974fa402c',24,29,1,0,5,'print',TRUE),
('6602fd05a8fc89e974fa402e','6602fd05a8fc89e974fa402c',29,30,1,5,1,'(',TRUE),
('6602fd05a8fc89e974fa402f','6602fd05a8fc89e974fa402c',30,39,1,6,9,'last_name',TRUE),
('6602fd05a8fc89e974fa4030','6602fd05a8fc89e974fa402c',39,40,1,15,1,')',TRUE),
('6602fd05a8fc89e974fa4036','6602fd05a8fc89e974fa4035',22,25,1,6,3,'job',TRUE),
('6602fd05a8fc89e974fa403e','6602fd05a8fc89e974fa403d',35,36,1,7,1,'=',TRUE),
('6602fd05a8fc89e974fa4044','6602fd05a8fc89e974fa4043',57,63,4,0,6,'status',TRUE),
('6602fd05a8fc89e974fa4045','6602fd05a8fc89e974fa4043',64,65,4,7,1,'=',TRUE),
('6602fd05a8fc89e974fa4046','6602fd05a8fc89e974fa4043',66,85,4,9,19,'"New data required"',TRUE),
('6602fd05a8fc89e974fa404c','6602fd05a8fc89e974fa404b',64,78,3,13,14,'default_option',TRUE),
('6602fd05a8fc89e974fa4052','6602fd05a8fc89e974fa4051',34,40,1,6,6,'status',TRUE),
('6602fd05a8fc89e974fa4076','6602fd05a8fc89e974fa4075',26,37,1,0,11,'temperature',TRUE),
('6602fd05a8fc89e974fa407c','6602fd05a8fc89e974fa407b',34,40,1,0,6,'status',TRUE),
('6602fd05a8fc89e974fa407d','6602fd05a8fc89e974fa407b',41,42,1,7,1,'=',TRUE),
('6602fd05a8fc89e974fa407e','6602fd05a8fc89e974fa407b',43,57,1,9,14,'"Writing code"',TRUE),
('6602fd05a8fc89e974fa4084','6602fd05a8fc89e974fa4083',29,37,1,11,8,'"Dollar"',TRUE),
('6602fd05a8fc89e974fa408a','6602fd05a8fc89e974fa4089',31,37,1,9,6,'"Done"',TRUE),
('6602fd05a8fc89e974fa4091','6602fd05a8fc89e974fa4090',13,14,0,13,1,'+',TRUE),
('6602fd05a8fc89e974fa4098','6602fd05a8fc89e974fa4097',19,20,0,19,1,'+',TRUE),
('6602fd05a8fc89e974fa4099','6602fd05a8fc89e974fa4097',21,25,0,21,4,'"55"',TRUE),
('6602fd05a8fc89e974fa409f','6602fd05a8fc89e974fa409e',36,37,1,19,1,'+',TRUE),
('6602fd05a8fc89e974fa40a0','6602fd05a8fc89e974fa409e',38,47,1,21,9,'followers',TRUE),
('6602fd05a8fc89e974fa40a7','6602fd05a8fc89e974fa40a6',30,35,1,6,5,'label',TRUE),
('6602fd05a8fc89e974fa40c5','6602fd05a8fc89e974fa40c4',25,36,1,6,11,'temperature',TRUE),
('6602fd05a8fc89e974fa40cb','6602fd05a8fc89e974fa40ca',5,6,0,5,1,'(',TRUE),
('6602fd05a8fc89e974fa40cc','6602fd05a8fc89e974fa40ca',6,21,0,6,15,'"Posts:" + "55"',TRUE),
('6602fd05a8fc89e974fa40cd','6602fd05a8fc89e974fa40ca',21,22,0,21,1,')',TRUE),
('6602fd05a8fc89e974fa40d3','6602fd05a8fc89e974fa40d2',37,42,3,6,5,'title',TRUE),
('6602fd05a8fc89e974fa40d4','6602fd05a8fc89e974fa40d2',43,44,3,12,1,'+',TRUE),
('6602fd05a8fc89e974fa40d5','6602fd05a8fc89e974fa40d2',45,49,3,14,4,'name',TRUE),
('6602fd05a8fc89e974fa40db','6602fd05a8fc89e974fa40da',48,55,1,24,7,'"likes"',TRUE),
('6602fd05a8fc89e974fa40e2','6602fd05a8fc89e974fa40e1',15,16,0,15,1,'5',TRUE),
('6602fd05a8fc89e974fa40e8','6602fd05a8fc89e974fa40e7',0,12,0,0,12,'active_users',TRUE),
('6602fd05a8fc89e974fa40e9','6602fd05a8fc89e974fa40e7',13,14,0,13,1,'=',TRUE),
('6602fd05a8fc89e974fa40ea','6602fd05a8fc89e974fa40e7',15,16,0,15,1,'5',TRUE),
('6602fd05a8fc89e974fa40f0','6602fd05a8fc89e974fa40ef',27,28,0,27,1,'+',TRUE),
('6602fd05a8fc89e974fa40f1','6602fd05a8fc89e974fa40ef',29,30,0,29,1,'1',TRUE),
('6602fd05a8fc89e974fa40f7','6602fd05a8fc89e974fa40f6',14,15,0,14,1,'*',TRUE),
('6602fd05a8fc89e974fa40fd','6602fd05a8fc89e974fa40fc',68,69,2,22,1,'+',TRUE),
('6602fd05a8fc89e974fa40fe','6602fd05a8fc89e974fa40fc',70,71,2,24,1,'1',TRUE),
('6602fd05a8fc89e974fa4104','6602fd05a8fc89e974fa4103',24,29,2,0,5,'total',TRUE),
('6602fd05a8fc89e974fa4105','6602fd05a8fc89e974fa4103',40,41,2,16,1,'+',TRUE),
('6602fd05a8fc89e974fa4106','6602fd05a8fc89e974fa4103',42,48,2,18,6,'public',TRUE),
('6602fd05a8fc89e974fa412c','6602fd05a8fc89e974fa412b',44,45,2,14,1,'*',TRUE),
('6602fd05a8fc89e974fa412d','6602fd05a8fc89e974fa412b',46,54,2,16,8,'interest',TRUE),
('6602fd05a8fc89e974fa4133','6602fd05a8fc89e974fa4132',39,52,2,6,13,'sum_of_grades',TRUE),
('6602fd05a8fc89e974fa4134','6602fd05a8fc89e974fa4132',53,54,2,20,1,'/',TRUE),
('6602fd05a8fc89e974fa4135','6602fd05a8fc89e974fa4132',55,63,2,22,8,'students',TRUE),
('6602fd05a8fc89e974fa413b','6602fd05a8fc89e974fa413a',59,64,3,6,5,'total',TRUE),
('6602fd05a8fc89e974fa413c','6602fd05a8fc89e974fa413a',65,66,3,12,1,'-',TRUE),
('6602fd05a8fc89e974fa413d','6602fd05a8fc89e974fa413a',67,75,3,14,8,'discount',TRUE),
('6602fd05a8fc89e974fa4143','6602fd05a8fc89e974fa4142',18,20,0,18,2,'12',TRUE),
('6602fd05a8fc89e974fa414f','6602fd05a8fc89e974fa414e',11,12,0,11,1,'=',TRUE),
('6602fd05a8fc89e974fa4150','6602fd05a8fc89e974fa414e',13,17,0,13,4,'True',TRUE),
('6602fd05a8fc89e974fa4156','6602fd05a8fc89e974fa4155',21,28,1,6,7,'correct',TRUE),
('6602fd05a8fc89e974fa415f','6602fd05a8fc89e974fa415e',28,33,1,9,5,'False',TRUE),
('6602fd05a8fc89e974fa4160','6602fd05a8fc89e974fa415e',40,46,2,6,6,'status',TRUE),
('6602fd05a8fc89e974fa4180','6602fd05a8fc89e974fa417f',27,32,1,6,5,'False',TRUE),
('6602fd05a8fc89e974fa4186','6602fd05a8fc89e974fa4185',12,16,0,12,4,'True',TRUE),
('6602fd05a8fc89e974fa418c','6602fd05a8fc89e974fa418b',17,22,0,17,5,'False',TRUE),
('6602fd05a8fc89e974fa4192','6602fd05a8fc89e974fa4191',20,24,0,20,4,'True',TRUE),
('6602fd05a8fc89e974fa419d','6602fd05a8fc89e974fa419c',6,9,0,6,3,'not',TRUE),
('6602fd05a8fc89e974fa419e','6602fd05a8fc89e974fa419c',10,14,0,10,4,'True',TRUE),
('6602fd05a8fc89e974fa41a4','6602fd05a8fc89e974fa41a3',6,9,0,6,3,'not',TRUE),
('6602fd05a8fc89e974fa41a5','6602fd05a8fc89e974fa41a3',10,15,0,10,5,'False',TRUE),
('6602fd05a8fc89e974fa41ab','6602fd05a8fc89e974fa41aa',17,22,1,0,5,'print',TRUE),
('6602fd05a8fc89e974fa41ac','6602fd05a8fc89e974fa41aa',23,26,1,6,3,'not',TRUE),
('6602fd05a8fc89e974fa41ad','6602fd05a8fc89e974fa41aa',27,36,1,10,9,'available',TRUE),
('6602fd05a8fc89e974fa41b3','6602fd05a8fc89e974fa41b2',26,27,1,11,1,'=',TRUE),
('6602fd05a8fc89e974fa41b4','6602fd05a8fc89e974fa41b2',28,31,1,13,3,'not',TRUE),
('6602fd05a8fc89e974fa41b5','6602fd05a8fc89e974fa41b2',32,39,1,17,7,'morning',TRUE),
('6602fd05a8fc89e974fa41b6','6602fd05a8fc89e974fa41b2',15,25,1,0,10,'is_evening',TRUE),
('6602fd05a8fc89e974fa41d8','6602fd05a8fc89e974fa41d7',19,22,0,19,3,'not',TRUE),
('6602fd05a8fc89e974fa41d9','6602fd05a8fc89e974fa41d7',23,27,0,23,4,'True',TRUE),
('6602fd05a8fc89e974fa41df','6602fd05a8fc89e974fa41de',6,14,0,6,8,'not True',TRUE),
('6602fd05a8fc89e974fa41e5','6602fd05a8fc89e974fa41e4',17,30,1,0,13,'not_available',TRUE),
('6602fd05a8fc89e974fa41e6','6602fd05a8fc89e974fa41e4',31,32,1,14,1,'=',TRUE),
('6602fd05a8fc89e974fa41e7','6602fd05a8fc89e974fa41e4',37,46,1,20,9,'open_slot',TRUE),
('6602fd05a8fc89e974fa41ed','6602fd05a8fc89e974fa41ec',6,14,0,6,8,'not True',TRUE),
('6602fd05a8fc89e974fa41f9','6602fd05a8fc89e974fa41f8',2,3,0,2,1,'=',TRUE),
('6602fd05a8fc89e974fa41fa','6602fd05a8fc89e974fa41f8',3,4,0,3,1,'=',TRUE),
('6602fd05a8fc89e974fa4203','6602fd05a8fc89e974fa4202',6,8,0,6,2,'10',TRUE),
('6602fd05a8fc89e974fa4204','6602fd05a8fc89e974fa4202',9,11,0,9,2,'==',TRUE),
('6602fd05a8fc89e974fa4205','6602fd05a8fc89e974fa4202',12,14,0,12,2,'10',TRUE),
('6602fd05a8fc89e974fa420b','6602fd05a8fc89e974fa420a',6,13,0,6,7,'9 == 10',TRUE),
('6602fd05a8fc89e974fa422d','6602fd05a8fc89e974fa422c',23,24,1,12,1,'=',TRUE),
('6602fd05a8fc89e974fa422e','6602fd05a8fc89e974fa422c',24,25,1,13,1,'=',TRUE),
('6602fd05a8fc89e974fa422f','6602fd05a8fc89e974fa422c',26,28,1,15,2,'11',TRUE),
('6602fd05a8fc89e974fa4235','6602fd05a8fc89e974fa4234',9,11,0,9,2,'==',TRUE),
('6602fd05a8fc89e974fa423b','6602fd05a8fc89e974fa423a',12,14,0,12,2,'13',TRUE),
('6602fd05a8fc89e974fa4241','6602fd05a8fc89e974fa4240',10,12,0,10,2,'==',TRUE),
('6602fd05a8fc89e974fa4248','6602fd05a8fc89e974fa4247',8,10,0,8,2,'!=',TRUE),
('6602fd05a8fc89e974fa424e','6602fd05a8fc89e974fa424d',7,8,0,7,1,'=',TRUE),
('6602fd05a8fc89e974fa424f','6602fd05a8fc89e974fa424d',11,13,0,11,2,'!=',TRUE),
('6602fd05a8fc89e974fa4255','6602fd05a8fc89e974fa4254',7,8,0,7,1,'=',TRUE),
('6602fd05a8fc89e974fa4256','6602fd05a8fc89e974fa4254',11,13,0,11,2,'==',TRUE),
('6602fd05a8fc89e974fa4257','6602fd05a8fc89e974fa4254',0,6,0,0,6,'result',TRUE),
('6602fd05a8fc89e974fa425d','6602fd05a8fc89e974fa425c',26,28,2,10,2,'==',TRUE),
('6602fd05a8fc89e974fa4283','6602fd05a8fc89e974fa4282',9,11,0,9,2,'!=',TRUE),
('6602fd05a8fc89e974fa4289','6602fd05a8fc89e974fa4288',27,28,1,15,1,'=',TRUE),
('6602fd05a8fc89e974fa428a','6602fd05a8fc89e974fa4288',36,38,1,24,2,'==',TRUE),
('6602fd05a8fc89e974fa428b','6602fd05a8fc89e974fa4288',39,41,1,27,2,'13',TRUE),
('6602fd05a8fc89e974fa4291','6602fd05a8fc89e974fa4290',41,43,2,12,2,'==',TRUE),
('6602fd05a8fc89e974fa4297','6602fd05a8fc89e974fa4296',36,38,1,23,2,'!=',TRUE),
('6602fd05a8fc89e974fa42a2','6602fd05a8fc89e974fa42a1',12,13,0,12,1,'+',TRUE),
('6602fd05a8fc89e974fa42a8','6602fd05a8fc89e974fa42a7',8,9,0,8,1,'+',TRUE),
('6602fd05a8fc89e974fa42a9','6602fd05a8fc89e974fa42a7',10,25,0,10,15,'" new messages"',TRUE),
('6602fd05a8fc89e974fa42af','6602fd05a8fc89e974fa42ae',6,25,0,6,19,'f"{2} new messages"',TRUE),
('6602fd06a8fc89e974fa42b5','6602fd06a8fc89e974fa42b4',6,7,0,6,1,'f',TRUE),
('6602fd06a8fc89e974fa42b6','6602fd06a8fc89e974fa42b4',7,25,0,7,18,'"{6} new messages"',TRUE),
('6602fd06a8fc89e974fa42bc','6602fd06a8fc89e974fa42bb',8,11,0,8,3,'{2}',TRUE),
('6602fd06a8fc89e974fa42c2','6602fd06a8fc89e974fa42c1',26,38,1,9,12,'new_messages',TRUE),
('6602fd06a8fc89e974fa42c8','6602fd06a8fc89e974fa42c7',27,37,3,9,10,'new - read',TRUE),
('6602fd06a8fc89e974fa42ce','6602fd06a8fc89e974fa42cd',9,10,0,9,1,'5',TRUE),
('6602fd06a8fc89e974fa42cf','6602fd06a8fc89e974fa42cd',30,31,0,30,1,'2',TRUE),
('6602fd06a8fc89e974fa42d5','6602fd06a8fc89e974fa42d4',8,14,1,0,6,'status',TRUE),
('6602fd06a8fc89e974fa42d6','6602fd06a8fc89e974fa42d4',15,16,1,7,1,'=',TRUE),
('6602fd06a8fc89e974fa42d7','6602fd06a8fc89e974fa42d4',17,38,1,9,21,'f"{new} new messages"',TRUE),
('6602fd06a8fc89e974fa42f5','6602fd06a8fc89e974fa42f4',6,28,0,6,22,'f"{4} dataset entries"',TRUE),
('6602fd06a8fc89e974fa42fb','6602fd06a8fc89e974fa42fa',6,7,0,6,1,'f',TRUE),
('6602fd06a8fc89e974fa4301','6602fd06a8fc89e974fa4300',21,26,0,21,5,'{500}',TRUE),
('6602fd06a8fc89e974fa4307','6602fd06a8fc89e974fa4306',34,35,1,21,1,'{',TRUE),
('6602fd06a8fc89e974fa4308','6602fd06a8fc89e974fa4306',35,42,1,22,7,'degrees',TRUE),
('6602fd06a8fc89e974fa4309','6602fd06a8fc89e974fa4306',42,43,1,29,1,'}',TRUE),
('6602fd06a8fc89e974fa430f','6602fd06a8fc89e974fa430e',18,25,1,0,7,'display',TRUE),
('6602fd06a8fc89e974fa4310','6602fd06a8fc89e974fa430e',26,27,1,8,1,'=',TRUE),
('6602fd06a8fc89e974fa4311','6602fd06a8fc89e974fa430e',28,29,1,10,1,'f',TRUE),
('6602fd06a8fc89e974fa4312','6602fd06a8fc89e974fa430e',29,54,1,11,25,'"Airing tonight: {movie}"',TRUE),
('6602fd06a8fc89e974fa431a','6602fd06a8fc89e974fa4319',0,8,0,0,8,'sign_ups',TRUE),
('6602fd06a8fc89e974fa431b','6602fd06a8fc89e974fa4319',9,10,0,9,1,'=',TRUE),
('6602fd06a8fc89e974fa431c','6602fd06a8fc89e974fa4319',11,16,0,11,5,'"low"',TRUE),
('6602fd06a8fc89e974fa4322','6602fd06a8fc89e974fa4321',0,11,0,0,11,'highest_gdp',TRUE),
('6602fd06a8fc89e974fa4328','6602fd06a8fc89e974fa4327',13,14,0,13,1,'=',TRUE),
('6602fd06a8fc89e974fa4335','6602fd06a8fc89e974fa4334',36,45,1,6,9,'age_group',TRUE),
('6602fd06a8fc89e974fa4344','6602fd06a8fc89e974fa4343',20,34,1,0,14,'average_rating',TRUE),
('6602fd06a8fc89e974fa4345','6602fd06a8fc89e974fa4343',35,36,1,15,1,'=',TRUE),
('6602fd06a8fc89e974fa4346','6602fd06a8fc89e974fa4343',37,38,1,17,1,'5',TRUE),
('6602fd06a8fc89e974fa436a','6602fd06a8fc89e974fa4369',0,9,0,0,9,'save_file',TRUE),
('6602fd06a8fc89e974fa436b','6602fd06a8fc89e974fa4369',10,11,0,10,1,'=',TRUE),
('6602fd06a8fc89e974fa436c','6602fd06a8fc89e974fa4369',12,17,0,12,5,'False',TRUE),
('6602fd06a8fc89e974fa437b','6602fd06a8fc89e974fa437a',15,18,0,15,3,'not',TRUE),
('6602fd06a8fc89e974fa439f','6602fd06a8fc89e974fa439e',26,37,1,0,11,'description',TRUE),
('6602fd06a8fc89e974fa43a0','6602fd06a8fc89e974fa439e',38,39,1,12,1,'=',TRUE),
('6602fd06a8fc89e974fa43a1','6602fd06a8fc89e974fa439e',40,61,1,14,21,'f"A book by {author}"',TRUE),
('6602fd06a8fc89e974fa43a7','6602fd06a8fc89e974fa43a6',34,36,1,18,2,'!=',TRUE),
('6602fd06a8fc89e974fa43b6','6602fd06a8fc89e974fa43b5',12,15,0,12,3,'999',TRUE),
('6602fd06a8fc89e974fa43d2','6602fd06a8fc89e974fa43d1',0,9,0,0,9,'car_brand',TRUE),
('6602fd06a8fc89e974fa43d8','6602fd06a8fc89e974fa43d7',47,60,3,0,13,'print(step_1)',TRUE),
('6602fd06a8fc89e974fa43d9','6602fd06a8fc89e974fa43d7',61,74,4,0,13,'print(step_2)',TRUE),
('6602fd06a8fc89e974fa43e9','6602fd06a8fc89e974fa43e8',0,5,0,0,5,'print',TRUE),
('6602fd06a8fc89e974fa43ef','6602fd06a8fc89e974fa43ee',17,23,0,17,6,'"blue"',TRUE),
('6602fd06a8fc89e974fa43f5','6602fd06a8fc89e974fa43f4',29,34,1,0,5,'print',TRUE),
('6602fd06a8fc89e974fa43f6','6602fd06a8fc89e974fa43f4',34,35,1,5,1,'(',TRUE),
('6602fd06a8fc89e974fa43f7','6602fd06a8fc89e974fa43f4',35,44,1,6,9,'astronaut',TRUE),
('6602fd06a8fc89e974fa43f8','6602fd06a8fc89e974fa43f4',44,45,1,15,1,')',TRUE),
('6602fd06a8fc89e974fa4412','6602fd06a8fc89e974fa4411',7,16,0,7,9,'"morning"',TRUE),
('6602fd06a8fc89e974fa4439','6602fd06a8fc89e974fa4438',30,38,1,10,8,'"Louise"',TRUE),
('6602fd06a8fc89e974fa4453','6602fd06a8fc89e974fa4452',54,65,2,15,11,'start_label',TRUE),
('6602fd06a8fc89e974fa4464','6602fd06a8fc89e974fa4463',35,42,2,11,7,'value_1',TRUE),
('6602fd06a8fc89e974fa4465','6602fd06a8fc89e974fa4463',43,44,2,19,1,'+',TRUE),
('6602fd06a8fc89e974fa446d','6602fd06a8fc89e974fa446c',6,14,0,6,8,'not True',TRUE),
('6602fd06a8fc89e974fa4473','6602fd06a8fc89e974fa4472',16,25,0,16,9,'not False',TRUE),
('6602fd06a8fc89e974fa4484','6602fd06a8fc89e974fa4483',17,29,1,0,12,'is_available',TRUE),
('6602fd06a8fc89e974fa4485','6602fd06a8fc89e974fa4483',30,31,1,13,1,'=',TRUE),
('6602fd06a8fc89e974fa4486','6602fd06a8fc89e974fa4483',32,35,1,15,3,'not',TRUE),
('6602fd06a8fc89e974fa4487','6602fd06a8fc89e974fa4483',36,45,1,19,9,'open_slot',TRUE),
('6602fd06a8fc89e974fa44a9','6602fd06a8fc89e974fa44a8',35,37,3,12,2,'!=',TRUE),
('6602fd06a8fc89e974fa44af','6602fd06a8fc89e974fa44ae',6,7,0,6,1,'5',TRUE),
('6602fd06a8fc89e974fa44be','6602fd06a8fc89e974fa44bd',17,28,1,6,11,'today == 13',TRUE),
('6602fd06a8fc89e974fa44ce','6602fd06a8fc89e974fa44cd',9,11,0,9,2,'!=',TRUE),
('6602fd06a8fc89e974fa44de','6602fd06a8fc89e974fa44dd',51,53,1,28,2,'==',TRUE),
('6602fd06a8fc89e974fa44ef','6602fd06a8fc89e974fa44ee',22,23,1,6,1,'f',TRUE),
('6602fd06a8fc89e974fa44f0','6602fd06a8fc89e974fa44ee',24,28,1,8,4,'todo',TRUE),
('6602fd06a8fc89e974fa44f1','6602fd06a8fc89e974fa44ee',28,29,1,12,1,':',TRUE),
('6602fd06a8fc89e974fa44f2','6602fd06a8fc89e974fa44ee',30,31,1,14,1,'{',TRUE),
('6602fd06a8fc89e974fa44f3','6602fd06a8fc89e974fa44ee',31,35,1,15,4,'task',TRUE),
('6602fd06a8fc89e974fa44f4','6602fd06a8fc89e974fa44ee',35,36,1,19,1,'}',TRUE),
('6602fd06a8fc89e974fa4504','6602fd06a8fc89e974fa4503',50,67,2,6,17,'f"Hello, {name}!"',TRUE),
('6602fd06a8fc89e974fa4514','6602fd06a8fc89e974fa4513',51,57,0,51,6,'{2018}',TRUE),
('6602fd06a8fc89e974fa4524','6602fd06a8fc89e974fa4523',69,82,3,23,13,'{destination}',TRUE),
('6602fd06a8fc89e974fa4525','6602fd06a8fc89e974fa4523',96,103,3,50,7,'{hours}',TRUE),
('6602fd06a8fc89e974fa4526','6602fd06a8fc89e974fa4523',104,113,3,58,9,'{minutes}',TRUE),
('6602fd06a8fc89e974fa4540','6602fd06a8fc89e974fa453f',19,23,1,0,4,'fact',TRUE),
('6602fd06a8fc89e974fa454e','6602fd06a8fc89e974fa454d',8,13,0,8,5,'{200}',TRUE),
('6602fd06a8fc89e974fa4554','6602fd06a8fc89e974fa4553',11,16,1,0,5,'print',TRUE),
('6602fd06a8fc89e974fa4555','6602fd06a8fc89e974fa4553',16,17,1,5,1,'(',TRUE),
('6602fd06a8fc89e974fa4556','6602fd06a8fc89e974fa4553',17,34,1,6,17,'f"{cocoa}% cocoa"',TRUE),
('6602fd06a8fc89e974fa4557','6602fd06a8fc89e974fa4553',34,35,1,23,1,')',TRUE),
('6602fd06a8fc89e974fa456a','6602fd06a8fc89e974fa4569',2,3,0,2,1,'<',TRUE),
('6602fd06a8fc89e974fa4570','6602fd06a8fc89e974fa456f',6,7,0,6,1,'1',TRUE),
('6602fd06a8fc89e974fa4571','6602fd06a8fc89e974fa456f',8,9,0,8,1,'<',TRUE),
('6602fd06a8fc89e974fa4572','6602fd06a8fc89e974fa456f',10,13,0,10,3,'235',TRUE),
('6602fd06a8fc89e974fa4578','6602fd06a8fc89e974fa4577',10,11,0,10,1,'<',TRUE),
('6602fd06a8fc89e974fa4579','6602fd06a8fc89e974fa4577',12,13,0,12,1,'1',TRUE),
('6602fd06a8fc89e974fa457f','6602fd06a8fc89e974fa457e',10,11,0,10,1,'>',TRUE),
('6602fd06a8fc89e974fa45a1','6602fd06a8fc89e974fa45a0',6,7,0,6,1,'5',TRUE),
('6602fd06a8fc89e974fa45a2','6602fd06a8fc89e974fa45a0',8,9,0,8,1,'>',TRUE),
('6602fd06a8fc89e974fa45a3','6602fd06a8fc89e974fa45a0',10,11,0,10,1,'4',TRUE),
('6602fd06a8fc89e974fa45a9','6602fd06a8fc89e974fa45a8',9,10,0,9,1,'<',TRUE),
('6602fd06a8fc89e974fa45af','6602fd06a8fc89e974fa45ae',9,10,0,9,1,'>',TRUE),
('6602fd06a8fc89e974fa45b5','6602fd06a8fc89e974fa45b4',10,11,0,10,1,'>',TRUE),
('6602fd06a8fc89e974fa45bc','6602fd06a8fc89e974fa45bb',8,10,0,8,2,'<=',TRUE),
('6602fd06a8fc89e974fa45c2','6602fd06a8fc89e974fa45c1',6,8,0,6,2,'11',TRUE),
('6602fd06a8fc89e974fa45c3','6602fd06a8fc89e974fa45c1',9,11,0,9,2,'<=',TRUE),
('6602fd06a8fc89e974fa45c4','6602fd06a8fc89e974fa45c1',12,14,0,12,2,'11',TRUE),
('6602fd06a8fc89e974fa45ca','6602fd06a8fc89e974fa45c9',11,13,0,11,2,'>=',TRUE),
('6602fd06a8fc89e974fa45d0','6602fd06a8fc89e974fa45cf',7,8,0,7,1,'=',TRUE),
('6602fd06a8fc89e974fa45d1','6602fd06a8fc89e974fa45cf',11,13,0,11,2,'<=',TRUE),
('6602fd06a8fc89e974fa45d7','6602fd06a8fc89e974fa45d6',26,29,2,9,3,'min',TRUE),
('6602fd06a8fc89e974fa45d8','6602fd06a8fc89e974fa45d6',30,32,2,13,2,'<=',TRUE),
('6602fd06a8fc89e974fa45d9','6602fd06a8fc89e974fa45d6',33,36,2,16,3,'max',TRUE),
('6602fd06a8fc89e974fa45f9','6602fd06a8fc89e974fa45f8',39,41,1,20,2,'<=',TRUE),
('6602fd06a8fc89e974fa45ff','6602fd06a8fc89e974fa45fe',31,33,1,19,2,'>=',TRUE),
('6602fd06a8fc89e974fa4605','6602fd06a8fc89e974fa4604',39,45,2,14,6,'solved',TRUE),
('6602fd06a8fc89e974fa4606','6602fd06a8fc89e974fa4604',46,48,2,21,2,'<=',TRUE),
('6602fd06a8fc89e974fa4607','6602fd06a8fc89e974fa4604',49,56,2,24,7,'minimum',TRUE),
('6602fd06a8fc89e974fa460d','6602fd06a8fc89e974fa460c',9,11,0,9,2,'>=',TRUE),
('6602fd06a8fc89e974fa4619','6602fd06a8fc89e974fa4618',14,16,0,14,2,'==',TRUE),
('6602fd06a8fc89e974fa461f','6602fd06a8fc89e974fa461e',6,13,0,6,7,'"apple"',TRUE),
('6602fd06a8fc89e974fa4620','6602fd06a8fc89e974fa461e',14,16,0,14,2,'==',TRUE),
('6602fd06a8fc89e974fa4621','6602fd06a8fc89e974fa461e',17,24,0,17,7,'"apple"',TRUE),
('6602fd06a8fc89e974fa4627','6602fd06a8fc89e974fa4626',14,16,0,14,2,'==',TRUE),
('6602fd06a8fc89e974fa4628','6602fd06a8fc89e974fa4626',17,25,0,17,8,'"orange"',TRUE),
('6602fd06a8fc89e974fa462e','6602fd06a8fc89e974fa462d',45,52,3,6,7,'fruit_1',TRUE),
('6602fd06a8fc89e974fa462f','6602fd06a8fc89e974fa462d',53,55,3,14,2,'==',TRUE),
('6602fd06a8fc89e974fa4630','6602fd06a8fc89e974fa462d',56,63,3,17,7,'fruit_2',TRUE),
('6602fd06a8fc89e974fa4650','6602fd06a8fc89e974fa464f',54,56,3,16,2,'==',TRUE),
('6602fd06a8fc89e974fa4656','6602fd06a8fc89e974fa4655',12,18,0,12,6,'"high"',TRUE),
('6602fd06a8fc89e974fa465c','6602fd06a8fc89e974fa465b',36,42,1,9,6,'"pipe"',TRUE),
('6602fd06a8fc89e974fa4662','6602fd06a8fc89e974fa4661',15,17,0,15,2,'==',TRUE),
('6602fd06a8fc89e974fa4669','6602fd06a8fc89e974fa4668',19,21,0,19,2,'!=',TRUE),
('6602fd06a8fc89e974fa466f','6602fd06a8fc89e974fa466e',6,18,0,6,12,'"subscribed"',TRUE),
('6602fd06a8fc89e974fa4670','6602fd06a8fc89e974fa466e',19,21,0,19,2,'!=',TRUE),
('6602fd06a8fc89e974fa4671','6602fd06a8fc89e974fa466e',22,32,0,22,10,'"rejected"',TRUE),
('6602fd06a8fc89e974fa4677','6602fd06a8fc89e974fa4676',19,20,0,19,1,'!',TRUE),
('6602fd06a8fc89e974fa4678','6602fd06a8fc89e974fa4676',20,21,0,20,1,'=',TRUE),
('6602fd06a8fc89e974fa467e','6602fd06a8fc89e974fa467d',5,6,0,5,1,'=',TRUE),
('6602fd06a8fc89e974fa469e','6602fd06a8fc89e974fa469d',54,56,3,16,2,'!=',TRUE),
('6602fd06a8fc89e974fa46a4','6602fd06a8fc89e974fa46a3',12,23,0,12,11,'"bliss.png"',TRUE),
('6602fd06a8fc89e974fa46aa','6602fd06a8fc89e974fa46a9',38,43,1,13,5,'"Jim"',TRUE),
('6602fd06a8fc89e974fa46b0','6602fd06a8fc89e974fa46af',57,59,3,15,2,'!=',TRUE),
('6602fd06a8fc89e974fa46bb','6602fd06a8fc89e974fa46ba',16,22,0,16,6,'"High"',TRUE),
('6602fd06a8fc89e974fa46c1','6602fd06a8fc89e974fa46c0',8,10,0,8,2,'42',TRUE),
('6602fd06a8fc89e974fa46c7','6602fd06a8fc89e974fa46c6',5,6,0,5,1,'3',TRUE),
('6602fd06a8fc89e974fa46c8','6602fd06a8fc89e974fa46c6',6,7,0,6,1,'.',TRUE),
('6602fd06a8fc89e974fa46c9','6602fd06a8fc89e974fa46c6',7,12,0,7,5,'14159',TRUE),
('6602fd06a8fc89e974fa46cf','6602fd06a8fc89e974fa46ce',22,26,0,22,4,'True',TRUE),
('6602fd06a8fc89e974fa46d5','6602fd06a8fc89e974fa46d4',0,5,0,0,5,'is_on',TRUE),
('6602fd06a8fc89e974fa46d6','6602fd06a8fc89e974fa46d4',6,7,0,6,1,'=',TRUE),
('6602fd06a8fc89e974fa46d7','6602fd06a8fc89e974fa46d4',8,13,0,8,5,'False',TRUE),
('6602fd06a8fc89e974fa4703','6602fd06a8fc89e974fa4702',7,13,0,7,6,'"Joey"',TRUE),
('6602fd06a8fc89e974fa4704','6602fd06a8fc89e974fa4702',20,22,1,6,2,'28',TRUE),
('6602fd06a8fc89e974fa4705','6602fd06a8fc89e974fa4702',35,39,2,12,4,'True',TRUE),
('6602fd06a8fc89e974fa470b','6602fd06a8fc89e974fa470a',7,13,0,7,6,'"Jill"',TRUE),
('6602fd06a8fc89e974fa4711','6602fd06a8fc89e974fa4710',15,17,0,15,2,'10',TRUE),
('6602fd06a8fc89e974fa4717','6602fd06a8fc89e974fa4716',18,19,0,18,1,'.',TRUE),
('6602fd06a8fc89e974fa4718','6602fd06a8fc89e974fa4716',19,21,0,19,2,'55',TRUE),
('6602fd06a8fc89e974fa471e','6602fd06a8fc89e974fa471d',17,21,0,17,4,'True',TRUE),
('6602fd06a8fc89e974fa4724','6602fd06a8fc89e974fa4723',24,26,0,24,2,'11',TRUE),
('6602fd06a8fc89e974fa472c','6602fd06a8fc89e974fa472b',22,26,1,6,4,'type',TRUE),
('6602fd06a8fc89e974fa4733','6602fd06a8fc89e974fa4732',79,83,4,6,4,'type',TRUE),
('6602fd06a8fc89e974fa4734','6602fd06a8fc89e974fa4732',105,119,5,10,14,'(fuel_deposit)',TRUE),
('6602fd06a8fc89e974fa4735','6602fd06a8fc89e974fa4732',131,132,6,10,1,'(',TRUE),
('6602fd06a8fc89e974fa4736','6602fd06a8fc89e974fa4732',142,143,6,21,1,')',TRUE),
('6602fd06a8fc89e974fa4737','6602fd06a8fc89e974fa4732',145,150,7,0,5,'print',TRUE),
('6602fd06a8fc89e974fa4746','6602fd06a8fc89e974fa4745',45,53,3,16,8,'int(age)',TRUE),
('6602fd06a8fc89e974fa474d','6602fd06a8fc89e974fa474c',48,51,3,6,3,'str',TRUE),
('6602fd06a8fc89e974fa474e','6602fd06a8fc89e974fa474c',51,52,3,9,1,'(',TRUE),
('6602fd06a8fc89e974fa474f','6602fd06a8fc89e974fa474c',52,60,3,10,8,'password',TRUE),
('6602fd06a8fc89e974fa4750','6602fd06a8fc89e974fa474c',60,61,3,18,1,')',TRUE),
('6602fd06a8fc89e974fa4756','6602fd06a8fc89e974fa4755',19,22,1,6,3,'int',TRUE),
('6602fd06a8fc89e974fa475c','6602fd06a8fc89e974fa475b',17,22,1,6,5,'float',TRUE),
('6602fd06a8fc89e974fa475d','6602fd06a8fc89e974fa475b',22,23,1,11,1,'(',TRUE),
('6602fd06a8fc89e974fa475e','6602fd06a8fc89e974fa475b',23,28,1,12,5,'weeks',TRUE),
('6602fd06a8fc89e974fa475f','6602fd06a8fc89e974fa475b',28,29,1,17,1,')',TRUE),
('6602fd06a8fc89e974fa4766','6602fd06a8fc89e974fa4765',42,45,3,8,3,'int',TRUE),
('6602fd06a8fc89e974fa4767','6602fd06a8fc89e974fa4765',69,72,4,15,3,'int',TRUE),
('6602fd06a8fc89e974fa476e','6602fd06a8fc89e974fa476d',114,131,6,22,17,'bool(middle_name)',TRUE),
('6602fd06a8fc89e974fa476f','6602fd06a8fc89e974fa476d',152,167,7,20,15,'bool(foot_size)',TRUE),
('6602fd06a8fc89e974fa4770','6602fd06a8fc89e974fa476d',79,91,5,17,12,'bool(member)',TRUE),
('6602fd06a8fc89e974fa4771','6602fd06a8fc89e974fa476d',187,201,8,19,14,'bool(siblings)',TRUE),
('6602fd06a8fc89e974fa4777','6602fd06a8fc89e974fa4776',29,39,2,11,10,'bool(pets)',TRUE),
('6602fd06a8fc89e974fa4778','6602fd06a8fc89e974fa4776',51,61,3,11,10,'bool(kids)',TRUE),
('6602fd06a8fc89e974fa4792','6602fd06a8fc89e974fa4791',32,36,1,11,4,'bool',TRUE),
('6602fd06a8fc89e974fa4793','6602fd06a8fc89e974fa4791',37,43,1,16,6,'detail',TRUE),
('6602fd06a8fc89e974fa47a4','6602fd06a8fc89e974fa47a3',9,11,0,9,2,'>=',TRUE),
('6602fd06a8fc89e974fa47aa','6602fd06a8fc89e974fa47a9',26,30,2,0,4,'pass',TRUE),
('6602fd06a8fc89e974fa47ab','6602fd06a8fc89e974fa47a9',31,32,2,5,1,'=',TRUE),
('6602fd06a8fc89e974fa47ac','6602fd06a8fc89e974fa47a9',39,41,2,13,2,'>=',TRUE),
('6602fd06a8fc89e974fa47ad','6602fd06a8fc89e974fa47a9',42,51,2,16,9,'min_score',TRUE),
('6602fd06a8fc89e974fa47b3','6602fd06a8fc89e974fa47b2',45,47,2,19,2,'>=',TRUE),
('6602fd06a8fc89e974fa47c0','6602fd06a8fc89e974fa47bf',60,62,3,11,2,'!=',TRUE),
('6602fd06a8fc89e974fa47e6','6602fd06a8fc89e974fa47e5',9,12,0,9,3,'100',TRUE),
('6602fd06a8fc89e974fa47e7','6602fd06a8fc89e974fa47e5',13,14,0,13,1,'+',TRUE),
('6602fd06a8fc89e974fa47e8','6602fd06a8fc89e974fa47e5',0,6,0,0,6,'result',TRUE),
('6602fd06a8fc89e974fa47e9','6602fd06a8fc89e974fa47e5',17,22,1,0,5,'print',TRUE),
('6602fd06a8fc89e974fa47ef','6602fd06a8fc89e974fa47ee',0,9,0,0,9,'last_name',TRUE),
('6602fd06a8fc89e974fa47f0','6602fd06a8fc89e974fa47ee',10,11,0,10,1,'=',TRUE),
('6602fd06a8fc89e974fa47f1','6602fd06a8fc89e974fa47ee',12,21,0,12,9,'"Clooney"',TRUE),
('6602fd06a8fc89e974fa4800','6602fd06a8fc89e974fa47ff',0,5,0,0,5,'score',TRUE),
('6602fd06a8fc89e974fa4801','6602fd06a8fc89e974fa47ff',6,7,0,6,1,'=',TRUE),
('6602fd06a8fc89e974fa4802','6602fd06a8fc89e974fa47ff',8,9,0,8,1,'2',TRUE),
('6602fd06a8fc89e974fa4831','6602fd06a8fc89e974fa4830',38,39,2,19,1,'>',TRUE),
('6602fd06a8fc89e974fa4837','6602fd06a8fc89e974fa4836',36,37,1,25,1,'4',TRUE),
('6602fd06a8fc89e974fa4848','6602fd06a8fc89e974fa4847',32,34,1,20,2,'>=',TRUE),
('6602fd06a8fc89e974fa484f','6602fd06a8fc89e974fa484e',25,38,2,0,13,'give_discount',TRUE),
('6602fd06a8fc89e974fa4850','6602fd06a8fc89e974fa484e',39,40,2,14,1,'=',TRUE),
('6602fd06a8fc89e974fa4851','6602fd06a8fc89e974fa484e',41,46,2,16,5,'value',TRUE),
('6602fd06a8fc89e974fa4852','6602fd06a8fc89e974fa484e',47,49,2,22,2,'>=',TRUE),
('6602fd06a8fc89e974fa4853','6602fd06a8fc89e974fa484e',50,57,2,25,7,'minimum',TRUE),
('6602fd06a8fc89e974fa485a','6602fd06a8fc89e974fa4859',61,75,5,6,14,'age >= min_age',TRUE),
('6602fd06a8fc89e974fa486c','6602fd06a8fc89e974fa486b',53,55,2,17,2,'==',TRUE),
('6602fd06a8fc89e974fa4872','6602fd06a8fc89e974fa4871',6,13,0,6,7,'"Diana"',TRUE),
('6602fd06a8fc89e974fa4873','6602fd06a8fc89e974fa4871',14,16,0,14,2,'==',TRUE),
('6602fd06a8fc89e974fa4874','6602fd06a8fc89e974fa4871',17,26,0,17,9,'"Charles"',TRUE),
('6602fd06a8fc89e974fa4884','6602fd06a8fc89e974fa4883',9,15,0,9,6,'"pipe"',TRUE),
('6602fd06a8fc89e974fa488a','6602fd06a8fc89e974fa4889',11,13,0,11,2,'!=',TRUE),
('6602fd06a8fc89e974fa4899','6602fd06a8fc89e974fa4898',57,59,3,15,2,'!=',TRUE),
('6602fd06a8fc89e974fa48b5','6602fd06a8fc89e974fa48b4',0,5,0,0,5,'topic',TRUE),
('6602fd06a8fc89e974fa48b6','6602fd06a8fc89e974fa48b4',6,7,0,6,1,'=',TRUE),
('6602fd06a8fc89e974fa48b7','6602fd06a8fc89e974fa48b4',8,17,0,8,9,'"Biology"',TRUE),
('6602fd06a8fc89e974fa48c7','6602fd06a8fc89e974fa48c6',37,43,3,6,6,'online',TRUE),
('6602fd62666d4ea088040be2','6602fd62666d4ea088040be1',4,9,1,0,5,'const',TRUE),
('6602fd62666d4ea088040be8','6602fd62666d4ea088040be7',4,8,0,4,4,'city',TRUE),
('6602fd62666d4ea088040bee','6602fd62666d4ea088040bed',4,12,0,4,8,'homeCity',TRUE),
('6602fd62666d4ea088040bf4','6602fd62666d4ea088040bf3',6,15,0,6,9,'windyCity',TRUE),
('6602fd62666d4ea088040c14','6602fd62666d4ea088040c13',6,15,0,6,9,'highScore',TRUE),
('6602fd62666d4ea088040c1a','6602fd62666d4ea088040c19',0,1,0,0,1,'l',TRUE),
('6602fd62666d4ea088040c1b','6602fd62666d4ea088040c19',2,3,0,2,1,'t',TRUE),
('6602fd62666d4ea088040c1c','6602fd62666d4ea088040c19',1,2,0,1,1,'e',TRUE),
('6602fd62666d4ea088040c22','6602fd62666d4ea088040c21',4,13,0,4,9,'highScore',TRUE),
('6602fd62666d4ea088040c23','6602fd62666d4ea088040c21',0,3,0,0,3,'let',TRUE),
('6602fd62666d4ea088040c29','6602fd62666d4ea088040c28',0,3,0,0,3,'let',TRUE),
('6602fd62666d4ea088040c30','6602fd62666d4ea088040c2f',6,10,0,6,4,'car1',TRUE),
('6602fd62666d4ea088040c36','6602fd62666d4ea088040c35',11,12,0,11,1,'=',TRUE),
('6602fd62666d4ea088040c37','6602fd62666d4ea088040c35',13,22,0,13,9,'"Chicago"',TRUE),
('6602fd62666d4ea088040c3d','6602fd62666d4ea088040c3c',22,23,0,22,1,';',TRUE),
('6602fd62666d4ea088040c43','6602fd62666d4ea088040c42',0,1,0,0,1,'"',TRUE),
('6602fd62666d4ea088040c44','6602fd62666d4ea088040c42',8,9,0,8,1,'"',TRUE),
('6602fd62666d4ea088040c4a','6602fd62666d4ea088040c49',0,1,0,0,1,'"',TRUE),
('6602fd62666d4ea088040c4b','6602fd62666d4ea088040c49',1,18,0,1,17,'Winter is coming.',TRUE),
('6602fd62666d4ea088040c4c','6602fd62666d4ea088040c49',18,19,0,18,1,'"',TRUE),
('6602fd62666d4ea088040c70','6602fd62666d4ea088040c6f',20,27,1,0,7,'let job',TRUE),
('6602fd62666d4ea088040c71','6602fd62666d4ea088040c6f',28,29,1,8,1,'=',TRUE),
('6602fd62666d4ea088040c72','6602fd62666d4ea088040c6f',30,39,1,10,9,'"Plumber"',TRUE),
('6602fd62666d4ea088040c78','6602fd62666d4ea088040c77',0,11,0,0,11,'let company',TRUE),
('6602fd62666d4ea088040c79','6602fd62666d4ea088040c77',12,13,0,12,1,'=',TRUE),
('6602fd62666d4ea088040c7a','6602fd62666d4ea088040c77',14,21,0,14,7,'"Apple"',TRUE),
('6602fd62666d4ea088040c7b','6602fd62666d4ea088040c77',21,22,0,21,1,';',TRUE),
('6602fd62666d4ea088040c81','6602fd62666d4ea088040c80',15,16,0,15,1,'"',TRUE),
('6602fd62666d4ea088040c82','6602fd62666d4ea088040c80',16,21,0,16,5,'Malta',TRUE),
('6602fd62666d4ea088040c83','6602fd62666d4ea088040c80',21,22,0,21,1,'"',TRUE),
('6602fd62666d4ea088040c89','6602fd62666d4ea088040c88',15,24,0,15,9,'"Desktop"',TRUE),
('6602fd62666d4ea088040c92','6602fd62666d4ea088040c91',6,19,0,6,13,'norwayCapital',TRUE),
('6602fd62666d4ea088040c93','6602fd62666d4ea088040c91',0,5,0,0,5,'const',TRUE),
('6602fd62666d4ea088040c9d','6602fd62666d4ea088040c9c',0,3,0,0,3,'let',TRUE),
('6602fd62666d4ea088040ca4','6602fd62666d4ea088040ca3',6,14,0,6,8,'BIRTHDAY',TRUE),
('6602fd62666d4ea088040cab','6602fd62666d4ea088040caa',6,20,0,6,14,'SPEED_OF_LIGHT',TRUE),
('6602fd62666d4ea088040cb1','6602fd62666d4ea088040cb0',0,5,0,0,5,'const',TRUE),
('6602fd62666d4ea088040ccf','6602fd62666d4ea088040cce',0,3,0,0,3,'let',TRUE),
('6602fd62666d4ea088040cd5','6602fd62666d4ea088040cd4',6,19,0,6,13,'LONGEST_RIVER',TRUE),
('6602fd62666d4ea088040cdb','6602fd62666d4ea088040cda',0,5,0,0,5,'const',TRUE),
('6602fd62666d4ea088040ce7','6602fd62666d4ea088040ce6',0,30,0,0,30,'const step1 = "Collect pants";',TRUE),
('6602fd62666d4ea088040ce8','6602fd62666d4ea088040ce6',31,49,1,0,18,'const step2 = "?";',TRUE),
('6602fd62666d4ea088040ce9','6602fd62666d4ea088040ce6',50,73,2,0,23,'const step3 = "Profit";',TRUE),
('6602fd62666d4ea088040cef','6602fd62666d4ea088040cee',12,27,0,12,15,'"Hello, World!"',TRUE),
('6602fd62666d4ea088040cf5','6602fd62666d4ea088040cf4',35,36,1,11,1,'(',TRUE),
('6602fd62666d4ea088040cf6','6602fd62666d4ea088040cf4',41,42,1,17,1,')',TRUE),
('6602fd62666d4ea088040cfc','6602fd62666d4ea088040cfb',46,54,1,12,8,'greeting',TRUE),
('6602fd62666d4ea088040d02','6602fd62666d4ea088040d01',37,41,1,12,4,'name',TRUE),
('6602fd62666d4ea088040d22','6602fd62666d4ea088040d21',0,26,0,0,26,'const frequency = "daily";',TRUE),
('6602fd62666d4ea088040d23','6602fd62666d4ea088040d21',27,50,1,0,23,'console.log(frequency);',TRUE),
('6602fd62666d4ea088040d29','6602fd62666d4ea088040d28',0,7,0,0,7,'console',TRUE),
('6602fd62666d4ea088040d2a','6602fd62666d4ea088040d28',7,8,0,7,1,'.',TRUE),
('6602fd62666d4ea088040d2b','6602fd62666d4ea088040d28',8,11,0,8,3,'log',TRUE),
('6602fd62666d4ea088040d2c','6602fd62666d4ea088040d28',11,12,0,11,1,'(',TRUE),
('6602fd62666d4ea088040d2d','6602fd62666d4ea088040d28',18,19,0,18,1,')',TRUE),
('6602fd62666d4ea088040d33','6602fd62666d4ea088040d32',42,50,1,12,8,'lastName',TRUE),
('6602fd62666d4ea088040d39','6602fd62666d4ea088040d38',35,38,1,12,3,'job',TRUE),
('6602fd62666d4ea088040d42','6602fd62666d4ea088040d41',54,55,1,14,1,'=',TRUE),
('6602fd62666d4ea088040d49','6602fd62666d4ea088040d48',110,123,4,0,13,'currentStatus',TRUE),
('6602fd63666d4ea088040d4a','6602fd62666d4ea088040d48',124,125,4,14,1,'=',TRUE),
('6602fd63666d4ea088040d4b','6602fd62666d4ea088040d48',126,135,4,16,9,'"Reading"',TRUE),
('6602fd63666d4ea088040d52','6602fd63666d4ea088040d51',90,103,3,16,13,'defaultStatus',TRUE),
('6602fd63666d4ea088040d59','6602fd63666d4ea088040d58',52,65,1,12,13,'currentStatus',TRUE),
('6602fd63666d4ea088040d5a','6602fd63666d4ea088040d58',116,129,4,12,13,'currentStatus',TRUE),
('6602fd63666d4ea088040d7e','6602fd63666d4ea088040d7d',31,42,1,0,11,'temperature',TRUE),
('6602fd63666d4ea088040d84','6602fd63666d4ea088040d83',31,44,1,0,13,'currentStatus',TRUE),
('6602fd63666d4ea088040d85','6602fd63666d4ea088040d83',45,46,1,14,1,'=',TRUE),
('6602fd63666d4ea088040d86','6602fd63666d4ea088040d83',47,61,1,16,14,'"Writing code"',TRUE),
('6602fd63666d4ea088040d87','6602fd63666d4ea088040d83',61,62,1,30,1,';',TRUE),
('6602fd63666d4ea088040d8d','6602fd63666d4ea088040d8c',28,38,1,0,10,'buttonText',TRUE),
('6602fd63666d4ea088040d8e','6602fd63666d4ea088040d8c',39,40,1,11,1,'=',TRUE),
('6602fd63666d4ea088040d8f','6602fd63666d4ea088040d8c',41,49,1,13,8,'"Log in"',TRUE),
('6602fd63666d4ea088040d90','6602fd63666d4ea088040d8c',49,50,1,21,1,';',TRUE),
('6602fd63666d4ea088040d96','6602fd63666d4ea088040d95',52,58,1,16,6,'"Done"',TRUE),
('6602fd63666d4ea088040d9e','6602fd63666d4ea088040d9d',13,14,0,13,1,'+',TRUE),
('6602fd63666d4ea088040da5','6602fd63666d4ea088040da4',12,24,0,12,12,'"Followers:"',TRUE),
('6602fd63666d4ea088040da6','6602fd63666d4ea088040da4',25,26,0,25,1,'+',TRUE),
('6602fd63666d4ea088040da7','6602fd63666d4ea088040da4',27,31,0,27,4,'"55"',TRUE),
('6602fd63666d4ea088040dae','6602fd63666d4ea088040dad',24,36,1,0,12,'"Followers:"',TRUE),
('6602fd63666d4ea088040daf','6602fd63666d4ea088040dad',37,38,1,13,1,'+',TRUE),
('6602fd63666d4ea088040db0','6602fd63666d4ea088040dad',39,48,1,15,9,'followers',TRUE),
('6602fd63666d4ea088040db7','6602fd63666d4ea088040db6',32,43,1,0,11,'console.log',TRUE),
('6602fd63666d4ea088040db8','6602fd63666d4ea088040db6',43,44,1,11,1,'(',TRUE),
('6602fd63666d4ea088040db9','6602fd63666d4ea088040db6',76,77,1,44,1,')',TRUE),
('6602fd63666d4ea088040dc0','6602fd63666d4ea088040dbf',14,22,0,14,8,'"Posts:"',TRUE),
('6602fd63666d4ea088040dc1','6602fd63666d4ea088040dbf',23,24,0,23,1,'+',TRUE),
('6602fd63666d4ea088040dc2','6602fd63666d4ea088040dbf',25,29,0,25,4,'"13"',TRUE),
('6602fd63666d4ea088040dc3','6602fd63666d4ea088040dbf',43,48,1,12,5,'label',TRUE),
('6602fd63666d4ea088040de9','6602fd63666d4ea088040de8',38,49,1,12,11,'temperature',TRUE),
('6602fd63666d4ea088040def','6602fd63666d4ea088040dee',0,11,0,0,11,'console.log',TRUE),
('6602fd63666d4ea088040df0','6602fd63666d4ea088040dee',11,12,0,11,1,'(',TRUE),
('6602fd63666d4ea088040df1','6602fd63666d4ea088040dee',12,27,0,12,15,'"Posts:" + "55"',TRUE),
('6602fd63666d4ea088040df2','6602fd63666d4ea088040dee',27,28,0,27,1,')',TRUE),
('6602fd63666d4ea088040df3','6602fd63666d4ea088040dee',28,29,0,28,1,';',TRUE),
('6602fd63666d4ea088040df9','6602fd63666d4ea088040df8',57,62,3,12,5,'title',TRUE),
('6602fd63666d4ea088040dfa','6602fd63666d4ea088040df8',63,64,3,18,1,'+',TRUE),
('6602fd63666d4ea088040dfb','6602fd63666d4ea088040df8',65,69,3,20,4,'name',TRUE),
('6602fd63666d4ea088040e01','6602fd63666d4ea088040e00',57,64,1,28,7,'"likes"',TRUE),
('6602fd63666d4ea088040e08','6602fd63666d4ea088040e07',22,23,0,22,1,'5',TRUE),
('6602fd63666d4ea088040e0f','6602fd63666d4ea088040e0e',6,19,0,6,13,'numberOfLikes',TRUE),
('6602fd63666d4ea088040e10','6602fd63666d4ea088040e0e',20,21,0,20,1,'=',TRUE),
('6602fd63666d4ea088040e11','6602fd63666d4ea088040e0e',22,23,0,22,1,'5',TRUE),
('6602fd63666d4ea088040e12','6602fd63666d4ea088040e0e',0,5,0,0,5,'const',TRUE),
('6602fd63666d4ea088040e19','6602fd63666d4ea088040e18',24,25,0,24,1,'+',TRUE),
('6602fd63666d4ea088040e1a','6602fd63666d4ea088040e18',26,27,0,26,1,'1',TRUE),
('6602fd63666d4ea088040e21','6602fd63666d4ea088040e20',20,21,0,20,1,'*',TRUE),
('6602fd63666d4ea088040e28','6602fd63666d4ea088040e27',84,85,2,26,1,'+',TRUE),
('6602fd63666d4ea088040e29','6602fd63666d4ea088040e27',86,87,2,28,1,'1',TRUE),
('6602fd63666d4ea088040e30','6602fd63666d4ea088040e2f',44,49,2,6,5,'total',TRUE),
('6602fd63666d4ea088040e31','6602fd63666d4ea088040e2f',50,51,2,12,1,'=',TRUE),
('6602fd63666d4ea088040e32','6602fd63666d4ea088040e2f',52,68,2,14,16,'private + public',TRUE),
('6602fd63666d4ea088040e58','6602fd63666d4ea088040e57',64,65,2,20,1,'*',TRUE),
('6602fd63666d4ea088040e59','6602fd63666d4ea088040e57',66,74,2,22,8,'interest',TRUE),
('6602fd63666d4ea088040e5f','6602fd63666d4ea088040e5e',77,78,2,24,1,'/',TRUE),
('6602fd63666d4ea088040e65','6602fd63666d4ea088040e64',85,90,3,12,5,'total',TRUE),
('6602fd63666d4ea088040e66','6602fd63666d4ea088040e64',91,92,3,18,1,'-',TRUE),
('6602fd63666d4ea088040e67','6602fd63666d4ea088040e64',93,101,3,20,8,'discount',TRUE),
('6602fd63666d4ea088040e6d','6602fd63666d4ea088040e6c',22,24,0,22,2,'12',TRUE),
('6602fd63666d4ea088040e7a','6602fd63666d4ea088040e79',42,46,1,12,4,'true',TRUE),
('6602fd63666d4ea088040e81','6602fd63666d4ea088040e80',16,20,0,16,4,'true',TRUE),
('6602fd63666d4ea088040e82','6602fd63666d4ea088040e80',34,41,1,12,7,'correct',TRUE),
('6602fd63666d4ea088040e8b','6602fd63666d4ea088040e8a',46,51,1,15,5,'false',TRUE),
('6602fd63666d4ea088040e8c','6602fd63666d4ea088040e8a',65,71,2,12,6,'status',TRUE),
('6602fd63666d4ea088040eac','6602fd63666d4ea088040eab',28,35,1,0,7,'console',TRUE),
('6602fd63666d4ea088040ead','6602fd63666d4ea088040eab',35,36,1,7,1,'.',TRUE),
('6602fd63666d4ea088040eae','6602fd63666d4ea088040eab',36,39,1,8,3,'log',TRUE),
('6602fd63666d4ea088040eaf','6602fd63666d4ea088040eab',39,40,1,11,1,'(',TRUE),
('6602fd63666d4ea088040eb0','6602fd63666d4ea088040eab',40,45,1,12,5,'false',TRUE),
('6602fd63666d4ea088040eb1','6602fd63666d4ea088040eab',45,46,1,17,1,')',TRUE),
('6602fd63666d4ea088040eb7','6602fd63666d4ea088040eb6',6,19,0,6,13,'autoSaveImage',TRUE),
('6602fd63666d4ea088040eb8','6602fd63666d4ea088040eb6',22,26,0,22,4,'true',TRUE),
('6602fd63666d4ea088040eb9','6602fd63666d4ea088040eb6',0,5,0,0,5,'const',TRUE),
('6602fd63666d4ea088040ebf','6602fd63666d4ea088040ebe',6,18,0,6,12,'allowCookies',TRUE),
('6602fd63666d4ea088040ec0','6602fd63666d4ea088040ebe',21,26,0,21,5,'false',TRUE),
('6602fd63666d4ea088040ec6','6602fd63666d4ea088040ec5',17,21,0,17,4,'true',TRUE),
('6602fd63666d4ea088040ed2','6602fd63666d4ea088040ed1',12,13,0,12,1,'!',TRUE),
('6602fd63666d4ea088040ed3','6602fd63666d4ea088040ed1',13,17,0,13,4,'true',TRUE),
('6602fd63666d4ea088040ed9','6602fd63666d4ea088040ed8',12,13,0,12,1,'!',TRUE),
('6602fd63666d4ea088040eda','6602fd63666d4ea088040ed8',13,18,0,13,5,'false',TRUE),
('6602fd63666d4ea088040ee0','6602fd63666d4ea088040edf',36,37,1,12,1,'!',TRUE),
('6602fd63666d4ea088040ee1','6602fd63666d4ea088040edf',37,46,1,13,9,'isMorning',TRUE),
('6602fd63666d4ea088040ee8','6602fd63666d4ea088040ee7',30,39,1,6,9,'isEvening',TRUE),
('6602fd63666d4ea088040ee9','6602fd63666d4ea088040ee7',40,41,1,16,1,'=',TRUE),
('6602fd63666d4ea088040eea','6602fd63666d4ea088040ee7',42,43,1,18,1,'!',TRUE),
('6602fd63666d4ea088040eeb','6602fd63666d4ea088040ee7',43,52,1,19,9,'isMorning',TRUE),
('6602fd63666d4ea088040f0d','6602fd63666d4ea088040f0c',20,21,0,20,1,'!',TRUE),
('6602fd63666d4ea088040f0e','6602fd63666d4ea088040f0c',21,25,0,21,4,'true',TRUE),
('6602fd63666d4ea088040f14','6602fd63666d4ea088040f13',12,17,0,12,5,'!true',TRUE),
('6602fd63666d4ea088040f1a','6602fd63666d4ea088040f19',23,28,1,0,5,'const',TRUE),
('6602fd63666d4ea088040f1b','6602fd63666d4ea088040f19',29,40,1,6,11,'isAvailable',TRUE),
('6602fd63666d4ea088040f1c','6602fd63666d4ea088040f19',43,52,1,20,9,'!openSlot',TRUE),
('6602fd63666d4ea088040f22','6602fd63666d4ea088040f21',12,17,0,12,5,'!true',TRUE),
('6602fd63666d4ea088040f2e','6602fd63666d4ea088040f2d',4,5,0,4,1,'=',TRUE),
('6602fd63666d4ea088040f2f','6602fd63666d4ea088040f2d',3,4,0,3,1,'=',TRUE),
('6602fd63666d4ea088040f30','6602fd63666d4ea088040f2d',2,3,0,2,1,'=',TRUE),
('6602fd63666d4ea088040f39','6602fd63666d4ea088040f38',12,14,0,12,2,'10',TRUE),
('6602fd63666d4ea088040f3a','6602fd63666d4ea088040f38',15,18,0,15,3,'===',TRUE),
('6602fd63666d4ea088040f3b','6602fd63666d4ea088040f38',19,21,0,19,2,'10',TRUE),
('6602fd63666d4ea088040f42','6602fd63666d4ea088040f41',12,20,0,12,8,'9 === 10',TRUE),
('6602fd63666d4ea088040f64','6602fd63666d4ea088040f63',36,37,1,18,1,'=',TRUE),
('6602fd63666d4ea088040f65','6602fd63666d4ea088040f63',37,38,1,19,1,'=',TRUE),
('6602fd63666d4ea088040f66','6602fd63666d4ea088040f63',38,39,1,20,1,'=',TRUE),
('6602fd63666d4ea088040f67','6602fd63666d4ea088040f63',40,42,1,22,2,'11',TRUE),
('6602fd63666d4ea088040f6d','6602fd63666d4ea088040f6c',15,18,0,15,3,'===',TRUE),
('6602fd63666d4ea088040f73','6602fd63666d4ea088040f72',19,21,0,19,2,'13',TRUE),
('6602fd63666d4ea088040f79','6602fd63666d4ea088040f78',16,19,0,16,3,'===',TRUE),
('6602fd63666d4ea088040f80','6602fd63666d4ea088040f7f',14,17,0,14,3,'!==',TRUE),
('6602fd63666d4ea088040f87','6602fd63666d4ea088040f86',13,14,0,13,1,'=',TRUE),
('6602fd63666d4ea088040f88','6602fd63666d4ea088040f86',17,20,0,17,3,'!==',TRUE),
('6602fd63666d4ea088040f8e','6602fd63666d4ea088040f8d',13,14,0,13,1,'=',TRUE),
('6602fd63666d4ea088040f8f','6602fd63666d4ea088040f8d',17,20,0,17,3,'===',TRUE),
('6602fd63666d4ea088040f96','6602fd63666d4ea088040f95',46,49,2,16,3,'===',TRUE),
('6602fd63666d4ea088040fbc','6602fd63666d4ea088040fbb',15,18,0,15,3,'!==',TRUE),
('6602fd63666d4ea088040fc2','6602fd63666d4ea088040fc1',39,40,1,20,1,'=',TRUE),
('6602fd63666d4ea088040fc3','6602fd63666d4ea088040fc1',48,51,1,29,3,'===',TRUE),
('6602fd63666d4ea088040fc4','6602fd63666d4ea088040fc1',52,54,1,33,2,'13',TRUE),
('6602fd63666d4ea088040fca','6602fd63666d4ea088040fc9',60,63,2,18,3,'===',TRUE),
('6602fd63666d4ea088040fd0','6602fd63666d4ea088040fcf',48,51,1,28,3,'!==',TRUE),
('6602fd63666d4ea088040fe8','6602fd63666d4ea088040fe7',16,17,0,16,1,'=',TRUE),
('6602fd63666d4ea088040fee','6602fd63666d4ea088040fed',0,11,0,0,11,'console.log',TRUE),
('6602fd63666d4ea088040fef','6602fd63666d4ea088040fed',11,12,0,11,1,'(',TRUE),
('6602fd63666d4ea088040ff0','6602fd63666d4ea088040fed',12,21,0,12,9,'"Atlanta"',TRUE),
('6602fd63666d4ea088040ff1','6602fd63666d4ea088040fed',21,22,0,21,1,')',TRUE),
('6602fd63666d4ea088040ff7','6602fd63666d4ea088040ff6',57,68,1,0,11,'console.log',TRUE),
('6602fd63666d4ea088040ff8','6602fd63666d4ea088040ff6',68,69,1,11,1,'(',TRUE),
('6602fd63666d4ea088040ff9','6602fd63666d4ea088040ff6',69,80,1,12,11,'ingredients',TRUE),
('6602fd63666d4ea088040ffa','6602fd63666d4ea088040ff6',80,81,1,23,1,')',TRUE),
('6602fd63666d4ea088041009','6602fd63666d4ea088041008',78,82,4,12,4,'goal',TRUE),
('6602fd63666d4ea08804100a','6602fd63666d4ea088041008',83,84,4,17,1,'-',TRUE),
('6602fd63666d4ea08804100b','6602fd63666d4ea088041008',85,93,4,19,8,'milesRan',TRUE),
('6602fd63666d4ea088041011','6602fd63666d4ea088041010',81,86,4,12,5,'total',TRUE),
('6602fd63666d4ea088041017','6602fd63666d4ea088041016',56,61,3,14,5,'score',TRUE),
('6602fd63666d4ea088041018','6602fd63666d4ea088041016',64,71,3,22,7,'penalty',TRUE),
('6602fd63666d4ea088041019','6602fd63666d4ea088041016',62,63,3,20,1,'-',TRUE),
('6602fd63666d4ea088041036','6602fd63666d4ea088041035',133,141,8,12,8,'loggedIn',TRUE),
('6602fd63666d4ea08804103c','6602fd63666d4ea08804103b',20,21,0,20,1,'!',TRUE),
('6602fd63666d4ea088041042','6602fd63666d4ea088041041',83,87,4,12,4,'true',TRUE),
('6602fd63666d4ea08804104f','6602fd63666d4ea08804104e',42,45,1,21,3,'===',TRUE),
('6602fd63666d4ea088041050','6602fd63666d4ea08804104e',46,49,1,25,3,'100',TRUE),
('6602fd63666d4ea08804105f','6602fd63666d4ea08804105e',47,50,1,24,3,'!==',TRUE),
('6602fd63666d4ea088041065','6602fd63666d4ea088041064',38,39,1,14,1,'=',TRUE),
('6602fd63666d4ea088041066','6602fd63666d4ea088041064',53,54,1,29,1,'!',TRUE),
('6602fd63666d4ea088041067','6602fd63666d4ea088041064',57,58,1,33,1,'0',TRUE),
('6602fd63666d4ea0880410a6','6602fd63666d4ea0880410a5',14,15,0,14,1,'<',TRUE),
('6602fd63666d4ea0880410ac','6602fd63666d4ea0880410ab',12,13,0,12,1,'1',TRUE),
('6602fd63666d4ea0880410ad','6602fd63666d4ea0880410ab',14,15,0,14,1,'<',TRUE),
('6602fd63666d4ea0880410ae','6602fd63666d4ea0880410ab',16,19,0,16,3,'235',TRUE),
('6602fd63666d4ea0880410b4','6602fd63666d4ea0880410b3',16,17,0,16,1,'<',TRUE),
('6602fd63666d4ea0880410b5','6602fd63666d4ea0880410b3',18,19,0,18,1,'1',TRUE),
('6602fd63666d4ea0880410bb','6602fd63666d4ea0880410ba',16,17,0,16,1,'>',TRUE),
('6602fd63666d4ea0880410dd','6602fd63666d4ea0880410dc',12,13,0,12,1,'5',TRUE),
('6602fd63666d4ea0880410de','6602fd63666d4ea0880410dc',14,15,0,14,1,'>',TRUE),
('6602fd63666d4ea0880410df','6602fd63666d4ea0880410dc',16,17,0,16,1,'4',TRUE),
('6602fd63666d4ea0880410e5','6602fd63666d4ea0880410e4',15,16,0,15,1,'<',TRUE),
('6602fd63666d4ea0880410eb','6602fd63666d4ea0880410ea',15,16,0,15,1,'>',TRUE),
('6602fd63666d4ea0880410f1','6602fd63666d4ea0880410f0',16,17,0,16,1,'>',TRUE),
('6602fd63666d4ea0880410f8','6602fd63666d4ea0880410f7',14,16,0,14,2,'<=',TRUE),
('6602fd63666d4ea0880410fe','6602fd63666d4ea0880410fd',12,14,0,12,2,'11',TRUE),
('6602fd63666d4ea0880410ff','6602fd63666d4ea0880410fd',15,17,0,15,2,'<=',TRUE),
('6602fd63666d4ea088041100','6602fd63666d4ea0880410fd',18,20,0,18,2,'11',TRUE),
('6602fd63666d4ea088041106','6602fd63666d4ea088041105',17,19,0,17,2,'>=',TRUE),
('6602fd63666d4ea08804110c','6602fd63666d4ea08804110b',13,14,0,13,1,'=',TRUE),
('6602fd63666d4ea088041112','6602fd63666d4ea088041111',46,49,2,15,3,'min',TRUE),
('6602fd63666d4ea088041113','6602fd63666d4ea088041111',50,52,2,19,2,'<=',TRUE),
('6602fd63666d4ea088041114','6602fd63666d4ea088041111',53,56,2,22,3,'max',TRUE),
('6602fd63666d4ea088041134','6602fd63666d4ea088041133',50,52,1,25,2,'<=',TRUE),
('6602fd63666d4ea08804113a','6602fd63666d4ea088041139',34,35,1,15,1,'=',TRUE),
('6602fd63666d4ea08804113b','6602fd63666d4ea088041139',43,45,1,24,2,'>=',TRUE),
('6602fd63666d4ea088041141','6602fd63666d4ea088041140',58,64,2,19,6,'solved',TRUE),
('6602fd63666d4ea088041142','6602fd63666d4ea088041140',65,67,2,26,2,'<=',TRUE),
('6602fd63666d4ea088041143','6602fd63666d4ea088041140',68,75,2,29,7,'minimum',TRUE),
('6602fd63666d4ea088041149','6602fd63666d4ea088041148',15,17,0,15,2,'>=',TRUE),
('6602fd63666d4ea088041154','6602fd63666d4ea088041153',20,23,0,20,3,'===',TRUE),
('6602fd63666d4ea08804115a','6602fd63666d4ea088041159',12,19,0,12,7,'"apple"',TRUE),
('6602fd63666d4ea08804115b','6602fd63666d4ea088041159',20,23,0,20,3,'===',TRUE),
('6602fd63666d4ea08804115c','6602fd63666d4ea088041159',24,31,0,24,7,'"apple"',TRUE),
('6602fd63666d4ea088041162','6602fd63666d4ea088041161',20,23,0,20,3,'===',TRUE),
('6602fd63666d4ea088041163','6602fd63666d4ea088041161',24,32,0,24,8,'"orange"',TRUE),
('6602fd63666d4ea088041169','6602fd63666d4ea088041168',61,67,2,12,6,'fruit1',TRUE),
('6602fd63666d4ea08804116a','6602fd63666d4ea088041168',68,71,2,19,3,'===',TRUE),
('6602fd63666d4ea08804116b','6602fd63666d4ea088041168',72,78,2,23,6,'fruit2',TRUE),
('6602fd63666d4ea08804118b','6602fd63666d4ea08804118a',69,72,2,21,3,'===',TRUE),
('6602fd63666d4ea088041191','6602fd63666d4ea088041190',42,47,1,17,5,'"low"',TRUE),
('6602fd63666d4ea088041197','6602fd63666d4ea088041196',47,53,1,14,6,'"pipe"',TRUE),
('6602fd63666d4ea08804119d','6602fd63666d4ea08804119c',21,24,0,21,3,'===',TRUE),
('6602fd63666d4ea0880411a4','6602fd63666d4ea0880411a3',20,23,0,20,3,'!==',TRUE),
('6602fd63666d4ea0880411aa','6602fd63666d4ea0880411a9',12,19,0,12,7,'"apple"',TRUE),
('6602fd63666d4ea0880411ab','6602fd63666d4ea0880411a9',20,23,0,20,3,'!==',TRUE),
('6602fd63666d4ea0880411ac','6602fd63666d4ea0880411a9',24,32,0,24,8,'"orange"',TRUE),
('6602fd63666d4ea0880411b6','6602fd63666d4ea0880411b5',21,22,0,21,1,'=',TRUE),
('6602fd63666d4ea0880411d6','6602fd63666d4ea0880411d5',69,72,2,21,3,'!==',TRUE),
('6602fd63666d4ea0880411dc','6602fd63666d4ea0880411db',18,29,0,18,11,'"bliss.png"',TRUE),
('6602fd63666d4ea0880411e2','6602fd63666d4ea0880411e1',49,54,1,18,5,'"Jim"',TRUE),
('6602fd63666d4ea0880411e8','6602fd63666d4ea0880411e7',73,76,2,20,3,'!==',TRUE),
('6602fd63666d4ea0880411f3','6602fd63666d4ea0880411f2',16,25,0,16,9,'"Cookies"',TRUE),
('6602fd63666d4ea0880411f9','6602fd63666d4ea0880411f8',14,16,0,14,2,'42',TRUE),
('6602fd63666d4ea0880411ff','6602fd63666d4ea0880411fe',13,17,0,13,4,'true',TRUE),
('6602fd63666d4ea088041205','6602fd63666d4ea088041204',6,10,0,6,4,'isOn',TRUE),
('6602fd63666d4ea088041206','6602fd63666d4ea088041204',13,18,0,13,5,'false',TRUE),
('6602fd63666d4ea08804122a','6602fd63666d4ea088041229',17,23,0,17,6,'"Joey"',TRUE),
('6602fd63666d4ea08804122b','6602fd63666d4ea088041229',37,39,1,12,2,'28',TRUE),
('6602fd63666d4ea08804122c','6602fd63666d4ea088041229',56,60,2,15,4,'true',TRUE),
('6602fd63666d4ea088041232','6602fd63666d4ea088041231',18,24,0,18,6,'"Jill"',TRUE),
('6602fd63666d4ea088041238','6602fd63666d4ea088041237',6,17,0,6,11,'minutesLeft',TRUE),
('6602fd63666d4ea088041239','6602fd63666d4ea088041237',20,22,0,20,2,'10',TRUE),
('6602fd63666d4ea08804123f','6602fd63666d4ea08804123e',17,21,0,17,4,'true',TRUE),
('6602fd63666d4ea088041245','6602fd63666d4ea088041244',0,5,0,0,5,'const',TRUE),
('6602fd63666d4ea088041246','6602fd63666d4ea088041244',6,11,0,6,5,'score',TRUE),
('6602fd63666d4ea088041247','6602fd63666d4ea088041244',12,13,0,12,1,'=',TRUE),
('6602fd63666d4ea088041248','6602fd63666d4ea088041244',14,16,0,14,2,'57',TRUE),
('6602fd63666d4ea088041250','6602fd63666d4ea08804124f',17,18,0,17,1,'+',TRUE),
('6602fd63666d4ea088041257','6602fd63666d4ea088041256',20,21,0,20,1,'+',TRUE),
('6602fd63666d4ea08804125d','6602fd63666d4ea08804125c',32,34,0,32,2,'99',TRUE),
('6602fd63666d4ea088041263','6602fd63666d4ea088041262',50,55,1,32,5,'score',TRUE),
('6602fd63666d4ea08804126a','6602fd63666d4ea088041269',32,36,0,32,4,'true',TRUE),
('6602fd63666d4ea088041270','6602fd63666d4ea08804126f',51,55,1,32,4,'pass',TRUE),
('6602fd63666d4ea0880412a0','6602fd63666d4ea08804129f',22,23,0,22,1,'+',TRUE),
('6602fd63666d4ea0880412a6','6602fd63666d4ea0880412a5',15,16,0,15,1,'+',TRUE),
('6602fd63666d4ea0880412a7','6602fd63666d4ea0880412a5',17,21,0,17,4,'"10"',TRUE),
('6602fd63666d4ea0880412ad','6602fd63666d4ea0880412ac',24,25,0,24,1,'+',TRUE),
('6602fd63666d4ea0880412ae','6602fd63666d4ea0880412ac',26,27,0,26,1,'2',TRUE),
('6602fd63666d4ea0880412b4','6602fd63666d4ea0880412b3',27,40,1,12,13,'"Entry fee: "',TRUE),
('6602fd63666d4ea0880412b5','6602fd63666d4ea0880412b3',41,42,1,26,1,'+',TRUE),
('6602fd63666d4ea0880412b6','6602fd63666d4ea0880412b3',43,46,1,28,3,'fee',TRUE),
('6602fd63666d4ea0880412bc','6602fd63666d4ea0880412bb',23,24,0,23,1,'+',TRUE),
('6602fd63666d4ea0880412bd','6602fd63666d4ea0880412bb',25,29,0,25,4,'true',TRUE),
('6602fd63666d4ea0880412c3','6602fd63666d4ea0880412c2',49,57,1,26,8,'isWinner',TRUE),
('6602fd63666d4ea0880412d2','6602fd63666d4ea0880412d1',73,75,2,24,2,'&&',TRUE),
('6602fd63666d4ea0880412d8','6602fd63666d4ea0880412d7',42,47,1,17,5,'false',TRUE),
('6602fd63666d4ea0880412de','6602fd63666d4ea0880412dd',63,74,2,12,11,'isBatteryOn',TRUE),
('6602fd63666d4ea0880412df','6602fd63666d4ea0880412dd',75,77,2,24,2,'&&',TRUE),
('6602fd63666d4ea0880412e0','6602fd63666d4ea0880412dd',78,88,2,27,10,'isSwitchOn',TRUE),
('6602fd63666d4ea0880412e6','6602fd63666d4ea0880412e5',51,54,2,0,3,'let',TRUE),
('6602fd63666d4ea0880412e7','6602fd63666d4ea0880412e5',55,61,2,4,6,'result',TRUE),
('6602fd63666d4ea0880412e8','6602fd63666d4ea0880412e5',62,63,2,11,1,'=',TRUE),
('6602fd63666d4ea08804130a','6602fd63666d4ea088041309',64,66,2,29,2,'&&',TRUE),
('6602fd63666d4ea088041310','6602fd63666d4ea08804130f',96,98,2,36,2,'&&',TRUE),
('6602fd63666d4ea088041311','6602fd63666d4ea08804130f',99,114,2,39,15,'isSubjectFilled',TRUE),
('6602fd63666d4ea088041317','6602fd63666d4ea088041316',60,65,2,0,5,'const',TRUE),
('6602fd63666d4ea088041318','6602fd63666d4ea088041316',66,72,2,6,6,'result',TRUE),
('6602fd63666d4ea088041319','6602fd63666d4ea088041316',73,74,2,13,1,'=',TRUE),
('6602fd63666d4ea08804131f','6602fd63666d4ea08804131e',90,92,2,37,2,'&&',TRUE),
('6602fd63666d4ea08804132c','6602fd63666d4ea08804132b',73,75,2,24,2,'||',TRUE),
('6602fd63666d4ea088041332','6602fd63666d4ea088041331',42,47,1,16,5,'false',TRUE),
('6602fd63666d4ea088041338','6602fd63666d4ea088041337',34,35,1,12,1,'!',TRUE),
('6602fd63666d4ea08804133e','6602fd63666d4ea08804133d',63,64,3,12,1,'!',TRUE),
('6602fd63666d4ea08804133f','6602fd63666d4ea08804133d',64,65,3,13,1,'(',TRUE),
('6602fd63666d4ea088041340','6602fd63666d4ea08804133d',89,90,3,38,1,')',TRUE),
('6602fd63666d4ea088041346','6602fd63666d4ea088041345',101,102,3,12,1,'!',TRUE),
('6602fd63666d4ea08804136e','6602fd63666d4ea08804136d',101,103,3,35,2,'||',TRUE),
('6602fd63666d4ea08804136f','6602fd63666d4ea08804136d',110,111,3,44,1,'>',TRUE),
('6602fd63666d4ea088041375','6602fd63666d4ea088041374',51,52,1,22,1,'!',TRUE),
('6602fd63666d4ea08804137b','6602fd63666d4ea08804137a',121,122,4,16,1,'=',TRUE),
('6602fd63666d4ea088041381','6602fd63666d4ea088041380',82,84,2,30,2,'||',TRUE),
('6602fd63666d4ea088041382','6602fd63666d4ea088041380',85,86,2,33,1,'!',TRUE),
('6602fd63666d4ea088041388','6602fd63666d4ea088041387',95,96,3,29,1,'>',TRUE),
('6602fd63666d4ea088041389','6602fd63666d4ea088041387',107,109,3,41,2,'||',TRUE),
('6602fd63666d4ea08804139f','6602fd63666d4ea08804139e',39,44,2,0,5,'const',TRUE),
('6602fd63666d4ea0880413a0','6602fd63666d4ea08804139e',45,49,2,6,4,'pass',TRUE),
('6602fd63666d4ea0880413a1','6602fd63666d4ea08804139e',50,51,2,11,1,'=',TRUE),
('6602fd63666d4ea0880413a2','6602fd63666d4ea08804139e',52,69,2,13,17,'score >= minScore',TRUE),
('6602fd63666d4ea0880413a8','6602fd63666d4ea0880413a7',12,14,0,12,2,'21',TRUE),
('6602fd63666d4ea0880413ae','6602fd63666d4ea0880413ad',58,60,2,19,2,'>=',TRUE),
('6602fd63666d4ea0880413bd','6602fd63666d4ea0880413bc',64,67,2,18,3,'===',TRUE),
('6602fd63666d4ea0880413ca','6602fd63666d4ea0880413c9',20,23,0,20,3,'!==',TRUE),
('6602fd63666d4ea0880413d9','6602fd63666d4ea0880413d8',0,5,0,0,5,'const',TRUE),
('6602fd63666d4ea0880413da','6602fd63666d4ea0880413d8',6,11,0,6,5,'score',TRUE),
('6602fd63666d4ea0880413db','6602fd63666d4ea0880413d8',12,13,0,12,1,'=',TRUE),
('6602fd63666d4ea0880413dc','6602fd63666d4ea0880413d8',14,15,0,14,1,'2',TRUE),
('6602fd63666d4ea0880413e2','6602fd63666d4ea0880413e1',0,12,0,0,12,'const result',TRUE),
('6602fd63666d4ea0880413e3','6602fd63666d4ea0880413e1',19,20,0,19,1,'+',TRUE),
('6602fd63666d4ea0880413e4','6602fd63666d4ea0880413e1',21,22,0,21,1,'1',TRUE),
('6602fd63666d4ea0880413f3','6602fd63666d4ea0880413f2',15,20,0,15,5,'"100"',TRUE),
('6602fd63666d4ea0880413f4','6602fd63666d4ea0880413f2',21,22,0,21,1,'+',TRUE),
('6602fd63666d4ea0880413f5','6602fd63666d4ea0880413f2',23,24,0,23,1,'1',TRUE),
('6602fd63666d4ea088041404','6602fd63666d4ea088041403',45,46,1,17,1,'!',TRUE),
('6602fd63666d4ea08804141a','6602fd63666d4ea088041419',63,71,2,15,8,'testsRun',TRUE),
('6602fd63666d4ea08804141b','6602fd63666d4ea088041419',72,74,2,24,2,'||',TRUE),
('6602fd63666d4ea08804141c','6602fd63666d4ea088041419',75,86,2,27,11,'outputShows',TRUE),
('6602fd63666d4ea088041422','6602fd63666d4ea088041421',47,48,1,20,1,'!',TRUE);


