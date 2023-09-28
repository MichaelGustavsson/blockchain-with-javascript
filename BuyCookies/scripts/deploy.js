const hardhat = require('hardhat');

const main = async () => {
  const contract = await hardhat.ethers.getContractFactory('BuyCookies');
  const buyCookies = await contract.deploy();
  await buyCookies.deployed();

  console.log('BuyCookies is deployed to: ', buyCookies.address);
};

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
