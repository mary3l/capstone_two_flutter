/*
  Warnings:

  - You are about to drop the column `opponentName` on the `Game` table. All the data in the column will be lost.
  - Added the required column `againstTeam` to the `Game` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Game" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "againstTeam" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "semester" TEXT NOT NULL,
    "teamID" INTEGER,
    "seasonID" INTEGER NOT NULL,
    CONSTRAINT "Game_teamID_fkey" FOREIGN KEY ("teamID") REFERENCES "Team" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Game_seasonID_fkey" FOREIGN KEY ("seasonID") REFERENCES "Season" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Game" ("date", "id", "seasonID", "semester", "teamID", "title") SELECT "date", "id", "seasonID", "semester", "teamID", "title" FROM "Game";
DROP TABLE "Game";
ALTER TABLE "new_Game" RENAME TO "Game";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
