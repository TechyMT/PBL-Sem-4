import { useState, useEffect } from "react";
import { URL } from "../configs/firebaseConfig";

export default function PrintURL() {
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
        <ul>
          {urls.map((urlData) => (
            <li key={urlData.id}><a href={urlData.link}>{urlData.id}</a></li>
          ))}
        </ul>
      ) : (
        <p>Loading...</p>
      )}
    </div>
  );
}
