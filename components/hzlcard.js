import styles from "../styles/hzlcard.module.css"

function hzlcard(props)
{
    return(
        <div className={styles.column}>
            <div className={styles.card}>
                <div className={styles.content1}><h3>{props.date}</h3></div>
                <div className={styles.content2}><h3>{props.roll}</h3></div>
                <div className={styles.content3}><h3>{props.status}</h3></div>
                <div className={styles.content4}><h3>{props.pages}</h3></div>
                <div className={styles.content5}><h3>{props.amount}</h3></div>
            </div>
        </div>
    )
}
export default hzlcard;