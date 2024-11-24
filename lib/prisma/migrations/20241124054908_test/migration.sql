/*
  Warnings:

  - You are about to drop the column `quarterID` on the `Logs` table. All the data in the column will be lost.
  - You are about to drop the column `number` on the `PlayerStatistics` table. All the data in the column will be lost.
  - You are about to drop the column `quarterID` on the `PlayerStatistics` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Logs" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "keywordOne" TEXT NOT NULL,
    "keywordTwo" TEXT NOT NULL,
    "keywordThree" TEXT,
    "isValidCombination" BOOLEAN NOT NULL,
    "timestamp" DATETIME NOT NULL
);
INSERT INTO "new_Logs" ("id", "isValidCombination", "keywordOne", "keywordThree", "keywordTwo", "timestamp") SELECT "id", "isValidCombination", "keywordOne", "keywordThree", "keywordTwo", "timestamp" FROM "Logs";
DROP TABLE "Logs";
ALTER TABLE "new_Logs" RENAME TO "Logs";
CREATE TABLE "new_PlayerStatistics" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "playerID" INTEGER,
    "totalScore" INTEGER NOT NULL DEFAULT 0,
    "madeOne" INTEGER NOT NULL DEFAULT 0,
    "madeTwo" INTEGER NOT NULL DEFAULT 0,
    "madeThree" INTEGER NOT NULL DEFAULT 0,
    "miss" INTEGER DEFAULT 0,
    "rebound" INTEGER NOT NULL DEFAULT 0,
    "foul" INTEGER NOT NULL DEFAULT 0,
    "turnover" INTEGER NOT NULL DEFAULT 0,
    "assist" INTEGER NOT NULL DEFAULT 0,
    "block" INTEGER NOT NULL DEFAULT 0,
    "steal" INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT "PlayerStatistics_playerID_fkey" FOREIGN KEY ("playerID") REFERENCES "Player" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_PlayerStatistics" ("assist", "block", "foul", "id", "madeOne", "madeThree", "madeTwo", "miss", "playerID", "rebound", "steal", "totalScore", "turnover") SELECT "assist", "block", "foul", "id", "madeOne", "madeThree", "madeTwo", "miss", "playerID", "rebound", "steal", "totalScore", "turnover" FROM "PlayerStatistics";
DROP TABLE "PlayerStatistics";
ALTER TABLE "new_PlayerStatistics" RENAME TO "PlayerStatistics";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
