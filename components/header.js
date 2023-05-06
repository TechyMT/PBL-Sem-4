import styles from "../styles/header.module.css";
import Link from "next/link";

export default function Navbar() {
  const linkStyle={
    textDecoration:"none"
  }
  return (
    <div className={styles.nav}>
      <Link style={linkStyle} href="/"><h1 className={styles.color_1}>Prin<span className={styles.color_2}>tEZ</span></h1></Link>
    </div>
  );
}
