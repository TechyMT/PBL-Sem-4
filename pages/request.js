import homeStyles from "../styles/requestPage.module.css";
import Card from "../components/card_1";
import Head from "next/head";
import Layout from "../components/layout";
import { useState, useEffect, Fragment } from "react";
import { URL, posPrint } from "../configs/firebaseConfig";

import ImgNotFound from "../components/notFound";
import Link from "next/link";
import styles from "../styles/accept.module.css";

function Requests() {
  const [urls, setUrls] = useState([]);

  useEffect(() => {
    async function fetchData() {
      const urlArray = await URL();

      const filteredArray = urlArray.filter((urlData) => !urlData.data.isPrinted);

      setUrls([...filteredArray]);
    }

    fetchData();
  }, []);

  const handleClick = async (docId, urlArr) => {
    try {
      const {pages, Amount} = urlArr;
      await posPrint(docId, urlArr);
      console.log("api-executed");
      setUrls((prevUrls) => [...prevUrls.filter((urlData) => urlData.docId !== docId)]);
      console.log("seturl executed");

    } catch (error) {
      console.error("Printing error:", error);
    }
  };

  const linkStyle = {
    textDecoration: "none",
  };

  return (
    <div>
      <Layout>
        <Head>
          <meta name="viewport" content="initial-scale=1, width=device-width" />
          <title>Mustafa</title>
        </Head>

        <div>
          <button className={homeStyles.flexBox}>
            <Link style={linkStyle} href="/accept">
              Accept
            </Link>
          </button>
          {urls.length > 0 ? (
            <div className={homeStyles.flexBox}>
              {urls.map((urlData) => (
                <Fragment key={urlData.docId}>
                  <Card
                    key={urlData.docId} // Add a unique key prop
                    url={urlData}
                    handleClick={() => handleClick(urlData.docId, urlData.data)}
                  />
                </Fragment>
              ))}
            </div>
          ) : (
            <ImgNotFound />
          )}
        </div>
      </Layout>
    </div>
  );
}

export default Requests;
