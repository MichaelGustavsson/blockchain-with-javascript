const hardhat = require('hardhat');
const abi = require('../artifacts/contracts/BuyCookies.sol/BuyCookies.json');

const { API_URL, PRIVATE_KEY, CONTRACT_ADDRESS } = process.env;

const getBalance = async (provider, address) => {
  const balance = await provider.getBalance(address);
  return hardhat.ethers.utils.formatEther(balance);
};

const main = async () => {
  const contractAddress = CONTRACT_ADDRESS;
  const contractAbi = abi.abi;

  const provider = new hardhat.ethers.providers.JsonRpcProvider(API_URL);
  const signer = new hardhat.ethers.Wallet(PRIVATE_KEY, provider);

  const buyCookie = new hardhat.ethers.Contract(contractAddress, contractAbi, signer);

  console.log('Owners current balance: ', await getBalance(provider, signer.address));

  const balance = await getBalance(provider, buyCookie.address);
  console.log('¨The contracts balance: ', balance);

  if (balance !== '0.0') {
    const tx = await buyCookie.withdrawPayment();
    await tx.wait();
  } else {
    console.log('No cookies sold');
  }

  console.log('Owners current balance: ', await getBalance(provider, signer.address));
};

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
