module.exports = (sequelize, Sequelize) => {
    const vendingData = sequelize.define("vending_data", {
      title: {
        type: Sequelize.STRING
      },
      description: {
        type: Sequelize.STRING
      },
      image: {
        type: Sequelize.STRING
      },
      published: {
        type: Sequelize.BOOLEAN
      }
    });
  
    return vendingData;
  };