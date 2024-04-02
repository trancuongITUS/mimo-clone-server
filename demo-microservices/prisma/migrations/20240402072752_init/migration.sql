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

-- CreateTable
CREATE TABLE "sections" (
    "id" SERIAL NOT NULL,
    "index" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "startIndex" INTEGER NOT NULL,
    "endIndex" INTEGER NOT NULL,
    "isLocked" BOOLEAN NOT NULL,

    CONSTRAINT "sections_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sections_courses" (
    "sectionId" INTEGER NOT NULL,
    "courseId" INTEGER NOT NULL,

    CONSTRAINT "sections_courses_pkey" PRIMARY KEY ("sectionId","courseId")
);

-- AddForeignKey
ALTER TABLE "sections_courses" ADD CONSTRAINT "sections_courses_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "courses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sections_courses" ADD CONSTRAINT "sections_courses_sectionId_fkey" FOREIGN KEY ("sectionId") REFERENCES "sections"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
