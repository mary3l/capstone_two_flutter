/*
  Warnings:

  - You are about to drop the column `action` on the `PlayerStatistics` table. All the data in the column will be lost.
  - You are about to drop the column `gameID` on the `PlayerStatistics` table. All the data in the column will be lost.
  - You are about to drop the column `points` on the `PlayerStatistics` table. All the data in the column will be lost.
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
  - Added the required column `number` to the `PlayerStatistics` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gameID` to the `Quarter` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_PlayerStatistics" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "number" INTEGER NOT NULL,
    "playerID" INTEGER,
    "quarterID" INTEGER,
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
    CONSTRAINT "PlayerStatistics_playerID_fkey" FOREIGN KEY ("playerID") REFERENCES "Player" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "PlayerStatistics_quarterID_fkey" FOREIGN KEY ("quarterID") REFERENCES "Quarter" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_PlayerStatistics" ("id", "playerID", "quarterID") SELECT "id", "playerID", "quarterID" FROM "PlayerStatistics";
DROP TABLE "PlayerStatistics";
ALTER TABLE "new_PlayerStatistics" RENAME TO "PlayerStatistics";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
