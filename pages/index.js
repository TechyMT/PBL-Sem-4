import styles from "../styles/home.module.css";
import Link from "next/link";
import Image from "next/image";
import Layout from "../components/layout";

export default function App() {
  return (
    <Layout>
    <div>
      <div className={styles.center}>
        <Image src="/logo.png" width={737} height={338} />
      </div>
      <h1>Hello World</h1>
      <Link href="/request">
      <button > To request </button>
      </Link>
      <Link href="/first">
      <button > To first </button>
      </Link>
    </div>
    </Layout>
  );
}
