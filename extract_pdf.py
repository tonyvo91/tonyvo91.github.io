#!/usr/bin/env python3
import PyPDF2
import json
import sys
import os

def extract_pdf_text(pdf_path):
    try:
        with open(pdf_path, 'rb') as file:
            reader = PyPDF2.PdfReader(file)
            text = ""
            for page in reader.pages:
                text += page.extract_text() + "\n"
            return text
    except Exception as e:
        return f"Error extracting PDF content: {str(e)}"

if __name__ == "__main__":
    pdf_path = os.path.join(os.getcwd(), "data", "[Tung_Vo_Resume_2025].pdf")
    text_content = extract_pdf_text(pdf_path)
    print(text_content)
