import * as React from "react"
import Button from "@mui/material/Button"



export default function PButton(props){

    function handleClick(){
        props.handleClick();
        
    }


    return(
        <div>
        <Button variant = "contained" href = {props.link}   onClick={handleClick}> Print! </ Button >

        </div>
    )
}