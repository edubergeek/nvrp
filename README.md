# nvtp
NVIDIA Docker with RAPIDS TensorFlow Keras with X11 support

## build the image
docker build -t nvrp .

## run it on GPU 1
alias nvrp2-0='docker run --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 -it -v /home/${USER}/ml/:/ml/ -v /tmp/.X11-unix/:/tmp/.X11-unix -v "/home/$USER/.Xauthority:/tmp/Xauthority" --env="DISPLAY=${DISPLAY}" --env="CUDA_VISIBLE_DEVICES=0" -p "8888:8888" --gpus "device=0" nvrp'

## run it on GPU 2
alias nvrp2-1='docker run --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 -it -v /home/${USER}/ml/:/ml/ -v /tmp/.X11-unix/:/tmp/.X11-unix -v "/home/$USER/.Xauthority:/tmp/Xauthority" --env="DISPLAY=${DISPLAY}" --env="CUDA_VISIBLE_DEVICES=1" -p "8889:8888" --gpus 2 nvrp'

## run it on all GPUs
alias nvrp='source ~/ml/numerai/nairc;docker run -it --net=host -v /home/${USER}/ml/:/ml/ -v /tmp/.X11-unix/:/tmp/.X11-unix -v "/home/$USER/.Xauthority:/tmp/Xauthority" --env="DISPLAY=${DISPLAY}" --env="NAI_IDENTITY=${NAI_IDENTITY}" --env="NAI_SECRET=${NAI_SECRET}" --env="CUDA_VISIBLE_DEVICES=0,1" --gpus 2 nvrp'
