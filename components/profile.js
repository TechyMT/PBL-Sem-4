import React from "react";
import Image from "next/image";
import styles from "../styles/profile.module.css";
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
function Profile(props) {
  // const circle = {
  //     width: '130px',
  //     height: '130px',
  //     borderRadius:'50%',
  //     border:'2px',
  //     color: 'black'
  // };
  const srcName = "/" + props.name + ".png";
  // const imgStyle={
  //     borderRadius:'50%',

  // }
  return (
    <div className={styles.profile}>
      <div className={styles.imgWrapper}>
        <Image
          className={styles.hoverZoom}
          alt={props.name}
          src={srcName}
          width={130}
          height={130}
        />
      </div>
    </div>
  );
}
export default Profile;
// style inside return div should be double curly braces, objects of objects.({{...}})
