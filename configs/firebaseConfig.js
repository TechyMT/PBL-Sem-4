// Import the functions you need from the SDKs you need
const { initializeApp } = require("firebase/app");
const {
  getStorage,
  ref,
  listAll,
  getDownloadURL,
  uploadBytes,
  
} = require("firebase/storage");
const { getFirestore, collection, addDoc } = require("firebase/firestore");

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBri3HfJ4EtW7kLOYcBA7wDkXJ9RQBcPsk",
  authDomain: "fir-test-d90e2.firebaseapp.com",
  databaseURL: "https://fir-test-d90e2-default-rtdb.firebaseio.com",
  projectId: "fir-test-d90e2",
  storageBucket: "fir-test-d90e2.appspot.com",
  messagingSenderId: "102923422659",
  appId: "1:102923422659:web:bc4f35a0db29548d6b0b76",
  measurementId: "G-MD5CFQE16C",
};
const app = initializeApp(firebaseConfig);

// Get a reference to the folder

// Get a reference to the root folder

const db = getFirestore(app);
const storage = getStorage(app);

// List all items in the root folder
const printFolder = [];


// <------------------------------ STORAGE ---------------------------------------->

const rootFolderRef = ref(storage, "temp");
async function URL() {
  try {
    const res = await listAll(rootFolderRef);
    // Filter the results to include only subfolders
    const subfolders = res.prefixes;
    const tempFolder = [];
    // Log the subfolder names to the console
    subfolders.map((subfolder) => {
      if (!tempFolder.includes(subfolder.name)) {
        tempFolder.push(subfolder.name);
      }
    });

    if (tempFolder.length !== 0) {
      const promises = tempFolder.map(async (idName) => {
        const folderRef = ref(storage, "temp/" + idName);
        const res = await listAll(folderRef);
        // Get the download URL for each file
        const promises2 = res.items.map(async (itemRef) => {
          const pathArr = itemRef.fullPath.split("/");
          const downloadURL = await getDownloadURL(itemRef);
          return {
            "link" : downloadURL,
            "id": pathArr[1],
            "name":pathArr[2]
          };
        });
        const urls = await Promise.all(promises2);
        // Do something with the download URLs
        
        return urls;
      });
      // Wait for all the promises to resolve
      const allUrls = await Promise.all(promises);
      // Flatten the array of arrays into a single array of all download URLs
      const urls = allUrls.flat();
      return urls;
    } else {
      console.log("no folder exist");
      return -1;
    }
  } catch (error) {
    console.error("Error listing subfolders:", error);
    return -1;
  }
}

//<--------------------------------- DATABASE ---------------------------------------->

const userRef = collection(db, "print-on-demand");

async function posPrint(uid, purl, pname){

  await addDoc(userRef, {
    id: uid,
    urlArr: {
        name: pname,
        url : purl
    }
})

//   const url = purl;
//   const storageRef = ref(storage, "printed");
//   // const folderName = uid;
//   const folderRef = ref(storage, "printed/"+uid);
//   // const fileName = pname;

//   await fetch(url)
//   .then((res) => {
//     return res.blob()
//   })
//   .then(blob => {
    
    
//     const fileRef = ref(storage, "printed/file.pdf");

//     uploadBytes(fileRef, blob)
//     .then(snapshot => {
    
//       console.log('Uploaded file successfully!');
//     })
//     .catch(error => {
//       console.error('Error uploading file:', error);
//     });
// })
// .catch(error => {
//   console.error('Error retrieving file contents:', error);
// });

}








module.exports = {
  posPrint,
  URL,
  

};

// // console.log(printFolder);
// if (printFolder.length !== 0) {
//   listAll(folderRef)
//     .then((res) => {
//       // Get the download URL for each file
//       const promises = res.items.map((itemRef) => getDownloadURL(itemRef));

//       // Wait for all the promises to resolve
//       Promise.all(promises)
//         .then((urls) => {
//           // Do something with the download URLs

//           console.log(urls);
//         })
//         .catch((error) => {
//           // Handle errors
//           console.error(error);
//         });
//     })
//     .catch((error) => {
//       // Handle errors
//       console.error(error);
//     });
// } else {
//   console.log("no folder exist");
// }
