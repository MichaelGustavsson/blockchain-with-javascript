/** @type import('hardhat/config').HardhatUserConfig */

require('dotenv').config();
require('@nomiclabs/hardhat-ethers');

const { API_URL, PRIVATE_KEY } = process.env;

module.exports = {
  solidity: '0.8.19',
  defaultNetwork: 'sepolia',
  networks: {
    hardhat: {},
    sepolia: {
      url: API_URL, //Adressen till min applikation på Alchemy...
      accounts: [`0x${PRIVATE_KEY}`], //Privata nyckel till min Wallet...
    },
  },
};
