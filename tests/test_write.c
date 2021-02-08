/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_write.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: romanbtt <marvin@student.42sp.org.br>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/03 10:04:13 by romanbtt          #+#    #+#             */
/*   Updated: 2021/02/07 21:04:03 by romanbtt         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"
#include "libasm.h"

static void	test_write3(char *file, int fd, char *str)
{
	int ret_write;
	int ret_ft_write;
	int len;
	static int	count;

	count = count + 1;
	printf("\033[1;34mTest #%d\033[0m\n", count);
	printf("String           : >|%s|<\n", str);
	len = strlen(str);
	write(fd, "write :\n>|", 10);
	ret_write = write(fd, str, len);
	write(fd, "|<\n\nft_write :\n>|", 17);
	ret_ft_write = ft_write(fd, str, len);
	write(fd, "|<", 2);
	printf("write return    : %d\n", ret_write);
	printf("ft_write return : %d\n", ret_ft_write);
	if (ret_write == ret_ft_write)
		printf("\033[1;32mPassed\033[0m\n");
	if (ret_ft_write == -1 && ret_write == -1)
		printf("Nothing to check, both functions return an error.\n\n");
	else if (ret_ft_write != -1 && ret_write != -1)
		printf("Please check out %s file to confirm the test.\n\n", file);
	else
		printf("\033[1;31mFailed\033[0m\n\n");
}

static void	test_write2(char *file, char *str, bool create_error)
{
	int fd;
	if (create_error)
	{
		test_write3("test_error.txt", -3, "Test error");
		return ;
	}
	if (!(fd = open(file, O_CREAT | O_RDWR | O_APPEND, 777)))
	{
		printf("Open() has return an error.\n\n");
		return;
	}
	test_write3(file, fd, str);
	close (fd);
}

void	test_write(void)
{
	char long_str[1024];

	system("rm -f *write.txt");
	memset(long_str, 48, 1024);
	long_str[1023] = '\0';
	printf("\n\033[1;32m<----------- Test ft_write ----------->\033[0m\n\n");
	test_write2("test_1_write.txt", "Hello World!", 0);
	test_write2("test_2_write.txt", "42", 0);
	test_write2("test_3_error_write.txt", "test error", 1);
	test_write2("test_4_write.txt", "\0", 0);
	test_write2("test_5_write.txt", long_str, 0);
	test_write2("test_6_write.txt", " ", 0);
	test_write2("test_7_write.txt", "\t", 0);
	test_write2("test_8_write.txt", "ɸ", 0);
	test_write2("test_9_write.txt", "你好世界!", 0);
}