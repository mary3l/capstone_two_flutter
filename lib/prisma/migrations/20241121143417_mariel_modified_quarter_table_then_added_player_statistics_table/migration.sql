/*
  Warnings:

  - You are about to drop the column `assist` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `block` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `foul` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `madeOne` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `madeThree` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `madeTwo` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `miss` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `number` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `reboundDefensive` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `reboundOffensive` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `steal` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `totalScore` on the `Quarter` table. All the data in the column will be lost.
  - You are about to drop the column `turnover` on the `Quarter` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "PlayerStatistics" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "quarterID" INTEGER NOT NULL,
    "playerID" INTEGER NOT NULL,
    "number" INTEGER NOT NULL,
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
    CONSTRAINT "PlayerStatistics_quarterID_fkey" FOREIGN KEY ("quarterID") REFERENCES "Quarter" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "PlayerStatistics_playerID_fkey" FOREIGN KEY ("playerID") REFERENCES "Player" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Quarter" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "gameID" INTEGER NOT NULL,
    CONSTRAINT "Quarter_gameID_fkey" FOREIGN KEY ("gameID") REFERENCES "Game" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Quarter" ("gameID", "id") SELECT "gameID", "id" FROM "Quarter";
DROP TABLE "Quarter";
ALTER TABLE "new_Quarter" RENAME TO "Quarter";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
