/*
  Warnings:

  - You are about to drop the column `gameID` on the `Season` table. All the data in the column will be lost.
  - Added the required column `seasonId` to the `Game` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Season" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "startYear" INTEGER NOT NULL,
    "endYear" INTEGER NOT NULL
);
INSERT INTO "new_Season" ("endYear", "id", "startYear") SELECT "endYear", "id", "startYear" FROM "Season";
DROP TABLE "Season";
ALTER TABLE "new_Season" RENAME TO "Season";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
