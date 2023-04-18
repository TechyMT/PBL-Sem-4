import { URL } from "../configs/firebaseConfig"

import { useState, useEffect } from "react";





export default function CardData(props) {
  return (
    <div>
      <h1>{props.id}</h1>
      <p> {props.link} </p>
    </div>
  );

 
}
