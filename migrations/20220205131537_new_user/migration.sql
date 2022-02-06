/*
  Warnings:

  - A unique constraint covering the columns `[username]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "Resume_email_key";

-- AlterTable
ALTER TABLE "Education" ADD COLUMN     "createdBy" UUID;

-- AlterTable
ALTER TABLE "Experience" ADD COLUMN     "createdBy" UUID;

-- AlterTable
ALTER TABLE "Resume" ADD COLUMN     "fullname" TEXT NOT NULL DEFAULT E'',
ADD COLUMN     "user" UUID,
ADD COLUMN     "website" TEXT NOT NULL DEFAULT E'';

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "username" TEXT NOT NULL DEFAULT E'';

-- CreateIndex
CREATE INDEX "Education_createdBy_idx" ON "Education"("createdBy");

-- CreateIndex
CREATE INDEX "Experience_createdBy_idx" ON "Experience"("createdBy");

-- CreateIndex
CREATE INDEX "Resume_user_idx" ON "Resume"("user");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- AddForeignKey
ALTER TABLE "Resume" ADD CONSTRAINT "Resume_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
