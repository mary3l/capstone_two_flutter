-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Season" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "startYear" INTEGER NOT NULL,
    "endYear" INTEGER NOT NULL,
    "gameID" INTEGER,
    CONSTRAINT "Season_gameID_fkey" FOREIGN KEY ("gameID") REFERENCES "Game" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Season" ("endYear", "id", "startYear") SELECT "endYear", "id", "startYear" FROM "Season";
DROP TABLE "Season";
ALTER TABLE "new_Season" RENAME TO "Season";
CREATE UNIQUE INDEX "Season_gameID_key" ON "Season"("gameID");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
