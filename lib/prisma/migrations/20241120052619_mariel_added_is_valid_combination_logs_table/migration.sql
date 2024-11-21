/*
  Warnings:

  - Added the required column `isValidCombination` to the `Logs` table without a default value. This is not possible if the table is not empty.

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
    "timestamp" DATETIME NOT NULL,
    "quarterID" INTEGER NOT NULL,
    CONSTRAINT "Logs_quarterID_fkey" FOREIGN KEY ("quarterID") REFERENCES "Quarter" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Logs" ("id", "keywordOne", "keywordThree", "keywordTwo", "quarterID", "timestamp") SELECT "id", "keywordOne", "keywordThree", "keywordTwo", "quarterID", "timestamp" FROM "Logs";
DROP TABLE "Logs";
ALTER TABLE "new_Logs" RENAME TO "Logs";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
