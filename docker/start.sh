#/bin/sh

# rm -f agent-key agent-key.pub

# ssh-keygen -f agent-key -m PEM -t rsa -N ""
# pub_key="$(cat agent-key.pub)"
pub_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCi1Lvhyh0nvQkBnxKvKVplYs1XUmX7iX8nXPtifdcAi0rphJZ0IvNItqI2lpUsMFxSmxSMHzZTW1zO5gft6piZN7pfpx>

docker build --tag jenkins/arm-agent:lts https://github.com/labmicro/ci.git#master:docker
docker run -d --restart=on-failure --name "jenkins.agent" --privileged -v /dev/bus/usb:/dev/bus/usb -v /dev/ttyUSB1:/dev/ttyUSB1 jenkins/arm-agent:lts "$pub_key"
