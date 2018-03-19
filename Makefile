CC = gcc -g
CCASM = nasm

RM = rm -f

NAME = libasm.so
TESTNAME = test_exec

SRCS =	src/strchr.asm	\
		src/strlen.asm	\
		src/rindex.asm	\

OBJDIR = obj/

OBJS = $(SRCS:%.asm=$(OBJDIR)/%.o)

$(OBJDIR)/%.o : %.asm
	mkdir -p $(OBJDIR)
	mkdir -p $(@D)
	$(CCASM) -f elf64 -o $@ $<

all: $(NAME)

$(NAME): $(OBJS)
	ld -shared -o $(NAME) $(OBJS)

test-lib: re
	gcc -O0 -fno-builtin -g main.c -Wl,-rpath . -lasm -o test_exec

clean:
	$(RM) $(OBJS)
	$(RM) $(TESTNAME)
	$(RM) -r $(OBJDIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re

