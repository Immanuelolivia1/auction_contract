// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the openzepplin contracts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


// NFT is  ERC721 signifies that the contract we are creating imports ERC721 and follows ERC721 contract from openzeppelin
contract NFT is ERC721URIStorage {
    uint256 num = 1;
    string URI = "https://ipfs.io/ipfs/Qma1sraPgyMCagbBPvwwe9momgtoawpVVYH6esEexGcccs?filename=MetaData.json";
    constructor() ERC721("NFT", "ITM") {
        // mint an NFT to yourself
        _mint(msg.sender, num);
        _setTokenURI(num, URI);
    }
}