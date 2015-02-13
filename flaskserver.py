from flask import Flask, render_template, request, url_for
app = Flask(__name__)

@app.route('/')
def loadpage(name = None):
    return render_template('index.html', name = name)
@app.route('/upload', methods = ['GET', 'POST'])
def upload_file():
    if request.method == 'GET':
        return render_template('index.html')
    if request.method == 'POST':
        f = request.files["file"]
        f.save('/home/smile/workspace/cuda_inpainting/static/test.png')
        print url_for('static', filename='test.png')
        return render_template('index.html', name = 'uploaded')
if __name__ == '__main__':
    app.debug = True;
    app.run('0.0.0.0')
