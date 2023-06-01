const fs = require("fs");
const { exec } = require("child_process")
const path  = require("path");

export default function handler(req, res) {
  const links = req.body;

  // Create a file named 'url.txt'

  // Append the links to the file
  links.forEach((link) => {
    fs.appendFileSync('url.txt', link + '\n');
  });

  // Execute the .bat file
  const relativePath = path.join(__dirname,"..","..","..","..","\download_print.bat");
  exec(relativePath, (error, stdout, stderr) => {
    if (error) {
      console.error(`Error executing .bat file: ${error.message}`);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }

    console.log('Command executed successfully');
    console.log('stdout:', stdout);
    console.log('stderr:', stderr);

    // Send a JSON response indicating successful execution
    res.status(200).json({ message: 'Bat file executed successfully' });
  });

  
}
