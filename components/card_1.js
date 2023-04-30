
import styles from  "../styles/card.module.css";
import PButton from "./button";
import CardData from "./cardData";
import {isPrinted } from "../configs/firebaseConfig";
import { useState, useEffect } from "react";

import ImgNotFound from "./notFound";

function Card(props) {
    const resultArr = [];
    const { id, link, name } = props.url;
    function handleClick(){
      props.handleClick(id,link,name);
    }
  //   const [printed, setPrinted] = useState(false);

  // useEffect(() => {
  //   isPrinted(id, link)
  //     .then((result) => {
  //       setPrinted(result);
        
  //     })
  //     .catch((error) => {
  //       console.error(error);
  //     });
  // }, [id, link]);

  // if(printed){
  //   resultArr.push(false);
  //   return null;
  // }
  //   else{
  //     resultArr.push(true);
    return(
      <div className={styles.card}>
      <h2> ID: <br/ > {id}</h2>
      <p>{name}</p>
      {/* <a href={link}>{link}</a> */}
      <PButton key = {id} link = {link} name = "Print!" handleClick = {handleClick} />
    </div>
    
    )
    
    }


  
  
  export default Card;