'use client'
import React, { useState } from "react";

const Job = () => {
  const [file, setFile] = useState(null);

  const handleFileChange = (e) => {
    const selectedFile = e.target.files[0];
    setFile(selectedFile);
  };

  const uploadJob = async () => {
    if (!file) return;
    try {
      const formData = new FormData();
      formData.append("jobFile", file);
      await axios.post("http://127.0.0.1:3000/", formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });
      // Handle success
      console.log("File uploaded successfully!");
    } catch (error) {
      // Handle error
      console.error("Error uploading file:", error);
    }
  };

  return (
    <div>
      <input
        type="file"
        accept=".pdf,.txt"
        onChange={handleFileChange}
      />
      <button
        className="border-2 border-black w-fit flex items-center justify-center border-solid px-2 py-1 ml-2"
        onClick={uploadJob}
      >
        Upload Job
      </button>
    </div>
  );
};

export default Job;

