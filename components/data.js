import React from 'react';

function Data(props){
    const styleData ={
        fontSize:'12px'
    };
    return(
        <div style={styleData}>
            <h1>{props.title}</h1>
            <p>{props.desc}</p>
        </div>
    );
};


export default Data;