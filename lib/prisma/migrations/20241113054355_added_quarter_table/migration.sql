-- CreateTable
CREATE TABLE "Quarter" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "number" INTEGER NOT NULL,
    "totalScore" INTEGER NOT NULL,
    "madeOne" INTEGER NOT NULL,
    "madeTwo" INTEGER NOT NULL,
    "madeThree" INTEGER NOT NULL,
    "miss" INTEGER NOT NULL,
    "reboundOffensive" INTEGER NOT NULL,
    "reboundDefensive" INTEGER NOT NULL,
    "foul" INTEGER NOT NULL,
    "turnover" INTEGER NOT NULL,
    "assist" INTEGER NOT NULL,
    "block" INTEGER NOT NULL,
    "steal" INTEGER NOT NULL
);
