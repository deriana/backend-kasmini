require('dotenv').config();  

function fiture(statusList) {
  return (req, res, next) => {
    const featureStatus = process.env.FEATURE_STATUS || "off"; 

    if (statusList.includes(featureStatus)) {
      return next();
    } else {
      return res.status(403).send('This Fiture Is Disabled');
    }
  };
}

module.exports = fiture;
