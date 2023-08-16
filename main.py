from flask import Flask, request, send_file
import os

app = Flask(__name__)

@app.get("/")
def homePage():
    return "Hello this is {} server :v0.0.9.9.1".format(os.getenv("ENV"))
