import styles from "../styles/hzlcard.module.css"

function hzlcard(props)
{
    return(
        <div className={styles.coloumn}>
            <div className={styles.card}>
                <div className={styles.content}><h3>{props.id}</h3></div>
                <div className={styles.content}><h3>{props.payment}</h3></div>
                <div className={styles.content}><h3>{props.status}</h3></div>
                <div className={styles.content}><h3>{props.amount}</h3></div>
            </div>
        </div>
    )
}
export default hzlcard;