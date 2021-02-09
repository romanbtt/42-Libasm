/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_strlen.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: romanbtt <marvin@student.42sp.org.br>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/02 22:59:24 by romanbtt          #+#    #+#             */
/*   Updated: 2021/02/08 21:11:02 by romanbtt         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"
#include "libasm.h"

static void	test_strlen2(char *str)
{
	int			ret_strlen;
	int			ret_ft_strlen;
	static int	count;

	count = count + 1;
	printf("\033[1;34mTest #%d\033[0m\n", count);
	printf("String           : >|%s|<\n", str);
	ret_strlen = strlen(str);
	ret_ft_strlen = ft_strlen(str);
	printf("strlen return    : %d\n", ret_strlen);
	printf("ft_strlen return : %d\n", ret_ft_strlen);
	if (ret_strlen == ret_ft_strlen)
		printf("\033[1;32mPassed\033[0m\n\n");
	else
		printf("\033[1;31mFailed\033[0m\n\n");
}

void		test_strlen(void)
{
	char long_str[1024];

	printf("\n\033[1;32m<----------- Test ft_strlen ----------->\033[0m\n\n");
	memset(long_str, 48, 1024);
	long_str[1023] = '\0';
	test_strlen2("Hello World!");
	test_strlen2("Otters are carnivorous mammals in the subfamily Lutrinae.");
	test_strlen2("42");
	test_strlen2("Cheese is life");
	test_strlen2("Life is\tcheese");
	test_strlen2("\0");
	test_strlen2(" ");
	test_strlen2("\t");
	test_strlen2("\0hello");
	test_strlen2("DOGE\0COIN");
	test_strlen2("你好世界!");
	test_strlen2(long_str);
}
