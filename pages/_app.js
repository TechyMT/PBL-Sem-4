import { useState, useEffect } from 'react';
import { useRouter } from 'next/router';
import LoadingScreen from '../components/LoadingScreen';
import "../styles/globals.css"
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
      {loading && <LoadingScreen />}
      <Component {...pageProps} />
    </>
  );
}

export default MyApp;
