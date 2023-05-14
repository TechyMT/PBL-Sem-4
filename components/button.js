import * as React from "react"
import Button from "@mui/material/Button"
import styles from "../styles/button.module.css"
import { orange } from "@mui/material/colors";



export default function PButton(props){
    // const buttonStyle={
    //     color:'black',
    //     backgroundColor: props.color,
    // };
    function handleClick(){
        props.handleClick();
        
    }


    return(
        <div className= {styles.button}>
        <Button variant = "default"  onClick={handleClick}
        sx={{
            ":hover": {
              bgcolor: "black",
              color: "azure",
              
            }
          }}> Print! </ Button >
        </div>
    )
}