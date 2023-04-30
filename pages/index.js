import styles from "../styles/home.module.css";
import Link from "next/link";
import Image from "next/image";
import TeamCard from "../components/teamCard"
import Layout from "../components/layout";
import PButton from "../components/button";

export default function App() {
  return (
    <div>
      <div className={styles.center}>
        <Image src="/logo.png" width={737} height={338} />
      </div>
      <h1>Hello World</h1>
      <Link href="/request">
      <button > To request </button>
      </Link>
      <Link href="/accept">
      <button > To Accept </button>
      </Link>
      <TeamCard />
    </div>
  );
}
