import styles from "../styles/pdfPreview.module.css"

function Preview(props){
const url = props.url + "#1"

    return(
        <embed src={url} className={styles.preview} width={0} height={0}
        frameBorder="0"
        scrolling="auto"></embed>    )
}

export default Preview