import { URL } from "../configs/firebaseConfig"

import { useState, useEffect } from "react";

export default function CardData() {
  // return (
  //   <div>
  //     <h1>{name}</h1>
  //     <p> {id} </p>
  //   </div>
  // );
  const [urls, setUrls] = useState([]);

  useEffect(() => {
    async function fetchData() {
      const urlArray = await URL();
      setUrls(urlArray);
    }
    fetchData();
  }, []);

  

  return (
    <div>
      {urls.length > 0 ? (
        <div>
          {urls.map((urlData) => (
            <div>
            <h1>{urlData.id}</h1>
            <p>{urlData.link}</p>
            {/* <li key={urlData.id}><a href={urlData.link}>{urlData.id}</a></li> */}
            </ div>
          ))}
        </div>
      ) : (
        <p>Loading...</p>
      )}
    </div>
  );
}
