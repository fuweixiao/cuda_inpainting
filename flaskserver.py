from flask import Flask, render_template, request, url_for, jsonify
from PIL import Image
import os, sys
import uuid
app = Flask(__name__)
binfile = 'cpp/inpaiting'
port = 9000

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
        path = 'static/' + inputname + '.png'
        f.save(path)
        size = [600,600]
        img = Image.open(path)
        image = img.resize((600, 600), Image.ANTIALIAS)
        image.save(path)
        return render_template('index.html', name = 'static/' + inputname + '.png', inpainting = False)
@app.route('/inpainting', methods = ['GET','POST'])
def inpainting():
    if request.method == 'GET':
        return render_template('index.html')
    if request.method == 'POST':
        args = request.get_json(force=False, silent=False, cache=True)
	imgpath = args["src"].split(str(port) + '/')[-1]
	#img = Image.open(args["src"].split(str(port) + '/')[-1])
	
	#save output
	output = str(uuid.uuid4())
        outputpath = 'static/' + output + '.jpg' 
	
	#run cpp for image inpainting
        cmd = binfile + ' '  + imgpath + ' ' + args["x"] + 'h ' + args["y"] + ' ' + args["width"] + ' ' + args["height"] + ' ' + outputpath + ' ' + '10' 
        os.system(cmd);
        return jsonify(address = "static/" + output + '.jpg' )
if __name__ == '__main__':
    if len(sys.argv) == 2 and sys.argv[1] == 'CUDA':
    	print "Running CUDA version"
	binfile = 'cuda/inpainting'
    else:
        print "Running CPP version"
    app.debug = True;
    app.run('0.0.0.0', port)
