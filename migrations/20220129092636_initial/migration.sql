-- CreateTable
CREATE TABLE "User" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "email" TEXT NOT NULL DEFAULT E'',
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Resume" (
    "id" UUID NOT NULL,
    "email" TEXT NOT NULL DEFAULT E'',
    "phone" TEXT NOT NULL DEFAULT E'',
    "address" TEXT NOT NULL DEFAULT E'',
    "additionalSkills" JSONB,

    CONSTRAINT "Resume_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Education" (
    "id" UUID NOT NULL,
    "resume" UUID,
    "name" TEXT NOT NULL DEFAULT E'',
    "level" TEXT NOT NULL DEFAULT E'',
    "graduation" TEXT NOT NULL DEFAULT E'',

    CONSTRAINT "Education_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Experience" (
    "id" UUID NOT NULL,
    "resume" UUID,
    "position" TEXT NOT NULL DEFAULT E'',
    "company" TEXT NOT NULL DEFAULT E'',
    "address" TEXT NOT NULL DEFAULT E'',
    "fromDate" TIMESTAMP(3),
    "toDate" TIMESTAMP(3),
    "works" JSONB,

    CONSTRAINT "Experience_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Resume_email_key" ON "Resume"("email");

-- CreateIndex
CREATE INDEX "Education_resume_idx" ON "Education"("resume");

-- CreateIndex
CREATE INDEX "Experience_resume_idx" ON "Experience"("resume");

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_resume_fkey" FOREIGN KEY ("resume") REFERENCES "Resume"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_resume_fkey" FOREIGN KEY ("resume") REFERENCES "Resume"("id") ON DELETE SET NULL ON UPDATE CASCADE;
