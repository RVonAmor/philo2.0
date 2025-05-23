NAME	= philo
CC		= cc
# Default maximum number of philosophers (can be overridden with make MAX_PHILOS=n)
MAX_PHILOS ?= 250
CFLAGS	= -Werror -Wall -Wextra -pthread
MAX_PHILOS ?= 250
CFLAGS	= -Werror -Wall -Wextra -pthread -g3

# Run 'make re MODE=pretty' for color formatting.
# Run 'make re MODE=pretty' for color formatting.
# Run 'make re MODE=debug' for debug formatting.
# Run 'make re MAX_PHILOS=n' to set a custom maximum number of philosophers.
MODE	= none
ifeq ($(MODE), pretty)
	CFLAGS	+= -D DEBUG_FORMATTING=1
endif
ifeq ($(MODE), debug)
	CFLAGS	+= -D DEBUG_FORMATTING=1 -fsanitize=thread -g
endif

# Add compiler flags to pass MAX_PHILOS values
CFLAGS += -D MAX_PHILOS=$(MAX_PHILOS) -D STR_MAX_PHILOS=\"$(MAX_PHILOS)\"

# Add compiler flags to pass MAX_PHILOS values
CFLAGS += -D MAX_PHILOS=$(MAX_PHILOS) -D STR_MAX_PHILOS=\"$(MAX_PHILOS)\"

SRC_PATH = sources/
OBJ_PATH = objects/

SRC		=	main.c \
			parsing.c \
			grim_reaper.c \
			time.c \
			philosopher.c \
			init.c \
			output.c \
			exit.c
SRCS	= $(addprefix $(SRC_PATH), $(SRC))
OBJ		= $(SRC:.c=.o)
OBJS	= $(addprefix $(OBJ_PATH), $(OBJ))

INC		= -I ./includes/

all: $(NAME)

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@mkdir -p $(OBJ_PATH)
	$(CC) $(CFLAGS) -c $< -o $@ $(INC)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

clean:
	rm -rf $(OBJ_PATH)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all re clean fclean