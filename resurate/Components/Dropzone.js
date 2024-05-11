"use client";
import Dropzone from "react-dropzone";

const Dropzoner = ({handleChange}) => {
  return (
    <Dropzone onDrop={handleChange}>
      {({ getRootProps, getInputProps }) => (
        <section className="border rounded-md p-10" >
          <div {...getRootProps()}>
            <input {...getInputProps()} />
            <p className="text-gray-500">Drag 'n' drop some files here, or click to select files</p>
          </div>
        </section>
      )}
    </Dropzone>
  );
};

export default Dropzoner;
