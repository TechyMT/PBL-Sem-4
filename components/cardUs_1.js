import styles from "../styles/cardUs.module.css";
import CardData from "./cardData";
import Profile from "./profile";
import Data from "./data";
import CircleRow from "./circleRow";

// import {useSpring, animated} from 'react-spring'
// const props=useSpring({opacity:1,from:{opacity:0}})

function CardUs(props) {
  return (
    <div className={styles.cardUs}>
      <Profile name={props.n} />

      <Data className={styles.title} title={props.t} desc={props.d} />
      <div className={styles.child}>
        <CircleRow styles={styles.aHover} g={props.lg} l={props.ll} i={props.li} />
      </div>
    </div>
  );
}

export default CardUs;
