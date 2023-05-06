import SocialCircle from "./circleSocial";
// import SocialIcon from "react-social-icons"
import {FaInstagram,FaLinkedin,FaGithub} from "react-icons/Fa"
import styles from "../styles/circleRow.module.css"

function CircleRow(props)
{
    const rowStyle ={
        display:'flex',
        justifyContent:'center',
        alignItems:'center',
        flexDirection:'row'
    }
    const iconStyle ={
        margin:'10px'
    }
    return(
        <div style={rowStyle}>
            {/* <SocialCircle  link={props.g}/>
            <SocialCircle link={props.l}/>
            <SocialCircle link={props.i}/> */}
            {/* <SocialIcon url={props.g}/>
            <SocialIcon url={props.l}/>
            <SocialIcon url={props.i}/> */}
            <div className={styles.shakeHover}>
            <a className={styles.aHover} href={props.i}><FaInstagram style={iconStyle} size="2rem" color="black"/></a>
            <a className={styles.aHover} href={props.g}><FaGithub style={iconStyle} size="2rem" color="black"/></a>
            <a className={styles.aHover} href={props.l}><FaLinkedin style={iconStyle} size="2rem" color="black"/></a>
            </div>
        </div>
    );
};

export default CircleRow;