import styles from "../styles/accept.module.css";
import PButton from "../components/button";
import { useState, useEffect, useRef } from "react";
import { handleAccept } from "../configs/firebaseConfig";
import Preview from "../components/pdfPreview";
import ImgNotFound from "../components/notFound";
import Layout from "../components/layout";
import SectionHeading from "../components/sectionHeading";
import Head from "next/head";

export default function App() {
  const [inputValue, setInputValue] = useState("");
  const [result, setResult] = useState([]);
  const [isClicked, setIsClicked] = useState(false);

  const inputRefs = [
    useRef(null),
    useRef(null),
    useRef(null),
    useRef(null),
    useRef(null),
  ];

  useEffect(() => {
    const handleInput = (event, index) => {
      const newValue = event.target.value;

      if (event.key === "Backspace" && newValue.length === 0) {
        setInputValue("");
        // Backspace was pressed and input is empty
        if (index > 0) {
          // Move focus to previous input element
          inputRefs[index - 1].current.focus();
          // Clear previous input element value
          inputRefs[index - 1].current.value = "";
          // Set cursor position at the end of previous input element
          const length = inputRefs[index - 1].current.value.length;
          inputRefs[index - 1].current.setSelectionRange(length, length);
        }
      } else if (newValue.length === 1) {
        // Input is not empty, move focus to next input element if available
        if (index < inputRefs.length - 1) {
          inputRefs[index + 1].current.focus();
        } else {
          const newInputValue = inputRefs.reduce(
            (acc, ref) => acc + ref.current.value,
            ""
          );
          setInputValue(newInputValue);
        }
      }
    };

    inputRefs.forEach((ref, index) => {
      ref.current.addEventListener("input", (event) => {
        handleInput(event, index);
      });
    });

    return () => {
      inputRefs.forEach((ref, index) => {
        ref.current &&
          ref.current.removeEventListener("input", (event) => {
            handleInput(event, index);
          });
      });
    };
  }, [inputRefs, inputValue]);

  async function handleClick(event) {
    setIsClicked(true);
    event.preventDefault();

    const id = inputValue;
    const files = await handleAccept(id);
    if (files.length > 0) {
      setResult([...files]);
    } else {
      setResult([]);
    }
    const resultContainer = document.getElementById("result");
    if (resultContainer) {
      resultContainer.scrollIntoView({ behavior: "smooth" });
    }
  }

  return (
    <Layout>
      <Head>
          <meta name="viewport" content="initial-scale=1, width=device-width" />
          <title>Collect</title>
        </Head>
      <div>
        <h1 className={styles.heading} style={{ color: "azure", textAlign: "center", marginTop: "5rem" }}>
          COLLECT YOUR PRINTS
        </h1>
        {/* <SectionHeading title="COLLECT YOUR PRINTS"/> */}

        <div className={styles.body}>
          <form className={styles.form} onSubmit={handleClick}>
            <div className={styles.inputContainer}>
              <input
                className={styles.input}
                type="text"
                id="input1"
                name="input1"
                maxLength="1"
                ref={inputRefs[0]}
              />

              <input
                className={styles.input}
                type="text"
                id="input2"
                name="input2"
                maxLength="1"
                ref={inputRefs[1]}
              />

              <input
                className={styles.input}
                type="text"
                id="input3"
                name="input3"
                maxLength="1"
                ref={inputRefs[2]}
              />

              <input
                className={styles.input}
                type="text"
                id="input4"
                name="input4"
                maxLength="1"
                ref={inputRefs[3]}
              />

              <input
                className={styles.input}
                type="text"
                id="input5"
                name="input5"
                maxLength="1"
                ref={inputRefs[4]}
              />
            </div>
            <div className={styles.buttonContainer}>
              <button  type="submit">Verify</button>
            </div>
          </form>
          {/* <p>{inputValue}</p> */}
        </div>
        <div className={styles.resultContainer} id="result">
          {" "}
          <ul>
            {result.length > 0 ? (
              <div>
                {result.map((file, index) => (
                  <Preview url={file} />
                ))}
              </div>
            ) : isClicked ? (
              <div className={styles.imgContainer}>
                <ImgNotFound />
              </div>
            ) : (
              <div></div>
            )}
          </ul>
        </div>
      </div>
    </Layout>
  );
}
