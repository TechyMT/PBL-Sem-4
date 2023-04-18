import "../styles/globals.css"
import LoadingScreen from "../components/LoadingScreen";
import {useRouter} from "next/router";
import { useEffect, useState, Fragment} from "react";




function MyApp({ Component, pageProps }) {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setTimeout(() => {
        setLoading(false);
      }, 3000);
  }, []);

  return (
    <>
      {!loading ? (
        <Fragment>
          <Component {...pageProps} />
          </Fragment>
      ) : (
        <LoadingScreen />
      )}
    </>
  );
}

export default MyApp