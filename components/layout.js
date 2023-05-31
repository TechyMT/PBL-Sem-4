import Navbar from "./header";
import Footer from "./footer"
export default function Layout({ children }) {
  const styleLayout={
    width:"100%"
  }
  return <div className={styleLayout}> 
    <div
          id="canvas-container"
          // ref={bgRef}
          style={{
            // background:
            //   "linear-gradient(90deg, rgba(0,1,6,0.3) 0%, rgba(0,1,6,0.8939950980392157) 50%, rgba(0,1,6,0.3) 100%), url('https://user-images.githubusercontent.com/26748614/96337246-f14d4580-1085-11eb-8793-a86d929e034d.jpg')",
            objectFit: "cover",
            height: "100vh",
            width: "100vw",
            position: "fixed",
            // zIndex: -1,
            backgroundSize: "cover",
            backgroundRepeat: "no-repeat",
          }}
        ></div>
    <Navbar />
    {children}
    <Footer />
    </div>;
    
}
