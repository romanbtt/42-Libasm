NAME			= libasm.a
EXEC_FILE		= evaluation.out

AS				= nasm 
ASFLAGS			= -f elf64

CC				= clang 
CFLAGS			= -Wall -Werror -Wextra


INC_DIR			= ./includes/
SRC_DIR			= ./sources/
TEST_DIR		= ./tests/

INCLUDES 		= -I $(INC_DIR)

TXT_WRITE		= 	test_1_write.txt \
					test_2_write.txt \
					test_4_write.txt \
					test_5_write.txt \
					test_6_write.txt \
					test_7_write.txt \
					test_8_write.txt \
					test_9_write.txt \

SCR_TEST_FILES 	=	main.c \
					test_strlen.c \
					test_strcpy.c \
					test_strcmp.c \
					test_write.c \
					test_read.c \
					test_strdup.c

SRC_FILES 		=	ft_strlen.s \
					ft_strcpy.s \
					ft_strcmp.s \
					ft_write.s

SRCS = $(addprefix $(SRC_DIR),$(SRC_FILES))
OBJS = $(SRCS:.s=.o)

TEST_SRCS = $(addprefix $(TEST_DIR),$(SCR_TEST_FILES))
TEST_OBJS = $(TEST_SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo "\033[1;32m[OK]\033[0m	\033[1;33mCreating \033[0m $(NAME)"
	@echo ""

%.o: %.s
	@$(AS) $(ASFLAGS) $< -o $@
	@echo "\033[1;32m[OK]\033[0m	\033[1;33mCompiling\033[0m $(@F)"

eval: $(NAME) $(EXEC_FILE)

$(EXEC_FILE): $(TEST_OBJS)
	@$(CC) $(TEST_OBJS) $(INCLUDES) $(CFLAGS) -L. -lasm -o $(EXEC_FILE)
	@echo "\033[1;32m[OK]\033[0m	\033[1;33mCreating \033[0m $(EXEC_FILE)"
	@echo "$$FORTYTWO"

%.o: %.c
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
	@echo "\033[1;32m[OK]\033[0m	\033[1;33mCompiling\033[0m $(@F)"

clean:
	@$(RM) $(OBJS) $(TEST_OBJS) $(EXEC_FILE) $(TXT_WRITE)
	@echo ""
	@echo "\033[1;32m[OK]\033[0m	\033[1;33mDeleting \033[0m object files"
	@echo "\033[1;32m[OK]\033[0m	\033[1;33mDeleting \033[0m executable file"
	@echo "\033[1;32m[OK]\033[0m	\033[1;33mDeleting \033[0m txt files"

fclean: clean
	@$(RM) $(NAME)
	@echo "\033[1;32m[OK]\033[0m	\033[1;33mDeleting \033[0m $(NAME)"

re: fclean all

define FORTYTWO

        \033[1;31m:::      ::::::::
      :+:      :+:    :+:
    +:+ +:+         +:+  
  +#+  +:+       +#+     
+#+#+#+#+#+   +#+        
     #+#    #+#          
    ###    \033[1;36mRobitett\033[0m

"Don't get lost in your pain, know that one day your pain will become your cure."
	~ Rumi

endef
export FORTYTWO

	
