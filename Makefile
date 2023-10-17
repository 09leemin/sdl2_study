###########   © Mikel N. Legasa

##
### Executable, Objects and Dependencies
##

EX = Pong
OB = Game.o 
 #Excl. main.o - It has his own rule.
DP = Game.h

##
###
##

MAIN = $(wildcard *Main.cpp)
MAINo = $(patsubst %.cpp,%.o,$(MAIN))
CLDIR = $(EX) $(OB) *main.o *~ *save

##
### Compiler and linker
##

C = g++
CF = -w -Wall -Wextra -I. -std=c++11 -fpermissive #Compiler flags
LF = -w -Wall -Wextra -std=c++11 -fpermissive #Linker flags
SDLF = -lSDL2 -lSDL2_image -ldl #Additional SDL flags


##
### Rules
##

all: $(EX)

quoridor: $(EX)

$(EX):  $(MAINo) $(OB)
	$(C) $(LF) -o $@ $^ $(SDLF)

$(MAINo): $(MAIN) $(DP) $(OB)
	$(C) $(CF) -c -o $@ $<

$(OB): %.o:  %.cpp
	$(C) $(CF) -c -o $@ $<

### Cleanup
clean:
	rm -rf $(OB) *.o *~
###
cleanall:
	rm -rf $(CLDIR)
