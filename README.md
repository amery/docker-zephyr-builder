
# Install launcher
```
cd projects/docker
git clone https://github.com/amery/docker-zephyr-builder
cd docker-zephyr-builder
ln -s $PWD/run.sh ~/bin/docker-zephyr-builder
```

# Build Zephyr example
```
cd projects
git clone https://github.com/zephyrproject-rtos/zephyr
cd zephyr/samples/hello_world
mkdir build
cd build
docker-zephyr-build -DBOARD=stm32f411e_disco ..
```
