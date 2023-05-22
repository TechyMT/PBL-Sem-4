
import styles from  "../styles/card.module.css";
import PButton from "./button";
import CardData from "./cardData";
// import {useSpring, animated} from 'react-spring'
// const props=useSpring({opacity:1,from:{opacity:0}})


function Card(props) {
  
    const { docId, data } = props.url;
    const {id,urlArr,pages,date_time} = data;
    const dateortime = date_time.split("2023");

    function handleClick(){
      props.handleClick(docId,urlArr);
    }
    return (
      <div className={styles.card}>
        <h2> ID: {id}</h2>
        
        <p>______________________________</p>
        {/* <a href={link}>{link}</a> */}
        <p>Pages: {pages}</p>
        <p>Date: {dateortime[0]} 2023</p>
        <p>Time: {dateortime[1]}</p>
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