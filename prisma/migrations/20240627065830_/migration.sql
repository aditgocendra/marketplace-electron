-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "username" VARCHAR(12) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profile" (
    "avatar" VARCHAR(100) NOT NULL,
    "number" VARCHAR(13) NOT NULL,
    "userId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Location" (
    "province" VARCHAR(32) NOT NULL,
    "regency" VARCHAR(32) NOT NULL,
    "district" VARCHAR(32) NOT NULL,
    "address" VARCHAR(256),
    "userId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(40) NOT NULL,
    "price" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DetailProduct" (
    "description" VARCHAR(256) NOT NULL,
    "seen" INTEGER NOT NULL,
    "fav" INTEGER NOT NULL,
    "productId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "ImageProduct" (
    "image" TEXT NOT NULL,
    "isThumb" BOOLEAN NOT NULL,
    "productId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "ProductLink" (
    "shopee" TEXT NOT NULL,
    "tokopedia" TEXT NOT NULL,
    "tiktokShope" TEXT NOT NULL,
    "whatsapp" TEXT NOT NULL,
    "productId" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_userId_key" ON "Profile"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Location_userId_key" ON "Location"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Product_name_key" ON "Product"("name");

-- CreateIndex
CREATE UNIQUE INDEX "DetailProduct_productId_key" ON "DetailProduct"("productId");

-- CreateIndex
CREATE UNIQUE INDEX "ImageProduct_productId_key" ON "ImageProduct"("productId");

-- CreateIndex
CREATE UNIQUE INDEX "ProductLink_productId_key" ON "ProductLink"("productId");

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DetailProduct" ADD CONSTRAINT "DetailProduct_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageProduct" ADD CONSTRAINT "ImageProduct_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductLink" ADD CONSTRAINT "ProductLink_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
