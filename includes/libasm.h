/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: romanbtt <marvin@student.42sp.org.br>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/02 15:57:06 by romanbtt          #+#    #+#             */
/*   Updated: 2021/02/08 21:13:50 by romanbtt         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include "main.h"

size_t		ft_strlen(char *str);
char		*ft_strcpy(char *dest, char *src);
int			ft_strcmp(char *s1, char *s2);
ssize_t		ft_write(int fd, const void *buf, size_t count);
ssize_t		ft_read(int fd, void *buf, size_t count);
char		*ft_strdup(const char *s);

#endif
