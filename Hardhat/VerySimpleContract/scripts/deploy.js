const { ethers } = require('hardhat');

async function main() {
  const contract = await ethers.getContractFactory('DumbMessage');
  const message = await contract.deploy('My first try!');

  console.log('Contract deployed to address:', message.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
