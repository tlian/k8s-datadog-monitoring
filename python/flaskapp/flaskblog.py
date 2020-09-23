import os
from flask import Flask, render_template, url_for
import logging as LOG

app = Flask(__name__)
DEFAULT_LOG_PATH = os.environ.get('LOG_PATH') if os.environ.get('LOG_PATH') else "/var/log/flashblog"
DEFAULT_LOG_FILE = "flashblog.log"

if not os.path.isdir(DEFAULT_LOG_PATH):
    os.makedirs(DEFAULT_LOG_PATH)
LOG.basicConfig(
    filename=os.path.join(DEFAULT_LOG_PATH, DEFAULT_LOG_FILE),
    format='%(asctime)s %(levelname)-8s %(message)s',
    level=LOG.INFO,
    datefmt='%Y-%m-%d %H:%M:%S'
)

posts = [
    {
        'author': 'Thawngzapum Lian',
        'title': 'SRE',
        'content': 'Alpha team',
        'date_posted': 'June, 2020'
    },
    {
        'author': 'Jane Doe',
        'title': 'SRE',
        'content': 'Beta team',
        'date_posted': 'June, 2020'
    }
]
@app.route("/")
@app.route("/home")
def home():
    LOG.info("GET /home")
    return render_template('home.html', posts=posts)

@app.route("/about")
def about():
    LOG.info("GET /about")
    return render_template('about.html', title='About')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
