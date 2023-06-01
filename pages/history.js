import styles from "../styles/history.module.css";
import HzlCard from "../components/hzlcard";
import Layout from "../components/layout";
import { getHistory } from "../configs/firebaseConfig";
import { useEffect, useState, Fragment } from "react";
import Head from "next/head";

export default function History() {
  const [hist, setHist] = useState([]);
  useEffect(() => {
    async function fetchData() {
      const history = await getHistory();
      setHist(history);
    }
    fetchData();
  }, []);

  return (
    <Layout>
      <Head>
          <meta name="viewport" content="initial-scale=1, width=device-width" />
          <title>History</title>
        </Head>
      <div className={styles.table}>
        <div className={styles.tableFixedHead}>
          <div className={styles.card}>
            <p className={styles.column}>Date</p>
            <p className={styles.columnID}>ID</p>
            <p className={styles.columnStatus}>Status</p>
            <p className={styles.column}> Pages</p>
            <p className={styles.column}>Amount</p>
          </div>
        </div>
        <div className={styles.cardList}>
          {hist.map((history) => (
            
            <Fragment key = {history.id} >
              <HzlCard
                key={history.id}
                date = {history.date}
                roll={history.id}
                payment={history.amount}
                status={history.status}
                pages = {history.pages}
                amount={history.amount}
                urlArr = {history.nameArr}
              />
            </Fragment>
          ))}
        </div>
      </div>
    </Layout>
  );
}
