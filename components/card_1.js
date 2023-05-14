
import styles from  "../styles/card.module.css";
import PButton from "./button";
import CardData from "./cardData";
// import {useSpring, animated} from 'react-spring'
// const props=useSpring({opacity:1,from:{opacity:0}})


function Card(props) {
  
    const { docId, data } = props.url;
    const {id,urlArr,Pages} = data;
    function handleClick(){
      props.handleClick(docId,urlArr,Pages);
    }
    return (
      <div className={styles.card}>
        <h2> ID: {id}</h2>
        
        <p>______________________________</p>
        {/* <a href={link}>{link}</a> */}
        <p>Pages: {Pages}</p>
        <PButton key = {id} handleClick = {handleClick} />
      </div>
    );
  }
  
  export default Card;
/*destructuring-eg:
props.url={
  id:"21383",
  link:"www.xyz.com",
  name:"riya"
} 
const { id, link, name } = props.url;

id:"21383",
link:"www.xyz.com",
name:"riya"*/