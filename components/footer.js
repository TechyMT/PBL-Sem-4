import styles from "../styles/header.module.css";
import Image from "next/image";
export default function Footer() {
  return (
    <div className={styles.nav}>
      <p className={styles.footerColor}>
        developed with {" "}
        <span className={styles.wave}>❤️</span>
        {' '} by Web Team.
      </p>
    </div>
  );
}
