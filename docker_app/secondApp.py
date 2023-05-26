from flask import Flask
import logging

app = Flask(__name__)

@app.route('/')
def hello():
    logging.info("before I say hello I say goodbye")
    return 'Here I am again with latest version of my app!'
    logging.info("after I say hello I say goodbye")

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
