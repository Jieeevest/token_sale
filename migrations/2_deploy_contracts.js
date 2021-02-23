const BaleToken = artifacts.require("BaleToken");
const BitmindICO = artifacts.require("BitmindICO");

module.exports = function (deployer) {
  deployer.deploy(BaleToken, 1000000).then(function () {
    var tokenPrice = 1000000000000000;
    return deployer.deploy(BitmindICO, BaleToken.address, tokenPrice);
  });
};
