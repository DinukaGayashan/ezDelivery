const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp(functions.config().firebase);

async function checkCollectionForUser(email, col) {
  const userCollectionRef = admin.firestore().collection(col);
  const querySnapshot = await userCollectionRef
      .where("email", "==", email).get();
  return querySnapshot.size >= 1;
}

exports.checkUserRole = functions.https.onCall(async (data, context) => {
  const customer = await checkCollectionForUser(data.email, "customers");
  const distributor = await checkCollectionForUser(data.email,
      "distributors");
  if (customer) {
    return "customer";
  } else if (distributor) {
    return "distributor";
  } else {
    return "no";
  }
});

async function checkUsersForKey(key, col) {
  const userCollectionRef = admin.firestore().collection(col);
  const querySnapshot = await userCollectionRef
      .where("secretKey", "==", key).get();
  return querySnapshot.size >= 1;
}

exports.getSecretKey = functions.https.onCall(async (data, context) => {
  const number=Math.round(Math.random()*1000000);
  const checkCustomers = await checkUsersForKey(number, "customers");
  if (checkCustomers) {
    this.getSecretKey();
  } else {
    return number.toString();
  }
});
