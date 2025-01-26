FT_PRINTF = ft_printf/libftprintf.a

CC = cc
CFLAGS = -Wall -Werror -Wextra

SERVER = server
CLIENT = client

SRCS_SERVER = server.c
SRCS_CLIENT = client.c
SRCS_SERVER_BONUS = server_bonus.c
SRCS_CLIENT_BONUS = client_bonus.c

OBJ_SERVER = $(SRCS_SERVER:.c=.o)
OBJ_CLIENT = $(SRCS_CLIENT:.c=.o)
OBJ_SERVER_BONUS = $(SRCS_SERVER_BONUS:.c=.o)
OBJ_CLIENT_BONUS = $(SRCS_CLIENT_BONUS:.c=.o)

all: $(SERVER) $(CLIENT)

$(SERVER): $(OBJ_SERVER) $(FT_PRINTF)
	$(CC) $(CFLAGS) $(OBJ_SERVER) ft_printf/libftprintf.a -o $(SERVER)
$(CLIENT): $(OBJ_CLIENT) $(FT_PRINTF)
	$(CC) $(CFLAGS) $(OBJ_CLIENT) ft_printf/libftprintf.a -o $(CLIENT)
$(FT_PRINTF):
	$(MAKE) -C ./ft_printf

bonus: $(OBJ_SERVER_BONUS) $(OBJ_CLIENT_BONUS) $(FT_PRINTF)
	$(CC) $(CFLAGS) $(OBJ_SERVER_BONUS) ft_printf/libftprintf.a -o $(SERVER)
	$(CC) $(CFLAGS) $(OBJ_CLIENT_BONUS) ft_printf/libftprintf.a -o $(CLIENT)

clean:
	$(MAKE) clean -C ./ft_printf
	rm -rf $(OBJ_SERVER) $(OBJ_CLIENT) $(OBJ_SERVER_BONUS) $(OBJ_CLIENT_BONUS)
fclean: clean
	$(MAKE) fclean -C ./ft_printf
	rm -rf $(SERVER) $(CLIENT)
re:	fclean all