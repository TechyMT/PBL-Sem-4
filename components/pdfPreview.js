function Preview(props){
const url = props.url + "#1"

    return(
        <embed src={url} width={500} height={1000} style = {{margin: "100px"} }type="application/pdf"
        frameBorder="0"
        scrolling="auto"></embed>    )
}

export default Preview