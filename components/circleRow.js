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
    // const iconStyle ={
    //     margin:'10px'
    // }
    return(
        <div style={rowStyle}>
            {/* <SocialCircle  link={props.g}/>
            <SocialCircle link={props.l}/>
            <SocialCircle link={props.i}/> */}
            {/* <SocialIcon url={props.g}/>
            <SocialIcon url={props.l}/>
            <SocialIcon url={props.i}/> */}
            <div>
            <a  href={props.i}><FaInstagram className={props.styles} id="insta" size="1.5rem" /></a>
            <a  href={props.g}><FaGithub className={props.styles} id="git" size="1.5rem" /></a>
            <a  href={props.l}><FaLinkedin className={props.styles} id="linkedIn" size="1.5rem" /></a>
            </div>
        </div>
    );
};

export default CircleRow;