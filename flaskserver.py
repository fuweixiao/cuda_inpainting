from flask import Flask, render_template, request, url_for, jsonify
from PIL import Image
import os
import uuid
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
        inputname = str(uuid.uuid4())
        print inputname
        global path
        path = '/home/smile/workspace/cuda_inpainting/static/' + inputname + '.png'
        f.save(path)
        size = [600,600]
        img = Image.open(path)
        #img.thumbnail(size, Image.ANTIALIAS)
        image = img.resize((600, 600), Image.ANTIALIAS)
        image.save(path)
        return render_template('index.html', name = 'static/' + inputname + '.png', inpainting = False)
@app.route('/inpainting', methods = ['GET','POST'])
def inpainting():
    if request.method == 'GET':
        return render_template('index.html')
    if request.method == 'POST':
        img = Image.open(path)
        #img.save('/home/smile/workspace/cuda_inpainting/static/done.jpg')
        args = request.get_json(force=False, silent=False, cache=True)
        output = str(uuid.uuid4())
        outputpath = '/home/smile/workspace/cuda_inpainting/static/' + output + '.jpg' 
        cmd = 'cpp/inpainting ' + path + ' ' + args["x"] + 'h ' + args["y"] + ' ' + args["width"] + ' ' + args["height"] + ' ' + outputpath + ' ' + '10' 
        os.system(cmd);
        return jsonify(address = "static/" + output + '.jpg' )
if __name__ == '__main__':
    app.debug = True;
    app.run('0.0.0.0')
