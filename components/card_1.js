
import styles from  "../styles/card.module.css";
import PButton from "./button";
import CardData from "./cardData";


function Card(props) {
  
    const { id, link, name } = props.url;
    function handleClick(){
      props.handleClick(id,link,name);
    }
    return (
      <div className={styles.card}>
        <h2> ID: <br/ > {id}</h2>
        <p>{name}</p>
        {/* <a href={link}>{link}</a> */}
        <PButton key = {id} link = {link} handleClick = {handleClick} />
      </div>
    );
  }
  
  export default Card;