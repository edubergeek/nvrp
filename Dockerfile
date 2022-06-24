FROM nvcr.io/nvidia/rapidsai/rapidsai:22.02-cuda11.2-runtime-ubuntu20.04
RUN apt-get update && apt-get install -y ffmpeg libsm6 libxext6
WORKDIR /ml
RUN pip install --upgrade pip
#RUN pip install keras
#RUn pip install git+https://www.github.com/keras-team/keras-contrib.git
#RUN pip install matplotlib numpy scipy pillow scikit-image pdbpp pandas sklearn 
COPY root.bashrc /tmp
RUN cat /tmp/root.bashrc >>/root/.bashrc && rm -f /tmp/root.bashrc
