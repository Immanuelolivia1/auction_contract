// Import ethers from Hardhat package
const { ethers } = require("hardhat");
require("dotenv").config({ path: ".env" });

async function main() {

    const metadataURL = "ipfs://QmNr4FbWyygkwtzLZo1XJ18Y8grRapvhmJjsG8g3PfxsPe/";
  
  const nftContract = await ethers.getContractFactory("NFT");

  // deploy contract
  const deployedNFTContract = await nftContract.deploy();
  
  // wait for contract to deploy
  await deployedNFTContract.deployed();

  // print address of the deployed contract
  console.log("NFT Contract Address:", deployedNFTContract.address);
}
// Call the main function to check for error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
//  NFT contract Address 0x83f25a4BEBe548fBc3861Bee1aBA1642fEA1E992