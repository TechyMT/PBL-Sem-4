import React from 'react';
import Image from 'next/image';

// const Circle = ({size,color}) => {
//     const circleStyle = {
//         width: size,
//         height: size,
//         borderRadius: '50%',
//         backgroundColor: color
//     };
//     return(
//         <div className='circle' style={circleStyle}>
//             <Image src="riyawani.png"/>
//         </div>
//     );
// };
function Profile (props){
    // const circle = {
    //     width: '130px',
    //     height: '130px',
    //     borderRadius:'50%',
    //     border:'2px',
    //     color: 'black' 
    // };
    const srcName = "/"+props.name+".png" ;
    return(
    <div>
        <Image style={{borderRadius:'50%'}}
        src={srcName} width={130} height={130}/>
    </div>
    );
}
export default Profile;
// style inside return div should be double curly braces, objects of objects.({{...}})