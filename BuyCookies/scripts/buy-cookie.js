const hardhat = require('hardhat');

// Funktion som returnerar balansen i mitt kontrakt
const getBalance = async (address) => {
  const balance = await hardhat.ethers.provider.getBalance(address);
  return hardhat.ethers.utils.formatEther(balance);
};

// Funktion som itererar genom adresserna och presenterar balansen för respektive adress...
const displayBalances = async (addresses) => {
  let i = 0;
  for (const address of addresses) {
    console.log(`Address ${i} balance: `, await getBalance(address));
    i++;
  }
};

// Funktion som visar alla snälla meddelanden...
const displayMessages = async (messages) => {
  for (const message of messages) {
    console.log(`At ${message.timestamp}, ${message.name}, ${message.from} sent the message: ${message.message}`);
  }
};
// Funktion main...
const main = async () => {
  // Hämta gratis testkonton, hardat waffle...
  const [owner, buyer1, buyer2, buyer3, buyer4, buyer5] = await hardhat.ethers.getSigners();

  // Hämta in kontraktet som jag ska kommunicera med...
  const contract = await hardhat.ethers.getContractFactory('BuyCookies');
  // Gör en test distribution...
  const buyCookies = await contract.deploy();

  await buyCookies.deployed();
  console.log('BuyCookies is deployed to: ', buyCookies.address);

  // Kontrollera balansen innan något köp genomförs...
  const addresses = [owner.address, buyer1.address, buyCookies.address];
  console.log('--- Kollar balansen innan köp genomförs ---');
  await displayBalances(addresses);

  // Vi testar att köpa lite kakor...
  console.log('--- Köper kakor ---');
  const price = { value: hardhat.ethers.utils.parseEther('1') };

  await buyCookies.connect(buyer1).buyCookie('Annika', 'The best cookies ever!', price);
  await buyCookies.connect(buyer2).buyCookie('Malin', 'Yummi!', price);
  await buyCookies.connect(buyer3).buyCookie('Emma', "I can't stop eating them", price);
  await buyCookies.connect(buyer4).buyCookie('Claes', 'With coffee their are great', price);
  await buyCookies.connect(buyer5).buyCookie('Trond', 'They are so gooooooood!!!!', price);

  console.log('--- Kakor är inhandlade ---');
  await displayBalances(addresses);

  // Tömma kassan för dagen...
  await buyCookies.connect(owner).withdrawPayment();

  // Kontrollera balansen...
  console.log('--- Efter att jag tömt kassan ---');
  await displayBalances(addresses);

  // Läs alla snälla meddelanden...
  console.log('--- Läser meddelandena ---');
  const messages = await buyCookies.getMessages();
  await displayMessages(messages);
};

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
