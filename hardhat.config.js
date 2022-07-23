require("@nomiclabs/hardhat-waffle");
const projectId = 'a25556d28904410ab9ee77a77bdf36bf'  // project ID from infura
const fs = require('fs')
const keyData = fs.readFileSync('./p-key.txt', { encoding: 'utf-8', flag: 'r' })  // reads exported private key from wallet account

module.exports = {
  defaultNetwork: 'hardhat',
  networks: {
    hardhat: {
      chainId: 1337 // config standard
    },
    mumbai: {
      url: `https://polygon-mumbai.infura.io/v3/${projectId}`,
      accounts: [keyData]
    },
    mainnet: {
      url: `https://polygon-mainnet.infura.io/v3/${projectId}`,
      accounts: [keyData]
    }
  },
  solidity: {
    version: "0.8.15",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
};
