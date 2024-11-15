-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Logs" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "keywordOne" TEXT NOT NULL,
    "keywordTwo" TEXT NOT NULL,
    "keywordThree" TEXT,
    "timestamp" DATETIME NOT NULL,
    "quarterID" INTEGER NOT NULL,
    CONSTRAINT "Logs_quarterID_fkey" FOREIGN KEY ("quarterID") REFERENCES "Quarter" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Logs" ("id", "keywordOne", "keywordThree", "keywordTwo", "quarterID", "timestamp") SELECT "id", "keywordOne", "keywordThree", "keywordTwo", "quarterID", "timestamp" FROM "Logs";
DROP TABLE "Logs";
ALTER TABLE "new_Logs" RENAME TO "Logs";
CREATE TABLE "new_Quarter" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "number" INTEGER NOT NULL,
    "totalScore" INTEGER NOT NULL DEFAULT 0,
    "madeOne" INTEGER NOT NULL DEFAULT 0,
    "madeTwo" INTEGER NOT NULL DEFAULT 0,
    "madeThree" INTEGER NOT NULL DEFAULT 0,
    "miss" INTEGER NOT NULL DEFAULT 0,
    "reboundOffensive" INTEGER NOT NULL DEFAULT 0,
    "reboundDefensive" INTEGER NOT NULL DEFAULT 0,
    "foul" INTEGER NOT NULL DEFAULT 0,
    "turnover" INTEGER NOT NULL DEFAULT 0,
    "assist" INTEGER NOT NULL DEFAULT 0,
    "block" INTEGER NOT NULL DEFAULT 0,
    "steal" INTEGER NOT NULL DEFAULT 0
);
INSERT INTO "new_Quarter" ("assist", "block", "foul", "id", "madeOne", "madeThree", "madeTwo", "miss", "number", "reboundDefensive", "reboundOffensive", "steal", "totalScore", "turnover") SELECT "assist", "block", "foul", "id", "madeOne", "madeThree", "madeTwo", "miss", "number", "reboundDefensive", "reboundOffensive", "steal", "totalScore", "turnover" FROM "Quarter";
DROP TABLE "Quarter";
ALTER TABLE "new_Quarter" RENAME TO "Quarter";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
