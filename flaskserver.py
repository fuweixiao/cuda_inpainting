from flask import Flask, render_template, request
app = Flask(__name__)

@app.route('/')
def loadpage(name = 'YYY'):
    return render_template('index.html', name = name)
@app.route('/upload', methods = ['GET', 'POST'])
def upload_file():
    print "hehe"
    if request.method == 'GET':
        return render_template('index.html')
    if request.method == 'POST':
        f = request.files["file"]
        print "test!"
        f.save('/home/smile/workspace/cuda_inpainting/uploads/test.img')
        return render_template('index.html')
if __name__ == '__main__':
    app.debug = True;
    app.run('0.0.0.0')
