/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "User";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Season" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "startYear" INTEGER NOT NULL,
    "endYear" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Game" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "semester" TEXT NOT NULL,
    "teamID" INTEGER NOT NULL,
    CONSTRAINT "Game_teamID_fkey" FOREIGN KEY ("teamID") REFERENCES "Team" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Team" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Player" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "lastName" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "middleName" TEXT NOT NULL,
    "jerseyNumber" INTEGER NOT NULL,
    "gamesPlayed" INTEGER NOT NULL,
    "teamID" INTEGER NOT NULL,
    CONSTRAINT "Player_teamID_fkey" FOREIGN KEY ("teamID") REFERENCES "Team" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
