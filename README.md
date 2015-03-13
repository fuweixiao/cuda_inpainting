# cuda_inpainting
This project is a web service for image inpainting. 

The backend is build with flask, which requires python 2.7 and flask.
You can install flask simply by running this:
```
sudo pip install flask
```
We use opencv to load images, if you don't have it on your computer, run this:
```
sudo apt-get install libopencv-dev
```
You can run the web service like this:
```
python flaskserver.py
```
The default port for the web is 5000, you can go to this address http://your ip:5000 in your web browser to load the web and do tests.

Simply choose a file and upload it. Select a frame in the picture then click inpainting. The new image will show up on the right. If you want to reselect the frame or restart, just click clear.

We've also done optimization with CUDA, which speeds it up by 350x. If you have a GPU and CUDA installed on your computer, you can run the CUDA version like this.
```
python flaskserver.py CUDA
```


