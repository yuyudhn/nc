CC_i686 = i686-w64-mingw32-gcc
CC_x86_64 = x86_64-w64-mingw32-gcc

CFLAGS_i686 = -DNDEBUG -DWIN32 -D_CONSOLE -DTELNET -DGAPING_SECURITY_HOLE
LDFLAGS_i686 = -s -lkernel32 -luser32 -lwsock32 -lwinmm

CFLAGS_x86_64 = -DNDEBUG -DWIN64 -D_CONSOLE -DTELNET -DGAPING_SECURITY_HOLE -m64
LDFLAGS_x86_64 = -s -m64 -lkernel32 -luser32 -lwsock32 -lwinmm

SRC = getopt.c doexec.c netcat.c

all: nc32.exe nc64.exe

nc32.exe: $(SRC)
	$(CC_i686) $(CFLAGS_i686) $(SRC) $(LDFLAGS_i686) -o $@

nc64.exe: $(SRC)
	$(CC_x86_64) $(CFLAGS_x86_64) $(SRC) $(LDFLAGS_x86_64) -o $@

clean:
	rm -f nc32.exe nc64.exe
