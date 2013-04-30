# Junior's Makefile
# Cesar Mora Castro 2013
OUTPUTDIR = ./
TARGET = $(OUTPUTDIR)junior
OBJSDIR = ./obj/
INCDIR = ./include/
SRCDIR = ./src/
CXX = g++
CXXFLAGS = -Wall -c -O2

# Compilation mode
ifeq ($(mode), release) # Release mode
	CXXFLAGS += -O2
else # Debug mode
	CXXFLAGS += -ggdb
endif

# Libraries
LDFLAGS =

# Includes
INCFLAGS = -I$(INCDIR)

# Objects
OBJSCRUDE = DBAgent.o EnglishParser.o

OBJS= $(addprefix $(OBJSDIR),$(OBJSCRUDE))


# Rules
all:  $(SRCDIR)junior.cpp $(OBJS)
	$(CXX) $(OBJS) $< -Wall $(LDFLAGS) $(INCFLAGS) -o $(TARGET)

# Compilation rules
$(OBJSDIR)%.o: $(SRCDIR)/%.cpp $(INCDIR)/%.h
	$(CXX) -o $@ $< $(CXXFLAGS) $(INCFLAGS) $(LDFLAGS)

clean:
	rm -Rf $(OBJSDIR) $(OUTPUTDIR) *~