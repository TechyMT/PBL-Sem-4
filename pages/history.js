import styles from "../styles/history.module.css";
import HzlCard from "../components/hzlcard";
export default function History() {
  return (
    <div>
      <div className={styles.heading}>
        <div  className={styles.h1}><h1>History</h1></div>     
      <div className={styles.row}>
        <div className={styles.coloumn}>
          <div className={styles.card}>
            <div className={styles.content}>
              <h3>id</h3>
            </div>
            <div className={styles.content}>
              <h3>payment</h3>
            </div>
            <div className={styles.content}>
              <h3>status</h3>
            </div>
            <div className={styles.content}>
              <h3>amount</h3>
            </div>
          </div>
        </div>
      </div>
      </div>
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
      <HzlCard id="21383" payment="paid" status="printed" amount="69" />
    </div>
  );
}
