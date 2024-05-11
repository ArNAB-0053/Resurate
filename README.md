# Resurate

Resurate is a machine learning-based application designed to streamline the resume screening process, enabling faster and more accurate candidate-job matching.

## Problem Statement

Traditional resume screening processes suffer from inefficiency and human bias, often involving time-consuming manual reviews that may inaccurately match candidates with job requirements. This inefficiency can impede swift talent acquisition and result in missing out on ideal candidates. Resurate addresses these challenges by leveraging machine learning to parse, filter, and rank resumes based on candidate suitability, significantly streamlining selection, accelerating hiring, and driving efficiency while remaining adaptable to future recruitment needs.

## Proposed Approach

We use machine learning for resume screening, aiming for faster, unbiased, and precise candidate-job matching. Our approach includes data collection, natural language processing (NLP)-based feature extraction, resume parsing, and a user-friendly interface for seamless deployment.

## Features

- **Automated Resume Parsing**: NLP-powered parsing extracts essential candidate information from resumes.
- **Customizable Ranking**: Quantifies candidate relevance based on job description, streamlining selection.
- **Bias Mitigation**: Eliminates human bias, ensuring fair and objective evaluations.

## How Resurate Works

1. **Collect Resumes**: First, we gather resumes from job applicants.
2. **Read Resumes**: Resurate reads through resumes to understand what skills and experience each person has.
3. **Match Resumes to Jobs**: It then matches these resumes to available job openings based on what the job requires.
4. **Show Results**:  Resurate gives a list of the best-matched resumes for each job.

## Why Use Resurate

- **Faster Hiring**: It helps companies find the right people for the job quickly.
- **Fairer Process**: Resurate removes human bias and treats everyone equally.
- **Easy to Use**: Its simple interface makes it easy to understand and use.

## TechStacks

- **Python**: Backend development and machine learning model training.
- **Flask**: Web framework for building the backend API.
- **Flutter**: Framework for building the cross-platform mobile application.
- **Node.js**: Backend for serving API requests in real-time.
- **Express.js**: Web framework for Node.js.
- **MongoDB**: Database for storing resume and job description data.

## Basic Workflow

1. **Data Collection**: Gather resumes and job descriptions.
2. **Preprocessing**: Prepare the resumes and job descriptions for parsing.
3. **Parsing**: Utilize Pyrespercer for NLP-based parsing, extracting essential information such as skills, experience, and education from the resumes.
4. **Ranking**: Implement a scoring system based on the extracted information to rank the resumes against the job descriptions.
5. **Bias Mitigation**: Apply techniques to ensure fair and unbiased evaluations, promoting diversity and inclusivity.
6. **Deployment**: Deploy the parsed and ranked resume system for real-time ranking of uploaded resumes against specified job descriptions.
