-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "clerkUserId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "imageUrl" TEXT,
    "industry" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" TEXT,
    "bio" TEXT,
    "experience" INTEGER,
    "skills" TEXT[],

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Assessment" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "question" TEXT NOT NULL,
    "answer" TEXT NOT NULL,
    "userAnswer" TEXT NOT NULL,
    "score" DOUBLE PRECISION NOT NULL,
    "category" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Assessment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IndustryInsight" (
    "id" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "salaryRanges" JSONB[],
    "growthRate" DOUBLE PRECISION NOT NULL,
    "demandLevel" TEXT NOT NULL,
    "topSkills" TEXT[],
    "marketOutlook" TEXT NOT NULL,
    "keyTrends" TEXT[],
    "recommendedSkills" TEXT[],
    "lastUpdated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nextUpdate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "IndustryInsight_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_clerkUserId_key" ON "User"("clerkUserId");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "Assessment_userId_idx" ON "Assessment"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "IndustryInsight_industry_key" ON "IndustryInsight"("industry");

-- CreateIndex
CREATE INDEX "IndustryInsight_industry_idx" ON "IndustryInsight"("industry");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_industry_fkey" FOREIGN KEY ("industry") REFERENCES "IndustryInsight"("industry") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Assessment" ADD CONSTRAINT "Assessment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
