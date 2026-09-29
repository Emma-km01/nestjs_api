/*
  Warnings:

  - You are about to drop the column `createdAT` on the `Task` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAT` on the `Task` table. All the data in the column will be lost.
  - You are about to drop the column `userID` on the `Task` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `Task` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Task` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_userID_fkey";

-- AlterTable
ALTER TABLE "Task" DROP COLUMN "createdAT",
DROP COLUMN "updatedAT",
DROP COLUMN "userID",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
