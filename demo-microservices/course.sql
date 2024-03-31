-- CreateTable
CREATE TABLE "courses" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "descriptionContent" TEXT NOT NULL,
    "shortDescriptionContent" TEXT NOT NULL,
    "onboardCategory" TEXT NOT NULL,
    "isNew" BOOLEAN NOT NULL,
    "isHidden" BOOLEAN NOT NULL,
    "iconBanner" TEXT NOT NULL,

    CONSTRAINT "courses_pkey" PRIMARY KEY ("id")
);

-- ADD 6 COURSES IN MIMO APP

INSERT INTO public.courses(title, 
slug, 
"descriptionContent", 
"shortDescriptionContent", 
"onboardCategory", 
"isNew", 
"isHidden", 
"iconBanner")
VALUES ('HTML', 
'html', 
'Start building web pages using the foundational markup language of the web', 
'Learn the essentials of HTML to build websites', 
'build', 
true, 
false, 
'https://res.cloudinary.com/dw3pxcshp/image/upload/v1711797699/bjgw86tktpf6qfey08op.png');

INSERT INTO public.courses(title, 
slug, 
"descriptionContent", 
"shortDescriptionContent", 
"onboardCategory",
"isNew", 
"isHidden", 
"iconBanner")
VALUES ('CSS', 
'css', 
'Style your web pages using CSS, the language designed to bring HTML pages to life', 
'Learn the essentials of CSS to style websites', 
'none', 
true, 
false, 
'https://res.cloudinary.com/dw3pxcshp/image/upload/v1711853685/gfhzjto786atvj7j23sx.png');

INSERT INTO public.courses(title, 
slug, 
"descriptionContent", 
"shortDescriptionContent", 
"onboardCategory",
"isNew", 
"isHidden", 
"iconBanner")
VALUES ('JavaScript', 
'javascript', 
'Create dynamic web pages with the world''s most used programming language', 
'Learn the essentials of JavaScript to make websites interactive', 
'build', 
true, 
false, 
'https://res.cloudinary.com/dw3pxcshp/image/upload/v1711854064/z55xnpvwnkzpesocekpr.png');

INSERT INTO public.courses(title, 
slug, 
"descriptionContent", 
"shortDescriptionContent", 
"onboardCategory",
"isNew", 
"isHidden", 
"iconBanner")
VALUES ('SQL', 
'sql', 
'Get to know databases, tables, and queries while learning smart ways to extract and manage data', 
'Learn how to use SQL queries to extract and manage data', 
'none', 
true, 
false, 
'https://res.cloudinary.com/dw3pxcshp/image/upload/v1711857335/zo9squricxx6vxot1npo.png');

INSERT INTO public.courses(title, 
slug, 
"descriptionContent", 
"shortDescriptionContent", 
"onboardCategory",
"isNew", 
"isHidden", 
"iconBanner")
VALUES ('Python', 
'python', 
'Learn the essentials of the fun, all-purpose language Python', 
'Learn the essentials of the fun, all-purpose language Python', 
'none', 
true, 
false, 
'https://res.cloudinary.com/dw3pxcshp/image/upload/v1711857873/woayw3xg6odhsbcynmsq.png');

INSERT INTO public.courses(title, 
slug, 
"descriptionContent", 
"shortDescriptionContent", 
"onboardCategory",
"isNew", 
"isHidden", 
"iconBanner")
VALUES ('Swift', 
'swift', 
'Master Apple''s programming language and unlock the potential to create your own iOS apps', 
'Learn Apple''s programming language Swift', 
'none', 
true, 
false, 
'https://res.cloudinary.com/dw3pxcshp/image/upload/v1711858135/dt3uu8jj8v3o5yskm0fw.png');