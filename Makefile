CC = gcc

CFLAGS = -march=native -O3 -flto -pipe
DEBUG = -g3 -ggdb3 -gdwarf -fvar-tracking
LDFLAGS = -fuse-linker-plugin -fuse-ld=mold -Wl,--color-diagnostics=always -Wl,-zrewrite-endbr

OBJ = $(wildcard src/*.c)
BUILD = build/
RELEASE_BUILD = $(BUILD)release/
DEBUG_BUILD = $(BUILD)debug/
NAME = shell

release:
	mkdir -pv $(RELEASE_BUILD)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJ) -o $(RELEASE_BUILD)$(NAME)

debug:
	mkdir -pv $(DEBUG_BUILD)
	$(CC) $(CFLAGS) $(DEBUG) $(LDFLAGS) $(OBJ) -o $(DEBUG_BUILD)$(NAME)
