import styles from "../styles/home.module.css";
import Link from "next/link";
import Image from "next/image";
import Layout from "../components/layout";
import CardUs from "../components/cardUs_1";
export default function App() {
  return (
    <Layout>
      <div>
        <div className={styles.center}>
          <Image className={styles.image} src="/logo.png" width={0} height={0} sizes="100vw"   alt="logo"/>
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
              In today's digital age, there are various applications that allow
              users to store and manage their documents online.
            </p>
            <p>
              However, there are times when a physical copy of a document is
              required.
            </p>
            <p>
              So this app helps to upload or scan documents or images and then
              print them according to the user’s specifications.{" "}
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
              <CardUs
               n="aunty" 
               t="Mustafa Trunkwala"
               d="Full Stack Web Developer"
               lg="https://github.com/TechyMT"
               ll="https://www.linkedin.com/in/mustafa-trunkwala-49249a22a/"
               li="https://www.instagram.com/nothim_7856/"
               />
              <CardUs 
                n="riya"
                t="Riya Wani"
                d="Frontend Developer,UI/UX designer"
                lg="https://github.com/Riyaa2610"
                ll="https://www.linkedin.com/in/riya-wani-114672229/"
                li="https://www.instagram.com/postcardsbyriya/"
              />
              <CardUs
                n="rhea1" 
                t="Rhea Shah" 
                d="UI/UX designer"
                lg="https://github.com/Rheaa21"
                ll="https://www.linkedin.com/in/rhea-shah-1b7a95253/"
                li="https://www.instagram.com/rheashah21/"
                />
              <CardUs 
                n="surana1" 
                t="Ameya Surana"
                d="App Developer"
                lg="https://github.com/FireFeast7"
                ll="https://www.linkedin.com/in/ameya-surana-b8a49b22a/"
                li="https://www.instagram.com/surana_ameya/"
              />
              <CardUs 
                n="amogh"   
                t="Amogh Thakurdesai"
                d="App Developer"
                lg="https://github.com/crazygolden"
                ll="https://www.linkedin.com/in/amogh-thakurdesai-5a3456149/"
                li="https://www.instagram.com/amoghptd/"
              />
            </section>
          </div>
        </div>
      </div>
    </Layout>
  );
}
