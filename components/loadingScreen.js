import Image from "next/image";
import styles from "../styles/loader.module.scss";

const LoadingScreen = () => {
  return (
    <div className={styles.screen}>
      <div className={styles.center}>
        <Image src="/logo.png"  width={369} height={169} alt ="logo" />
        <div className={styles.balls}>
          <div className={`${styles.ball} ${styles.one}`}></div>
          <div className={`${styles.ball} ${styles.two}`}></div>
          <div className={`${styles.ball} ${styles.three}`}></div>
        </div>
      </div>
    </div>
  );
};

export default LoadingScreen;
