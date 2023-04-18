import homeStyles from "../styles/home.module.css";
import Card from "../componets/card_1";
import Head from "next/head";
import Layout from "../componets/layout";
import PrintURL from "../componets/getUrls";

export default function Home() {
  return (
    <div>
      <Layout>
        <Head>
          <meta name="viewport" content="initial-scale=1, width=device-width" />
          <title>Mustafa</title>
        </Head>
        
        <div className={homeStyles.flexBox}>
          <Card />
          {/* <Card/>
          <Card /> */}
          
        </div>
        {/* <PrintURL/> */}
      </Layout>
    </div>
  );
}
