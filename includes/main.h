/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.h                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: romanbtt <marvin@student.42sp.org.br>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/02 14:44:21 by romanbtt          #+#    #+#             */
/*   Updated: 2021/02/08 21:41:19 by romanbtt         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MAIN_H
# define MAIN_H

# include <string.h>
# include <stdio.h>
# include <unistd.h>
# include <fcntl.h>
# include <errno.h>
# include <stdbool.h>
# include <stdlib.h>

typedef void	(*t_array_tests)(void);

void			test_strlen(void);
void			test_strcpy(void);
void			test_strcmp(void);
void			test_write(void);
void			test_read(void);
void			test_strdup(void);

#endif
