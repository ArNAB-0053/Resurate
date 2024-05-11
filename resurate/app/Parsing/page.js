"use client";
import React, { useState, useEffect } from "react";
import axios from "axios";
import Dropzoner from "@/Components/Dropzone";

const Parsing = () => {
  const [resumes, setResumes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [file, setFile] = useState(null);
  const [uploadMsg, setUploadMsg] = useState("");

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const response = await axios.get("http://127.0.0.1:3000/");
      const data = response.data;
      const resumesArray = Object.keys(data).map((key) => ({
        name: data[key].Name,
        percentage: data[key].Percentage,
      }));
      setResumes(resumesArray);
      setLoading(false);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };

  const sortResumes = () => {
    const sortedResumes = [...resumes].sort(
      (a, b) => b.percentage - a.percentage
    );
    setResumes(sortedResumes);
  };

  const handleFileChange = (e) => {
    const selectedFile = e.target.files[0];
    setFile(selectedFile);
  };

  const uploadResume = async () => {
    if (!file) return;
    try {
      const formData = new FormData();
      formData.append("resume", file);
      await axios.post("http://127.0.0.1:3000/", formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });
      // Fetch data again after upload
      fetchData();
      // Show upload message
      setUploadMsg("Resume uploaded successfully!");
    } catch (error) {
      console.error("Error uploading resume:", error);
    }
  };

  return (
    <div className="pt-8 flex flex-col space-y-5 justify-center items-center">
      <div className="space-y-4 flex justify-center items-center flex-col">
        <div className="border rounded-md p-10">
          <input type="file" accept=".pdf" onChange={handleFileChange} />
        </div>

        {/* <Dropzoner handleChange = {handleFileChange}/> */}
        <button
          className="border-2 border-black w-fit flex items-center justify-center border-solid px-2 py-1 ml-2"
          onClick={uploadResume}
        >
          Upload Resume
        </button>
        {uploadMsg && <div className="text-green-500 mt-2">{uploadMsg}</div>}
      </div>
      {loading ? (
        <div>Loading...</div>
      ) : (
        <div className="shadow-lg p-4 w-1/2 space-y-3 border ">
          {resumes.map((resume, index) => (
            <div key={index}>
              <div>Name: {resume.name}</div>
              <div>Score: {resume.percentage}</div>
            </div>
          ))}
         
          
        </div>
      )}
       <div className="flex justify-center items-center">
          <button
            className="border-2 border-black border-solid px-2 py-1 mt-4"
            onClick={sortResumes}
          >
            Sort Resumes
          </button>
          </div>
    </div>
  );
};

export default Parsing;
