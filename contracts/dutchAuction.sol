//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

interface IERC721{
    function transferfrom(
        address _from,
        address _to,
        uint _nftId
    ) external;
}

contract auction{
    uint private constant DURATION = 15 minutes;

    IERC721 public nft;
    uint public nftId;

    address payable public seller;
    uint public startingPrice;
    uint public discountRate;
    uint public startAt;
    uint public expiresAt;

    constructor(
        uint _startingPrice,
        uint _discountRate,
        address _nft,
        uint _nftId
    ) {
        seller = payable(msg.sender);
        startingPrice = _startingPrice;
        discountRate = _discountRate;
        startAt = block.timestamp;
        expiresAt = block.timestamp + DURATION;

        require(_startingPrice >= _discountRate * DURATION, "starting time price is too low");

        nft = IERC721(_nft);
        nftId = _nftId;
     
    }

    function getPrice() public view returns(uint){
        uint timeElaped = block.timestamp - startAt;
        uint discount = discountRate * timeElaped;
        return startingPrice - discount;
    }

    function buy() external payable{
        require(block.timestamp < expiresAt, "this auction has ended");
        uint price = getPrice();
        require(msg.value >= price, "The amount sent is less than NFT price");
        nft.transferfrom(seller, msg.sender, nftId);
        uint refund = msg.value - price;
        if(refund >0){
            payable(msg.sender).transfer(refund);
        }

        selfdestruct(seller);

    }




}