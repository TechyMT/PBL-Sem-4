import { useState, useEffect } from 'react';
import { useRouter } from 'next/router';
import LoadingScreen from '../components/LoadingScreen';
import "../styles/globals.css"
import Head from "next/head"

function MyApp({ Component, pageProps }) {
  const [loading, setLoading] = useState(false);
  const [isMounting, setIsMounting] = useState(true);
  const router = useRouter();

  useEffect(() => {
    const handleStart = () => {
      if (!isMounting) {
        setLoading(true);
      }
    };

    const handleComplete = () => {
      setInterval(() => {setLoading(false);},5000)
    };

    router.events.on('routeChangeStart', handleStart);
    router.events.on('routeChangeComplete', handleComplete);
    router.events.on('routeChangeError', handleComplete);

    setIsMounting(false);

    return () => {
      router.events.off('routeChangeStart', handleStart);
      router.events.off('routeChangeComplete', handleComplete);
      router.events.off('routeChangeError', handleComplete);
    };
  }, [router, isMounting]);

  return (
    <>
      <Head>
      <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
      <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png "/>
      <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png"/>
      <link rel="manifest" href="/site.webmanifest"/>
      <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5"/>
      <meta name="msapplication-TileColor" content="#da532c"/>
      <meta name="theme-color" content="#252525"/>
    </Head>
      {loading && <LoadingScreen />}
      <Component {...pageProps} />
    </>
  );
}

export default MyApp;
