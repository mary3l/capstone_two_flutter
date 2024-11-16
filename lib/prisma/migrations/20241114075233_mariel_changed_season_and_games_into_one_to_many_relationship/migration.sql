/*
  Warnings:

  - You are about to drop the column `gameID` on the `Season` table. All the data in the column will be lost.
  - Added the required column `seasonId` to the `Game` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Game" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "semester" TEXT NOT NULL,
    "teamID" INTEGER NOT NULL,
    "seasonId" INTEGER NOT NULL,
    CONSTRAINT "Game_teamID_fkey" FOREIGN KEY ("teamID") REFERENCES "Team" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Game_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "Season" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Game" ("date", "id", "semester", "teamID", "title") SELECT "date", "id", "semester", "teamID", "title" FROM "Game";
DROP TABLE "Game";
ALTER TABLE "new_Game" RENAME TO "Game";
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
