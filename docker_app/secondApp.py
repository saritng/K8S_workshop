from flask import Flask
import logging

app = Flask(__name__)

@app.route('/')
def hello():
    logging.info("before I say hello I say goodbye")
    return 'Here I am for the second time!'
    logging.info("after I say hello I say goodbye")

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5006)
