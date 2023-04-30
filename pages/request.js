import homeStyles from "../styles/requestPage.module.css";
import Card from "../components/card_1";
import Head from "next/head";
import Layout from "../components/layout";
import { useState, useEffect, Fragment } from "react";
import { URL, posPrint, isPrinted } from "../configs/firebaseConfig";
import Image from "next/image";
import ImgNotFound from "../components/notFound";
import Link from "next/link";
import styles from "../styles/accept.module.css"

function Requests() {
  const [urls, setUrls] = useState([]);
  const [resultArr, setResultArr] = useState([]);
  let times = 0;
  useEffect(() => {
    async function fetchData() {
      const urlArray = await URL();
      if (urlArray.length > 0) {
        const updatedArr = [];
        for(let i = 0; i<urlArray.length; i++){
          const {id, link} = urlArray[i];
          const printed = await isPrinted(id,link);
          if(!printed){
            
            updatedArr.push(urlArray[i]);
          }
         
        }
        setResultArr(updatedArr);
        setUrls(resultArr);
      } else setUrls([]);
    }
    fetchData();
  }, [resultArr]);

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
          <button >
          <Link href = "/accept">Accept</Link>
          </button>
          {urls.length > 0 ? (
            <div className={homeStyles.flexBox}>
              {urls.map((urlData) => (
                <Fragment key = {urlData.id}>
                
          
                <Card url={urlData} handleClick={handleClick} />
        
                
              </ Fragment>
              ))}
            </div>
          ):(
            <ImgNotFound />
          )}
        </div>
      </Layout>
    </div>
  );
}
export default Requests;
