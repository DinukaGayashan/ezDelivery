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
      .where("key", "==", key).get();
  return querySnapshot.size >= 1;
}

exports.getSecretKey = functions.https.onCall(async (data, context) => {
  const number=Math.round(Math.random()*1000000);
  const checkCustomers = await checkUsersForKey(number, "customers");
  const checkDistributors = await checkUsersForKey(number, "distributors");
  if (checkCustomers || checkDistributors) {
    this.getSecretKey();
  } else {
    return number.toString();
  }
});

exports.checkCustomerAvailability = functions.https.onCall(
    async (data, context) => {
      const checkCustomers = await checkUsersForKey(data.key, "customers");
      if (checkCustomers) {
        return "true";
      } else {
        return "false";
      }
    });

exports.addPackageReference = functions.firestore
    .document("packages/{packageId}")
    .onCreate(async (snapshot, context) => {
      const customerEmail=snapshot.data().customerEmail;
      const customerRef=await admin.firestore()
          .collection("customers").where("email", "==", customerEmail).get();

      const updatePromises1=[];
      customerRef.forEach((doc) => {
        updatePromises1.push(admin.firestore()
            .collection("customers").doc(doc.id)
            .update({packages: admin.firestore.FieldValue
                .arrayUnion(snapshot.ref)}));
      });

      await Promise.all(updatePromises1);

      const distributorEmail=snapshot.data().distributorEmail;
      const distributorRef=await admin.firestore()
          .collection("distributors")
          .where("email", "==", distributorEmail).get();

      const updatePromises2=[];
      distributorRef.forEach((doc) => {
        updatePromises2.push(admin.firestore()
            .collection("distributors").doc(doc.id)
            .update({packages: admin.firestore.FieldValue
                .arrayUnion(snapshot.ref)}));
      });

      await Promise.all(updatePromises2);
    });
