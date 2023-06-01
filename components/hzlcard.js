import styles from "../styles/hzlcard.module.css";
import { Accordion, AccordionDetails, AccordionSummary } from "@mui/material";
import { useState } from "react";

function hzlcard(props) {
  const [expanded, setExpanded] = useState(false);
  const handleChange = (panel) => (event, isExpanded) => {
    setExpanded(isExpanded ? panel : false);
  };
  const nameArr = props.urlArr;
  console.log(nameArr);
  return (
    <Accordion
      expanded={expanded === "panel1"}
      onChange={handleChange("panel1")}
      sx={{ backgroundColor: "#5F4BA5" }}
    >
        <AccordionSummary
          expandIcon={<button className={styles.button} style={{height: "50px",borderRadius:"50%",marginLeft:"-20px", backgroundColor:""}}>↓</button>}
          aria-controls="panel1bh-content"
          id="panel1bh-header"
        >
         <div className={styles.column} sx={{ width: '33%', flexShrink: 0 }}>
        <div className={styles.card}>
          <div className={styles.content1}>
            <h3>{props.date}</h3>
          </div>
          <div className={styles.content2}>
            <h3>{props.roll}</h3>
          </div>
          <div className={styles.content3}>
            <h3>{props.status}</h3>
          </div>
          <div className={styles.content4}>
            <h3>{props.pages}</h3>
          </div>
          <div className={styles.content5}>
            <h3>{props.amount}</h3>
          </div>
        </div>
      </div>
      
        </AccordionSummary>
        <AccordionDetails>
          <ul>
            {nameArr.map((url) =>(
             
                <li className={styles.paralist}>{url.name}</li>
               
            ))}
            </ul>
        </AccordionDetails>
      
    </Accordion>
  );
}
export default hzlcard;
