function SectionHeading(props){
    const headingStyle={
        color:'azure',
        textAlign:'center',
        marginTop:'5rem',
    }
    return(
        <h1 style={headingStyle}>{props.title}</h1>
    );
};

export default SectionHeading;