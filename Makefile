##
## EPITECH PROJECT, 2024
## B-ASM-400-MAR-4-1-asmminilibc-meddi.gueran
## File description:
## Makefile
##

SRC = src/strlen.s \
      src/strchr.s \
      src/memset.s \
      src/memcpy.s \
      src/memmove.s \
      src/strrchr.s \
      src/strcmp.s \
      src/strncmp.s \
      src/strcasecmp.s \
      src/strstr.s \
	src/strpbrk.s \
	src/strcspn.s \

OBJ = $(SRC:.s=.o)

NAME = libasm.so

all: $(NAME)

$(NAME): $(OBJ)
	ld -shared -o $(NAME) $(OBJ)

%.o: %.s
	nasm -f elf64 $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
