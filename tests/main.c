/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: romanbtt <marvin@student.42sp.org.br>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/02 14:38:00 by romanbtt          #+#    #+#             */
/*   Updated: 2021/02/07 21:05:47 by romanbtt         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"
#define STR_TEST "1234567"

void	test_all(void)
{
	test_strlen();
	test_strcpy();
	test_strcmp();
	test_write();
	test_read();
	test_strdup();
}

void	select_function(char c)
{
	int i;
	static t_array_tests func[7] = {test_strlen, test_strcpy, test_strcmp,
		test_write, test_read, test_strdup, test_all};
	
	i = 0;
	while (c != STR_TEST[i])
		i++;
	(*func[i])();
}

void	doc_args()
{
	printf("\n\033[1;33mEvaluation Libasm of robitett\033[0m\n\n");
	printf("1 : ft_strlen\n");
	printf("2 : ft_strcpy\n");
	printf("3 : ft_strcmp\n");
	printf("4 : ft_write\n");
	printf("5 : ft_read\n");
	printf("6 : ft_strdup\n");
	printf("7 : all tests\n");
	printf("8 : exit\n");
	printf("Select a test : ");
}

int	main(void)
{
	int c;

	c = '0';
	system("clear");
	while (!strchr("12345678", c))
	{
		doc_args();
		c = getchar();
		if (!strchr("12345678", c))
		{
			printf("\n\n\033[1;31mInvalid selection\033[0m\n");
			while ((c = getchar()) != '\n' && c != EOF)
				;
		}	
	}
	if (c == '8')
		return (0);
	select_function(c);
	return (0);
}