import styles from "../styles/header.module.css";
import Link from "next/link";

export default function Navbar() {
  const linkStyle = {
    textDecoration: "none",
  };

  return (
    <div className={styles.nav}>
      <div className={styles.logo}>
        <Link style={linkStyle} href="/">
          <h1 className={styles.color_1}>
            Prin<span className={styles.color_2}>tEZ</span>
          </h1>
        </Link>
      </div>
      <div className={styles.linksContainer}>
        <div className={styles.links}>
          <Link style={linkStyle} href="/accept">
            <p className={styles.color_3}>Collect</p>
          </Link>
        </div>
        <div className={styles.links}>
          <Link style={linkStyle} href="/request">
            <p className={styles.color_3}>Print</p>
          </Link>
        </div>
        <div className={styles.links}>
          <Link style={linkStyle} href="/history">
            <p className={styles.color_3}>History</p>
          </Link>
        </div>
      </div>
    </div>
  );
}
