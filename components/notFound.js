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
      <Image src="/noresults.png" width={577} height={433}  alt="imagenotfound"/>
    </div>
  );
}

