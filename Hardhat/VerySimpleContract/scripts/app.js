// require('dotenv').config();
const { API_URL, PRIVATE_KEY, CONTRACT_ADDRESS } = process.env;
const { ethers } = require('hardhat');
const contract = require('../artifacts/contracts/DumbMessage.sol/DumbMessage.json');
// Provider - Alchemy
// const provider = new ethers.providers.AlchemyProvider('sepolia', API_KEY); Funkar inte längre
const provider = new ethers.providers.JsonRpcProvider(API_URL);
// Signer - Jag
const signer = new ethers.Wallet(PRIVATE_KEY, provider);
// Kontraktet och skapa en ny instans...
const dumbContract = new ethers.Contract(CONTRACT_ADDRESS, contract.abi, signer);

async function init() {
  const message = await dumbContract.message();
  console.log('Current message is: ', message);

  console.log('Updating the message');
  const tx = await dumbContract.SetMessage('This is a new message');
  await tx.wait();

  const updatedMessage = await dumbContract.message();
  console.log('The new message is: ', updatedMessage);
}

// funktionsanrop => går till raden 13 och kör funktionen init()
init()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
