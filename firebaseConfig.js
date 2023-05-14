// Import the functions you need from the SDKs you need
const { initializeApp } = require("firebase/app");
const {
  getStorage,
  ref,
  listAll,
  getDownloadURL,
  uploadBytes,
} = require("firebase/storage");
const {
  getFirestore,
  collection,
  addDoc,
  getDocs,
  doc,
  updateDoc,
  setDoc,
  query,
  where,
  runTransaction,
} = require("firebase/firestore");
const NodeCache = require("node-cache");
const cache = new NodeCache({ stdTTL: 300, checkperiod: 320 });
const fs = require("fs");

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
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

// Import the functions you need from the SDKs you need
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
//surana
// const firebaseConfig = {
//   apiKey: "AIzaSyBC017Ki9r8imjeWVM9rkh-_DNNXdjwM7Y",
//   authDomain: "printez.firebaseapp.com",
//   projectId: "printez",
//   storageBucket: "printez.appspot.com",
//   messagingSenderId: "596061893090",
//   appId: "1:596061893090:web:3230536798ea747e7289bb"
// };

// Initialize Firebase
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
          
          if(pathArr[2] !== "abc.txt"){
         
          const downloadURL = await getDownloadURL(itemRef);
          fs.appendFile('url.txt', downloadURL + '\n', (err) => {
            if (err) {
              console.error('Failed to append URL:', err);
            }
          });
          return {
            link: downloadURL,
            id: pathArr[1],
            name: pathArr[2],
          };
      }
      
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
// async function URL() {
  
//   try {
//     const documents = [];
//     const res = await listAll(rootFolderRef);
//     // Filter the results to include only subfolders
//     const subfolders = res.prefixes;
//     const tempFolder = [];
//     // Log the subfolder names to the console
//     subfolders.map((subfolder) => {
//       if (!tempFolder.includes(subfolder.name)) {
//         tempFolder.push(subfolder.name);
//       }
//     });


//     if (tempFolder.length !== 0) {
//       const promises = tempFolder.map(async (idName) => {
        
//         const folderRef = ref(storage, "temp/" + idName);
//         const res = await listAll(folderRef);
//         // Get the download URL for each file
        
//         const promises2 = res.items.map(async (itemRef) => {
         
//           const pathArr = itemRef.fullPath.split("/");
//           if(pathArr[2] !== "abc"){
//           const downloadURL = await getDownloadURL(itemRef);
//           return {
//             link: downloadURL,
//             name: pathArr[2],
            
//           };
//       }});
//         const urls = await Promise.all(promises2);
//         // Do something with the download URLs
//         documents.push({id:idName, files:urls});
//         return urls;
//       });
//       // Wait for all the promises to resolve
//       const allUrls = await Promise.all(promises);
//       // Flatten the array of arrays into a single array of all download URLs
//       const urls = allUrls.flat();
//       documents.map(async (document)=>{
        
//         const documentRef = doc(collection(db, "print"));
//         await setDoc(documentRef,{
//           id: document.id,
//           isGiven: false,
//           isPrinted: true,
//           urlArr:document.files,
//         })
//       })
      
//     } else {
//       console.log("no folder exist");
//       return -1;
//     }
//   } catch (error) {
//     console.error("Error listing subfolders:", error);
//     return -1;
//   }
// }
// URL();
//<--------------------------------- DATABASE ---------------------------------------->


//<=====================================POST PRINT ========================================>
const userRef = collection(db, "print-on-demand");
async function posPrint(uid, purl, pname) {
  
  await addDoc(userRef, {
    id: uid,
    isGiven: false,
    urlArr: {
      name: pname,
      url: purl,
      isPrinted: true,
      
    },
  });

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
//<=====================================CHECK PRINT ========================================>


const tempRef = collection(db,"print-on-demand");
async function isPrinted(id, url) {
  const queryFiles = query(tempRef,where("urlArr.url", "==", url));

  const querySnapshot = await getDocs(queryFiles);
  const docArray = querySnapshot.docs;
 
  
  for (let i = 0; i < docArray.length; i++) {
    // const doc = docArray[i];
  //   if (doc.data().urlArr.url === url && doc.data().id === id) {
      
  //     return true;
  //   }
  // }
  // return false;
  return true;
  }}
// async function isPrinted(id, url) {
//   const cacheKey = `isPrinted_${id}_${url}`;
//   const cachedResult = cache.get(cacheKey);
//   if (cachedResult) {
//     return cachedResult;
//   }

//   const querySnapshot = await getDocs(tempRef);
//   const docArray = querySnapshot.docs;

//   for (let i = 0; i < docArray.length; i++) {
//     const doc = docArray[i];
//     if (doc.data().urlArr.url === url && doc.data().id === id) {
//       cache.set(cacheKey, true);
//       return true;
//     }
//   }

//   cache.set(cacheKey, false);
//   return false;
// }
//<=====================================HANDLE ACCEPT ========================================>

async function handleAccept(id){
  const queryFiles = query(tempRef,where("id","==",id),where("isGiven","==",false));
  const querySnapshot = await getDocs(queryFiles);
  const docArray = querySnapshot.docs; 
  const nameArr = []
  // for (let i = 0; i < docArray.length; i++) {
  //   const docc = docArray[i];
    
  //     const docRef = doc(db,"print-on-demand",docc.id);     
  //    nameArr.push(docc.data().urlArr.url);
  //    const res = updateDoc(docRef,{
  //     isGiven: true
  //    }) 
      
  // }
  // return nameArr; 
  await runTransaction(db,async (transaction) => {
    for (let i = 0; i < docArray.length; i++) {
      const docc = docArray[i];
      const docRef = doc(db, "print-on-demand", docc.id);     
      nameArr.push(docc.data().urlArr.url);
      transaction.update(docRef, { isGiven: true });
    }
  });
  
  return nameArr;
}
// async function handleAccept(id){
//   const cacheKey = `handleAccept_${id}`;
//   const cachedResult = cache.get(cacheKey);
//   if (cachedResult) {
//     return cachedResult;
//   }

//   const querySnapshot = await getDocs(tempRef);
//   const docArray = querySnapshot.docs;

//   const nameArr = [];
//   for (let i = 0; i < docArray.length; i++) {
//     const docc = docArray[i];

//     if (docc.data().id === id && !docc.data().isGiven) {
//       const docRef = doc(db,"print-on-demand",docc.id);

//       nameArr.push(docc.data().urlArr.url);

//       const res = await updateDoc(docRef,{
//         isGiven: true
//       });
//     }
//   }

//   cache.set(cacheKey, nameArr);
//   return nameArr;
// }

module.exports = {
  posPrint,
  URL,
  isPrinted,
  handleAccept,
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
