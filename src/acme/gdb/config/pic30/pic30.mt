# Target: Microchip dsPIC w/ simulator
TDEPFILES = pic30-tdep.o
TM_FILE = tm-pic30.h

SIM_OBS = remote-sim.o
SIM = ../sim/pic30/libsim.a ../sim/pic30/libsimpic30.a
