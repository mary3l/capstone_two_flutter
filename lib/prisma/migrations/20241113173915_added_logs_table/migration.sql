-- CreateTable
CREATE TABLE "Logs" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "keywordOne" TEXT NOT NULL,
    "keywordTwo" TEXT NOT NULL,
    "keywordThree" TEXT NOT NULL,
    "timestamp" DATETIME NOT NULL,
    "quarterID" INTEGER NOT NULL,
    CONSTRAINT "Logs_quarterID_fkey" FOREIGN KEY ("quarterID") REFERENCES "Quarter" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
