import styles from "../styles/pdfPreview.module.css"

function Preview(props){
const url = props.url + "#1"

    return(
        <embed src={url} className={styles.preview} width={500} height={1000}
        frameBorder="0"
        scrolling="auto"></embed>    )
}

export default Preview