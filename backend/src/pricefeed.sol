// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./AggregatorV3Interface.sol";
contract PriceConsumerV3 {
    AggregatorV3Interface internal USDCpriceFeed;
    AggregatorV3Interface internal ETHpriceFeed;
    /**
     * Network: Scroll Sepolia Testnet
     * USDC/USD Address: 0xA2F78ab2355fe2f984D808B5CeE7FD0A93D5270E
     * ETH/USD Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
     */
    constructor() {
        USDCpriceFeed = AggregatorV3Interface(0xFadA8b0737D4A3AE7118918B7E69E689034c0127);
        ETHpriceFeed = AggregatorV3Interface(0x59F1ec1f10bD7eD9B938431086bC1D9e233ECf41);
        }
    /**
     * Returns the latest prices
     */
    function LatestUSDCprice() public view returns (int) {
        (
           /* uint80 roundID */,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
           /* uint80 answeredInRound */
        ) = USDCpriceFeed.latestRoundData();
        return (price) / 10**8;
    }
    function LatestETHprice() public view returns (int) {
        (
            /*uint80 roundID */,
            int price,
            /*uint startedAt */,
            /*uint timeStamp*/,
            /*uint80 answeredInRound */
        ) = ETHpriceFeed.latestRoundData();
        return (price) / 10**8;
}
    
}