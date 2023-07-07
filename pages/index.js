import styles from "../styles/home.module.css";
import Link from "next/link";
import Image from "next/image";
import Layout from "../components/layout";
import CardUs from "../components/cardUs_1";
import Head from "next/head";
import aboutUs from "../components/aboutUs";

function createEntry(details) {
  const { id, n, t, d, lg, ll, li } = details;
  return <CardUs key={id} n={n} t={t} d={d} lg={lg} ll={ll} li={li} />;
}
export default function App() {
  return (
    <Layout>
      <Head>
        <meta name="viewport" content="initial-scale=1, width=device-width" />
        <title>Home</title>
      </Head>
      <div>
        <div className={styles.center}>
          <Image
            className={styles.image}
            src="/logo.png"
            width={0}
            height={0}
            sizes="100vw"
            alt="logo"
          />
        </div>
        <div className={styles.centerMiddle}>
          <div className={styles.div1}>
            <div className={styles.div2}>
              <h1> " What is PrintEZ? "</h1>
              <h2>
                <i>Print at your Ease</i>
              </h2>
              <div className={styles.content}>
                <p>
                  In today's digital age, there are various applications that
                  allow users to store and manage their documents online.
                </p>
                <p>
                  However, there are times when a physical copy of a document is
                  required.
                </p>
                <p>
                  So this app helps to upload or scan documents or images and
                  then print them according to the user’s specifications.{" "}
                </p>
              </div>
            </div>
          </div>
        </div>
        <div className={styles.centerButtons}>
          <Link href="/request">
            <button className={styles.request}> Print docs </button>
          </Link>
          <Link href="/accept">
            <button className={styles.accept}>Collect</button>
          </Link>
          <Link href="/history">
            <button className={styles.history}>History</button>
          </Link>
          <br></br>
        </div>
        <div className={styles.sectionStyle}>
          <h1>ABOUT US</h1>
          <div className={styles.centerCards}>
            <section className={styles.aboutCards}>
              {aboutUs.map(createEntry)}
            </section>
          </div>
        </div>
      </div>
    </Layout>
  );
}
