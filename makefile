# Build all: make all
# Build seq: make sequential
# Build par: make parallel
# Clean: make clean

# Compiler and flags
CXX = g++
CXXFLAGS = -fopenmp

all: sequential/seq.out parallel/par.out

sequential/seq.out: sequential/seq.cpp
	$(CXX) $(CXXFLAGS) -o sequential/seq.out sequential/seq.cpp
	@echo "Build sequential program complete."

parallel/par.out: parallel/par.cpp
	$(CXX) $(CXXFLAGS) -o parallel/par.out parallel/par.cpp
	@echo "Build parallel program complete."

sequential: sequential/seq.out
parallel: parallel/par.out

clean:
	rm -f sequential/seq.out parallel/par.out
	@echo "Clean complete."