//import Link from "next/link"
// import SocialIcon from "react-social-icons"

function SocialCircle(props){
    const circleStyle = {
        width: '30px',
        height: '30px',
        border:'solid',
        borderRadius: '50%',  
        borderWidth:'2px',
        color:'black',
        backgroundColor: 'white',
        margin:'12px',
        justifyContent:'center',
        alignItems:'top',
        padding:'5px'
    };
    return(
        <div style={circleStyle}>
            {/* <Image style={{borderRadius:'50%'}}
            src={props.imgSource} width={30} height={30}/> */}
            {/* <button href={props.imgLink}/> */}
            {/* <SocialIcon url="https://github.com/Riyaa2610"/> */}
            {/* <SocialIcon url={props.l}/>
            <SocialIcon url={props.i}/> */}
        </div>
    );
};

export default SocialCircle;