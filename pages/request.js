import homeStyles from "../styles/requestPage.module.css";
import Card from "../components/card_1";
import Head from "next/head";
import Layout from "../components/layout";
import { useState, useEffect } from "react";
import { URL, posPrint } from "../configs/firebaseConfig";
import Image from "next/image";


function Requests() {
  const [urls, setUrls] = useState([]);

  useEffect(() => {
    async function fetchData() {
      const urlArray = await URL();
      if (urlArray.length > 0) {
        setUrls(urlArray);
      } else setUrls([]);
    }
    fetchData();
  }, []);

  async function handleClick(uid, purl, pname) {
    await posPrint(uid, purl, pname);
  }

  return (
    <div>
      <Layout>
        <Head>
          <meta name="viewport" content="initial-scale=1, width=device-width" />
          <title>Mustafa</title>
        </Head>

        
          <div>
            {urls.length > 0 ? (
              <div className={homeStyles.flexBox}>
                {urls.map((urlData) => (
                  <Card
                    key={urlData.id}
                    url={urlData}
                    handleClick={handleClick}
                  />
                ))}
              </div>
            ) : urls.length == 0 ? (
              
                <div
                  style={{display: "block",marginLeft: "auto",marginRight:"auto", width: "35%"}}
                >
                  <Image src="/noresults.png" width={577} height={433} />
                </div>
            
            ) : (
              <p>Loading...</p>
            )}
          </div>
        
      </Layout>
    </div>
  );
}
export default Requests;
