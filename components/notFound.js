import Image from "next/image";

export default function ImgNotFound() {
    
  return (
    <div
      style={{
        display: "block",
        marginLeft: "auto",
        marginRight: "auto",
        width: "35%",
      }}
    >
      <Image  src="/noresults.png" width={0} height={0} sizes="100vw" style={{width:"auto", height:"auto"}} alt="imagenotfound"/>
    </div>
  );
}

