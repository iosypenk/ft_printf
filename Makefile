# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iosypenk <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/10/26 16:39:49 by iosypenk          #+#    #+#              #
#    Updated: 2017/10/26 16:39:54 by iosypenk         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

CC = gcc

CFLAGS = -Wall -Wextra -Werror

SRC = ft_printf.c get_len_wid_pr.c get_sp_tp.c if_wid_pr.c ib.c					\
	if_flags_1.c if_flags_2.c print_1.c print_2.c print_3.c make_wchar.c

OBJ = $(SRC:.c=.o)

LIBFT := $(patsubst %.c,%.o,$(wildcard libft/*.c))

.PHONY: libft.a

all: $(NAME)

$(NAME): libft.a $(OBJ)
	ar rc $(NAME) $(OBJ) $(LIBFT)
	ranlib $(NAME)

libft.a:
	make -C ./libft

%.o : %.c
	$(CC) $(CFLAGS) -o $@ -c $< 

clean:
	rm -f $(OBJ)
	make clean -C ./libft

fclean: clean
	rm -f $(NAME) libft/libft.a

re: fclean all
