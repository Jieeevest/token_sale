const BaleToken = artifacts.require("BaleToken");

module.exports = function (deployer) {
  deployer.deploy(BaleToken, 1000000);
};
