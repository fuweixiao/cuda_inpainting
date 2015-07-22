# Image Inpainting Using Belief Propagation
This project is a web service for image inpainting. It is an implementation and optimization of the paper http://www.csd.uoc.gr/~komod/publications/docs/completion_cvpr2006.pdf

Below is the instructions for Linux(Ubuntu) users:

To download the code run:
```
git clone https://github.com/fuweixiao/cuda_inpainting.git
```
The backend is build with flask, which requires python 2.7 and flask.
You can install flask simply by running this:
```
sudo pip install flask
```
We use opencv to load images, if you don't have it on your computer(Ubuntu), run this:
```
sudo apt-get install libopencv-dev
```

To compile the code with both CPU and GPU:
```
make
```
To compile the code with only CPU:
```
make cpp
```
To compile the code with only GPU:
```
make cuda
```


You can run the web service like this:
```
python flaskserver.py
```
By default you run the CPU version of the code. The default port for the web is 9000, you can go to this address http://${YOUR_IP}:9000 in your web browser to load the web and do tests.

Simply choose a file and upload it. Select a frame in the picture then click inpainting. The new image will show up on the right. If you want to reselect the frame or restart, just click clear.

We've also done optimization with CUDA, which speeds it up by 350x. If you have a GPU and CUDA installed on your computer, you can run the CUDA version like this.
```
python flaskserver.py CUDA
```


