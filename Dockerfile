FROM ubuntu:disco

LABEL maintainer="Kilian Werner <kwerner@rhrk.uni-kl.de>"

RUN useradd -ms /bin/bash myUser

USER root

COPY preliminaries.sh /home/myUser
RUN /home/myUser/preliminaries.sh

COPY mpitest.c opt/
COPY mpi.sh /home/myUser
RUN /home/myUser/mpi.sh

COPY hpx-requirements.sh /home/myUser
RUN /home/myUser/hpx-requirements.sh

COPY hpx.sh /home/myUser/
COPY slurm_environment.cpp /home/myUser/
RUN /home/myUser/hpx.sh

WORKDIR /home/myUser

COPY MinimalExample /home/myUser/MinimalExample
COPY build.sh /home/myUser
RUN /home/myUser/build.sh

USER myUser
