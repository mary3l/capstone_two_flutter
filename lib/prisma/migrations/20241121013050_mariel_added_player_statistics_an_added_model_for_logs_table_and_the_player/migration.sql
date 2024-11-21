-- CreateTable
CREATE TABLE "PlayerStatistics" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "playerID" INTEGER,
    "gameID" INTEGER,
    "quarterID" INTEGER,
    "action" TEXT NOT NULL,
    "points" INTEGER,
    CONSTRAINT "PlayerStatistics_playerID_fkey" FOREIGN KEY ("playerID") REFERENCES "Player" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "PlayerStatistics_gameID_fkey" FOREIGN KEY ("gameID") REFERENCES "Game" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "PlayerStatistics_quarterID_fkey" FOREIGN KEY ("quarterID") REFERENCES "Quarter" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
