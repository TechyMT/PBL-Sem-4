import styles from "../styles/history.module.css";
import HzlCard from "../components/hzlcard";
import Layout from "../components/layout";
import { getHistory } from "../configs/firebaseConfig";
import { useEffect, useState, Fragment } from "react";

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
      <div className={styles.table}>
        <div className={styles.tableFixedHead}>
          <div className={styles.card}>
            <p className={styles.column}>ID</p>
            <p className={styles.column}>Status</p>
            <p className={styles.column}> Pages</p>
            <p className={styles.column}>Amount</p>
          </div>
        </div>
        <div className={styles.cardList}>
          {hist.map((history) => (
            <Fragment key = {history.id} >
              <HzlCard
                key={history.id}
                roll={history.id}
                payment={history.amount}
                status={history.status}
                pages = {history.pages}
                amount={history.amount}
              />
            </Fragment>
          ))}
        </div>
      </div>
    </Layout>
  );
}
