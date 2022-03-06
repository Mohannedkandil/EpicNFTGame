const { hexStripZeros } = require("ethers/lib/utils")

// run our MyEpicGame Contract
const main = async () => {
    // Compile out contract and update the artifacts
    const gameContractFactory = await hre.ethers.getContractFactory('MyEpicGame');
    // Hardhat will create Local Eth network
    const gameContract = await gameContractFactory.deploy(
        ["Leo", "Ang", "Pikachu"], // Names
        ["https://i.imgur.com/pKd5Sdk.png", // Images
            "https://i.imgur.com/xVu4vFL.png",
            "https://i.imgur.com/WMB6g9u.png"],
        [100, 200, 300],                    // HP values
        [100, 50, 25]                       // Attack damage values
    );
    // Wait until the contract is deployed to our blockchain network, hardhat created fake miners
    // on my machine to try its best to imitate the actual blockchain
    await gameContract.deployed();
    // The address of the deplyed contract
    console.log("Contract deployed to:", gameContract.address);
};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();