-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Player" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "lastName" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "middleName" TEXT NOT NULL,
    "jerseyNumber" INTEGER NOT NULL,
    "gamesPlayed" INTEGER,
    "teamID" INTEGER,
    CONSTRAINT "Player_teamID_fkey" FOREIGN KEY ("teamID") REFERENCES "Team" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Player" ("firstName", "gamesPlayed", "id", "jerseyNumber", "lastName", "middleName", "teamID") SELECT "firstName", "gamesPlayed", "id", "jerseyNumber", "lastName", "middleName", "teamID" FROM "Player";
DROP TABLE "Player";
ALTER TABLE "new_Player" RENAME TO "Player";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
