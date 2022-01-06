Car_Base: Car_Base.cpp
	g++ -c Car_Base.cpp

all: Car_Base.o
	g++ onix_bot_test.cpp -o onix_bot_test
	g++ test.cpp -o test
	g++ onix_bot.cpp Car_Base.o -o onix_bot -pthread
