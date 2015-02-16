from flask import Flask, render_template, request, url_for, jsonify
from PIL import Image
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
        size = [1600,1600]
        img = Image.open('/home/smile/workspace/cuda_inpainting/static/test.png')
        #img.thumbnail(size, Image.ANTIALIAS)
        img.save('/home/smile/workspace/cuda_inpainting/static/test.jpg')
        return render_template('index.html', name = 'uploaded', inpainting = False)
@app.route('/inpainting', methods = ['GET','POST'])
def inpainting():
    if request.method == 'GET':
        return render_template('index.html')
    if request.method == 'POST':
        img = Image.open('/home/smile/workspace/cuda_inpainting/static/test.png')
        img.save('/home/smile/workspace/cuda_inpainting/static/done.jpg')
        print request.get_json(force=False, silent=False, cache=True)
        return jsonify(address = "static/done.jpg" )
if __name__ == '__main__':
    app.debug = True;
    app.run('0.0.0.0')
