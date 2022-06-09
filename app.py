"""
该脚本
"""
from flask import Flask, request, redirect
import webbrowser
import urllib.parse

app = Flask(__name__)


@app.route("/search", methods=["GET"])
def hello_world(q=None):
    q = urllib.parse.quote(request.args.get("q"))
    logseq_page_url = f"logseq://graph/Documents?page={q}"
    return redirect(logseq_page_url)

if __name__ == "__main__":
    app.run(port=1234)
