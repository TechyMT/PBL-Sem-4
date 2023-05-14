import React from 'react';
import styles from "../styles/data.module.css";
function Data(props){
    const styleData ={
        fontSize:'12px'
    };
    return(
        <div className={styles.data}>
            <h1 className={styles.h1}>{props.title}</h1>
            <p className={styles.p}>{props.desc}</p>
        </div>
    );
};


export default Data;