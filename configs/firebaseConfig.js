// Import the functions you need from the SDKs you need
const { initializeApp } = require("firebase/app");
const {
  getStorage,
} = require("firebase/storage");
const {
  getFirestore,
  collection,
  getDocs,
  doc,
  updateDoc,
  query,
  where,
  runTransaction,
} = require("firebase/firestore");
// test
// const firebaseConfig = {
//   apiKey: "AIzaSyBri3HfJ4EtW7kLOYcBA7wDkXJ9RQBcPsk",
//   authDomain: "fir-test-d90e2.firebaseapp.com",
//   databaseURL: "https://fir-test-d90e2-default-rtdb.firebaseio.com",
//   projectId: "fir-test-d90e2",
//   storageBucket: "fir-test-d90e2.appspot.com",
//   messagingSenderId: "102923422659",
//   appId: "1:102923422659:web:bc4f35a0db29548d6b0b76",
//   measurementId: "G-MD5CFQE16C",
// };

//pbl
const firebaseConfig = {
  apiKey: "AIzaSyBVPeHcLwRpUN4eVGEZwUIQKX_E6SYXX80",
  authDomain: "pbl-sem-4.firebaseapp.com",
  databaseURL: "https://pbl-sem-4-default-rtdb.firebaseio.com",
  projectId: "pbl-sem-4",
  storageBucket: "pbl-sem-4.appspot.com",
  messagingSenderId: "345714848225",
  appId: "1:345714848225:web:70a01a24e1a35b81f9a2a0",
  measurementId: "G-Z7HXXVYV0F"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

// Get a reference to the folder

// Get a reference to the root folder

const db = getFirestore(app);
const storage = getStorage(app);

// List all items in the root folder
const printFolder = [];

// <------------------------------ STORAGE ---------------------------------------->

const printRef = collection(db, "print");

async function URL() {
  try {
    console.log("contacted");
    const queryPrintFiles = query(printRef, where("isPrinted", "==", false));
    const querySnapshot = await getDocs(queryPrintFiles);
    const docArray = querySnapshot.docs;
    const urlArr = [];
    docArray.forEach((doc) => {
      urlArr.push({ docId: doc.id, data: doc.data() });
    });

    return urlArr;
  } catch (error) {
    console.error("Error listing subfolders:", error);
    return -1;
  }
}

//<--------------------------------- DATABASE ---------------------------------------->

//<=====================================POST PRINT ========================================>

// Function to reset the variable to zero at the start of the day
function resetVariable() {
  const now = new Date();
  const tomorrow = new Date(
    now.getFullYear(),
    now.getMonth(),
    now.getDate() + 1
  );
  const timeUntilTomorrow = tomorrow - now;

  setTimeout(() => {
    pages = 0;
    amounts = 0;
    console.log("Variable reset to zero");
    resetVariable(); // Schedule the next reset for the following day
  }, timeUntilTomorrow);
}

// Start the reset process
resetVariable();

async function posPrint(id, urlArray) {
  const docRef = doc(collection(db, "print"), id);
  const { urlArr } = urlArray;
  const date = new Date();
  const linkArr = urlArr.map((url) => url.link);

  try {
    await updateDoc(docRef, {
      isPrinted: true,
      date: date,
    });

    const url = "/api/executeBat";

    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(linkArr), // Replace with your actual data object
    });

    if (response.ok) {
      // Request was successful
      const data = await response.json();
      console.log("Response:", data);
    } else {
      // Request failed
      console.error("Error:", response.status);
    }
  } catch (error) {
    console.error("Error:", error);
  }
}

//<=====================================CHECK HISTORY ========================================>

async function getHistory() {
  try {
    const historyArr = [];
    
    const querySnapshot = await getDocs(printRef);
    const docArray = querySnapshot.docs;
    docArray.forEach((docc) => {
      let printStatus = "isGiven";
      if(!docc.data().isGiven && docc.data().isPrinted){
        console.log("printed");
        printStatus = "Printed";
      }
      else if(!docc.data().isPrinted){
        printStatus = "Pending";
      }
      
      let datee = docc.data().date_time.split("2023");

      historyArr.push({
        date: datee[0]+" 2023",
        id:docc.data().id,
        status: printStatus,
        pages: docc.data().pages,
        amount: docc.data().Amount,
        nameArr: docc.data().urlArr,
        



      })
    });
    return historyArr;
  } catch (err) {
    console.log(err);
  }
}

//<=====================================HANDLE ACCEPT ========================================>
const tempRef = collection(db, "print");
async function handleAccept(id) {
  const queryFiles = query(
    tempRef,
    where("id", "==", id),
    where("isPrinted", "==", true),
    where("isGiven", "==", false)
  );
  const querySnapshot = await getDocs(queryFiles);
  const docArray = querySnapshot.docs;
  const nameArr = [];
  const urlData = [];
  await runTransaction(db, async (transaction) => {
    for (let i = 0; i < docArray.length; i++) {
      const docc = docArray[i];
      urlData.push(docc.data());
      const docRef = doc(db, "print", docc.id);
      // nameArr.push(docc.data().urlArr.url);
      transaction.update(docRef, { isGiven: true });
    }
    console.log(urlData);
    urlData.forEach((urlObj) => {
      const { urlArr } = urlObj;
      // console.log(urlArr);
      urlArr.forEach((url) => {
        console.log(url.link);
      });
      urlArr.forEach((url) => {
        const { link } = url;
        nameArr.push(link);
      });
    });
  });

  return nameArr;
}

module.exports = {
  posPrint,
  URL,
  getHistory,
  handleAccept,
};
